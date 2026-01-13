-- NoobTacoUI Minimap Module
-- Creates a square minimap with themed border and addon button drawer

local addonName, addon = ...

-- WoW API
local CreateFrame = CreateFrame
local Minimap = Minimap
local GetMinimapShape = GetMinimapShape
local LibStub = LibStub

-- Early return if Minimap doesn't exist (shouldn't happen but safety check)
if not Minimap then
  return
end

-- Module initialization flag
local minimapModule = {}
addon.MinimapModule = minimapModule

-------------------------------------------------------------------------------
-- Utilities
-------------------------------------------------------------------------------
local function GetThemeColor()
  -- Get border color from NoobTaco-Config theme
  if addon.ConfigTheme then
    local r, g, b, a = addon.ConfigTheme:GetColor("border")
    return r or 0.84, g or 0.51, b or 0.27, a or 1 -- Fallback to Burnt Sienna
  end
  return 0.84, 0.51, 0.27, 1 -- Default: Burnt Sienna (#D78144)
end

-------------------------------------------------------------------------------
-- Square Minimap
-------------------------------------------------------------------------------
local function MakeMinimapSquare()
  -- Make minimap square
  Minimap:SetMaskTexture("Interface\\Buttons\\WHITE8X8")
  
  -- Create border frame if it doesn't exist
  if not Minimap.NoobTacoBorder then
    local border = CreateFrame("Frame", "NoobTacoUI_MinimapBorder", Minimap, "BackdropTemplate")
    border:SetFrameLevel(Minimap:GetFrameLevel() + 1)
    border:SetPoint("TOPLEFT", Minimap, "TOPLEFT", -1, 1)
    border:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMRIGHT", 1, -1)
    
    -- Set backdrop with 1px border
    local r, g, b, a = GetThemeColor()
    border:SetBackdrop({
      edgeFile = "Interface\\Buttons\\WHITE8X8",
      edgeSize = 1,
    })
    border:SetBackdropBorderColor(r, g, b, a)
    
    Minimap.NoobTacoBorder = border
  end
  
  -- Override GetMinimapShape for square detection
  if not minimapModule.originalGetMinimapShape then
    minimapModule.originalGetMinimapShape = GetMinimapShape
  end
  
  -- Make GetMinimapShape return SQUARE for LibDBIcon compatibility
  _G.GetMinimapShape = function()
    if minimapModule.isEnabled then
      return "SQUARE"
    else
      return minimapModule.originalGetMinimapShape and minimapModule.originalGetMinimapShape() or "ROUND"
    end
  end
end

local function RestoreRoundMinimap()
  -- Restore original round mask
  Minimap:SetMaskTexture("Interface\\ChatFrame\\ChatFrameBackground")
  
  -- Hide border
  if Minimap.NoobTacoBorder then
    Minimap.NoobTacoBorder:Hide()
  end
  
  -- Restore original GetMinimapShape
  if minimapModule.originalGetMinimapShape then
    _G.GetMinimapShape = minimapModule.originalGetMinimapShape
  end
end

-------------------------------------------------------------------------------
-- Addon Button Drawer
-------------------------------------------------------------------------------
local drawerFrame = nil
local drawerButtons = {}

local function CreateDrawerButton()
  -- Create drawer toggle button using LibDBIcon
  local LDB = LibStub("LibDataBroker-1.1", true)
  local LibDBIcon = LibStub("LibDBIcon-1.0", true)
  
  if not LDB or not LibDBIcon then
    return
  end
  
  -- Check if drawer button already registered
  if LibDBIcon:IsRegistered("NoobTacoUI_MinimapDrawer") then
    return
  end
  
  -- Create LDB data object for drawer
  local drawerLDB = LDB:NewDataObject("NoobTacoUI_MinimapDrawer", {
    type = "launcher",
    text = "Addons",
    icon = [[Interface\AddOns\NoobTacoUI\Media\Textures\logo.tga]],
    OnClick = function(self, button)
      if button == "LeftButton" then
        minimapModule:ToggleDrawer()
      end
    end,
    OnTooltipShow = function(tooltip)
      tooltip:SetText("NoobTaco Minimap Drawer")
      tooltip:AddLine("Left-click: Toggle addon buttons", 1, 1, 1)
      tooltip:AddLine("Collected buttons: " .. #drawerButtons, 0.7, 0.7, 0.7)
    end,
  })
  
  -- Ensure complete MinimapSettings structure exists
  if not NoobTacoUIDB.MinimapSettings then
    NoobTacoUIDB.MinimapSettings = {
      enabled = true,
      drawerEnabled = true,
      hiddenButtons = {},
      drawer = {
        hide = false,
        minimapPos = 180,
      }
    }
  else
    -- Ensure all required fields exist if MinimapSettings was partially initialized
    if not NoobTacoUIDB.MinimapSettings.drawer then
      NoobTacoUIDB.MinimapSettings.drawer = {
        hide = false,
        minimapPos = 180,
      }
    end
    if not NoobTacoUIDB.MinimapSettings.hiddenButtons then
      NoobTacoUIDB.MinimapSettings.hiddenButtons = {}
    end
  end
  
  LibDBIcon:Register("NoobTacoUI_MinimapDrawer", drawerLDB, NoobTacoUIDB.MinimapSettings.drawer)
end

local function CreateDrawerPanel()
  if drawerFrame then return drawerFrame end
  
  -- Create main drawer panel
  local frame = CreateFrame("Frame", "NoobTacoUI_MinimapDrawerPanel", UIParent, "BackdropTemplate")
  frame:SetSize(200, 300)
  frame:SetPoint("TOPRIGHT", Minimap, "BOTTOMRIGHT", 0, -10)
  frame:SetFrameStrata("DIALOG")
  frame:SetFrameLevel(100)
  frame:Hide()
  
  -- Set themed backdrop
  local r, g, b = GetThemeColor()
  frame:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8X8",
    edgeFile = "Interface\\Buttons\\WHITE8X8",
    edgeSize = 1,
  })
  
  if addon.ConfigTheme then
    local bgR, bgG, bgB, bgA = addon.ConfigTheme:GetColor("background")
    frame:SetBackdropColor(bgR, bgG, bgB, bgA)
  else
    frame:SetBackdropColor(0.11, 0.15, 0.23, 0.95)
  end
  frame:SetBackdropBorderColor(r, g, b, 1)
  
  -- Title
  local title = frame:CreateFontString(nil, "OVERLAY")
  if addon.ConfigTheme then
    addon.ConfigTheme:ApplyFont(title, "Bold", 14)
    local tr, tg, tb = addon.ConfigTheme:GetColor("highlight")
    title:SetTextColor(tr, tg, tb)
  else
    title:SetFont("Fonts\\FRIZQT__.TTF", 14, "BOLD")
    title:SetTextColor(0.96, 0.64, 0.38)
  end
  title:SetPoint("TOP", frame, "TOP", 0, -10)
  title:SetText("Minimap Addons")
  
  -- Close button
  local closeBtn = CreateFrame("Button", nil, frame)
  closeBtn:SetSize(20, 20)
  closeBtn:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -5, -5)
  closeBtn:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
  closeBtn:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
  closeBtn:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight", "ADD")
  closeBtn:SetScript("OnClick", function()
    frame:Hide()
  end)
  
  -- Scroll frame for buttons
  local scrollFrame = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")
  scrollFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", 10, -40)
  scrollFrame:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -30, 10)
  
  local scrollChild = CreateFrame("Frame", nil, scrollFrame)
  scrollChild:SetSize(160, 1)
  scrollFrame:SetScrollChild(scrollChild)
  
  frame.scrollChild = scrollChild
  frame.buttons = {}
  
  drawerFrame = frame
  return frame
end

function minimapModule:AddButtonToDrawer(buttonName, buttonFrame)
  if not drawerFrame then
    CreateDrawerPanel()
  end
  
  -- Don't add if already in drawer
  for _, btn in ipairs(drawerButtons) do
    if btn.name == buttonName then
      return
    end
  end
  
  -- Store button reference
  table.insert(drawerButtons, {
    name = buttonName,
    frame = buttonFrame,
    originalParent = buttonFrame:GetParent(),
    originalPoints = {},
  })
  
  -- Save original anchor points
  local btn = drawerButtons[#drawerButtons]
  for i = 1, buttonFrame:GetNumPoints() do
    local point, relativeTo, relativePoint, xOfs, yOfs = buttonFrame:GetPoint(i)
    table.insert(btn.originalPoints, {point, relativeTo, relativePoint, xOfs, yOfs})
  end
  
  -- Update drawer display
  self:UpdateDrawerDisplay()
end

function minimapModule:UpdateDrawerDisplay()
  if not drawerFrame then return end
  
  local scrollChild = drawerFrame.scrollChild
  local yOffset = -10
  local visibleCount = 0
  
  -- Clear existing drawer buttons
  for _, btn in ipairs(drawerFrame.buttons) do
    btn:Hide()
    btn:SetParent(nil)
  end
  drawerFrame.buttons = {}
  
  -- Get settings
  local hiddenButtons = NoobTacoUIDB.MinimapSettings and 
                       NoobTacoUIDB.MinimapSettings.hiddenButtons or {}
  
  -- Create buttons for each addon
  for _, btnData in ipairs(drawerButtons) do
    local isHidden = hiddenButtons[btnData.name]
    
    -- Create drawer entry
    local entry = CreateFrame("Button", nil, scrollChild, "BackdropTemplate")
    entry:SetSize(160, 30)
    entry:SetPoint("TOP", scrollChild, "TOP", 0, yOffset)
    
    -- Set backdrop
    entry:SetBackdrop({
      bgFile = "Interface\\Buttons\\WHITE8X8",
      edgeFile = "Interface\\Buttons\\WHITE8X8",
      edgeSize = 1,
    })
    
    if addon.ConfigTheme then
      local r, g, b = addon.ConfigTheme:GetColor("button_normal")
      entry:SetBackdropColor(r, g, b, 1)
      local br, bg, bb = addon.ConfigTheme:GetColor("border")
      entry:SetBackdropBorderColor(br, bg, bb, 0.3)
    else
      entry:SetBackdropColor(0.14, 0.19, 0.29, 1)
      entry:SetBackdropBorderColor(0.84, 0.51, 0.27, 0.3)
    end
    
    -- Button name text
    local text = entry:CreateFontString(nil, "OVERLAY")
    if addon.ConfigTheme then
      addon.ConfigTheme:ApplyFont(text, "Normal", 11)
      local tr, tg, tb = addon.ConfigTheme:GetColor("text")
      text:SetTextColor(tr, tg, tb)
    else
      text:SetFont("Fonts\\FRIZQT__.TTF", 11)
      text:SetTextColor(1, 1, 1)
    end
    text:SetPoint("LEFT", entry, "LEFT", 10, 0)
    text:SetText(btnData.name)
    
    -- Show/Hide toggle
    local toggle = CreateFrame("Button", nil, entry)
    toggle:SetSize(60, 20)
    toggle:SetPoint("RIGHT", entry, "RIGHT", -5, 0)
    toggle:SetNormalFontObject("GameFontNormalSmall")
    toggle:SetText(isHidden and "Show" or "Hide")
    toggle:SetScript("OnClick", function()
      minimapModule:ToggleButton(btnData.name)
    end)
    
    -- Hover effect
    entry:SetScript("OnEnter", function(self)
      if addon.ConfigTheme then
        local r, g, b = addon.ConfigTheme:GetColor("button_hover")
        self:SetBackdropColor(r, g, b, 1)
      else
        self:SetBackdropColor(0.25, 0.25, 0.25, 1)
      end
    end)
    entry:SetScript("OnLeave", function(self)
      if addon.ConfigTheme then
        local r, g, b = addon.ConfigTheme:GetColor("button_normal")
        self:SetBackdropColor(r, g, b, 1)
      else
        self:SetBackdropColor(0.14, 0.19, 0.29, 1)
      end
    end)
    
    table.insert(drawerFrame.buttons, entry)
    yOffset = yOffset - 35
    visibleCount = visibleCount + 1
  end
  
  -- Update scroll child height
  scrollChild:SetHeight(math.max(visibleCount * 35 + 20, 1))
end

function minimapModule:ToggleButton(buttonName)
  -- Ensure MinimapSettings and hiddenButtons exist
  if not NoobTacoUIDB.MinimapSettings then
    NoobTacoUIDB.MinimapSettings = {
      enabled = true,
      drawerEnabled = true,
      hiddenButtons = {},
    }
  end
  if not NoobTacoUIDB.MinimapSettings.hiddenButtons then
    NoobTacoUIDB.MinimapSettings.hiddenButtons = {}
  end
  
  -- Toggle button visibility
  local hiddenButtons = NoobTacoUIDB.MinimapSettings.hiddenButtons
  hiddenButtons[buttonName] = not hiddenButtons[buttonName]
  
  -- Find and toggle the actual button
  for _, btnData in ipairs(drawerButtons) do
    if btnData.name == buttonName then
      if hiddenButtons[buttonName] then
        btnData.frame:Hide()
      else
        btnData.frame:Show()
      end
      break
    end
  end
  
  -- Update drawer display
  self:UpdateDrawerDisplay()
  
  -- Print message
  local status = hiddenButtons[buttonName] and "hidden" or "shown"
  addon:Print("|chighlight|Minimap Drawer:|r " .. buttonName .. " " .. status)
end

function minimapModule:ToggleDrawer()
  if not drawerFrame then
    CreateDrawerPanel()
  end
  
  if drawerFrame:IsShown() then
    drawerFrame:Hide()
  else
    self:UpdateDrawerDisplay()
    drawerFrame:Show()
  end
end

function minimapModule:ShowDrawer()
  if not drawerFrame then
    CreateDrawerPanel()
  end
  self:UpdateDrawerDisplay()
  drawerFrame:Show()
end

function minimapModule:HideDrawer()
  if drawerFrame then
    drawerFrame:Hide()
  end
end

-------------------------------------------------------------------------------
-- Auto-detect and collect minimap buttons
-------------------------------------------------------------------------------
local maxScanAttempts = 3

local function ScanForMinimapButtons()
  -- Use a retry mechanism with progressive delays
  local function doScan(attempt)
    local LibDBIcon = LibStub("LibDBIcon-1.0", true)
    if not LibDBIcon then return end
    
    local foundCount = 0
    -- Get all registered LibDBIcon buttons
    for name, data in pairs(LibDBIcon.objects or {}) do
      -- Skip our own buttons
      if name ~= "NoobTacoUI" and name ~= "NoobTacoUI_MinimapDrawer" then
        if data.button and data.button:IsShown() then
          minimapModule:AddButtonToDrawer(name, data.button)
          foundCount = foundCount + 1
        end
      end
    end
    
    -- If no buttons found and we haven't exceeded max attempts, try again
    if foundCount == 0 and attempt < maxScanAttempts then
      local nextDelay = 2 * attempt -- Progressive delay: 2s, 4s, 6s
      C_Timer.After(nextDelay, function()
        doScan(attempt + 1)
      end)
    end
  end
  
  -- Start first scan after a short delay
  C_Timer.After(2, function()
    doScan(1)
  end)
end

-------------------------------------------------------------------------------
-- Enable/Disable Functions
-------------------------------------------------------------------------------
function minimapModule:Enable()
  if self.isEnabled then return end
  
  -- Initialize settings if needed
  if not NoobTacoUIDB.MinimapSettings then
    NoobTacoUIDB.MinimapSettings = {
      enabled = true,
      drawerEnabled = true,
      hiddenButtons = {},
      drawer = {
        hide = false,
        minimapPos = 180,
      }
    }
  end
  
  MakeMinimapSquare()
  
  if NoobTacoUIDB.MinimapSettings.drawerEnabled then
    CreateDrawerButton()
    ScanForMinimapButtons()
  end
  
  self.isEnabled = true
  addon:Print("|chighlight|Square Minimap:|r |csuccess|Enabled|r")
end

function minimapModule:Disable()
  if not self.isEnabled then return end
  
  RestoreRoundMinimap()
  
  -- Hide drawer
  if drawerFrame then
    drawerFrame:Hide()
  end
  
  -- Hide drawer button
  local LibDBIcon = LibStub("LibDBIcon-1.0", true)
  if LibDBIcon and LibDBIcon:IsRegistered("NoobTacoUI_MinimapDrawer") then
    LibDBIcon:Hide("NoobTacoUI_MinimapDrawer")
  end
  
  self.isEnabled = false
  addon:Print("|chighlight|Square Minimap:|r |cerror|Disabled|r")
end

function minimapModule:Toggle()
  if self.isEnabled then
    self:Disable()
  else
    self:Enable()
  end
end

function minimapModule:EnableDrawer()
  if not self.isEnabled then
    addon:Print("|cwarning|Enable square minimap first|r")
    return
  end
  
  NoobTacoUIDB.MinimapSettings.drawerEnabled = true
  CreateDrawerButton()
  ScanForMinimapButtons()
  
  local LibDBIcon = LibStub("LibDBIcon-1.0", true)
  if LibDBIcon and LibDBIcon:IsRegistered("NoobTacoUI_MinimapDrawer") then
    LibDBIcon:Show("NoobTacoUI_MinimapDrawer")
  end
  
  addon:Print("|chighlight|Minimap Drawer:|r |csuccess|Enabled|r")
end

function minimapModule:DisableDrawer()
  NoobTacoUIDB.MinimapSettings.drawerEnabled = false
  
  if drawerFrame then
    drawerFrame:Hide()
  end
  
  local LibDBIcon = LibStub("LibDBIcon-1.0", true)
  if LibDBIcon and LibDBIcon:IsRegistered("NoobTacoUI_MinimapDrawer") then
    LibDBIcon:Hide("NoobTacoUI_MinimapDrawer")
  end
  
  addon:Print("|chighlight|Minimap Drawer:|r |cerror|Disabled|r")
end

-------------------------------------------------------------------------------
-- Initialization
-------------------------------------------------------------------------------
local function Initialize()
  -- Wait for player to be fully loaded
  local initFrame = CreateFrame("Frame")
  initFrame:RegisterEvent("PLAYER_LOGIN")
  initFrame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_LOGIN" then
      -- Check if enabled in settings
      if NoobTacoUIDB.MinimapSettings and NoobTacoUIDB.MinimapSettings.enabled then
        minimapModule:Enable()
      end
      
      self:UnregisterEvent("PLAYER_LOGIN")
    end
  end)
end

-- Start initialization
Initialize()

-------------------------------------------------------------------------------
-- Slash Commands
-------------------------------------------------------------------------------
SLASH_NTMINIMAP1 = "/ntminimap"
SlashCmdList["NTMINIMAP"] = function(msg)
  msg = string.lower(msg or "")
  
  if msg == "toggle" or msg == "" then
    minimapModule:Toggle()
  elseif msg == "enable" or msg == "on" then
    minimapModule:Enable()
  elseif msg == "disable" or msg == "off" then
    minimapModule:Disable()
  elseif msg == "drawer" then
    minimapModule:ToggleDrawer()
  elseif msg == "drawerenable" then
    minimapModule:EnableDrawer()
  elseif msg == "drawerdisable" then
    minimapModule:DisableDrawer()
  else
    addon:Print("|chighlight|NoobTaco Minimap Commands:|r")
    addon:Print("  /ntminimap toggle - Toggle square minimap")
    addon:Print("  /ntminimap enable - Enable square minimap")
    addon:Print("  /ntminimap disable - Disable square minimap")
    addon:Print("  /ntminimap drawer - Toggle addon drawer")
    addon:Print("  /ntminimap drawerenable - Enable addon drawer")
    addon:Print("  /ntminimap drawerdisable - Disable addon drawer")
  end
end
