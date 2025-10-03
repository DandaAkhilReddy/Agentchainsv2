# n8n Quick Start Guide

## n8n is NOT running! Here's how to start it:

### Option 1: Start via Command Prompt (Easiest)

1. **Open Command Prompt** (not PowerShell):
   - Press `Win + R`
   - Type: `cmd`
   - Press Enter

2. **Start n8n**:
   ```bash
   n8n start
   ```

3. **Wait for this message**:
   ```
   Editor is now accessible via:
   http://localhost:5678/
   ```

4. **Open browser**:
   - Go to: `http://localhost:5678`
   - n8n should load!

---

### Option 2: Start with Double-Click (Windows)

1. Navigate to: `C:\users\akhil\Agentchains.ai\`
2. Double-click: **`START_N8N.bat`**
3. A command window will open and start n8n
4. Wait for "Editor is now accessible"
5. Open Chrome → `http://localhost:5678`

---

### Option 3: n8n Cloud (If local doesn't work)

If you have an n8n cloud account:

1. **Go to**: https://app.n8n.cloud/
2. **Sign in** with your credentials
3. **If page won't load**, try:
   - Clear browser cache (Ctrl + Shift + Delete)
   - Try incognito mode (Ctrl + Shift + N)
   - Try different browser (Firefox, Edge)
   - Disable VPN if active
   - Check your internet connection

---

## Troubleshooting

### Issue: "n8n: command not found"

**Solution**: Re-install n8n
```bash
npm install -g n8n
```

---

### Issue: Port 5678 already in use

**Solution**: Kill the process using port 5678
```bash
# Find process on port 5678
netstat -ano | findstr :5678

# Kill it (replace PID with actual process ID)
taskkill /PID <PID> /F

# Then start n8n again
n8n start
```

---

### Issue: n8n Cloud won't load in Chrome

**Solutions**:

1. **Clear cache**:
   - Chrome → Settings → Privacy → Clear browsing data
   - Select: "Cached images and files"
   - Time range: "All time"
   - Click "Clear data"

2. **Check if n8n.cloud is down**:
   - Go to: https://status.n8n.io/
   - Check if there's an outage

3. **Try incognito**:
   - Ctrl + Shift + N
   - Go to: https://app.n8n.cloud/

4. **Check firewall**:
   - Windows Firewall might be blocking
   - Temporarily disable and try again

5. **DNS issue**:
   - Try using Google DNS:
   - Control Panel → Network → Change adapter settings
   - Right-click WiFi → Properties → IPv4 → Use 8.8.8.8

---

### Issue: n8n starts but can't access http://localhost:5678

**Solution**: Check if another app is using port 5678

```bash
# Change n8n port
set N8N_PORT=5679
n8n start

# Now access at: http://localhost:5679
```

---

## Verification Steps

Once n8n loads:

1. ✅ You should see the n8n dashboard
2. ✅ Click "Workflows" in the left sidebar
3. ✅ Click "+ Add workflow" button
4. ✅ You should see the workflow editor

**If you see this, n8n is working!**

---

## Alternative: Use Docker (If nothing else works)

```bash
# Install Docker Desktop for Windows
# Download from: https://www.docker.com/products/docker-desktop/

# Then run n8n via Docker:
docker run -it --rm \
  --name n8n \
  -p 5678:5678 \
  n8nio/n8n

# Access at: http://localhost:5678
```

---

## Need Help?

**Check logs**:
```bash
# Run n8n with verbose logging
n8n start --log-level debug
```

**Common error messages**:
- "EADDRINUSE" → Port already in use (change port)
- "ECONNREFUSED" → Can't connect to database (re-install n8n)
- "Permission denied" → Run as Administrator

---

## Once n8n is Running

**Next steps**:
1. Import workflow: `AI-Reply-Assistant-Workflow.json`
2. Add OpenAI credentials
3. Test the webhook
4. Set up iOS Shortcut

**See**: `SETUP-GUIDE.md` for full instructions

---

**Still stuck?** Let me know the exact error message you're seeing!
