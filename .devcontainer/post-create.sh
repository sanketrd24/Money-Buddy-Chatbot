#!/bin/bash

echo "🚀 Setting up Flutter development environment..."

# Update and install dependencies
apt-get update -qq
apt-get install -y -qq \
  curl \
  git \
  wget \
  unzip \
  ca-certificates \
  > /dev/null 2>&1

# Install Flutter SDK
echo "📥 Installing Flutter SDK..."
cd /tmp
wget -q https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.0.0-stable.tar.xz
tar xf flutter_linux_3.0.0-stable.tar.xz
mv flutter /usr/local/flutter
rm flutter_linux_3.0.0-stable.tar.xz

# Add Flutter to PATH
export PATH="/usr/local/flutter/bin:$PATH"
echo 'export PATH="/usr/local/flutter/bin:$PATH"' >> ~/.bashrc

# Accept Flutter licenses
flutter config --no-analytics > /dev/null 2>&1
yes | flutter doctor --android-licenses > /dev/null 2>&1

# Get project dependencies
echo "📦 Getting dependencies..."
cd /workspaces/Money-Buddy-Chatbot
flutter pub get > /dev/null 2>&1

# Enable web support
echo "🌐 Enabling web support..."
flutter config --enable-web > /dev/null 2>&1

echo "✨ Setup complete!"
echo "Run: flutter run -d chrome"
