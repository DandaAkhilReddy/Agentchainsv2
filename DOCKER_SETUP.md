# n8n with Docker - Quick Start Guide

## ✅ Docker is Already Installed!

Great news - you already have Docker Desktop version 28.3.2 installed!

---

## 🚀 Start n8n Now (2 Easy Steps)

### **Step 1: Start Docker Desktop**

1. Look for the **Docker Desktop** icon in your taskbar (bottom-right)
2. If you see it, Docker might already be running
3. If not, click the **Windows Start button**
4. Type: `Docker Desktop`
5. Click on **Docker Desktop** app
6. Wait 30-60 seconds for Docker to start (whale icon will stop animating)

**OR** use the script I created:
- Double-click: `C:\users\akhil\start-n8n-docker.bat`
- It will auto-start Docker and then n8n

---

### **Step 2: Start n8n Container**

Open **Command Prompt** and run this command:

```bash
docker run -it --rm --name n8n -p 5678:5678 -v %USERPROFILE%\.n8n:/home/node/.n8n n8nio/n8n
```

**What this does:**
- Downloads n8n image (first time only, ~2 minutes)
- Starts n8n on port 5678
- Saves your workflows to `C:\Users\akhil\.n8n` (persistent storage)
- Auto-removes container when stopped

---

## ⏱️ Timeline (First Time)

```
Step 1: Start Docker Desktop        → 30-60 seconds
Step 2: Download n8n image          → 2-3 minutes (first time only!)
Step 3: n8n starts                  → 5 seconds
Total first time: ~4 minutes
```

**Next times**: Only 30-40 seconds (image is already downloaded)

---

## 🌐 Access n8n

Once you see this message in the terminal:
```
Editor is now accessible via:
http://localhost:5678/
```

**Open Chrome and go to:**
```
http://localhost:5678
```

You should see the n8n welcome screen! 🎉

---

## 🛑 Stop n8n

When you're done:
1. Go back to the Command Prompt window
2. Press **Ctrl + C**
3. n8n will stop and container will be removed automatically

**Your workflows are saved!** They're stored in `C:\Users\akhil\.n8n`

---

## 🔄 Restart n8n (After First Time)

Next time you want to use n8n:

1. Start Docker Desktop (if not running)
2. Run the same command:
   ```bash
   docker run -it --rm --name n8n -p 5678:5678 -v %USERPROFILE%\.n8n:/home/node/.n8n n8nio/n8n
   ```
3. Wait ~10 seconds
4. Open: `http://localhost:5678`

**No download needed!** The image is already on your computer.

---

## 📝 Easy Way (Use My Script)

I created a script that does everything automatically:

1. **Double-click**: `C:\users\akhil\start-n8n-docker.bat`
2. Wait for "Editor is now accessible"
3. Open Chrome → `http://localhost:5678`

The script will:
- ✅ Check Docker is installed
- ✅ Start Docker Desktop if needed
- ✅ Wait for Docker to be ready
- ✅ Start n8n container
- ✅ Show you when to open the browser

---

## 🐛 Troubleshooting

### Issue: "Docker Desktop is not running"

**Solution:**
1. Click Start menu
2. Search for "Docker Desktop"
3. Click to open it
4. Wait for whale icon to stop animating
5. Try the docker run command again

---

### Issue: "Port 5678 is already in use"

**Solution:** Something else is using port 5678

```bash
# Stop the n8n container
docker stop n8n

# Or use a different port (e.g., 5679)
docker run -it --rm --name n8n -p 5679:5678 -v %USERPROFILE%\.n8n:/home/node/.n8n n8nio/n8n

# Then access at: http://localhost:5679
```

---

### Issue: "Cannot connect to Docker daemon"

**Solution:** Docker Desktop isn't running

1. Open Docker Desktop application
2. Wait 30-60 seconds
3. Look for whale icon in system tray
4. When it stops animating, Docker is ready
5. Try the docker run command again

---

### Issue: Docker download is slow

**First time only** - Docker needs to download ~500MB image

**Tips:**
- Be patient (2-3 minutes on good internet)
- Don't close the terminal window
- You'll see progress: "Pulling from n8nio/n8n"
- Once downloaded, future starts take only 10 seconds

---

## 🔍 Verify Docker is Running

### Check Docker status:
```bash
docker ps
```

**Should show:**
```
CONTAINER ID   IMAGE       COMMAND       CREATED          STATUS          PORTS                    NAMES
abc123...      n8nio/n8n   "tini -- ..." 10 seconds ago   Up 9 seconds    0.0.0.0:5678->5678/tcp   n8n
```

If you see this, n8n is running! Open `http://localhost:5678`

---

## 📊 Useful Docker Commands

### View running containers:
```bash
docker ps
```

### View all containers (including stopped):
```bash
docker ps -a
```

### Stop n8n:
```bash
docker stop n8n
```

### Remove n8n container:
```bash
docker rm n8n
```

### View n8n logs:
```bash
docker logs n8n
```

### Check Docker images:
```bash
docker images
```

### Remove n8n image (to re-download fresh):
```bash
docker rmi n8nio/n8n
```

---

## 💾 Where Are My Workflows Saved?

All your n8n data is stored in:
```
C:\Users\akhil\.n8n\
```

This folder contains:
- `database.sqlite` - Your workflows and credentials
- `config/` - n8n settings
- `nodes/` - Custom nodes (if you install any)

**This folder persists** even when you stop/remove the container!

---

## 🔐 Backup Your Workflows

To backup all your n8n data:
1. Stop n8n (`Ctrl + C`)
2. Copy the entire folder:
   ```
   C:\Users\akhil\.n8n\
   ```
3. Paste it somewhere safe (external drive, cloud, etc.)

To restore:
1. Stop n8n
2. Replace `C:\Users\akhil\.n8n\` with your backup
3. Start n8n again

---

## 🚀 Next Steps After n8n Starts

Once n8n loads at `http://localhost:5678`:

1. **Create an account** (first time only)
   - Click "Get started"
   - Enter your email and password
   - This is stored locally (not in the cloud)

2. **Import the AI Reply Assistant workflow**
   - Click "Workflows" in the sidebar
   - Click "..." menu → "Import from file"
   - Select: `C:\users\akhil\Agentchains.ai\n8n-workflows\AI-Reply-Assistant-Workflow.json`

3. **Add OpenAI credentials**
   - Click the "OpenAI Vision" node
   - Click "Create New Credential"
   - Enter your OpenAI API key
   - Save

4. **Activate the workflow**
   - Toggle "Active" switch ON (top right)
   - Workflow is now live!

5. **Test it**
   - See: `n8n-workflows/TEST-EXAMPLES.md`
   - Send a test request via curl or Postman

---

## ⚡ Performance Tips

### Use Docker Desktop for better performance:
1. Open Docker Desktop → Settings (gear icon)
2. Resources → Advanced
3. Increase:
   - CPUs: 4 (if you have 8+ cores)
   - Memory: 4 GB (if you have 16+ GB RAM)
4. Click "Apply & Restart"

### Auto-start Docker on Windows boot:
1. Docker Desktop → Settings
2. General tab
3. ✅ Check "Start Docker Desktop when you log in"

---

## 🎯 You're All Set!

**What you have now:**
- ✅ Docker Desktop installed and working
- ✅ Easy script to start n8n (`start-n8n-docker.bat`)
- ✅ Persistent storage for workflows
- ✅ n8n ready to use at `http://localhost:5678`

**Total time to start n8n (after first setup): 30 seconds!**

---

## 📞 Need Help?

If anything doesn't work:
1. Check Docker Desktop is running (whale icon in taskbar)
2. Make sure no VPN is interfering
3. Try restarting Docker Desktop
4. Share the error message and I'll help!

**Let's get n8n running! Double-click `start-n8n-docker.bat` now!** 🚀
