# Showcase Image Generators

This directory contains scripts to generate professional showcase images for the NoobTacoUI-Media addon, displaying fonts and textures with Nord theme styling.

## Scripts

### Font Showcase Generator (`generate_font_showcase.py`)
Generates showcase images displaying all included Google Fonts with their various weights in a professional 2-column layout.

### Texture Showcase Generator (`generate_texture_showcase.py`)  
Generates showcase images displaying all Nord-themed textures, showing both solid colors and gradient versions side by side.

## Font Showcase Features

- **2-Column Layout**: Efficient display of all font families and weights
- **WoW Theme**: Includes World of Warcraft quotes for authentic feel
- **Nord Theme**: Uses the same Nord color palette as the addon
- **Professional Layout**: Clean, organized display of all font families and weights
- **Sample Text**: Shows each font with abbreviated sample text optimized for 2-column view
- **Multiple Quality Options**: High and medium quality settings for different use cases
- **Customizable**: Adjustable width and output path

## Font Showcase Usage

### Basic Usage
```bash
# Generate high-quality 2-column font showcase (default settings)
python3 generate_font_showcase.py

# Generate with custom output path
python3 generate_font_showcase.py --output ../font_showcase_2col.png

# Generate medium quality for web use
python3 generate_font_showcase.py --quality medium --width 900
```

### Font Showcase Options

- `--fonts-dir`: Path to fonts directory (default: `../../Media/Fonts`)
- `--output`: Output image path (default: `font_showcase.png`)
- `--width`: Image width in pixels (default: 1200)
- `--quality`: Image quality - `high` or `medium` (default: high)

## Texture Showcase Usage

### Basic Usage
```bash
# Generate high-quality texture showcase (default settings)
python3 generate_texture_showcase.py

# Generate with custom output path  
python3 generate_texture_showcase.py --output ../texture_showcase.png

# Generate medium quality for web use
python3 generate_texture_showcase.py --quality medium --width 800
```

### Texture Showcase Options

- `--textures-dir`: Path to textures directory (default: `../../Media/Textures`)
- `--output`: Output image path (default: `texture_showcase.png`)
- `--width`: Image width in pixels (default: 1000)
- `--quality`: Image quality - `high` or `medium` (default: high)

### Font Showcase Examples

```bash
# High-quality 2-column image for detailed viewing
python3 generate_font_showcase.py --width 1200 --quality high

# Smaller image for web/social media
python3 generate_font_showcase.py --width 800 --quality medium

# Custom output location
python3 generate_font_showcase.py --output ~/Desktop/addon_fonts.png
```

### Texture Showcase Examples

```bash
# High-quality texture comparison image
python3 generate_texture_showcase.py --width 1000 --quality high

# Compact version for documentation
python3 generate_texture_showcase.py --width 700 --quality medium

# Custom output location
python3 generate_texture_showcase.py --output ~/Desktop/addon_textures.png
```

## Requirements

- Python 3.6+
- Pillow (PIL) library

### Installing Dependencies

```bash
# Ubuntu/Debian
sudo apt install python3-pil

# Or using pip (if available)
pip3 install Pillow
```

## Output

### Font Showcase
The font script generates a PNG image showcasing:

1. **Header**: Addon title with WoW quote ("May your blades never dull!")
2. **2-Column Layout**: Efficient display of all 7 font families
3. **Font Families**: Montserrat, Roboto, Lato, Dosis, Exo2, Mukta, Poppins (left column: first 4, right column: remaining 3)
4. **Font Weights**: All available weights for each family
5. **Sample Text**: "The quick brown fox jumps 123" (optimized for 2-column view)
6. **Footer**: LibSharedMedia-3.0 compatibility information

### Texture Showcase
The texture script generates a PNG image showcasing:

1. **Header**: Addon title with WoW quote ("The elements will destroy you!")
2. **2-Column Layout**: Solid colors on left, gradients on right
3. **All 16 Nord Colors**: Nord00 through Nord15 with hex codes
4. **Color Bars**: Visual representation of each texture
5. **Gradient Preview**: Shows how gradient textures appear
6. **Footer**: Usage and compatibility information

### Generated Files

**Font Showcases:**
- `font_showcase_2col.png`: High-quality 2-column version (typically 1200x1500+ pixels)
- `font_showcase_2col_medium.png`: Medium-quality version (smaller file size)

**Texture Showcases:**
- `texture_showcase.png`: High-quality texture comparison (typically 1000x1260 pixels)
- `texture_showcase_medium.png`: Medium-quality version (smaller file size)

## Font Families Included

- **Montserrat**: 5 weights (Black, Bold, Medium, Regular, SemiBold)
- **Roboto**: 4 weights (Black, Bold, Medium, Regular)
- **Lato**: 3 weights (Black, Bold, Regular)
- **Dosis**: 7 weights (Bold, ExtraBold, ExtraLight, Light, Medium, Regular, SemiBold)
- **Exo2**: 6 weights (Black, Bold, ExtraBold, Medium, Regular, SemiBold)
- **Mukta**: 7 weights (Bold, ExtraBold, ExtraLight, Light, Medium, Regular, SemiBold)
- **Poppins**: 9 weights (Black, Bold, ExtraBold, ExtraLight, Italic, Medium, Regular, SemiBold, Thin)

## Notes

- The script automatically detects missing font files and displays appropriate error messages
- Uses system fallback fonts for UI elements (headers, labels) if custom fonts aren't available
- Images are optimized for file size while maintaining quality
- Colors match the Nord theme used throughout the addon

## Use Cases

**Font Showcases:**
- **Addon Store Pages**: Upload to CurseForge, WoWInterface, etc.
- **Documentation**: Include in README files or wikis
- **Social Media**: Share font collection highlights
- **Presentations**: Show font capabilities in videos or streams

**Texture Showcases:**
- **UI Documentation**: Demonstrate available status bar textures
- **Theme Previews**: Show Nord color palette in action
- **Addon Galleries**: Visual representation of texture assets
- **Development Reference**: Quick color/texture reference for developers

## Technical Notes

- Both scripts automatically detect missing files and display appropriate error messages
- Use system fallback fonts for UI elements (headers, labels) if custom fonts aren't available
- Images are optimized for file size while maintaining quality
- Colors match the Nord theme used throughout the addon
- All generated images use PNG format for best quality and transparency support
