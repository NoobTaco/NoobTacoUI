-- Luacheck configuration for NoobTacoUI-Media
-- This file configures luacheck to properly check World of Warcraft addon code

-- Exclude external library files from checking
exclude_files = {
  "Libraries/**",
  ".release/**",
}

-- Define global variables available in WoW addon environment
globals = {
  "LibStub",
  -- SavedVariables
  "NoobTacoUIMediaDB",
  -- Addon Compartment Functions
  "NoobTacoUIMedia_OnAddonCompartmentClick",
  "NoobTacoUIMedia_OnAddonCompartmentEnter",
  "NoobTacoUIMedia_OnAddonCompartmentLeave",
  -- Slash command globals (pattern: SLASH_COMMANDNAME# and SlashCmdList)
  "SLASH_NTMVERSION1", "SLASH_NTMVERSION2",
  "SLASH_NTMCOLLECTION1", "SLASH_NTMCOLLECTION2",
  "SLASH_NTUICONFIG1", "SLASH_NTUICONFIG2", "SLASH_NTUICONFIG3", "SLASH_NTUICONFIG4",
  "SLASH_NTCC1",
  "SLASH_NTMINIMAP1",
  "SLASH_NTDEBUG1",
  "SLASH_NTREFRESH1",
  "SlashCmdList", -- Slash command handler table (writable)
  -- Configuration menu globals
  "NoobTacoDB",
  "NoobTacoUIMediaAddon",
}

-- Allow access to WoW API globals (read-only)
read_globals = {
  -- Common WoW API functions and globals
  "CreateFrame", "UIParent", "GameFontNormal", "GameFontHighlight", "GameTooltipText",
  "GetAddOnMetadata", "Mixin", "C_AddOns",
  "Settings",                 -- New settings system
  "Interface", "AddOns",      -- Path components used in file paths
  "print", "string", "table", -- Standard Lua functions available in WoW
  -- Collection-related API functions
  "C_PetJournal", "C_MountJournal", "C_ToyBox", "GetAchievementInfo",
  "PlaySoundFile", "C_Timer",
  -- Add other WoW API functions here as needed
}

-- Ignore some patterns that are common/acceptable in WoW addons
ignore = {
  "113", -- Accessing undefined variable (handled by globals above)
  "631", -- Line is too long (we'll use max_line_length instead)
  "211", -- Unused local variable (sometimes needed for API compatibility)
  "212", -- Unused argument (common in event handlers)
  "112", -- Mutating undefined variable (handled by globals)
  "311", -- Value assigned to a local variable is unused
  "431", -- Shadowing upvalue argument (very common in WoW addon callbacks)
  "432", -- Shadowing upvalue (common in nested functions)
  "213", -- Unused loop variable (common in WoW API iteration)
  "141", -- Setting non-standard global variable (needed for WoW addon globals)
  "542", -- Empty if branch (common in WoW addon initialization)
}

-- Set standards for Lua 5.1 (used by WoW)
std = "lua51"

-- Line length limits (reasonable for addon development)
max_line_length = 120
