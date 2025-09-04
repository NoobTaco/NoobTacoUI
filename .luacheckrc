-- Luacheck configuration for NoobTacoUI-Media
-- This file configures luacheck to properly check World of Warcraft addon code

-- Exclude external library files from checking
exclude_files = {
  "Libraries/**",
}

-- Define global variables available in WoW addon environment
globals = {
  "LibStub",
}

-- Allow access to WoW API globals (read-only)
read_globals = {
  -- Common WoW API functions and globals
  "CreateFrame", "UIParent", "GameFontNormal",
  "Interface", "AddOns",   -- Path components used in file paths
  -- Add other WoW API functions here as needed
}

-- Ignore some patterns that are common/acceptable in WoW addons
ignore = {
  "113",   -- Accessing undefined variable (handled by globals above)
  "631",   -- Line is too long (we'll use max_line_length instead)
  "211",   -- Unused local variable (sometimes needed for API compatibility)
  "212",   -- Unused argument (common in event handlers)
  "112",   -- Mutating undefined variable (handled by globals)
  "311",   -- Value assigned to a local variable is unused
}

-- Set standards for Lua 5.1 (used by WoW)
std = "lua51"

-- Line length limits (reasonable for addon development)
max_line_length = 120
