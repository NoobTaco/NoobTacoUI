#!/usr/bin/env python3
"""
Generate a font showcase image for NoobTacoUI-Media addon
This script creates a professional showcase of all included fonts
"""

import os
import sys
from PIL import Image, ImageDraw, ImageFont
import argparse

# Nord color palette (matching the addon theme)
NORD_COLORS = {
    'nord0': '#2E3440',   # Dark background
    'nord1': '#3B4252',   # Darker background
    'nord2': '#434C5E',   # Dark accent
    'nord3': '#4C566A',   # Comment color
    'nord4': '#D8DEE9',   # Light text
    'nord5': '#E5E9F0',   # Lighter text
    'nord6': '#ECEFF4',   # Lightest text
    'nord7': '#8FBCBB',   # Cyan
    'nord8': '#88C0D0',   # Light cyan
    'nord9': '#81A1C1',   # Blue
    'nord10': '#5E81AC',  # Dark blue
    'nord11': '#BF616A',  # Red
    'nord12': '#D08770',  # Orange
    'nord13': '#EBCB8B',  # Yellow
    'nord14': '#A3BE8C',  # Green
    'nord15': '#B48EAD'   # Purple
}

def get_font_families():
    """Return organized font families with their weights"""
    return {
        'Montserrat': ['Black', 'Bold', 'Medium', 'Regular', 'SemiBold'],
        'Roboto': ['Black', 'Bold', 'Medium', 'Regular'],
        'Lato': ['Black', 'Bold', 'Regular'],
        'Dosis': ['Bold', 'ExtraBold', 'ExtraLight', 'Light', 'Medium', 'Regular', 'SemiBold'],
        'Exo2': ['Black', 'Bold', 'ExtraBold', 'Medium', 'Regular', 'SemiBold'],
        'Mukta': ['Bold', 'ExtraBold', 'ExtraLight', 'Light', 'Medium', 'Regular', 'SemiBold'],
        'Poppins': ['Black', 'Bold', 'ExtraBold', 'ExtraLight', 'Italic', 'Medium', 'Regular', 'SemiBold', 'Thin']
    }

def hex_to_rgb(hex_color):
    """Convert hex color to RGB tuple"""
    hex_color = hex_color.lstrip('#')
    return tuple(int(hex_color[i:i+2], 16) for i in (0, 2, 4))

def create_font_showcase(fonts_dir, output_path, width=1200, quality='high'):
    """Create a font showcase image"""
    
    # Calculate dimensions
    font_families = get_font_families()
    
    if quality == 'high':
        header_size = 48
        family_size = 28
        weight_size = 20
        sample_size = 18
        line_spacing = 8
        family_padding = 15  # Extra padding after family name
        section_spacing = 35
        column_spacing = 40
    else:  # medium quality for smaller file
        header_size = 36
        family_size = 22
        weight_size = 16
        sample_size = 14
        line_spacing = 6
        family_padding = 12  # Extra padding after family name
        section_spacing = 25
        column_spacing = 30
    
    # Calculate column width
    column_width = (width - column_spacing) // 2
    
    # Split font families into two columns
    family_list = list(font_families.items())
    col1_families = family_list[:4]  # First 4 families
    col2_families = family_list[4:]  # Remaining families
    
    # Calculate height needed for each column
    def calc_column_height(families):
        height = 0
        for family, weights in families:
            height += family_size + line_spacing + family_padding  # Family name + extra padding
            height += len(weights) * (weight_size + sample_size + line_spacing * 2)  # Weights
            height += section_spacing  # Space between families
        return height
    
    col1_height = calc_column_height(col1_families)
    col2_height = calc_column_height(col2_families)
    content_height = max(col1_height, col2_height)
    
    # Total height: header + content + footer
    height = 150 + content_height + 100  # Header space + content + footer space
    
    # Create image
    img = Image.new('RGB', (width, height), hex_to_rgb(NORD_COLORS['nord0']))
    draw = ImageDraw.Draw(img)
    
    try:
        # Try to use a system font for headers, fallback to default
        try:
            header_font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf", header_size)
            fallback_font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf", weight_size)
        except:
            header_font = ImageFont.load_default()
            fallback_font = ImageFont.load_default()
    except:
        header_font = ImageFont.load_default()
        fallback_font = ImageFont.load_default()
    
    y_pos = 50
    
    # Draw header
    title = "NoobTacoUI-Media Font Collection"
    title_bbox = draw.textbbox((0, 0), title, font=header_font)
    title_width = title_bbox[2] - title_bbox[0]
    draw.text(((width - title_width) // 2, y_pos), title, 
              fill=hex_to_rgb(NORD_COLORS['nord6']), font=header_font)
    
    # WoW quote instead of subtitle
    wow_quote = '"May your blades never dull!" - Traditional Orcish blessing'
    try:
        quote_font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans-Oblique.ttf", 16)
    except:
        try:
            quote_font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf", 16)
        except:
            quote_font = ImageFont.load_default()
    
    quote_bbox = draw.textbbox((0, 0), wow_quote, font=quote_font)
    quote_width = quote_bbox[2] - quote_bbox[0]
    draw.text(((width - quote_width) // 2, y_pos + header_size + 10), wow_quote,
              fill=hex_to_rgb(NORD_COLORS['nord13']), font=quote_font)
    
    subtitle = "High-quality Google Fonts for World of Warcraft addons"
    try:
        subtitle_font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf", 14)
    except:
        subtitle_font = ImageFont.load_default()
    
    subtitle_bbox = draw.textbbox((0, 0), subtitle, font=subtitle_font)
    subtitle_width = subtitle_bbox[2] - subtitle_bbox[0]
    draw.text(((width - subtitle_width) // 2, y_pos + header_size + 35), subtitle,
              fill=hex_to_rgb(NORD_COLORS['nord4']), font=subtitle_font)
    
    y_pos += header_size + 70
    
    # Draw fonts in two columns
    def draw_font_column(families, start_x, start_y):
        """Draw a column of font families"""
        y_pos = start_y
        
        for family_name, weights in families:
            # Try to use the family's regular font for the family name
            family_font = fallback_font  # Default fallback
            try:
                # Look for Regular weight first, then any available weight
                regular_font_file = f"{family_name}-Regular.ttf"
                regular_font_path = os.path.join(fonts_dir, regular_font_file)
                
                if os.path.exists(regular_font_path):
                    family_font = ImageFont.truetype(regular_font_path, family_size)
                else:
                    # Try the first available weight
                    for weight in weights:
                        font_file = f"{family_name}-{weight}.ttf"
                        font_path = os.path.join(fonts_dir, font_file)
                        if os.path.exists(font_path):
                            family_font = ImageFont.truetype(font_path, family_size)
                            break
            except:
                # If anything fails, stick with fallback
                pass
            
            # Draw family name using its own font
            draw.text((start_x, y_pos), family_name, 
                      fill=hex_to_rgb(NORD_COLORS['nord8']), font=family_font)
            y_pos += family_size + line_spacing + family_padding
            
            # Draw each weight
            for weight in weights:
                font_file = f"{family_name}-{weight}.ttf"
                font_path = os.path.join(fonts_dir, font_file)
                
                # Weight name
                weight_text = f"{weight}:"
                draw.text((start_x + 20, y_pos), weight_text,
                          fill=hex_to_rgb(NORD_COLORS['nord13']), font=fallback_font)
                
                # Sample text with the actual font (shorter for 2-column layout)
                sample_text = "The quick brown fox jumps 123"
                
                try:
                    if os.path.exists(font_path):
                        font = ImageFont.truetype(font_path, sample_size)
                        draw.text((start_x + 120, y_pos), sample_text,
                                  fill=hex_to_rgb(NORD_COLORS['nord5']), font=font)
                    else:
                        # Font file not found, use fallback
                        draw.text((start_x + 120, y_pos), f"{sample_text} [Missing]",
                                  fill=hex_to_rgb(NORD_COLORS['nord11']), font=fallback_font)
                except Exception as e:
                    # Error loading font, use fallback
                    draw.text((start_x + 120, y_pos), f"{sample_text} [Error]",
                              fill=hex_to_rgb(NORD_COLORS['nord11']), font=fallback_font)
                
                y_pos += weight_size + sample_size + line_spacing
            
            y_pos += section_spacing
    
    # Draw left column
    content_start_y = y_pos
    draw_font_column(col1_families, 30, content_start_y)
    
    # Draw right column
    draw_font_column(col2_families, 30 + column_width + column_spacing, content_start_y)
    
    # Add footer
    footer_text = "Compatible with LibSharedMedia-3.0 • Auto-registered in all compatible addons"
    try:
        footer_font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf", 14)
    except:
        footer_font = ImageFont.load_default()
    
    footer_bbox = draw.textbbox((0, 0), footer_text, font=footer_font)
    footer_width = footer_bbox[2] - footer_bbox[0]
    draw.text(((width - footer_width) // 2, height - 40), footer_text,
              fill=hex_to_rgb(NORD_COLORS['nord3']), font=footer_font)
    
    # Save image
    img.save(output_path, 'PNG', optimize=True)
    print(f"Font showcase saved to: {output_path}")
    print(f"Image dimensions: {width}x{height}")
    
    return output_path

def main():
    parser = argparse.ArgumentParser(description='Generate NoobTacoUI-Media font showcase')
    parser.add_argument('--fonts-dir', default='../../Media/Fonts', 
                       help='Path to fonts directory (default: ../../Media/Fonts)')
    parser.add_argument('--output', default='../../assets/images/font_showcase.png',
                       help='Output image path (default: ../../assets/images/font_showcase.png)')
    parser.add_argument('--width', type=int, default=1200,
                       help='Image width (default: 1200)')
    parser.add_argument('--quality', choices=['high', 'medium'], default='high',
                       help='Image quality/size (default: high)')
    
    args = parser.parse_args()
    
    # Resolve fonts directory path
    script_dir = os.path.dirname(os.path.abspath(__file__))
    fonts_dir = os.path.join(script_dir, args.fonts_dir)
    fonts_dir = os.path.normpath(fonts_dir)
    
    if not os.path.exists(fonts_dir):
        print(f"Error: Fonts directory not found: {fonts_dir}")
        print("Please specify the correct path with --fonts-dir")
        return 1
    
    print(f"Using fonts directory: {fonts_dir}")
    print(f"Found {len(os.listdir(fonts_dir))} font files")
    
    try:
        create_font_showcase(fonts_dir, args.output, args.width, args.quality)
        print("Font showcase generated successfully!")
        return 0
    except Exception as e:
        print(f"Error generating font showcase: {e}")
        return 1

if __name__ == "__main__":
    sys.exit(main())
