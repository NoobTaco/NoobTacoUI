# NoobTacoUI Assets

This directory contains generated showcase images and other assets for the NoobTacoUI addon. These files are included in the repository for documentation and promotional purposes but are excluded from the packaged addon distribution.

## 📁 Directory Structure

```
assets/
├── images/
│   ├── font_showcase.png          # High-quality font showcase (1200px wide)
│   ├── font_showcase_medium.png   # Medium-quality font showcase (900px wide)
│   ├── texture_showcase.png       # High-quality texture showcase (1000px wide)
│   └── texture_showcase_medium.png # Medium-quality texture showcase (800px wide)
└── README.md                      # This file
```

## 🖼️ Generated Images

### Font Showcases
- **Purpose**: Display all 41 Google Fonts included in the addon
- **Layout**: 2-column format with WoW theming
- **Features**: 
  - Font family names displayed in their own typeface
  - All font weights shown with sample text
  - WoW quote: "May your blades never dull!"
  - Nord color scheme matching the addon theme

### Texture Showcases  
- **Purpose**: Display all 32 Nord-themed status bar textures
- **Layout**: Side-by-side comparison of solid colors and gradients
- **Features**:
  - All 16 Nord colors (Nord00-Nord15)
  - Solid color bars on the left, gradient versions on the right
  - Hex color codes for reference
  - WoW quote: "The elements will destroy you!"

## 🔧 Generation

These images are generated using Python scripts located in `dev/scripts/`:

- `generate_font_showcase.py` - Creates font showcase images
- `generate_texture_showcase.py` - Creates texture showcase images

To regenerate the images:

```bash
cd dev/scripts

# Generate font showcases
python3 generate_font_showcase.py
python3 generate_font_showcase.py --quality medium --width 900 --output ../../assets/images/font_showcase_medium.png

# Generate texture showcases
python3 generate_texture_showcase.py
python3 generate_texture_showcase.py --quality medium --width 800 --output ../../assets/images/texture_showcase_medium.png
```

## 📦 Distribution

These assets are **NOT** included in the packaged addon distribution. They are excluded via `.pkgmeta` configuration:

```yaml
ignore:
    - assets
```

This keeps the addon package lightweight while providing promotional and documentation materials in the repository.

## 💡 Usage

These images are perfect for:

- **Addon Store Pages**: CurseForge, Wago screenshots
- **Documentation**: README embeds, wiki pages
- **Social Media**: Sharing font and texture collections
- **Development**: Reference materials for other addon developers

## 🎨 Styling

All images use the Nord color palette to match the addon's theme:

- **Background**: Nord0 (#2E3440)
- **Text**: Nord4-6 (light grays)
- **Accents**: Nord8 (cyan), Nord13 (yellow)
- **Sample Content**: Nord5 (off-white)

Images are optimized for web use while maintaining professional print quality for the high-resolution versions.
