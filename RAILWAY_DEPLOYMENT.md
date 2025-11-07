# Railway.app Deployment Guide

## 📋 Pre-Deployment Checklist

Before pushing to GitHub and deploying on Railway, verify all files are in place:

### Files Created/Updated for Railway:
- ✅ `Dockerfile` - Multi-stage build (frontend + backend)
- ✅ `railway.json` - Railway platform configuration
- ✅ `.dockerignore` - Excludes unnecessary files from Docker build
- ✅ `backend/requirements.txt` - Updated dependencies for production
- ✅ `backend/app/main.py` - Updated with static file serving
- ✅ `frontend/src/components/GenerateQuizTabNew.jsx` - API URL updated
- ✅ `frontend/src/components/HistoryTab.jsx` - API URL updated

---

## 🚀 Step-by-Step Deployment

### Step 1: Test Locally (Optional but Recommended)

Test that Docker builds correctly:

```bash
# Build Docker image locally
docker build -t deepklarity:latest .

# Run the image
docker run -p 8000:8000 deepklarity:latest
```

Then visit `http://localhost:8000` in your browser.

**Note:** If you see 404 on the frontend, it means the static files weren't built. This is expected since we haven't pushed to Railway yet.

### Step 2: Commit Changes to Git

```bash
cd d:\Projects\DeepKlarity-Assignment

# Stage all changes
git add .

# Commit
git commit -m "Prepare for Railway deployment - add Dockerfile, railway.json, and update API URLs"

# Push to GitHub
git push origin main
```

### Step 3: Create Railway Account

1. Go to **https://railway.app**
2. Click **Sign Up** (or **Log In** if you have an account)
3. Choose **GitHub** as authentication method
4. Authorize Railway to access your GitHub repositories

### Step 4: Deploy on Railway

#### Method A: Using Railway Dashboard (Easiest)

1. After signing in, click **New Project**
2. Select **Deploy from GitHub repo**
3. Find and select: `DeepKlarity-Assignment`
4. Railway will detect `Dockerfile` automatically
5. Wait for deployment (usually 5-10 minutes)
6. Once complete, you'll get a URL like: `https://deepklarity-production.up.railway.app`

#### Method B: Using Railway CLI

```bash
# Install Railway CLI
npm install -g @railway/cli

# Login to Railway
railway login

# Navigate to project directory
cd d:\Projects\DeepKlarity-Assignment

# Link to Railway project
railway link

# Deploy
railway up
```

### Step 5: Set Environment Variables (If Needed)

If your backend uses environment variables (like `GEMINI_API_KEY`):

1. In Railway dashboard, go to your project
2. Click **Variables** tab
3. Add your environment variables:
   - `GEMINI_API_KEY=your_actual_key`
   - `DATABASE_URL=your_db_url` (optional, uses SQLite by default)

### Step 6: View Your Deployed App

1. Your app will be live at the Railway-provided URL
2. Open it in browser to test
3. Generate a quiz from Wikipedia to verify it works

---

## 🔍 Troubleshooting

### If the build fails:

1. Check **Build Logs** in Railway dashboard
2. Common issues:
   - Node.js build failed: Missing `node_modules` lock file - ensure `frontend/package-lock.json` exists
   - Python dependency error: Check `backend/requirements.txt` syntax
   - Docker error: Verify `Dockerfile` syntax is correct

### If the app runs but shows 404:

1. Check console logs in browser (F12)
2. Verify frontend is being served: `https://your-railway-url/` should show the app
3. Check API calls in Network tab - they should go to `https://your-railway-url/generate_quiz/`

### If API calls fail:

1. Open browser console (F12)
2. Check Network tab for failed requests
3. Look for CORS errors
4. Verify backend is running with: `https://your-railway-url/docs`

---

## 📊 Architecture on Railway

```
User Browser
    ↓
https://deepklarity-railway.up.railway.app (Frontend)
    ↓
Same server - Python backend processes request
    ↓
Database (SQLite or PostgreSQL)
```

Everything runs in a single Docker container!

---

## 💡 Advanced: Upgrade to PostgreSQL (Optional)

Railway can automatically provide PostgreSQL. To use it:

1. In Railway dashboard, click **Add** → **PostgreSQL**
2. Railway will set `DATABASE_URL` environment variable
3. Update `backend/app/db.py` to use PostgreSQL instead of SQLite

---

## 📈 Monitoring Your Deployment

In Railway dashboard, you can:
- View real-time logs
- Monitor CPU/Memory usage
- See deployment history
- Manage environment variables
- Configure custom domains

---

## 🔄 Redeployment

To redeploy after making code changes:

```bash
# Make changes locally
# ... edit files ...

# Commit and push
git add .
git commit -m "Your changes"
git push origin main

# Railway automatically detects the push and redeploys!
# Check deployment status in Railway dashboard
```

No manual steps needed - Railway watches your GitHub repo!

---

## ✅ Final Checklist

- [ ] All files committed to Git
- [ ] Changes pushed to GitHub (`git push origin main`)
- [ ] Railway account created and logged in
- [ ] Project deployed from GitHub repo
- [ ] App URL accessible in browser
- [ ] Quiz generation works
- [ ] History functionality works
- [ ] No CORS errors in console

---

## 🎉 Success!

Your full-stack DeepKlarity app is now deployed and live on Railway!

**Share your app URL:** `https://your-railway-url` (replace with actual URL from Railway)

For updates, just push to GitHub - Railway redeploys automatically! 🚀
