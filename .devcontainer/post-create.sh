#!/bin/bash

set -e

echo "🚀 Setting up Money Buddy Chatbot environment..."

# Update package manager
echo "📦 Updating packages..."
apt-get update

# Install required dependencies
echo "📚 Installing dependencies..."
apt-get install -y \
    curl \
    git \
    wget \
    unzip \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release

# Flutter is already installed in the base image, verify it
echo "✅ Verifying Flutter installation..."
flutter doctor -v || true

# Get Dart and Flutter packages
echo "📥 Getting Flutter packages..."
cd /workspaces/Money-Buddy-Chatbot || cd /workspaces/money-buddy-chatbot || cd /workspaces/$(ls -d */ 2>/dev/null | head -1)
flutter pub get

# Enable web support
echo "🌐 Enabling web support..."
flutter config --enable-web

# Create a simple run script
echo "📝 Creating convenience scripts..."
cat > /workspaces/run_web.sh << 'EOF'
#!/bin/bash
echo "🚀 Starting Flutter Web Server..."
flutter run -d chrome --web-port=8080
EOF

chmod +x /workspaces/run_web.sh

echo ""
echo "✨ Setup complete! Money Buddy Chatbot is ready to run!"
echo ""
echo "To start the app, run one of these commands in the terminal:"
echo "  • flutter run -d chrome  (Web)"
echo "  • flutter run             (Auto-detect device)"
echo ""
echo "Or use the convenience script:"
echo "  • ./run_web.sh"
