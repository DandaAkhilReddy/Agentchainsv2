# iOS Shortcut Setup Guide
## AI Reply Copilot - Automatic Screenshot to Reply

**Setup Time**: 10 minutes
**Result**: Take screenshot → Get 3 AI replies automatically in 3 seconds!

---

## What You'll Build

```
📸 Screenshot → 🤖 AI Analysis → 💬 3 Replies → 📲 Notification → 📋 Copy & Paste
```

**Zero manual steps after setup!**

---

## Prerequisites

✅ iPhone with iOS 17.0 or later
✅ Shortcuts app installed (pre-installed on iOS)
✅ n8n running (localhost or cloud)
✅ OpenAI API key configured in n8n

---

## Part 1: Create the Shortcut (8 minutes)

### Step 1: Open Shortcuts App

1. Open **Shortcuts** app on your iPhone
2. Tap the **"+"** button (top right)
3. Tap **"Add Action"**

---

### Step 2: Get Latest Screenshot

**Action 1: Find Photos**
1. Search for: "Find Photos"
2. Tap: **"Find Photos where..."**
3. Configure:
   - **Filters**: Tap "Photos" → Select **"Screenshots"**
   - **Sort by**: **"Creation Date"** → **"Latest First"**
   - **Limit**: **1**

```
┌──────────────────────────────────┐
│ Find Photos where                │
│ ● Media Type is Screenshots      │
│ Sort by: Creation Date (Latest)  │
│ Limit: 1                          │
└──────────────────────────────────┘
```

---

### Step 3: Convert Image to Base64

**Action 2: Base64 Encode**
1. Tap **"+"** to add action
2. Search for: "Base64 Encode"
3. Tap: **"Base64 Encode"**
4. Input: **"Photos"** (from previous action)
5. Set: **"Encode"** (not Decode)

```
┌──────────────────────────────────┐
│ Base64 Encode [Photos]           │
│ Mode: Encode                      │
└──────────────────────────────────┘
```

---

### Step 4: Get Current Time

**Action 3: Current Date**
1. Tap **"+"**
2. Search for: "Current Date"
3. Tap: **"Current Date"**

```
┌──────────────────────────────────┐
│ Current Date                      │
└──────────────────────────────────┘
```

---

### Step 5: Choose Tone (Optional - can be skipped for auto-mode)

**Action 4: Choose from Menu**
1. Tap **"+"**
2. Search for: "Choose from Menu"
3. Tap: **"Choose from Menu"**
4. Prompt: **"Select Reply Tone"**
5. Add options:
   - **"Professional"**
   - **"Friendly"**
   - **"Casual"**
   - **"Flirty"**
   - **"Funny"**
6. Under each option, add action: **"Set Variable"** → Name: **"Tone"**, Value: (the option name)

**Alternative (Skip User Input)**: Just set a default tone variable
- Add action: "Set Variable"
- Name: **"Tone"**
- Value: **"Friendly"**

```
┌──────────────────────────────────┐
│ Set Variable                      │
│ Variable: Tone                    │
│ Value: Friendly                   │
└──────────────────────────────────┘
```

---

### Step 6: Build JSON Payload

**Action 5: Dictionary**
1. Tap **"+"**
2. Search for: "Dictionary"
3. Tap: **"Dictionary"**
4. Add keys and values:

| Key | Type | Value |
|-----|------|-------|
| `image` | Text | `data:image/png;base64,` + **[Base64 Encoded Text]** |
| `tone` | Text | **[Tone variable]** or "Friendly" |
| `platform` | Text | "WhatsApp" (or "auto") |
| `timestamp` | Date | **[Current Date]** |

**How to build the image value**:
- Type: `data:image/png;base64,`
- Then tap the blue variable button → Select **"Base64 Encoded Text"**

```
┌─────────────────────────────────────────┐
│ Dictionary                               │
├─────────────────────────────────────────┤
│ image: data:image/png;base64,[Base64]  │
│ tone: Friendly                          │
│ platform: WhatsApp                      │
│ timestamp: [Current Date]               │
└─────────────────────────────────────────┘
```

---

### Step 7: Send to n8n Webhook

**Action 6: Get Contents of URL**
1. Tap **"+"**
2. Search for: "Get Contents of URL"
3. Tap: **"Get Contents of URL"**
4. Configure:
   - **URL**: `http://YOUR_N8N_IP:5678/webhook/ai-reply`
     - Replace with your n8n URL
     - If n8n is on cloud: use the cloud URL
     - If localhost: use your computer's IP (e.g., `http://192.168.1.100:5678/webhook/ai-reply`)
   - **Method**: **POST**
   - **Headers**: Tap "Add new field" → "Headers"
     - Key: `Content-Type`
     - Value: `application/json`
   - **Request Body**: **JSON** → Select **"Dictionary"** from previous step

**How to find your n8n URL**:
```bash
# On your computer running n8n:
# Windows
ipconfig
# Look for: IPv4 Address (e.g., 192.168.1.100)

# Mac/Linux
ifconfig
# Look for: inet (e.g., 192.168.1.100)

# Then your URL is: http://192.168.1.100:5678/webhook/ai-reply
```

```
┌─────────────────────────────────────────┐
│ Get Contents of URL                      │
├─────────────────────────────────────────┤
│ URL: http://192.168.1.100:5678/webhook/ │
│      ai-reply                            │
│ Method: POST                             │
│ Headers:                                 │
│   Content-Type: application/json         │
│ Request Body: JSON                       │
│   [Dictionary from previous action]      │
└─────────────────────────────────────────┘
```

---

### Step 8: Parse Response

**Action 7: Get Dictionary from Input**
1. Tap **"+"**
2. Search for: "Get Dictionary from Input"
3. Tap: **"Get Dictionary from Input"**
4. Input: **"Contents of URL"** (from previous action)

```
┌──────────────────────────────────┐
│ Get Dictionary from Input         │
│ Input: [Contents of URL]         │
└──────────────────────────────────┘
```

**Action 8: Get Dictionary Value (Reply 1)**
1. Tap **"+"**
2. Search for: "Get Dictionary Value"
3. Tap: **"Get Dictionary Value"**
4. Configure:
   - **Get Value for**: `reply1`
   - **from**: **"Dictionary"** (from previous action)
5. Repeat this action 2 more times for `reply2` and `reply3`

```
┌──────────────────────────────────┐
│ Get Dictionary Value              │
│ Key: reply1                       │
│ From: [Dictionary]                │
└──────────────────────────────────┘
```

---

### Step 9: Show Notification with Action Buttons

**Action 9: Show Notification**
1. Tap **"+"**
2. Search for: "Show Notification"
3. Tap: **"Show Notification"**
4. Configure:
   - **Title**: "3 Replies Ready! 🤖"
   - **Body**: **[Dictionary Value for reply1]**
   - **Sound**: Default

```
┌──────────────────────────────────┐
│ Show Notification                 │
│ Title: 3 Replies Ready! 🤖        │
│ Body: [reply1]                    │
│ Sound: Default                    │
└──────────────────────────────────┘
```

**Action 10-12: Choose from List (Show all 3 replies)**
1. Tap **"+"**
2. Search for: "Choose from List"
3. Tap: **"Choose from List"**
4. Configure:
   - **Prompt**: "Select a reply to copy:"
   - **Items**: Tap **"+"** 3 times to add:
     - Item 1: **[Dictionary Value for reply1]**
     - Item 2: **[Dictionary Value for reply2]**
     - Item 3: **[Dictionary Value for reply3]**

```
┌──────────────────────────────────┐
│ Choose from List                  │
│ Prompt: Select a reply to copy:   │
│ Items:                            │
│   • [reply1]                      │
│   • [reply2]                      │
│   • [reply3]                      │
└──────────────────────────────────┘
```

**Action 13: Copy to Clipboard**
1. Tap **"+"**
2. Search for: "Copy to Clipboard"
3. Tap: **"Copy to Clipboard"**
4. Input: **"Chosen Item"** (from Choose from List)

```
┌──────────────────────────────────┐
│ Copy to Clipboard                 │
│ Input: [Chosen Item]              │
└──────────────────────────────────┘
```

**Action 14: Show Alert (Confirmation)**
1. Tap **"+"**
2. Search for: "Show Alert"
3. Tap: **"Show Alert"**
4. Configure:
   - **Title**: "Copied! ✅"
   - **Message**: "Reply copied to clipboard. Paste in your messaging app."
   - **Show Cancel Button**: OFF

```
┌──────────────────────────────────┐
│ Show Alert                        │
│ Title: Copied! ✅                 │
│ Message: Reply copied. Paste it!  │
└──────────────────────────────────┘
```

---

### Step 10: Name and Save

1. Tap **"Done"** (top right)
2. Long-press the shortcut name at the top
3. Rename to: **"AI Reply Copilot"**
4. Tap **"Done"**

---

## Part 2: Create Automation Trigger (2 minutes)

### Step 1: Open Automations

1. In Shortcuts app, tap **"Automation"** tab (bottom)
2. Tap **"+"** (top right)
3. Tap **"Create Personal Automation"**

---

### Step 2: Select Screenshot Trigger

1. Scroll down to **"Screenshot"**
2. Tap **"Screenshot"**
3. Under **"When"**, select: **"Is Taken"**
4. Tap **"Next"**

```
┌──────────────────────────────────┐
│ Screenshot Trigger                │
│ When: Is Taken                    │
│ Run: Immediately                  │
└──────────────────────────────────┘
```

---

### Step 3: Add Action

1. Tap **"Add Action"**
2. Search for: "Run Shortcut"
3. Tap: **"Run Shortcut"**
4. Select: **"AI Reply Copilot"** (the shortcut you just created)
5. Tap **"Next"**

---

### Step 4: Disable Confirmation

**IMPORTANT**: This step enables true automation!

1. **Toggle OFF**: "Ask Before Running"
2. **Toggle OFF**: "Notify When Run" (optional - reduces clutter)
3. Tap **"Done"**

```
┌──────────────────────────────────┐
│ Screenshot Automation             │
├──────────────────────────────────┤
│ ❌ Ask Before Running             │
│ ❌ Notify When Run                │
│ ✅ Enabled                        │
└──────────────────────────────────┘
```

**You're done!** 🎉

---

## Testing Your Setup

### Test 1: Manual Shortcut Run

1. Open any chat app (Messages, WhatsApp, etc.)
2. Take a screenshot of a conversation
3. Go to Shortcuts app → Find "AI Reply Copilot" → Tap it
4. Wait 3-5 seconds
5. Notification should appear with "3 Replies Ready!"
6. Tap notification → Choose a reply → "Copied!" alert appears
7. Go back to messaging app → Long-press text field → Paste → Send

**Expected time**: <5 seconds from screenshot to copied reply ✅

---

### Test 2: Automatic Trigger

1. Open any chat app
2. Take a screenshot (Power + Volume Up)
3. **Do nothing** - just wait
4. Within 3-5 seconds, notification appears automatically
5. Tap → Choose → Copied!
6. Paste → Send

**Expected time**: <5 seconds, zero manual steps ✅

---

### Test 3: Different Tones

**Update your shortcut to ask for tone**:
1. Edit shortcut → Step 5 (Tone selection)
2. Change from "Set Variable" to "Choose from Menu"
3. Test: Screenshot → Select "Professional" vs "Flirty"
4. Verify replies match the tone

**Example**:
- Input: "Want to grab coffee tomorrow?"
- **Professional**: "I appreciate the invitation. Let me check my schedule and get back to you shortly."
- **Flirty**: "Coffee with you? Absolutely! Tomorrow can't come soon enough 😊"

---

## Troubleshooting

### Issue: Automation doesn't trigger automatically

**Solution**:
1. Go to: Shortcuts → Automation tab
2. Find your "Screenshot" automation
3. Tap it → Verify:
   - ✅ Enabled (toggle is green)
   - ❌ "Ask Before Running" is OFF
4. If still doesn't work:
   - Delete automation
   - Recreate from scratch
   - Make sure to turn OFF "Ask Before Running"

---

### Issue: "Get Contents of URL" fails or times out

**Solution**:
1. **Check n8n is running**:
   - On your computer, open browser → `http://localhost:5678`
   - Should see n8n dashboard
2. **Check IP address**:
   - iPhone must be on same WiFi as computer running n8n
   - Verify IP: `ipconfig` (Windows) or `ifconfig` (Mac)
   - Update shortcut URL with correct IP
3. **Check firewall**:
   - Allow port 5678 through firewall
   - Windows: Control Panel → Firewall → Allow app → n8n
4. **Use ngrok for testing** (if on different networks):
   ```bash
   ngrok http 5678
   # Copy the https URL (e.g., https://abc123.ngrok.io)
   # Use: https://abc123.ngrok.io/webhook/ai-reply
   ```

---

### Issue: Notification doesn't show replies

**Solution**:
1. iPhone Settings → Notifications → **Shortcuts**
2. Verify:
   - ✅ Allow Notifications: ON
   - ✅ Lock Screen: ON
   - ✅ Notification Center: ON
   - ✅ Banners: ON
3. Test: Run shortcut manually → Should see notification

---

### Issue: Replies are generic / not contextual

**Solution**:
1. **Check image quality**:
   - In shortcut, before Base64 Encode, add:
     - Action: "Resize Image" → Width: 1200, Height: 1200
   - Larger = better AI context (but slower upload)
2. **Improve n8n prompt**:
   - Edit n8n workflow → "OpenAI Vision" node
   - Update system prompt to be more specific:
     ```
     "Read the ENTIRE conversation. Pay attention to:
     - Who is speaking
     - The tone of the conversation
     - Any questions being asked
     - Context clues (emojis, casual vs formal language)
     Generate 3 natural, contextually appropriate replies."
     ```
3. **Increase max tokens**:
   - n8n → OpenAI node → Options → Max Tokens: 300

---

### Issue: Slow (>10 seconds)

**Solution**:
1. **Compress image**:
   - Add action after "Find Photos": "Resize Image" → 800x800
   - Reduces upload time from 3s → 0.5s
2. **Use n8n cloud** (if on cellular):
   - n8n.io cloud hosting = faster than localhost over cellular
   - Cost: $20/month
3. **Switch to Azure OpenAI**:
   - Lower latency than OpenAI (especially in Europe/Asia)
   - Edit n8n workflow → Replace OpenAI node with Azure OpenAI node

---

### Issue: "No internet connection" error

**Solution**:
- Shortcut requires internet to send to n8n and call OpenAI
- If offline, add error handling:
  - After "Get Contents of URL", add: "If" action
  - Condition: "If Contents of URL has any value"
  - If true: continue
  - If false: Show Alert "No internet. Try again when connected."

---

## Advanced: iOS Notification Actions (Without Tapping)

### Setup Custom Notification Actions

**Instead of "Choose from List", use UNNotificationAction (requires native app)**

For now, the shortcut approach requires one tap to choose.

**Future native app will support**:
```
Notification:
┌──────────────────────────────────┐
│ 3 Replies Ready! 🤖              │
├──────────────────────────────────┤
│ "Hey! Sounds great, let me know  │
│  when you're free 👍"             │
├──────────────────────────────────┤
│ [Copy Reply 1] [Copy Reply 2]    │
└──────────────────────────────────┘
```

Tap action button → Instant copy (no app opening)

---

## Performance Tips

### Tip 1: Pre-select Tone (Skip Menu)

**Instead of asking every time**:
- Remove "Choose from Menu" for tone
- Replace with:
  ```
  Set Variable "Tone" = "Friendly"
  ```
- Saves 2 seconds per screenshot

---

### Tip 2: Cache Last Reply

**Add this to n8n**:
```javascript
// Store last 3 replies in workflow static data
$workflow.staticData.lastReplies = {
  screenshot: imageHash,
  replies: [reply1, reply2, reply3],
  timestamp: Date.now()
};

// On next request, if same screenshot (within 5 min):
if (cachedHash === imageHash && cacheAge < 300000) {
  return cached.replies; // Skip OpenAI call
}
```

Saves OpenAI API cost + 1.5 seconds

---

### Tip 3: Parallel Processing

**In shortcut, while uploading to n8n, show "Thinking..." alert**:
1. After "Get Contents of URL", immediately add:
   - "Show Notification" → "AI is thinking... 🤔"
2. When response arrives, replace with real notification

User feels it's faster (perceived speed)

---

## Next Steps

### Today:
- ✅ Test with 10 real screenshots
- ✅ Measure average time (should be <5 seconds)
- ✅ Share with 3 friends for feedback

### This Week:
- Add tone selector UI (or skip for speed)
- Add platform detection (auto-detect from screenshot)
- Improve prompt for better replies

### Next Month:
- Build native iOS app (replace Shortcut)
- Add custom keyboard extension
- Publish to App Store

---

## Share Your Setup

**Demo script for friends**:

1. "I built an AI reply assistant. Watch this."
2. Open WhatsApp, screenshot a message
3. Wait 3 seconds (point at screen)
4. Notification appears: "3 Replies Ready!"
5. Tap → Choose → Copied!
6. Paste → Send
7. "That's it! 3 seconds from screenshot to reply. Fully automatic."

**Reaction: 🤯**

---

## Costs

### Free Tier (Testing):
- Shortcuts app: **Free** (built-in iOS)
- n8n self-hosted: **Free**
- OpenAI API: **~$0.01 per screenshot** (GPT-4o Vision)
  - 100 screenshots = **$1**
  - 1000 screenshots = **$10**

### Paid Tier (Scale):
- n8n Cloud: **$20/month**
- OpenAI API: **$30-300/month** (depends on usage)
- **Total**: **$50-320/month**

### Enterprise Tier:
- Azure OpenAI (lower cost): **$20/month**
- n8n Cloud: **$50/month** (higher tier)
- **Total**: **$70/month**

---

**You're all set!** 🚀

Take a screenshot right now and test it!

**Questions?** Check troubleshooting or contact support.
