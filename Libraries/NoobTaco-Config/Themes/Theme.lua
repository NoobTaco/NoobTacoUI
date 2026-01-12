local Lib = LibStub("NoobTaco-Config-1.0")
local Theme = Lib.Theme

Theme.Current = "NoobTaco"

-- Lua Globals
local setmetatable, unpack, pairs = setmetatable, unpack, pairs
local math, string = math, string

-- Blizzard Globals
local CreateFrame = CreateFrame

Theme.Fonts = {
  Normal = Lib.Media .. "\\Fonts\\Poppins-Medium.ttf",
  Bold = Lib.Media .. "\\Fonts\\Poppins-Bold.ttf",
  ExtraBold = Lib.Media .. "\\Fonts\\Poppins-ExtraBold.ttf",
}

Theme.Presets = {
  Default = {
    background = { 0.05, 0.05, 0.05, 0.95 },
    header = { 1, 0.82, 0, 1 }, -- Blizzard Gold
    border = { 0.25, 0.25, 0.25, 1 },
    text = { 1, 1, 1, 1 },
    highlight = { 1, 0.82, 0, 1 },
    button = {
      normal = { 0.15, 0.15, 0.15, 1 },
      hover = { 0.25, 0.25, 0.25, 1 },
      selected = { 0.75, 0.61, 0, 1 }, -- Muted Blizzard Gold
      text = { 1, 1, 1, 1 },
    },
    alert = {
      warning = { 1, 0.82, 0, 1 },    -- Blizzard Gold
      error = { 1, 0.1, 0.1, 1 },     -- Blizzard Red
      success = { 0.1, 1, 0.1, 1 },   -- Blizzard Green
      info = { 0.21, 0.44, 0.86, 1 }, -- Blizzard Blue
    }
  },
  Nord = {
    background = { 0.18, 0.20, 0.25, 0.95 }, -- Polar Night
    header = { 0.53, 0.75, 0.82, 1 },        -- Frost (same as highlight)
    border = { 0.37, 0.42, 0.49, 1 },
    text = { 0.93, 0.94, 0.96, 1 },          -- Snow Storm
    highlight = { 0.53, 0.75, 0.82, 1 },     -- Frost
    button = {
      normal = { 0.29, 0.33, 0.41, 1 },      -- Nord3
      hover = { 0.37, 0.42, 0.49, 1 },       -- Nord3 Light
      selected = { 0.53, 0.75, 0.82, 1 },    -- Frost
      text = { 0.93, 0.94, 0.96, 1 },
    },
    alert = {
      warning = { 0.92, 0.80, 0.55, 1 }, -- Aurora Yellow
      error = { 0.75, 0.38, 0.45, 1 },   -- Aurora Red
      success = { 0.63, 0.79, 0.58, 1 }, -- Aurora Green
      info = { 0.56, 0.73, 0.80, 1 },    -- Frost Blue
    }
  },
  Catppuccin = {
    background = { 0.12, 0.12, 0.17, 0.95 }, -- Mocha Base
    header = { 0.78, 0.65, 0.94, 1 },        -- Mauve (same as highlight)
    border = { 0.36, 0.38, 0.49, 1 },        -- Surface
    text = { 0.80, 0.84, 0.93, 1 },          -- Text
    highlight = { 0.78, 0.65, 0.94, 1 },     -- Mauve
    button = {
      normal = { 0.19, 0.20, 0.27, 1 },      -- Mantle
      hover = { 0.36, 0.38, 0.49, 1 },       -- Surface1
      selected = { 0.78, 0.65, 0.94, 1 },    -- Mauve
      text = { 0.80, 0.84, 0.93, 1 },
    },
    alert = {
      warning = { 0.98, 0.78, 0.62, 1 }, -- Peach
      error = { 0.96, 0.48, 0.52, 1 },   -- Red
      success = { 0.65, 0.82, 0.55, 1 }, -- Green
      info = { 0.53, 0.75, 1, 1 },       -- Sapphire
    }
  },
  NoobTaco = {
    background = { 0.11, 0.15, 0.23, 0.60 }, -- Charcoal Navy (#1B263B)
    header = { 0.84, 0.51, 0.27, 1.00 },     -- Burnt Sienna (#D78144)
    border = { 0.84, 0.51, 0.27, 0.30 },     -- Burnt Sienna tint
    text = { 0.97, 0.98, 0.98, 1.00 },       -- Cloud White (#F8F9FA)
    highlight = { 0.96, 0.64, 0.38, 1.00 },  -- Golden Hour (#F4A261)
    button = {
      normal = { 0.14, 0.19, 0.29, 1.00 },
      hover = { 0.96, 0.64, 0.38, 1.00 },    -- Golden Hour
      selected = { 0.84, 0.51, 0.27, 1.00 }, -- Burnt Sienna
      text = { 0.97, 0.98, 0.98, 1.00 },
    },
    alert = {
      warning = { 0.96, 0.64, 0.38, 1.00 }, -- Specular Highlight color
      error = { 0.80, 0.30, 0.25, 1.00 },
      success = { 0.40, 0.70, 0.50, 1.00 },
      info = { 0.96, 0.64, 0.38, 1.00 }, -- Golden Hour
    }
  }
}

function Theme:GetColor(key)
  local preset = self.Presets[self.Current] or self.Presets.Default

  if key == "background" then return unpack(preset.background) end
  if key == "header" then return unpack(preset.header) end
  if key == "border" then return unpack(preset.border) end
  if key == "text" then return unpack(preset.text) end
  if key == "highlight" then return unpack(preset.highlight) end
  if key == "button_normal" then return unpack(preset.button.normal) end
  if key == "button_hover" then return unpack(preset.button.hover) end
  if key == "button_selected" then return unpack(preset.button.selected) end
  if key == "button_text" then return unpack(preset.button.text) end

  -- Support alert/severity colors as keys (for inline tokens)
  if preset.alert and preset.alert[key] then
    return unpack(preset.alert[key])
  end

  return 1, 1, 1, 1
end

function Theme:GetColorHex(key)
  local r, g, b, a = self:GetColor(key)
  -- Convert 0-1 to 0-255 and round to nearest integer
  r = math.floor(r * 255 + 0.5)
  g = math.floor(g * 255 + 0.5)
  b = math.floor(b * 255 + 0.5)
  a = math.floor((a or 1) * 255 + 0.5)
  return string.format("%02x%02x%02x%02x", a, r, g, b)
end

function Theme:GetFont(weight)
  return self.Fonts[weight] or self.Fonts.Normal
end

function Theme:GetAlertColor(severity)
  local preset = self.Presets[self.Current] or self.Presets.Default
  -- Normalize severity to lowercase for consistent lookup
  severity = string.lower(severity or "info")
  local color = preset.alert[severity] or preset.alert.info
  return unpack(color)
end

function Theme:GetButtonColorsForAlert(severity, overrideR, overrideG, overrideB)
  local r, g, b
  if overrideR and overrideG and overrideB then
    r, g, b = overrideR, overrideG, overrideB
  else
    r, g, b = self:GetAlertColor(severity)
  end

  -- Calculate hover (lighter)
  -- Mix with white for better visibility on bright colors
  local function mix(v1, v2, alpha) return v1 * (1 - alpha) + v2 * alpha end
  local function clamp(v) return math.min(1, math.max(0, v)) end
  local rh, gh, bh = mix(r, 1, 0.3), mix(g, 1, 0.3), mix(b, 1, 0.3)

  -- Calculate selected (darker)
  local rs, gs, bs = clamp(r - 0.2), clamp(g - 0.2), clamp(b - 0.2)

  return {
    normal = { r, g, b, 1 },
    hover = { rh, gh, bh, 1 },
    selected = { rs, gs, bs, 1 },
    text = { 0, 0, 0, 1 } -- Always black for alert buttons as they are usually bright
  }
end

function Theme:UpdateButtonState(btn)
  local state = (btn.isSelected and "selected" or (btn.isHover and "hover" or "normal"))
  local r, g, b, a

  -- If the button has a style, we re-evaluate the colors from the theme
  -- This ensures it updates when the theme changes.
  if btn.style then
    local colors = self:GetButtonColorsForStyle(btn.style)
    if colors then
      local tr, tg, tb, ta
      -- SPECIAL CASE: For sidebar buttons, we might want 'normal' to stay neutral
      -- unless it's selected/hovered to avoid it looking "stuck" in highlight mode.
      if btn.isSidebar and state == "normal" then
        r, g, b, a = self:GetColor("button_normal")
        tr, tg, tb, ta = self:GetColor("button_text")
      else
        r, g, b, a = unpack(colors[state] or colors.normal)
        tr, tg, tb, ta = unpack(colors.text or { 1, 1, 1, 1 })
      end

      -- Text color handling for styles
      if btn.Text then
        btn.Text:SetTextColor(tr, tg, tb, ta)
      end

      btn.bg:SetColorTexture(r, g, b, a)
      return
    end
  end

  if btn.customColors and btn.customColors[state] then
    r, g, b, a = unpack(btn.customColors[state])
  else
    r, g, b, a = self:GetColor("button_" .. state)
  end

  btn.bg:SetColorTexture(r, g, b, a)

  -- Handle Text Color
  if btn.Text then
    if btn.customColors and btn.customColors.text then
      btn.Text:SetTextColor(unpack(btn.customColors.text))
    else
      btn.Text:SetTextColor(self:GetColor("button_text"))
    end
  end
end

function Theme:GetButtonColorsForStyle(style)
  style = string.lower(style or "secondary")

  if style == "primary" or style == "accent" then
    local r, g, b = self:GetColor("highlight")
    return self:GetButtonColorsForAlert(style, r, g, b)
  elseif style == "secondary" or style == "normal" then
    return nil -- Use default theme colors
  else
    -- Alert styles (error, warning, success, info)
    return self:GetButtonColorsForAlert(style)
  end
end

local function TruncateText(fontString, text, maxWidth)
  if not fontString or not text then return end
  fontString:SetText(text)

  -- If width is not yet initialized (0), we cannot truncate accurately.
  -- Defer or use full text.
  local currentWidth = fontString:GetStringWidth()
  if currentWidth == 0 or currentWidth <= maxWidth then return end

  local length = string.len(text)
  while length > 0 and fontString:GetStringWidth() > maxWidth do
    length = length - 1
    fontString:SetText(string.sub(text, 1, length) .. "...")
  end
end

function Theme:ApplyFont(fontString, weight, size)
  if not fontString then return end
  fontString:SetFont(self:GetFont(weight or "Normal"), size or 12, "")
end

function Theme:ProcessText(text)
  if not text or type(text) ~= "string" then return text end

  -- Replace |cTOKEN| with |cAARRGGBB|
  -- We use a more specific pattern to ensure we only match our tokens
  return (text:gsub("|c([^|%s]+)|", function(token)
    -- If it's already a hex color (8 chars), leave it alone
    if #token == 8 and token:find("^%x+$") then
      return "|c" .. token
    end

    local hex = self:GetColorHex(token)
    if hex and hex ~= "ffffffff" or token == "text" then
      return "|c" .. hex
    end

    -- Fallback: return original if token not found or is default white
    return "|c" .. token .. "|"
  end))
end

-- Weak table to track objects that need theme updates
Theme.ObjectRegistry = setmetatable({}, { __mode = "k" })

function Theme:RegisterT(obj)
  if obj and obj.UpdateTheme then
    self.ObjectRegistry[obj] = true
    obj:UpdateTheme() -- Initial apply
  end
end

function Theme:ForceUpdate()
  for obj in pairs(self.ObjectRegistry) do
    if obj.UpdateTheme then
      obj:UpdateTheme()
    end
  end
end

function Theme:SetTheme(themeName)
  if self.Presets[themeName] then
    self.Current = themeName

    -- Update all registered objects
    self:ForceUpdate()

    -- Trigger refresh callback if needed
    if self.OnThemeChanged then
      self.OnThemeChanged()
    end
  end
end

-- Update CreateThemedButton to use the registry
function Theme:CreateThemedButton(parent)
  local btn = CreateFrame("Button", nil, parent)

  -- Background
  local bg = btn:CreateTexture(nil, "BACKGROUND")
  bg:SetAllPoints()
  btn.bg = bg

  -- Text
  local text = btn:CreateFontString(nil, "OVERLAY")
  text:SetFont(self:GetFont("Normal"), 12)
  text:SetPoint("CENTER")
  text:SetTextColor(self:GetColor("button_text"))
  btn.Text = text

  -- Theme Update Method
  btn.UpdateTheme = function(b)
    self:UpdateButtonState(b)
  end

  -- Scripts
  btn:SetScript("OnEnter", function(b)
    b.isHover = true
    self:UpdateButtonState(b)
  end)
  btn:SetScript("OnLeave", function(b)
    b.isHover = false
    self:UpdateButtonState(b)
  end)
  btn:SetScript("OnEnable", function(b)
    self:UpdateButtonState(b)
  end)
  btn:SetScript("OnDisable", function(_)
    -- Optional: dim?
  end)

  -- Methods
  btn.SetSelected = function(b, selected)
    b.isSelected = selected
    self:UpdateButtonState(b)
  end

  btn.SetLabel = function(b, newText)
    b.fullText = newText
    local currentWidth = b:GetWidth()
    local padding = 10
    if currentWidth > 0 then
      TruncateText(b.Text, newText, currentWidth - padding)
    else
      -- If width is not yet set, set text directly and hope for the best,
      -- or rely on a later call when width is known.
      b.Text:SetText(newText)
    end
  end

  -- Turn on registration
  self:RegisterT(btn)

  return btn
end

function Theme:RegisterTheme(name, themeData)
  if name and themeData then
    self.Presets[name] = themeData
  end
end
