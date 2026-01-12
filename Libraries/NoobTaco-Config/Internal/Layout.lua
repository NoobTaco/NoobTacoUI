local Lib = LibStub("NoobTaco-Config-1.0")
local ConfigLayout = Lib.Layout

local Theme = Lib.Theme


function ConfigLayout:CreateTwoColumnLayout(parent)
  local container = CreateFrame("Frame", nil, parent)
  container:SetAllPoints()

  -- Sidebar (Left)
  local sidebar = CreateFrame("Frame", nil, container)
  sidebar:SetPoint("TOPLEFT", container, "TOPLEFT", 0, 0)
  sidebar:SetPoint("BOTTOMLEFT", container, "BOTTOMLEFT", 0, 0)
  sidebar:SetWidth(200)

  -- Sidebar Background
  local sidebarBg = sidebar:CreateTexture(nil, "BACKGROUND")
  sidebarBg:SetAllPoints()
  sidebar.bg = sidebarBg

  -- Sidebar Theme Update
  sidebar.UpdateTheme = function(s)
    local r, g, b = Theme:GetColor("background")
    s.bg:SetColorTexture(r, g, b, 0.4) -- Darkened background for sidebar
  end
  Theme:RegisterT(sidebar)

  -- Content (Right)
  local content = CreateFrame("ScrollFrame", nil, container)
  content:SetPoint("TOPLEFT", sidebar, "TOPRIGHT", 10, -10)
  content:SetPoint("BOTTOMRIGHT", container, "BOTTOMRIGHT", -30, 10)

  local child = CreateFrame("Frame")
  child:SetSize(1, 1)
  content:SetScrollChild(child)

  -- Custom ScrollBar
  local scrollBar = CreateFrame("Slider", nil, container)
  scrollBar:SetPoint("TOPRIGHT", content, "TOPRIGHT", 25, 0)
  scrollBar:SetPoint("BOTTOMRIGHT", content, "BOTTOMRIGHT", 25, 0)
  scrollBar:SetWidth(6)

  local thumb = scrollBar:CreateTexture(nil, "OVERLAY")
  thumb:SetColorTexture(0.4, 0.4, 0.4, 0.8)
  thumb:SetSize(6, 30)
  scrollBar:SetThumbTexture(thumb)
  scrollBar.thumb = thumb

  local bg = scrollBar:CreateTexture(nil, "BACKGROUND")
  bg:SetAllPoints()
  scrollBar.bg = bg

  -- ScrollBar Theme Update
  scrollBar.UpdateTheme = function(sb)
    local r, g, b = Theme:GetColor("border")
    sb.thumb:SetColorTexture(r, g, b, 0.8)
    local br, b_g, bb = Theme:GetColor("background")
    sb.bg:SetColorTexture(br, b_g, bb, 0.3)
  end
  Theme:RegisterT(scrollBar)

  scrollBar:SetObeyStepOnDrag(true)
  scrollBar:SetValueStep(1)

  scrollBar:SetScript("OnValueChanged", function(_, value)
    content:SetVerticalScroll(value)
  end)

  content:SetScript("OnScrollRangeChanged", function(_, _, _)
    container:UpdateScrollBar()
  end)

  content:SetScript("OnVerticalScroll", function(_, offset)
    scrollBar:SetValue(offset)
  end)

  content:SetScript("OnMouseWheel", function(_, delta)
    local current = scrollBar:GetValue()
    local step = 40
    scrollBar:SetValue(current - (delta * step))
  end)

  function container.UpdateScrollBar()
    local yrange = content:GetVerticalScrollRange()
    scrollBar:SetMinMaxValues(0, yrange)

    local contentHeight = content:GetHeight()
    if contentHeight == 0 then
      -- Defer or use fallback if not yet measured
      contentHeight = parent:GetHeight() - 20
    end

    if yrange > 0 and contentHeight > 0 then
      local thumbHeight = math.max(20, (contentHeight / (contentHeight + yrange)) * contentHeight)
      thumb:SetHeight(thumbHeight)
      scrollBar:Show()
      -- Force theme update to ensure it's colored
      if scrollBar.UpdateTheme then scrollBar:UpdateTheme() end
    else
      scrollBar:Hide()
      scrollBar:SetValue(0)
    end
  end

  scrollBar:Hide()

  -- Store refs
  container.Sidebar = sidebar
  container.Content = content
  container.ContentChild = child
  container.ScrollBar = scrollBar
  container.SidebarButtons = {} -- NEW: Store buttons by ID

  return container
end

function ConfigLayout:AddSidebarButton(container, id, label, onClick, style, customColors)
  local sidebar = container.Sidebar
  local count = sidebar.buttonCount or 0

  local btn = Theme:CreateThemedButton(sidebar)
  btn:SetSize(180, 30)
  btn:SetPoint("TOP", sidebar, "TOP", 0, -10 - (count * 35))

  -- Handle styling
  btn.style = style
  btn.isSidebar = true

  if customColors then
    btn.customColors = customColors
  end
  Theme:UpdateButtonState(btn)

  btn.Text:SetText(label)
  btn.id = id

  btn:SetScript("OnClick", function(b)
    self:SelectSidebarButton(container, b.id)
    if onClick then onClick() end
  end)

  sidebar.buttonCount = count + 1
  if id then
    container.SidebarButtons[id] = { button = btn, onClick = onClick }
  end
  return btn
end

function ConfigLayout:SelectSidebarButton(container, id)
  local data = container.SidebarButtons[id]
  if not data then return end

  local btn = data.button
  if container.SelectedBtn and container.SelectedBtn ~= btn then
    container.SelectedBtn:SetSelected(false)
  end
  btn:SetSelected(true)
  container.SelectedBtn = btn
end

function ConfigLayout:SetScale(container, scale)
  container:SetScale(scale)
  -- PixelUtil:SetSize calls if needed for pixel perfection
end
