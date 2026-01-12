# NoobTaco-Config

[![CI](https://github.com/NoobTaco/NoobTaco-Config/actions/workflows/ci.yml/badge.svg)](https://github.com/NoobTaco/NoobTaco-Config/actions/workflows/ci.yml) [![Release](https://github.com/NoobTaco/NoobTaco-Config/actions/workflows/release.yml/badge.svg)](https://github.com/NoobTaco/NoobTaco-Config/actions/workflows/release.yml)

**NoobTaco-Config** is a modular, schema-driven configuration framework for World of Warcraft addons. Designed with a focus on "pixel-perfect" aesthetics and ease of use, it allows developers to build complex, themed options menus using simple Lua tables.

## 📸 Screenshots

| Overview | Theme Support |
| :---: | :---: |
| ![Welcome](https://raw.githubusercontent.com/NoobTaco/NoobTaco-Config/main/Media/Screenshots/noobtaco-config-welcome-ss.png) | ![Themes](https://raw.githubusercontent.com/NoobTaco/NoobTaco-Config/main/Media/Screenshots/noobtaco-config-theme-catppuccin-ss.png) |

> [!TIP]
> Use the [Library Showcase](https://github.com/NoobTaco/NoobTaco-Config/blob/main/Tests/ConfigTest.lua) in-game to see the dynamic theming and all widgets in action.

## ✨ Features

- 🛠️ **Declarative Schemas**: Define your entire UI layout in nested Lua tables.
- 🎨 **Dynamic Theming**: Built-in support for **NoobTaco**, **Nord**, and **Catppuccin** themes.
- 🔡 **Modern Typography**: Integrated with the **Poppins** font family for a sleek look.
- ⚡ **Transactional State**: Built-in commit/revert logic for user settings.
- 🌈 **Inline Color Tokens**: Use `|ctoken|` (e.g., `|chighlight|`) to dynamically style text based on the active theme.
- 📁 **Nested Data**: Native support for dot-notation in IDs to map directly to complex SavedVariables.
- 🔊 **Media Previewing**: Specialized media widgets with built-in playback for sounds.

## 🚀 Quick Start

### 1. Initialization
Retrieve the library via LibStub.

```lua
local Lib = LibStub("NoobTaco-Config-1.0")
if not Lib then return end
```

### 2. Create a Schema
Define the layout of your settings panel.

```lua
local schema = {
    type = "group",
    label = "General Settings",
    children = {
        {
            type = "about",
            icon = [[Interface\AddOns\MyAddon\Media\Logo]],
            title = "My Addon",
            version = "1.0.0",
            description = "A powerful configuration suite.",
            links = {
                { label = "GitHub", url = "https://github.com/..." }
            }
        },
        {
            type = "card",
            label = "Feature Settings",
            children = {
                 { id = "enableFeature", type = "checkbox", label = "Enable Magic", default = true },
                 { id = "powerLevel", type = "slider", label = "Power Level", min = 0, max = 100, default = 9000 }
            }
        }
    }
}
```

### 3. Rendering
```lua
-- Render directly to a Blizzard category frame
Lib.Renderer:Render(schema, myPanel)
```

## 🖼️ UI Showcase

| Inputs & Widgets | Buttons | Feedback & Alerts |
| :---: | :---: | :---: |
| ![Inputs](https://raw.githubusercontent.com/NoobTaco/NoobTaco-Config/main/Media/Screenshots/noobtaco-config-inputs-ss.png) | ![Buttons](https://raw.githubusercontent.com/NoobTaco/NoobTaco-Config/main/Media/Screenshots/noobtaco-config-button-ss.png) | ![Feedback](https://raw.githubusercontent.com/NoobTaco/NoobTaco-Config/main/Media/Screenshots/noobtaco-config-feedback-ss.png) |

## 🧪 Theme Engine
The library supports instant theme switching. All colors, including inline tokens, update in real-time.

| NoobTaco (Standard) | Nord (Frost) | Catppuccin (Mocha) |
| :---: | :---: | :---: |
| ![NoobTaco](https://raw.githubusercontent.com/NoobTaco/NoobTaco-Config/main/Media/Screenshots/noobtaco-config-theme-noobtaco-ss.png) | ![Nord](https://raw.githubusercontent.com/NoobTaco/NoobTaco-Config/main/Media/Screenshots/noobtaco-config-theme-nord-ss.png) | ![Catppuccin](https://raw.githubusercontent.com/NoobTaco/NoobTaco-Config/main/Media/Screenshots/noobtaco-config-theme-catppuccin-ss.png) |

## 📚 Documentation

- [Configuration Cheat Sheet](https://github.com/NoobTaco/NoobTaco-Config/blob/main/docs/CHEAT_SHEET.md) - All available containers and elements.
- [API Reference](https://github.com/NoobTaco/NoobTaco-Config/blob/main/docs/API_REFERENCE.md) - Detailed technical documentation.

## 📄 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
