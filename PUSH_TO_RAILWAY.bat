@echo off
REM =====================================================================
REM  RAILWAY DEPLOYMENT PUSH SCRIPT
REM  Run this to commit all changes and push to GitHub
REM =====================================================================

echo.
echo ╔══════════════════════════════════════════════════════════════════╗
echo ║         PUSHING RAILWAY DEPLOYMENT SETUP TO GITHUB               ║
echo ╚══════════════════════════════════════════════════════════════════╝
echo.

REM Change to project directory
cd /d "d:\Projects\DeepKlarity-Assignment"

REM Check current status
echo 📋 Current git status:
git status
echo.

REM Add all changes
echo ✅ Adding all changes...
git add .
echo.

REM Commit with message
echo 📝 Committing changes...
git commit -m "Setup Railway deployment - Dockerfile, configs, and API URLs updated for production"
echo.

REM Push to GitHub
echo 🚀 Pushing to GitHub...
git push origin main
echo.

REM Show result
if %errorlevel% equ 0 (
    echo ╔══════════════════════════════════════════════════════════════════╗
    echo ║  ✅ SUCCESSFULLY PUSHED TO GITHUB!                               ║
    echo ║                                                                  ║
    echo ║  Next Steps:                                                     ║
    echo ║  1. Visit https://railway.app                                    ║
    echo ║  2. Sign up/login with GitHub                                    ║
    echo ║  3. Click "New Project" → "Deploy from GitHub"                   ║
    echo ║  4. Select "DeepKlarity-Assignment"                              ║
    echo ║  5. Wait 5-10 minutes for deployment                             ║
    echo ║  6. Get your live URL! 🎉                                        ║
    echo ╚══════════════════════════════════════════════════════════════════╝
) else (
    echo ❌ Error during push. Check the output above.
)

pause
