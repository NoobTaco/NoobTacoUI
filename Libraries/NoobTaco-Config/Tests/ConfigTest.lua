local Name, _ = ...
local Lib = LibStub("NoobTaco-Config-1.0")
local ConfigTest = {}

-- Only load if Config Lib is present
if not Lib then return end

ConfigTest.Schemas = {}

local function BuildSchemas()
  if ConfigTest.Schemas.General then return end -- Already built

  -- 1. ABOUT SECTION
  ConfigTest.Schemas.About = {
    type = "group",
    children = {
      {
        type = "about",
        icon = Lib.Media .. "\\Textures\\noobtaco-config-logo.tga", -- Library Logo
        title = "|chighlight|Config Library|r Showcase",
        version = "v1.2.1",
        description =
        "Welcome to the |chighlight|NoobTaco-Config|r showcase. This application demonstrates all available widgets, layout options, and the dynamic theming engine.\n\nUse the sidebar to explore different feature sets. This environment uses a |cinfo|temporary state buffer|r, meaning changes here will not affect your persistent addon settings.",
        links = {
          { label = "Documentation", url = "https://github.com/NoobTaco/NoobTaco-Config" },
          { label = "GitHub",        url = "https://github.com/NoobTaco/NoobTaco-Config" },
          { label = "Discord",       url = "https://discord.gg/noobtaco" },
        }
      },
      { type = "header", label = "System Overview" },
      {
        type = "row",
        children = {
          {
            type = "callout",
            title = "|csuccess|Library Ready|r",
            text =
            "The configuration engine is fully initialized and utilizing the |chighlight|Poppins|r modern font family.",
            buttonText = "LOG STATUS",
            style = "success",
            onButtonClick = function() print("Config Library: Status Nominal") end
          },
        }
      }
    }
  }

  -- 2. INPUT ELEMENTS
  ConfigTest.Schemas.Inputs = {
    type = "group",
    children = {
      { type = "header",      label = "Standard Input Elements" },
      { type = "description", text = "These widgets allow for direct data entry and state manipulation using the |chighlight|Lib.State|r management system." },

      {
        type = "card",
        label = "Toggles & Binary State",
        children = {
          { id = "test_checkbox_1", type = "checkbox",                                                                                          label = "Standard Checkbox", default = true },
          { id = "test_checkbox_2", type = "checkbox",                                                                                          label = "Inverted Checkbox", default = false, invertValue = true },
          { type = "description",   text = "|cinfo|Note:|r Inverted checkboxes are useful for 'Hide' style settings (Checked = False in data)." },
        }
      },

      {
        type = "card",
        label = "Range & Text Selection",
        children = {
          { id = "test_slider",  type = "slider",      label = "Numeric Slider",       min = 0,                max = 100, step = 1, default = 50 },
          { id = "test_editbox", type = "editbox",     label = "Text Input Field",     default = "Sample Text" },
          { id = "test_color",   type = "colorpicker", label = "Color Palette Swatch", default = "FFCC00" },
        }
      }
    }
  }

  -- 3. SELECTORS & MEDIA
  ConfigTest.Schemas.Selectors = {
    type = "group",
    children = {
      { type = "header",      label = "Selection & Media" },
      { type = "description", text = "Advanced components for choosing from datasets or interacting with game assets like sounds." },

      {
        type = "card",
        label = "Dropdown Components",
        children = {
          {
            id = "test_dropdown",
            type = "dropdown",
            label = "Generic Dropdown",
            default = "opt1",
            options = {
              { label = "Option Alpha",                value = "opt1" },
              { label = "Option Beta",                 value = "opt2" },
              { label = "Option Gamma",                value = "opt3" },
              { label = "|chighlight|Themed Option|r", value = "opt4" },
            }
          }
        }
      },

      {
        type = "card",
        label = "Asset Selection",
        children = {
          {
            id = "test_media",
            type = "media",
            label = "Sound Library Selector",
            default = "Sound\\Interface\\RaidWarning.ogg",
            options = {
              { label = "Raid Warning", value = "Sound\\Interface\\RaidWarning.ogg" },
              { label = "Level Up",     value = "Sound\\Interface\\LevelUp.ogg" },
              { label = "Murloc",       value = "Sound\\Creature\\Murloc\\mMurlocAggroOld.ogg" },
            }
          },
          { type = "description", text = "The |chighlight|media|r widget includes a built-in play button for asset previewing." }
        }
      }
    }
  }

  -- 4. FEEDBACK & ALERTS
  ConfigTest.Schemas.Feedback = {
    type = "group",
    children = {
      { type = "header",      label = "Feedback & Communication" },
      { type = "description", text = "The library provides several ways to communicate status, errors, or guidance to the user." },

      {
        type = "card",
        label = "Inline Alerts",
        children = {
          { type = "alert", severity = "info",    text = "|cinfo|Information:|r This is a standard informational alert." },
          { type = "alert", severity = "success", text = "|csuccess|Success:|r The operation was completed successfully." },
          { type = "alert", severity = "warning", text = "|cwarning|Warning:|r Please review these settings before proceeding." },
          { type = "alert", severity = "error",   text = "|cerror|Error:|r An unexpected issue has occurred." },
        }
      },

      { type = "header", label = "Interactive Callouts" },
      {
        type = "callout",
        title = "Feature Highlight",
        text =
        "Callouts are |chighlight|high-impact|r banners designed to draw attention to specific actions or critical setup steps.",
        buttonText = "EXECUTE ACTION",
        style = "info",
        onButtonClick = function() print("Callout Action Executed") end
      },
      {
        type = "callout",
        title = "Warning Requirement",
        text =
        "This callout demonstrates a |cwarning|warning state|r. It uses theme-aware coloring for both the border and the action button.",
        buttonText = "ACKNOWLEDGE",
        style = "warning",
        onButtonClick = function() print("Warning Acknowledged") end
      }
    }
  }

  -- 5. BUTTON STYLES
  ConfigTest.Schemas.Buttons = {
    type = "group",
    children = {
      { type = "header",      label = "Interactive Components" },
      { type = "description", text = "Showcase of all predefined button styles and custom color override capabilities." },

      {
        type = "card",
        label = "Predefined Styles",
        children = {
          {
            type = "row",
            children = {
              { type = "button", label = "Primary",   style = "primary",   width = 120, onClick = function() end },
              { type = "button", label = "Secondary", style = "secondary", width = 120, onClick = function() end },
            }
          },
          {
            type = "row",
            children = {
              { type = "button", label = "Success", style = "success", width = 120, onClick = function() end },
              { type = "button", label = "Info",    style = "info",    width = 120, onClick = function() end },
              { type = "button", label = "Warning", style = "warning", width = 120, onClick = function() end },
              { type = "button", label = "Error",   style = "error",   width = 120, onClick = function() end },
            }
          }
        }
      },

      {
        type = "card",
        label = "Custom Overrides",
        children = {
          {
            type = "button",
            label = "Custom Color & Text Override",
            width = 250,
            customColors = {
              normal = { 0.4, 0.1, 0.6, 1 }, -- Purple
              hover  = { 0.6, 0.2, 0.8, 1 },
              text   = { 0, 1, 1, 1 }        -- Cyan text
            },
            onClick = function() end
          }
        }
      }
    }
  }

  -- 6. THEME ENGINE
  ConfigTest.Schemas.Theme = {
    type = "group",
    children = {
      { type = "header",      label = "Dynamic Theming" },
      { type = "description", text = "The library supports live theme switching. All colors, including |chighlight|inline tokens|r, update instantly across the entire UI." },

      {
        type = "card",
        label = "Theme Selection",
        children = {
          {
            id = "activeTheme",
            type = "dropdown",
            label = "Select Active Theme",
            default = "NoobTaco",
            options = {
              { label = "NoobTaco (Standard)", value = "NoobTaco" },
              { label = "Nord (Frost)",        value = "Nord" },
              { label = "Catppuccin (Mocha)",  value = "Catppuccin" },
              { label = "Legacy / Default",    value = "Default" },
            },
            onChange = function(value)
              Lib.Theme:SetTheme(value)
            end
          }
        }
      },

      { type = "header", label = "Token Demonstration" },
      {
        type = "card",
        label = "Theme Tokens in Strings",
        children = {
          { type = "description", text = "|chighlight|chighlight|r: Primary highlight color." },
          { type = "description", text = "|cheader|cheader|r: Main accent / header color." },
          { type = "description", text = "|cinfo|cinfo|r: Informational / Secondary blue." },
          { type = "description", text = "|csuccess|csuccess|r: Success green." },
          { type = "description", text = "|cwarning|cwarning|r: Warning amber." },
          { type = "description", text = "|cerror|cerror|r: Error red." },
        }
      }
    }
  }
end

-- ============================================================================
-- INITIALIZATION
-- ============================================================================
function ConfigTest:Initialize()
  local categoryName = "Library Showcase"

  BuildSchemas()

  local canvas = CreateFrame("Frame", nil, UIParent)
  canvas:SetSize(800, 600)

  if Settings and Settings.RegisterCanvasLayoutCategory then
    local category = Settings.RegisterCanvasLayoutCategory(canvas, categoryName)
    Settings.RegisterAddOnCategory(category)

    local hasRenderedOnce = false

    local function TryRender()
      local width = canvas:GetWidth()
      if width > 10 and (not canvas.lastRenderedWidth or math.abs(canvas.lastRenderedWidth - width) > 5) then
        self:RenderContent(canvas)
        canvas.lastRenderedWidth = width
      end
    end

    canvas:SetScript("OnShow", function()
      if not hasRenderedOnce then
        TryRender()
        C_Timer.After(0, function()
          TryRender()
          hasRenderedOnce = true
        end)
      else
        TryRender()
      end
    end)

    canvas:SetScript("OnSizeChanged", TryRender)
  end
end

function ConfigTest:RenderContent(parent)
  local Schemas = ConfigTest.Schemas

  -- Initialize State with Showcase DB
  local ShowcaseDB = {
    test_checkbox_1 = true,
    test_checkbox_2 = false,
    test_slider = 50,
    test_editbox = "Config Lib v1.0",
    test_color = "00A8FF",
    test_dropdown = "opt1",
    test_media = "Sound\\Interface\\RaidWarning.ogg",
    activeTheme = "NoobTaco",
  }
  Lib.State:Initialize(ShowcaseDB)

  -- Layout Initialization
  local layout = parent.Layout
  if not layout then
    layout = Lib.Layout:CreateTwoColumnLayout(parent)
    parent.Layout = layout
    layout:SetScale(1.0)

    -- Sidebar Configuration
    Lib.Layout:AddSidebarButton(layout, "about", "Overview", function()
      Lib.State:SetValue("lastSection", "about")
      Lib.Renderer:Render(Schemas.About, layout)
    end)
    Lib.Layout:AddSidebarButton(layout, "inputs", "Inputs", function()
      Lib.State:SetValue("lastSection", "inputs")
      Lib.Renderer:Render(Schemas.Inputs, layout)
    end)
    Lib.Layout:AddSidebarButton(layout, "selectors", "Selectors", function()
      Lib.State:SetValue("lastSection", "selectors")
      Lib.Renderer:Render(Schemas.Selectors, layout)
    end)
    Lib.Layout:AddSidebarButton(layout, "buttons", "Buttons", function()
      Lib.State:SetValue("lastSection", "buttons")
      Lib.Renderer:Render(Schemas.Buttons, layout)
    end)
    Lib.Layout:AddSidebarButton(layout, "feedback", "Feedback", function()
      Lib.State:SetValue("lastSection", "feedback")
      Lib.Renderer:Render(Schemas.Feedback, layout)
    end)
    Lib.Layout:AddSidebarButton(layout, "theme", "Theme Engine", function()
      Lib.State:SetValue("lastSection", "theme")
      Lib.Renderer:Render(Schemas.Theme, layout)
    end)
  end

  -- Initial Render
  local lastSection = Lib.State:GetValue("lastSection") or "about"
  local sectionSchemas = {
    about     = Schemas.About,
    inputs    = Schemas.Inputs,
    selectors = Schemas.Selectors,
    buttons   = Schemas.Buttons,
    feedback  = Schemas.Feedback,
    theme     = Schemas.Theme
  }

  Lib.Layout:SelectSidebarButton(layout, lastSection)
  Lib.Renderer:Render(sectionSchemas[lastSection] or Schemas.About, layout)
end

-- Initialize on Login
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function() ConfigTest:Initialize() end)
