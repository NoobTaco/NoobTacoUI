# NoobTacoUI-Media: Clean Nord-Themed Config Menu ✨

## Project Overview

NoobTacoUI-Media now features a beautiful, professional config menu with Nord theming inspired by Plumber's excellent UX patterns. The project has been cleaned up to include only the final, polished implementation.

## What's Included

### ✅ Single, Refined Config Menu
- **Modern Nord color palette** for consistent, elegant theming
- **Professional UX patterns** inspired by Plumber's proven design
- **Clean, maintainable code** with modular architecture
- **Responsive design** that works on any screen size

### ✅ Key Features
- **Draggable interface** with smooth movement
- **Category-based organization** (Audio, General, About)
- **Collection Notifications integration** with detailed popup settings
- **Version information** and proper attribution
- **Interface Options integration** with WoW's settings panel

### ✅ Multiple Access Methods
```
/ntconfig     - Main config menu
/ntuiconfig   - Alternative command
/ntmedia      - Short alias
/ntuimedia    - Alternative alias
/ntcc         - Direct to Collection Notifications
```

## File Structure (Clean)

```
NoobTacoUI-Media/
├── Media/
│   ├── UIAssets.lua              ← Nord color palette & asset management
│   ├── SharedMedia.lua           ← LibSharedMedia integration
│   ├── Load_Media.xml            ← Media loading definition
│   ├── Audio/                    ← Sound files
│   ├── Fonts/                    ← Font files
│   └── Textures/                 ← Nord-themed textures (NT_nord*.tga)
├── modules/
│   ├── ConfigMenu.lua            ← ⭐ Main Nord-themed config menu
│   ├── CollectionNotifications.lua ← Notification system with popup
│   ├── version.lua               ← Version handling
│   └── load_modules.xml          ← Module loading definition
├── Libraries/                    ← LibSharedMedia dependencies
└── Documentation files excluded from packaging
```

## Nord Color Palette

The config menu uses a carefully selected Nord color scheme:

### Backgrounds
- **Nord0** (#2e3440) - Primary dark background
- **Nord1** (#3b4252) - Secondary panels
- **Nord2** (#434c5e) - Hover states
- **Nord3** (#4c566a) - Borders and dividers

### Text & Accents
- **Nord4-6** - Text hierarchy (dim to bright)
- **Nord8** (#88c0d0) - Primary accent (headers, highlights)
- **Nord11** (#bf616a) - Error/warning states
- **Nord13** (#ebcb8b) - Success/special states

## Development Notes

### ✅ Clean Architecture
- Single config menu implementation (no duplicates)
- Modular asset system for easy customization
- Proper separation of concerns
- No unused code or assets

### ✅ User Experience
- Intuitive category navigation
- Clear visual hierarchy
- Consistent interaction patterns
- Accessible design principles

### ✅ Maintainability
- Well-documented code
- Consistent naming conventions
- Modular structure for easy expansion
- Proper error handling

## Packaging

The `.pkgmeta` file ensures that documentation and development files are excluded from the final addon package, keeping it clean for end users.

## Credits

- **Config menu design** inspired by Plumber addon by Peterodox
- **Nord color scheme** by Arctic Ice Studio
- **Implementation** by NoobTaco for NoobTacoUI-Media

## Future Expansion

The clean, modular architecture makes it easy to:
- Add new configuration categories
- Customize colors and styling
- Extend functionality
- Maintain consistency across the addon suite

---

**Result**: A professional, clean, and maintainable config menu that provides an excellent user experience while staying true to the Nord aesthetic! 🎯
