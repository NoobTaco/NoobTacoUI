# NoobTaco-Config Cheat Sheet

A comprehensive reference guide for all containers and elements available in the `NoobTaco-Config` library.

## 1. Containers
Containers are used to organize and scope your configuration items.

### `group`
The top-level container for a configuration section.
- **Properties**:
  - `type`: `"group"`
  - `children`: Table of element schemas.

### `row`
Organizes children horizontally.
- **Properties**:
  - `type`: `"row"`
  - `children`: Table of element schemas.

### `card`
A bordered container with a header bar.
- **Properties**:
  - `type`: `"card"`
  - `label`: Header text.
  - `children`: Table of element schemas.

### `about`
A specialized container for addon information.
- **Properties**:
  - `type`: `"about"`
  - `icon`: Path to icon texture.
  - `title`: Addon title.
  - `version`: Version string.
  - `description`: Multi-line description text.
  - `links`: Table of `{ label = "Name", url = "URL" }`.

---

## 2. Structural Elements
Elements that provide context or layout.

### `header`
A section title with an optional underline.
- **Properties**:
  - `type`: `"header"`
  - `label`: Title text.

### `description`
A block of informative text.
- **Properties**:
  - `type`: `"description"`
  - `text`: The descriptive content.

### `alert`
A colored message box for feedback or warnings.
- **Properties**:
  - `type`: `"alert"`
  - `severity`: `"info"`, `"success"`, `"warning"`, `"error"`.
  - `text`: Message content.

### `callout`
A standalone interactive banner with a title, text, and button.
- **Properties**:
  - `type`: `"callout"`
  - `title`: Headline text.
  - `text`: Body content.
  - `buttonText`: Text for the action button.
  - `style`: `"info"`, `"success"`, `"warning"`, `"error"`.
  - `onButtonClick`: Function called when the button is clicked.

---

## 3. Form Elements (Input)
Elements that allow users to change settings. These require an `id` for `Lib.State` persistence.

### `checkbox`
A simple toggle.
- **Properties**:
  - `id`: Unique identifier.
  - `type`: `"checkbox"`
  - `label`: Text shown next to the box.
  - `default`: Initial boolean value.

### `slider`
A range selector.
- **Properties**:
  - `id`: Unique identifier.
  - `type`: `"slider"`
  - `label`: Title text.
  - `min`: Minimum value.
  - `max`: Maximum value.
  - `step`: Incremental value.
  - `default`: Initial numeric value.

### `dropdown`
A selection menu.
- **Properties**:
  - `id`: Unique identifier.
  - `type`: `"dropdown"`
  - `label`: Label text.
  - `options`: Table of `{ label = "Text", value = any }`.
  - `default`: Initial value.
  - `onChange`: (Optional) Callback function `callback(value)`.

### `media`
A specialized dropdown for sound selection with a play button.
- **Properties**:
  - `id`: Unique identifier.
  - `type`: `"media"`
  - `label`: Label text.
  - `options`: Table of `{ label = "Sound Name", value = "Path\\To\\Sound" }`.
  - `default`: Initial path.

### `editbox`
A single-line text input.
- **Properties**:
  - `id`: Unique identifier.
  - `type`: `"editbox"`
  - `label`: Label text above the input.
  - `default`: Initial string.

### `colorpicker`
A color selection swatch.
- **Properties**:
  - `id`: Unique identifier.
  - `type`: `"colorpicker"`
  - `label`: Label text.
  - `default`: Initial hex string (e.g., `"FFFFFF"`).

---

## 4. Interaction
### `button`
A clickable action button.
- **Properties**:
  - `type`: `"button"`
  - `label`: Button text.
  - `width`: (Optional) Custom width.
  - `style`: (Optional) `"primary"`, `"secondary"`, `"info"`, `"success"`, `"warning"`, `"error"`.
  - `customColors`: (Optional) Table of `{ normal, hover, text }` (RGBA tables).
  - `onClick`: Callback function.

---

## 5. Inline Color Tokens
You can use theme-aware color tokens within any string property (e.g., `label`, `text`, `title`). These tokens are automatically replaced with the hex code of the current theme's color and update live when the theme is changed.

### Format
`|ctoken|Text content|r`

### Available Tokens
| Token | Description | Color Context |
| :--- | :--- | :--- |
| `|cheader|` | The primary accent/header color. | Often Gold or Bright White. |
| `|chighlight|`| The primary theme highlight color. | Burnt Sienna (NoobTaco), Blue (Nord), etc. |
| `|ctext|` | The default body text color. | Usually Cloud White or light grey. |
| `|csuccess|` | Success/Positive color. | Green. |
| `|cwarning|` | Warning/Caution color. | Orange/Amber. |
| `|cerror|` | Error/Danger color. | Red. |
| `|cinfo|` | Informational color. | Blue/Light Blue. |
| `|cborder|` | The theme's border color. | |
| `|cbackground|`| The theme's background color. | |

### Example Usage
```lua
{ 
  type = "description", 
  text = "|chighlight|Active Profile:|r |csuccess|Modern v1.0|r" 
}
```
