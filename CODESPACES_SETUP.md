# GitHub Codespaces Setup Guide 🚀

## Quick Start

### Option 1: Create Codespace from Browser (Easiest)

1. **Go to your GitHub repository**
   - Navigate to: `https://github.com/YOUR-USERNAME/money-buddy-chatbot`

2. **Click "Code" button** (green button)
   ![Code Button](https://docs.github.com/assets/cb-155100/images/help/repository/code-button.png)

3. **Select "Codespaces" tab**

4. **Click "Create codespace on main"**
   - GitHub will automatically set up the environment
   - Wait for initialization (usually 2-5 minutes)

5. **Once loaded, you'll see VS Code in your browser**

### Option 2: Command Line Setup

```bash
# Via GitHub CLI
gh codespace create --repo YOUR-USERNAME/money-buddy-chatbot --machine standard-2-core
```

## 🎯 What Happens Automatically

When you create a Codespace, these steps run automatically:

✅ **Environment Setup**
- Flutter SDK installed
- Dart SDK installed
- All dependencies loaded

✅ **Project Configuration**
- `flutter pub get` executed
- Web support enabled
- Dependencies installed

✅ **VS Code Extensions**
- Flutter extension installed
- Dart extension installed
- Code formatter configured

## 🚀 Running the Project

### Run Flutter Web App

In the Codespaces terminal, run:

```bash
flutter run -d chrome
```

Or use the convenience script:

```bash
./run_web.sh
```

### What You'll See

1. Terminal output showing compilation progress
2. A notification: **"A service running on port 8080 is available"**
3. Click **"Open in Browser"** to view your app

## 💻 Using the IDE

### Terminal
- Use the built-in terminal at the bottom
- Terminal is already in the correct directory

### File Explorer
- Left sidebar shows all project files
- Double-click to open and edit files

### Running & Debugging
- Press `F5` to debug (after running once)
- Use terminal commands for hot reload:
  - Type `r` to hot reload
  - Type `R` to hot restart

### Code Editing
- Full VS Code features available
- IntelliSense for Dart/Flutter
- Real-time error highlighting

## 📚 Useful Codespaces Features

### Port Forwarding
- Ports 8080, 3000, 5037 are automatically forwarded
- Click notifications to open forwarded ports in browser

### Creating Multiple Codespaces
```bash
gh codespace create --repo YOUR-USERNAME/money-buddy-chatbot --machine standard-4-core
```

### Stopping a Codespace
1. Click your profile (bottom-left corner)
2. Select "Stop current codespace"
3. This saves compute time and resources

### Deleting a Codespace
1. Go to https://github.com/codespaces
2. Find your codespace
3. Click "..." → "Delete"

## 🔧 Troubleshooting

### "Flutter not found" error
```bash
# Verify Flutter installation
flutter doctor

# If missing, re-initialize post-create script
bash .devcontainer/post-create.sh
```

### Port already in use
```bash
# Change port
flutter run -d chrome --web-port=8090
```

### Need to reset environment
```bash
flutter clean
flutter pub get
flutter run -d chrome
```

### Codespace initialization stuck
1. Wait for 5+ minutes (first build is slower)
2. Check terminal for errors
3. Refresh the browser (F5)
4. If still stuck, delete and create new codespace

## 💡 Tips & Tricks

### Quick Start Commands
```bash
# Just run these in the terminal
flutter run -d chrome        # Start web app
r                           # Hot reload (while app running)
R                           # Hot restart
q                           # Quit
```

### Editing & Testing Workflow
1. **Make changes** in the editor
2. **Press `r`** in terminal to hot reload
3. **See changes instantly** in the browser

### Working with Git
```bash
# Codespaces has git pre-installed
git add .
git commit -m "Add new feature"
git push origin main
```

### Accessing Other Machines
You can run on Android/iOS emulators within Codespaces, but it requires additional setup. For web development, the browser is the quickest option.

## 📊 Machine Types

Default: **Standard 2-core** (sufficient for web development)

Available options:
- **Standard 2-core**: Basic testing (FREE tier eligible)
- **Standard 4-core**: Better performance
- **Standard 8-core**: Maximum performance

## 🌐 Accessing Your App

### From Browser
1. When Flutter starts, you'll see: `"Application listening on http://localhost:8080"`
2. Codespaces will show a notification
3. Click **"Open in Browser"** or visit the forwarded port URL

### From Mobile Device
To test on your phone from Codespaces:
1. Find your Codespace's public URL
2. Share the forwarded port link
3. Open on mobile device

## 📝 Advanced Configuration

### Changing Machine Type
1. Stop the current codespace
2. Click "..." on codespace card
3. Select "Change machine type"
4. Choose a larger/smaller machine

### Custom Environment Variables
Create `.env` file in root:
```
FLUTTER_MODE=debug
```

### Installing Additional Tools
Edit `.devcontainer/post-create.sh`:
```bash
apt-get install -y your-tool-name
```

## 🚀 Deployment from Codespaces

### Build for Web Production
```bash
flutter build web --release
```

### Deploy to Firebase Hosting
```bash
# Install Firebase tools
npm install -g firebase-tools

# Deploy
firebase deploy
```

## 🔐 Security Notes

- Codespaces runs in a secure GitHub container
- No data is stored on your local machine
- Codespace is deleted when you delete it
- All data is private to your GitHub account

## 📞 Support

If you encounter issues:

1. **Check Flutter doctor**: `flutter doctor -v`
2. **Check logs**: Review terminal output
3. **Restart Codespace**: Stop and recreate
4. **Check GitHub Codespaces docs**: https://docs.github.com/en/codespaces

## ⚡ Performance Tips

- Use **Standard 2-core** for basic web development
- Close unused applications/terminals
- Use hot reload instead of hot restart
- Clear Flutter cache occasionally: `flutter clean`

---

**Happy Coding! 🎉 Your Money Buddy Chatbot awaits!**
