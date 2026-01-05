#!/usr/bin/env python3
"""
Generate a texture showcase image for NoobTacoUI-Media addon
This script creates a professional showcase of all Nord-themed textures
"""

import os
import sys
from PIL import Image, ImageDraw, ImageFont
import argparse

# Nord color palette (matching the addon theme)
NORD_COLORS = {
    'nord0': '#2E3440',   'nord1': '#3B4252',   'nord2': '#434C5E',   'nord3': '#4C566A',
    'nord4': '#D8DEE9',   'nord5': '#E5E9F0',   'nord6': '#ECEFF4',   'nord7': '#8FBCBB',
    'nord8': '#88C0D0',   'nord9': '#81A1C1',   'nord10': '#5E81AC',  'nord11': '#BF616A',
    'nord12': '#D08770',  'nord13': '#EBCB8B',  'nord14': '#A3BE8C',  'nord15': '#B48EAD'
}

def hex_to_rgb(hex_color):
    """Convert hex color to RGB tuple"""
    hex_color = hex_color.lstrip('#')
    return tuple(int(hex_color[i:i+2], 16) for i in (0, 2, 4))

def create_color_bar(width, height, color):
    """Create a solid color bar image"""
    img = Image.new('RGB', (width, height), color)
    return img

def create_gradient_bar(width, height, color1, color2):
    """Create a horizontal gradient bar from color1 to color2"""
    img = Image.new('RGB', (width, height), color1)
    draw = ImageDraw.Draw(img)
    
    for x in range(width):
        # Calculate blend ratio
        ratio = x / width
        r = int(color1[0] * (1 - ratio) + color2[0] * ratio)
        g = int(color1[1] * (1 - ratio) + color2[1] * ratio)
        b = int(color1[2] * (1 - ratio) + color2[2] * ratio)
        
        # Draw vertical line
        draw.line([(x, 0), (x, height)], fill=(r, g, b))
    
    return img

def create_texture_showcase(textures_dir, output_path, width=1000, quality='high'):
    """Create a texture showcase image"""
    
    if quality == 'high':
        header_size = 48
        label_size = 16
        bar_height = 40
        bar_width = 280
        spacing = 20
        row_spacing = 60
    else:  # medium quality
        header_size = 36
        label_size = 14
        bar_height = 30
        bar_width = 220
        spacing = 15
        row_spacing = 45
    
    # Calculate dimensions
    content_width = (bar_width * 2) + spacing  # Two bars side by side
    content_height = 16 * row_spacing  # 16 Nord colors
    
    total_height = 200 + content_height + 100  # Header + content + footer
    
    # Create image
    img = Image.new('RGB', (width, total_height), hex_to_rgb(NORD_COLORS['nord0']))
    draw = ImageDraw.Draw(img)
    
    # Try to load fonts
    try:
        header_font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf", header_size)
        label_font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf", label_size)
        mono_font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf", label_size - 2)
    except:
        header_font = ImageFont.load_default()
        label_font = ImageFont.load_default()
        mono_font = ImageFont.load_default()
    
    y_pos = 50
    
    # Draw header
    title = "NoobTacoUI-Media Texture Collection"
    title_bbox = draw.textbbox((0, 0), title, font=header_font)
    title_width = title_bbox[2] - title_bbox[0]
    draw.text(((width - title_width) // 2, y_pos), title, 
              fill=hex_to_rgb(NORD_COLORS['nord6']), font=header_font)
    
    # WoW quote
    wow_quote = '"The elements will destroy you!" - Shaman battle cry'
    try:
        quote_font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans-Oblique.ttf", 16)
    except:
        quote_font = label_font
    
    quote_bbox = draw.textbbox((0, 0), wow_quote, font=quote_font)
    quote_width = quote_bbox[2] - quote_bbox[0]
    draw.text(((width - quote_width) // 2, y_pos + header_size + 10), wow_quote,
              fill=hex_to_rgb(NORD_COLORS['nord13']), font=quote_font)
    
    subtitle = "32 Nord-themed status bar textures • Solid colors + Gradients"
    subtitle_bbox = draw.textbbox((0, 0), subtitle, font=label_font)
    subtitle_width = subtitle_bbox[2] - subtitle_bbox[0]
    draw.text(((width - subtitle_width) // 2, y_pos + header_size + 40), subtitle,
              fill=hex_to_rgb(NORD_COLORS['nord4']), font=label_font)
    
    # Column headers
    y_pos += header_size + 90
    
    # Calculate starting positions for centered layout
    start_x = (width - content_width) // 2
    
    solid_x = start_x
    gradient_x = start_x + bar_width + spacing
    
    # Column headers
    draw.text((solid_x + bar_width//2 - 30, y_pos), "Solid Colors", 
              fill=hex_to_rgb(NORD_COLORS['nord8']), font=label_font)
    draw.text((gradient_x + bar_width//2 - 30, y_pos), "Gradients", 
              fill=hex_to_rgb(NORD_COLORS['nord8']), font=label_font)
    
    y_pos += 30
    
    # Draw texture bars
    for i in range(16):
        nord_key = f'nord{i}'
        color = hex_to_rgb(NORD_COLORS[nord_key])
        
        # Solid color bar
        solid_bar = create_color_bar(bar_width, bar_height, color)
        img.paste(solid_bar, (solid_x, y_pos))
        
        # Gradient bar (from color to slightly lighter version)
        lighter_color = tuple(min(255, c + 30) for c in color)
        gradient_bar = create_gradient_bar(bar_width, bar_height, color, lighter_color)
        img.paste(gradient_bar, (gradient_x, y_pos))
        
        # Labels
        label_text = f"Nord{i:02d}"
        hex_text = NORD_COLORS[nord_key].upper()
        
        # Label on the left
        draw.text((solid_x - 80, y_pos + bar_height//2 - 8), label_text,
                  fill=hex_to_rgb(NORD_COLORS['nord5']), font=label_font)
        
        # Hex code on the right
        draw.text((gradient_x + bar_width + 10, y_pos + bar_height//2 - 8), hex_text,
                  fill=hex_to_rgb(NORD_COLORS['nord3']), font=mono_font)
        
        y_pos += row_spacing
    
    # Add footer
    footer_y = total_height - 60
    footer_text = "LibSharedMedia-3.0 Compatible • Perfect for health bars, mana bars & UI elements"
    footer_bbox = draw.textbbox((0, 0), footer_text, font=label_font)
    footer_width = footer_bbox[2] - footer_bbox[0]
    draw.text(((width - footer_width) // 2, footer_y), footer_text,
              fill=hex_to_rgb(NORD_COLORS['nord3']), font=label_font)
    
    # Add usage note
    usage_text = "Use in any addon that supports LibSharedMedia-3.0 textures"
    usage_bbox = draw.textbbox((0, 0), usage_text, font=label_font)
    usage_width = usage_bbox[2] - usage_bbox[0]
    draw.text(((width - usage_width) // 2, footer_y + 25), usage_text,
              fill=hex_to_rgb(NORD_COLORS['nord3']), font=label_font)
    
    # Save image
    img.save(output_path, 'PNG', optimize=True)
    print(f"Texture showcase saved to: {output_path}")
    print(f"Image dimensions: {width}x{total_height}")
    
    return output_path

def main():
    parser = argparse.ArgumentParser(description='Generate NoobTacoUI-Media texture showcase')
    parser.add_argument('--textures-dir', default='../../Media/Textures', 
                       help='Path to textures directory (default: ../../Media/Textures)')
    parser.add_argument('--output', default='../../assets/images/texture_showcase.png',
                       help='Output image path (default: ../../assets/images/texture_showcase.png)')
    parser.add_argument('--width', type=int, default=1000,
                       help='Image width (default: 1000)')
    parser.add_argument('--quality', choices=['high', 'medium'], default='high',
                       help='Image quality/size (default: high)')
    
    args = parser.parse_args()
    
    # Resolve textures directory path
    script_dir = os.path.dirname(os.path.abspath(__file__))
    textures_dir = os.path.join(script_dir, args.textures_dir)
    textures_dir = os.path.normpath(textures_dir)
    
    print(f"Using textures directory: {textures_dir}")
    
    try:
        create_texture_showcase(textures_dir, args.output, args.width, args.quality)
        print("Texture showcase generated successfully!")
        return 0
    except Exception as e:
        print(f"Error generating texture showcase: {e}")
        return 1

if __name__ == "__main__":
    sys.exit(main())
