#!/bin/bash
# JesterBloxx Transformation Setup Script for Linux/Mac
# This script helps set up the transformation environment

echo ""
echo "🎭 JesterBloxx Transformation Setup"
echo "===================================="
echo ""

# Check if we're in the right directory
if [ ! -d "Bloxstrap" ]; then
    echo "⚠️  Warning: Bloxstrap folder not found"
    echo "Please run this script from the repository root"
    exit 1
fi

echo "✅ Found Bloxstrap folder"
echo ""

# Create backup
if [ ! -d "Bloxstrap_Backup" ]; then
    echo "📦 Creating backup..."
    cp -r Bloxstrap Bloxstrap_Backup
    echo "✅ Backup created: Bloxstrap_Backup"
else
    echo "✅ Backup already exists: Bloxstrap_Backup"
fi

echo ""
echo "📋 Next Steps:"
echo "   1. Rename Bloxstrap → JesterBloxx"
echo "   2. Run transformation script (PowerShell or VS Find & Replace)"
echo "   3. Follow TRANSFORMATION_GUIDE.md for detailed steps"
echo ""
echo "📖 Resources:"
echo "   - Guide: TRANSFORMATION_GUIDE.md"
echo "   - Theme: JesterBloxx/UI/Styles/DarkRedTheme.xaml"
echo "   - Project: JesterBloxx/JesterBloxx.csproj"
echo ""
echo "🚀 Ready to begin transformation!"
echo ""
