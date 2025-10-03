# n8n AI Reply Assistant - Complete Setup Guide

## 🚀 Quick Start (30 Minutes)

This guide will help you set up the AI Reply Assistant using n8n and OpenAI Vision API.

---

## 📋 Prerequisites

### 1. n8n Installed & Running
You mentioned you already have n8n running locally. If not:

```bash
# Option 1: npm
npm install n8n -g
n8n start

# Option 2: Docker
docker run -it --rm --name n8n -p 5678:5678 n8nio/n8n

# Access n8n at: http://localhost:5678
```

### 2. OpenAI API Key
- Go to https://platform.openai.com/api-keys
- Create a new API key
- Copy it (you'll need it in Step 2)

### 3. Azure OpenAI (Alternative to OpenAI)
If you want to use Azure OpenAI instead:
- Go to Azure Portal
- Create an "Azure OpenAI" resource
- Deploy GPT-4o or GPT-4-vision model
- Copy endpoint URL and API key

---

## 🛠️ Step-by-Step Setup

### Step 1: Import Workflow to n8n

1. Open n8n in your browser: `http://localhost:5678`
2. Click **"+ New Workflow"** in top right
3. Click **"..."** menu → **"Import from File"**
4. Select the file: `AI-Reply-Assistant-Workflow.json`
5. Workflow should load with 5 nodes

**Nodes you'll see:**
```
[Webhook] → [Process Input] → [OpenAI Vision] → [Parse Replies] → [Response]
```

---

### Step 2: Configure OpenAI Credentials

1. Click on the **"OpenAI Vision - Generate Replies"** node
2. Click **"Create New Credential"** under "Credentials"
3. Enter your OpenAI API key
4. Click **"Save"**

**For Azure OpenAI:**
1. Select "Azure OpenAI" instead
2. Enter:
   - **Resource Name**: Your Azure resource name
   - **API Key**: From Azure portal
   - **Deployment Name**: Your GPT-4o deployment name (e.g., "gpt-4o-vision")

---

### Step 3: Activate the Webhook

1. Click on the **"Webhook - Receive Screenshot"** node
2. You'll see a webhook URL like:
   ```
   http://localhost:5678/webhook/ai-reply
   ```
3. **Copy this URL** (you'll need it for testing)
4. Click **"Listen for Test Event"** to activate it

---

### Step 4: Save & Activate Workflow

1. Click **"Save"** button (top right)
2. Name it: **"AI Reply Assistant"**
3. Toggle the **"Active"** switch (top right) to ON
4. Workflow is now live! 🎉

---

## 🧪 Testing the Workflow

### Method 1: Test with cURL (Command Line)

```bash
# Replace <WEBHOOK_URL> with your actual n8n webhook URL
curl -X POST http://localhost:5678/webhook/ai-reply \
  -H "Content-Type: application/json" \
  -d '{
    "image": "https://i.imgur.com/sample-chat-screenshot.png",
    "tone": "Friendly",
    "platform": "WhatsApp"
  }'
```

**Expected Response:**
```json
{
  "success": true,
  "tone": "Friendly",
  "platform": "WhatsApp",
  "replies": [
    "Hey! Sounds great, let me know when you're free 👍",
    "Awesome! I'm in, just send me the details",
    "Perfect timing! Count me in 😊"
  ],
  "reply1": "Hey! Sounds great, let me know when you're free 👍",
  "reply2": "Awesome! I'm in, just send me the details",
  "reply3": "Perfect timing! Count me in 😊",
  "timestamp": "2025-10-03T12:34:56.789Z"
}
```

---

### Method 2: Test with Base64 Image

If you have a screenshot file, convert it to base64:

```bash
# Mac/Linux
base64 -i screenshot.png -o screenshot.txt

# Windows PowerShell
[Convert]::ToBase64String([IO.File]::ReadAllBytes("screenshot.png")) | Out-File screenshot.txt
```

Then send it:
```bash
curl -X POST http://localhost:5678/webhook/ai-reply \
  -H "Content-Type: application/json" \
  -d '{
    "image": "data:image/png;base64,iVBORw0KGgoAAAANS...",
    "tone": "Professional"
  }'
```

---

### Method 3: Test with Postman

1. Open Postman (or download from https://www.postman.com/)
2. Create a new **POST** request
3. URL: `http://localhost:5678/webhook/ai-reply`
4. Headers: `Content-Type: application/json`
5. Body (JSON):
```json
{
  "image": "https://your-screenshot-url.png",
  "tone": "Friendly",
  "platform": "WhatsApp",
  "language": "English"
}
```
6. Click **Send**
7. See 3 AI-generated replies in response!

---

## 📱 iOS Shortcut Integration (Auto-Screenshot → AI Replies)

Now let's make this work seamlessly on your iPhone!

### Step 1: Expose n8n to Internet (for iOS to access)

**Option A: ngrok (Easiest for Testing)**
```bash
# Install ngrok
brew install ngrok  # Mac
# OR download from https://ngrok.com/download

# Expose n8n to internet
ngrok http 5678

# You'll get a public URL like:
# https://abc123.ngrok.io
```

Your webhook URL becomes:
```
https://abc123.ngrok.io/webhook/ai-reply
```

**Option B: Cloudflare Tunnel (Free, Permanent)**
```bash
# Install cloudflared
brew install cloudflare/cloudflare/cloudflared

# Tunnel n8n
cloudflared tunnel --url http://localhost:5678

# You'll get a URL like:
# https://xyz.trycloudflare.com
```

**Option C: Deploy n8n to Cloud (Production)**
- Use n8n Cloud (https://n8n.io/cloud) - $20/month
- Or deploy to Railway, Render, or DigitalOcean

---

### Step 2: Create iOS Shortcut

1. Open **Shortcuts** app on iPhone
2. Tap **"+"** to create new shortcut
3. Add these actions:

**Action 1: Get Latest Screenshots**
- Search "Get Latest Photos"
- Select **"Screenshots"** album
- Limit: **1**

**Action 2: Base64 Encode**
- Search "Base64 Encode"
- Input: **Latest Photos**

**Action 3: Build JSON**
- Search "Dictionary"
- Add keys:
  - `image`: `data:image/png;base64,` + **Base64 Encoded**
  - `tone`: **"Friendly"** (or ask user)
  - `platform`: **"WhatsApp"** (or ask user)

**Action 4: Send to n8n**
- Search "Get Contents of URL"
- URL: `https://your-ngrok-url.ngrok.io/webhook/ai-reply`
- Method: **POST**
- Headers: `Content-Type: application/json`
- Request Body: **Dictionary** (from previous step)

**Action 5: Parse Response**
- Search "Get Dictionary Value"
- Key: **"replies"**
- Show: **replies**

**Action 6: Show Replies**
- Search "Choose from List"
- Input: **Dictionary Value** (replies)
- Prompt: **"Pick a reply to copy"**

**Action 7: Copy to Clipboard**
- Search "Copy to Clipboard"
- Input: **Chosen Item**

**Action 8: Show Notification**
- Search "Show Notification"
- Message: **"Reply copied! Paste it in your chat."**

3. Name the shortcut: **"AI Reply Copilot"**
4. Add to Home Screen or Widgets

---

### Step 3: Use the Shortcut

**Manual Trigger:**
1. Take a screenshot of a conversation
2. Run the "AI Reply Copilot" shortcut
3. See 3 replies → choose one → copied!
4. Paste in your chat app

**Automation (Advanced):**
1. Go to **Automations** tab in Shortcuts
2. Create **"When I take a screenshot"** automation
3. Run **"AI Reply Copilot"** shortcut
4. Now every screenshot auto-generates replies! 🚀

---

## 🎨 Supported Tones & Platforms

### Tones
- `Professional` - Formal, polite, no emojis
- `Friendly` - Warm, casual, 1 emoji max
- `Casual` - Relaxed, informal, emojis okay
- `Flirty` - Witty, charming, playful
- `Funny` - Humorous, light-hearted

### Platforms
- `WhatsApp` - Casual messaging, emojis okay
- `Instagram` - Very casual, short, emojis encouraged
- `Outlook` - Professional email style
- `Slack` - Professional-casual hybrid
- `iMessage` - Natural conversational tone
- `LinkedIn` - Professional, thought leadership

### Languages
Currently supports 10 languages (auto-translation):
- English, Spanish, French, German, Hindi, Japanese, Portuguese, Italian, Korean, Chinese

---

## 🔧 Customization

### Modify Tone Prompts

Edit the `Process Input & Build Prompt` node:

```javascript
const systemPrompts = {
  'Professional': `Your custom professional prompt...`,
  'Sarcastic': `You are a sarcastic assistant...`,  // Add new tone
};
```

### Change Number of Replies

In `OpenAI Vision` node, modify `maxTokens`:
- 3 replies: `250 tokens`
- 5 replies: `400 tokens`
- 10 replies: `800 tokens`

### Add Safety Filters

Add a new node after `Parse & Format Replies`:
1. Add **"Code"** node
2. Check for profanity/PII:
```javascript
const replies = $json.replies;
const filtered = replies.map(r => {
  // Filter profanity
  if (r.match(/badword1|badword2/i)) {
    return '[Inappropriate reply filtered]';
  }
  // Filter phone numbers
  return r.replace(/\d{3}-\d{3}-\d{4}/g, '[REDACTED]');
});

return [{ json: { ...$$json, replies: filtered } }];
```

---

## 📊 Monitoring & Analytics

### View Execution History

1. Go to n8n **"Executions"** tab
2. See all webhook calls, response times, errors
3. Click any execution to debug

### Add Analytics

Add a **"Google Sheets"** node after `Parse & Format Replies`:
- Log: timestamp, tone, platform, reply used
- Track most popular tones/platforms

### Error Alerts

Add a **"Slack"** or **"Email"** node to `Error Handler`:
- Send alert when workflow fails
- Include error message and screenshot metadata (not image)

---

## 🔒 Privacy & Security

### Current Privacy Model

✅ **Good:**
- Screenshot is processed in-memory only
- OpenAI doesn't store images by default (per their policy)
- No database storage in n8n

⚠️ **To Improve:**
- Add authentication to webhook (API key)
- Use Azure OpenAI with Private Endpoints
- Enable n8n execution data auto-deletion

### Add Webhook Authentication

1. Edit `Webhook - Receive Screenshot` node
2. Add **Authentication** → **Header Auth**
3. Header Name: `X-API-Key`
4. Header Value: `your-secret-key-12345`

Now all requests must include:
```bash
curl -X POST https://your-url/webhook/ai-reply \
  -H "X-API-Key: your-secret-key-12345" \
  -H "Content-Type: application/json" \
  -d '{"image": "...", "tone": "Friendly"}'
```

### Auto-Delete Execution Data

1. n8n Settings → **Executions**
2. Set **"Delete executions after"**: **1 hour**
3. Screenshots are auto-purged

---

## 🚀 Performance Optimization

### Speed Tips

1. **Use Azure OpenAI** (faster than public OpenAI)
2. **Compress images** before sending:
   ```javascript
   // In iOS Shortcut, resize to max 1024px width
   ```
3. **Reduce maxTokens** to 200 (faster response)
4. **Enable caching** for common screenshots (advanced)

### Cost Optimization

**OpenAI Pricing (GPT-4o Vision):**
- ~$0.01 per screenshot analysis
- 100 screenshots = $1
- 10,000 screenshots/month = $100

**Azure OpenAI Pricing:**
- Similar to OpenAI, but more control
- Can set daily/monthly budget caps

**Reducing Costs:**
- Resize images to 512x512 (vs 1024x1024)
- Use GPT-4o-mini for simple messages (10x cheaper)
- Cache frequent responses (e.g., "Thanks!" → always same 3 replies)

---

## 🐛 Troubleshooting

### Error: "OpenAI credentials not found"
**Solution:** Re-configure OpenAI credentials in the node settings.

### Error: "Webhook not responding"
**Solution:**
1. Check workflow is **Active** (toggle on)
2. Click **"Listen for Test Event"** on webhook node
3. Verify n8n is running (`http://localhost:5678` loads)

### Error: "Invalid image format"
**Solution:**
- Ensure image is base64-encoded with `data:image/png;base64,` prefix
- OR use a public image URL (https://...)
- Max size: 20MB

### Error: "No replies generated"
**Solution:**
1. Check OpenAI API key is valid (test at https://platform.openai.com/playground)
2. Check if you have API credits ($5+ balance)
3. View n8n execution log for detailed error

### iOS Shortcut doesn't work
**Solution:**
1. Make sure n8n is exposed to internet (ngrok/cloudflare)
2. Test webhook URL in browser first
3. Check iOS Shortcut has "Allow Sharing" permission

---

## 📈 Next Steps

### Today (MVP Working)
- ✅ Import n8n workflow
- ✅ Configure OpenAI credentials
- ✅ Test with cURL/Postman
- ✅ Create iOS Shortcut
- ✅ Test end-to-end with real screenshot

### This Week (Improvements)
- [ ] Add authentication (API key)
- [ ] Add analytics (Google Sheets logging)
- [ ] Add more tones (Sarcastic, Empathetic)
- [ ] Add safety filters (profanity, PII)
- [ ] Create Telegram bot integration

### Next Month (Scale)
- [ ] Deploy n8n to cloud (n8n Cloud / Railway)
- [ ] Build web interface (simple HTML form)
- [ ] Add custom keyboard (requires native iOS app)
- [ ] Migrate to Azure OpenAI (better privacy)
- [ ] Add blockchain audit trail (optional)

---

## 💡 Advanced Use Cases

### Use Case 1: Telegram Bot Integration

1. Add **"Telegram Trigger"** node before webhook
2. Bot receives screenshot → auto-generates replies → sends back
3. No iOS Shortcut needed!

### Use Case 2: Slack Bot

1. Add **"Slack Trigger"** node
2. Slash command: `/ai-reply` → upload screenshot
3. Bot replies in thread with 3 suggestions

### Use Case 3: WhatsApp Business API

1. Connect n8n to WhatsApp Business API
2. Receive messages → auto-suggest replies to agent
3. Agent picks one → sent automatically

### Use Case 4: Email Assistant

1. Gmail Trigger → new email received
2. n8n generates 3 draft replies
3. Saves as Gmail drafts for review

---

## 📚 Resources

### n8n Documentation
- Official Docs: https://docs.n8n.io/
- Workflows Library: https://n8n.io/workflows/
- Community Forum: https://community.n8n.io/

### OpenAI Vision API
- API Docs: https://platform.openai.com/docs/guides/vision
- Pricing: https://openai.com/pricing
- Playground: https://platform.openai.com/playground

### iOS Shortcuts
- Shortcuts Gallery: https://www.icloud.com/shortcuts/
- Tutorial: https://support.apple.com/guide/shortcuts/

---

## 🎉 Success!

You now have a working AI Reply Assistant powered by n8n!

**What you built:**
✅ Screenshot → AI Vision → 3 Smart Replies (in 3 seconds)
✅ Supports 5 tones, 6 platforms, 10 languages
✅ Privacy-first (no storage)
✅ iOS Shortcut integration (one-tap automation)

**Next: Test it with a real screenshot and share your results!**

---

## 📧 Questions?

If you run into issues:
1. Check n8n execution logs (Executions tab)
2. Verify OpenAI API key and credits
3. Test webhook with Postman first
4. Check ngrok/cloudflare tunnel is running

Happy automating! 🚀
