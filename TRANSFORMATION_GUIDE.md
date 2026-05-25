# 🎭 JesterBloxx Transformation Guide

This guide will help you transform Bloxstrap into JesterBloxx with Dark Red & Black styling.

## 📋 Overview

| Phase | Task | Time | Status |
|-------|------|------|--------|
| 1 | Setup & Branding | ✅ Done | Complete |
| 2 | Namespace Renaming | ⏳ Todo | ~20 min |
| 3 | File Organization | ⏳ Todo | ~30 min |
| 4 | Theme Application | ⏳ Todo | ~45 min |
| 5 | Icons & Assets | ⏳ Todo | ~1 hour |
| 6 | Strings & Localization | ⏳ Todo | ~20 min |
| 7 | Testing & Build | ⏳ Todo | ~1 hour |

**Total Estimated Time: 3.5-4 hours**

---

## 🎨 Color Palette

```
Primary:       #8B0000 (Dark Red)
Accent:        #DC143C (Crimson)
Background:    #000000 (Black)
Text:          #FFFFFF (White)
Border:        #660000 (Darker Red)
Hover:         #A00000 (Lighter Dark Red)
Pressed:       #6B0000 (Pressed State)
```

---

## Phase 2: Namespace Renaming (20 minutes)

### Step 1: Open Find & Replace
1. Open your project in Visual Studio
2. Press `Ctrl+H` to open Find & Replace
3. Enable "Match Case" and "Regular Expressions"

### Step 2: Replace C# Namespaces
```
Find:    ^namespace Bloxstrap
Replace: namespace JesterBloxx
Scope:   Entire Solution
```

### Step 3: Replace Using Statements
```
Find:    using Bloxstrap
Replace: using JesterBloxx
Scope:   Entire Solution
```

### Step 4: Replace XAML References
```
Find:    clr-namespace:Bloxstrap
Replace: clr-namespace:JesterBloxx
Scope:   Entire Solution
```

---

## Phase 3: File Organization (30 minutes)

### Recommended Structure
```
JesterBloxx/
├── Core/
│   ├── Bootstrapper.cs
│   ├── Installer.cs
│   ├── LaunchHandler.cs
│   ├── LaunchSettings.cs
│   └── Paths.cs
├── Integrations/
│   ├── Discord/
│   │   └── DiscordPresence.cs
│   └── Server/
│       └── ServerDetection.cs
├── Models/
│   ├── Attributes/
│   ├── Enums/
│   ├── Exceptions/
│   └── *.cs (Data models)
├── UI/
│   ├── Styles/
│   │   ├── DarkRedTheme.xaml
│   │   └── *.xaml
│   ├── Windows/
│   ├── ViewModels/
│   └── Pages/
├── Utilities/
│   ├── Cache/
│   ├── Extensions/
│   ├── Helpers/
│   └── Logging/
├── Resources/
│   ├── Fonts/
│   ├── Icons/
│   ├── Mods/
│   └── Strings/
└── App.xaml
```

### How to Move Files
1. In Solution Explorer, right-click file
2. Select "Cut"
3. Navigate to destination folder
4. Right-click folder, select "Paste"
5. Visual Studio will auto-update references

---

## Phase 4: Apply Dark Red Theme (45 minutes)

### Step 1: Reference Theme in App.xaml
```xaml
<Application.Resources>
    <ResourceDictionary>
        <ResourceDictionary.MergedDictionaries>
            <ResourceDictionary Source="UI/Styles/DarkRedTheme.xaml"/>
        </ResourceDictionary.MergedDictionaries>
    </ResourceDictionary>
</Application.Resources>
```

### Step 2: Apply Styles to Windows
```xaml
<Window ... Style="{StaticResource JesterBloxxWindow}">
    <Button Style="{StaticResource JesterBloxxButton}">Click Me</Button>
</Window>
```

### Step 3: Update Color References
Replace all WPF color hardcodes:
- `#8B0000` (Primary Dark Red)
- `#DC143C` (Accent Crimson)
- `#000000` (Background Black)
- `#FFFFFF` (Text White)

---

## Phase 5: Icons & Assets (1 hour)

### Icon Replacement

#### Main Application Icon
- Replace: `JesterBloxx/Resources/JesterBloxx.ico`
- Size: 32x32 minimum
- Format: ICO
- Theme: Jester motif with dark red

#### Application Icons
Update in `Resources/Icons/`:
- `Icon2008.ico` through `Icon2022.ico`
- Keep consistent with dark red theme

### Asset Organization
```
Resources/
├── Icons/
│   ├── JesterBloxx.ico (Main app icon)
│   ├── JesterBloxx-16x16.png
│   ├── JesterBloxx-48x48.png
│   └── [Year icons]
├── Fonts/
│   └── [Font files]
├── Mods/
│   ├── Cursor/
│   └── Sounds/
└── UI/
    └── [UI Assets]
```

---

## Phase 6: Strings & Localization (20 minutes)

### Update Application Title
File: `App.xaml.cs`
```csharp
public partial class App : Application
{
    public const string AppName = "JesterBloxx";
    public const string AppVersion = "1.0.0";
}
```

### Update Window Titles
Search for hardcoded "Bloxstrap" strings and replace with "JesterBloxx"

### Update Menu Items & Labels
Update any UI text that references the old name

---

## Phase 7: Testing & Build (1 hour)

### Build Verification
```
✓ Solution builds without errors
✓ All namespaces updated
✓ No Bloxstrap references remain
✓ Theme applies correctly
✓ All colors match spec
```

### Functional Testing
- [ ] Application starts
- [ ] Main window displays correctly
- [ ] Dark red theme applied
- [ ] Black background visible
- [ ] Buttons respond to hover/click
- [ ] All UI elements visible
- [ ] Discord integration works
- [ ] Roblox launch works

### Run Commands
```bash
# Build solution
dotnet build

# Run application
dotnet run

# Build release
dotnet publish -c Release
```

---

## Subtle Jester Theme Elements

### Optional Enhancements

#### Tooltips
```csharp
// Add playful jester references to tooltips
"The Jester is in control now! 🎭"
"Time to play with style! 🎮"
```

#### Splash Screen
Add jester imagery or jokes during loading

#### Settings Window
- Jester-themed icon for settings
- Fun descriptions of options

#### Status Messages
```csharp
"JesterBloxx is ready to play! 🎭"
"Preparing your game... with style! 🎪"
```

---

## Troubleshooting

### Issue: Build fails with namespace errors
**Solution:** 
1. Clean solution (Build → Clean Solution)
2. Rebuild (Build → Rebuild Solution)
3. Check for missed replacements

### Issue: XAML won't load
**Solution:**
1. Verify namespace declarations
2. Check XML syntax
3. Look for circular references

### Issue: Theme not applying
**Solution:**
1. Verify ResourceDictionary is merged in App.xaml
2. Check brush names match
3. Rebuild solution

---

## Command Reference

### Visual Studio Find & Replace (Ctrl+H)

| Find | Replace | Notes |
|------|---------|-------|
| `^namespace Bloxstrap$` | `namespace JesterBloxx` | All namespaces |
| `using Bloxstrap` | `using JesterBloxx` | Using statements |
| `clr-namespace:Bloxstrap` | `clr-namespace:JesterBloxx` | XAML refs |
| `Bloxstrap\.` | `JesterBloxx.` | Type references |

---

## Scripts & Tools

### PowerShell Script
```powershell
# Dry run (preview changes)
.\Transform-JesterBloxx.ps1 -DryRun

# Apply transformations
.\Transform-JesterBloxx.ps1
```

### Batch Helper
```cmd
Start-Transformation.bat
```

---

## Before & After Checklist

### Before Transformation
- [ ] Backup created
- [ ] Solution builds successfully
- [ ] All tests pass

### After Transformation
- [ ] All namespaces updated to JesterBloxx
- [ ] All files properly organized
- [ ] Dark red theme applied throughout
- [ ] Icons updated with jester branding
- [ ] No Bloxstrap references remain
- [ ] Solution builds without errors
- [ ] All functionality preserved
- [ ] Application runs correctly

---

## Resources

- **Original Project:** [bloxstraplabs/bloxstrap](https://github.com/bloxstraplabs/bloxstrap)
- **UI Framework:** [WPF UI](https://github.com/lepoco/wpfui)
- **XAML Reference:** [Microsoft XAML Docs](https://docs.microsoft.com/en-us/windows/uwp/xaml-platform/)

---

## Tips & Best Practices

1. **Git Commits**
   - Commit after each phase
   - Use descriptive messages: "Phase X: [Description]"

2. **Testing**
   - Test each phase before moving to next
   - Build frequently
   - Keep backup until confident

3. **Organization**
   - Use consistent naming conventions
   - Keep related code together
   - Document custom styles

4. **Theme Updates**
   - Test theme in multiple windows
   - Ensure sufficient color contrast
   - Validate on different resolutions

---

**🎭 Happy coding! Make JesterBloxx your own! 🎪**
