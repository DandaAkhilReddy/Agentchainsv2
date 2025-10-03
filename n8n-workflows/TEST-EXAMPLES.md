# Test Examples - AI Reply Assistant

## 🧪 Ready-to-Use Test Cases

Copy these examples to test your n8n workflow immediately.

---

## Example 1: Friendly WhatsApp Reply

**cURL Command:**
```bash
curl -X POST http://localhost:5678/webhook/ai-reply \
  -H "Content-Type: application/json" \
  -d '{
    "image": "https://i.imgur.com/example1.png",
    "tone": "Friendly",
    "platform": "WhatsApp",
    "language": "English"
  }'
```

**Expected Response:**
```json
{
  "success": true,
  "tone": "Friendly",
  "platform": "WhatsApp",
  "replies": [
    "Hey! That sounds awesome, I'm totally in 😊",
    "Sounds great! Just let me know the time and I'll be there 👍",
    "Perfect! Count me in, can't wait 🎉"
  ],
  "timestamp": "2025-10-03T12:00:00.000Z"
}
```

---

## Example 2: Professional Outlook Email

**cURL Command:**
```bash
curl -X POST http://localhost:5678/webhook/ai-reply \
  -H "Content-Type: application/json" \
  -d '{
    "image": "https://i.imgur.com/professional-email.png",
    "tone": "Professional",
    "platform": "Outlook",
    "language": "English"
  }'
```

**Expected Response:**
```json
{
  "success": true,
  "tone": "Professional",
  "platform": "Outlook",
  "replies": [
    "Thank you for the update. I will review the document and provide my feedback by end of day.",
    "I appreciate you sharing this information. I will coordinate with the team and get back to you shortly.",
    "Thank you for bringing this to my attention. I will prioritize this and respond with next steps today."
  ],
  "timestamp": "2025-10-03T12:00:00.000Z"
}
```

---

## Example 3: Flirty Dating App Message

**cURL Command:**
```bash
curl -X POST http://localhost:5678/webhook/ai-reply \
  -H "Content-Type: application/json" \
  -d '{
    "image": "https://i.imgur.com/hinge-chat.png",
    "tone": "Flirty",
    "platform": "Instagram",
    "language": "English"
  }'
```

**Expected Response:**
```json
{
  "success": true,
  "tone": "Flirty",
  "platform": "Instagram",
  "replies": [
    "Haha you're trouble 😏 I like it though",
    "Well if you're buying, I'm definitely free tomorrow 😉",
    "You know just how to get my attention 😊"
  ],
  "timestamp": "2025-10-03T12:00:00.000Z"
}
```

---

## Example 4: Casual Slack Message

**cURL Command:**
```bash
curl -X POST http://localhost:5678/webhook/ai-reply \
  -H "Content-Type: application/json" \
  -d '{
    "image": "https://i.imgur.com/slack-chat.png",
    "tone": "Casual",
    "platform": "Slack",
    "language": "English"
  }'
```

**Expected Response:**
```json
{
  "success": true,
  "tone": "Casual",
  "platform": "Slack",
  "replies": [
    "Sure thing! I can jump on a quick call now if you're free",
    "No problem, happy to help. Let me know when works for you",
    "Sounds good! DM me and we can sync up"
  ],
  "timestamp": "2025-10-03T12:00:00.000Z"
}
```

---

## Example 5: Funny Instagram DM

**cURL Command:**
```bash
curl -X POST http://localhost:5678/webhook/ai-reply \
  -H "Content-Type: application/json" \
  -d '{
    "image": "https://i.imgur.com/insta-dm.png",
    "tone": "Funny",
    "platform": "Instagram",
    "language": "English"
  }'
```

**Expected Response:**
```json
{
  "success": true,
  "tone": "Funny",
  "platform": "Instagram",
  "replies": [
    "Haha stop calling me out like this 😂",
    "Okay but why is this literally me though 💀",
    "Not me reading this at 3am... classic 😅"
  ],
  "timestamp": "2025-10-03T12:00:00.000Z"
}
```

---

## Example 6: Multi-Language (Spanish)

**cURL Command:**
```bash
curl -X POST http://localhost:5678/webhook/ai-reply \
  -H "Content-Type: application/json" \
  -d '{
    "image": "https://i.imgur.com/spanish-chat.png",
    "tone": "Friendly",
    "platform": "WhatsApp",
    "language": "Spanish"
  }'
```

**Expected Response:**
```json
{
  "success": true,
  "tone": "Friendly",
  "platform": "WhatsApp",
  "replies": [
    "¡Claro! Me encantaría, dime cuándo y dónde 😊",
    "¡Suena genial! Cuenta conmigo 👍",
    "¡Perfecto! Ahí estaré sin falta 🎉"
  ],
  "timestamp": "2025-10-03T12:00:00.000Z"
}
```

---

## Example 7: Base64 Image (Local File)

**Step 1: Convert screenshot to base64**
```bash
# Mac/Linux
base64 -i screenshot.png | tr -d '\n' > screenshot_b64.txt

# Windows PowerShell
[Convert]::ToBase64String([IO.File]::ReadAllBytes("screenshot.png")) | Out-File -NoNewline screenshot_b64.txt
```

**Step 2: Send to n8n**
```bash
# Replace BASE64_DATA with contents of screenshot_b64.txt
curl -X POST http://localhost:5678/webhook/ai-reply \
  -H "Content-Type: application/json" \
  -d '{
    "image": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAA...",
    "tone": "Friendly",
    "platform": "WhatsApp"
  }'
```

---

## Example 8: Error Handling Test

**Missing Image (Should Return Error):**
```bash
curl -X POST http://localhost:5678/webhook/ai-reply \
  -H "Content-Type: application/json" \
  -d '{
    "tone": "Friendly"
  }'
```

**Expected Response:**
```json
{
  "success": false,
  "error": "No image provided. Send {\"image\": \"base64_or_url\", \"tone\": \"Friendly\"}",
  "timestamp": "2025-10-03T12:00:00.000Z"
}
```

---

## Example 9: All Tones Comparison

Test the same screenshot with all 5 tones:

```bash
# Professional
curl -X POST http://localhost:5678/webhook/ai-reply \
  -H "Content-Type: application/json" \
  -d '{"image": "https://i.imgur.com/test.png", "tone": "Professional"}'

# Friendly
curl -X POST http://localhost:5678/webhook/ai-reply \
  -H "Content-Type: application/json" \
  -d '{"image": "https://i.imgur.com/test.png", "tone": "Friendly"}'

# Casual
curl -X POST http://localhost:5678/webhook/ai-reply \
  -H "Content-Type: application/json" \
  -d '{"image": "https://i.imgur.com/test.png", "tone": "Casual"}'

# Flirty
curl -X POST http://localhost:5678/webhook/ai-reply \
  -H "Content-Type: application/json" \
  -d '{"image": "https://i.imgur.com/test.png", "tone": "Flirty"}'

# Funny
curl -X POST http://localhost:5678/webhook/ai-reply \
  -H "Content-Type: application/json" \
  -d '{"image": "https://i.imgur.com/test.png", "tone": "Funny"}'
```

---

## Example 10: Postman Collection

**Import this JSON into Postman:**

```json
{
  "info": {
    "name": "AI Reply Assistant",
    "schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
  },
  "item": [
    {
      "name": "Friendly WhatsApp",
      "request": {
        "method": "POST",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json"
          }
        ],
        "body": {
          "mode": "raw",
          "raw": "{\n  \"image\": \"https://i.imgur.com/example.png\",\n  \"tone\": \"Friendly\",\n  \"platform\": \"WhatsApp\"\n}"
        },
        "url": {
          "raw": "http://localhost:5678/webhook/ai-reply",
          "protocol": "http",
          "host": ["localhost"],
          "port": "5678",
          "path": ["webhook", "ai-reply"]
        }
      }
    },
    {
      "name": "Professional Email",
      "request": {
        "method": "POST",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json"
          }
        ],
        "body": {
          "mode": "raw",
          "raw": "{\n  \"image\": \"https://i.imgur.com/email.png\",\n  \"tone\": \"Professional\",\n  \"platform\": \"Outlook\"\n}"
        },
        "url": {
          "raw": "http://localhost:5678/webhook/ai-reply",
          "protocol": "http",
          "host": ["localhost"],
          "port": "5678",
          "path": ["webhook", "ai-reply"]
        }
      }
    }
  ]
}
```

---

## 📸 Sample Screenshot URLs (for Quick Testing)

Use these public screenshot URLs to test immediately:

1. **WhatsApp Chat** (Friendly):
   ```
   https://i.imgur.com/whatsapp-example.png
   ```

2. **Professional Email** (Formal):
   ```
   https://i.imgur.com/outlook-example.png
   ```

3. **Instagram DM** (Casual):
   ```
   https://i.imgur.com/instagram-example.png
   ```

4. **Slack Message** (Work):
   ```
   https://i.imgur.com/slack-example.png
   ```

*(Note: Replace with actual test screenshot URLs or use your own)*

---

## 🔍 How to Debug

### View n8n Execution Logs

1. Open n8n: `http://localhost:5678`
2. Click **"Executions"** in left sidebar
3. Click on any execution to see:
   - Input data (screenshot URL, tone, platform)
   - Each node's output
   - Errors (if any)
   - Response time

### Common Issues

**Issue: "Image not recognized"**
- Check image URL is publicly accessible
- Ensure base64 has `data:image/png;base64,` prefix
- Try a smaller image (<5MB)

**Issue: "Replies are generic"**
- Make sure screenshot shows clear conversation text
- Try a different tone
- Check if image URL loads in browser

**Issue: "Slow response (>10 seconds)"**
- OpenAI Vision API can be slow for large images
- Resize images to 1024x1024 max
- Check your internet connection

---

## ✅ Verification Checklist

After testing, verify:

- [ ] Webhook responds in <5 seconds
- [ ] Returns 3 unique replies (not identical)
- [ ] Replies match selected tone (Professional sounds formal, Friendly sounds casual)
- [ ] Replies are relevant to screenshot content
- [ ] No errors in n8n execution logs
- [ ] Works with both URL and base64 images
- [ ] Handles missing image gracefully (error message)

---

## 🎯 Next: iOS Integration

Once all tests pass, proceed to:
1. Expose n8n to internet (ngrok/cloudflare)
2. Create iOS Shortcut (see SETUP-GUIDE.md)
3. Test end-to-end: iPhone screenshot → AI replies in 3 seconds!

Happy testing! 🚀
