#!/bin/bash

# Don't exit on error - we want to continue even if some steps fail
set +e

echo "🚀 Setting up Money Buddy Chatbot environment..."

# Update package manager
echo "📦 Updating packages..."
sudo apt-get update -qq

# Flutter is already installed in the base image, verify it
echo "✅ Verifying Flutter installation..."
flutter --version

# Get Dart and Flutter packages
echo "📥 Getting Flutter packages..."
cd /workspaces/Money-Buddy-Chatbot 2>/dev/null || \
cd /workspaces/money-buddy-chatbot 2>/dev/null || \
cd /workspaces/$(ls -d */ 2>/dev/null | head -1) 2>/dev/null || \
cd /workspaces

# Run flutter pub get with error handling
flutter pub get 2>/dev/null || echo "⚠️  Flutter pub get had issues, but continuing..."

# Enable web support
echo "🌐 Enabling web support..."
flutter config --enable-web 2>/dev/null || echo "⚠️  Web support enable had issues, but continuing..."

echo ""
echo "✨ Setup complete! Money Buddy Chatbot is ready to run!"
echo ""
echo "To start the app, run:"
echo "  flutter run -d chrome"
