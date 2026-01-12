# NoobTaco-Config API Reference

This document provides a technical overview of how to use the `NoobTaco-Config` library.

## 1. Initialization
The library should be initialized via `LibStub`.

```lua
local Lib = LibStub("NoobTaco-Config-1.0")
if not Lib then return end

-- Initialize state with your SavedVariables table
Lib.State:Initialize(MyAddon_SavedVars)
```

## 2. Layout & Workflow
The library is designed for a two-column layout (Sidebar + Content).

```lua
-- Create the main container (usually inside a Blizzard Settings canvas)
local layout = Lib.Layout:CreateTwoColumnLayout(parentFrame)

-- Add items to the sidebar
Lib.Layout:AddSidebarButton(layout, "general", "General Settings", function()
    -- Render the schema when clicked
    Lib.Renderer:Render(MySchema, layout)
end)
```

## 3. Schema Definition
Schemas are tables defining your UI components.

| Type | Key Properties |
| :--- | :--- |
| `group` | `children` (table) |
| `header` | `label` |
| `description`| `text` |
| `checkbox` | `id`, `label`, `default`, `invertValue`, `onChange` |
| `slider` | `id`, `label`, `min`, `max`, `step`, `default`, `onChange` |
| `dropdown` | `id`, `label`, `options` ({label, value}), `onChange` |
| `media` | `id`, `label`, `options` (sound paths), `onChange` |
| `button` | `label`, `onClick`, `style`, `customColors` |
| `callout` | `title`, `text`, `buttonText`, `style` ("warning", "error", "success", "info"), `onButtonClick` |
| `card` | `label`, `children` |
| `about` | `icon`, `title`, `version`, `description`, `links` ({label, url}) |

### Example Schema
```lua
local GeneralSchema = {
    type = "group",
    children = {
        { type = "header", label = "General Settings" },
        { id = "enableBuffs", type = "checkbox", label = "Enable Buff Tracker", default = true },
        { id = "uiScale", type = "slider", label = "Master Scale", min = 0.5, max = 2.0, step = 0.1, default = 1.0 },
    }
}
```

## 4. Themes
```lua
-- Register a custom theme
Lib.Theme:RegisterTheme("MyCustomTheme", themeTable)

-- Apply a theme
Lib.Theme:SetTheme("NoobTaco") -- NoobTaco, Nord, Catppuccin
```

### Theme Color Tokens
The library supports dynamic color tokens within strings (headers, descriptions, callouts, alerts). These tokens are automatically replaced with the current theme's hex colors and update live when the theme is changed.

Use the format `|ctoken|` where `token` is a valid theme key.

**Available Tokens:**
- `|cheader|`: The header/accent color.
- `|chighlight|`: The primary highlight color (e.g. Burnt Sienna in NoobTaco).
- `|ctext|`: The standard body text color.
- `|cborder|`: The theme's border color.
- `|cbackground|`: The theme's background color.

**Example:**
```lua
{ 
    type = "description", 
    text = "|chighlight|Important:|r This setting requires a UI reload." 
}
```
*Note: The library automatically appends the `|r` if you forget it, but it's best practice to include it for complex strings.*

## 5. Media & Assets
Use `Lib.Media` to get the base path for library assets. This ensures correct paths whether the library is standalone or embedded.

```lua
local fontPath = Lib.Media .. "\\Fonts\\Poppins-Regular.ttf"
```
