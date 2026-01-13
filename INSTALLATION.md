# Installation Walkthrough

Welcome to NoobTacoUI! This guide will walk you through setting up your new interface from start to finish. Follow these steps carefully to ensure everything looks and functions perfectly.

## 1. Install Addons

First, install **NoobTacoUI** and any of the supported addons you wish to use (like BetterBlizzFrames, Platynator, etc.).
*It is recommended to install all supported addons for the complete experience.*

## 2. Launch & Resolution Setup

Launch World of Warcraft and open the NoobTacoUI options menu (Type `/nt config` or use the Minimap button).

### Step 1: Pixel Perfect Scaling
**Why this is important:** Setting the correct resolution scale is critical for crisp text and clean borders. If this isn't set correctly, your UI might look blurry or elements may not align properly.
*   Click **GO TO GAME SETTINGS** in the NoobTacoUI menu.
*   Select the option that matches your monitor (Standard or High Visibility).
*   **Reload your UI** when prompted.

## 3. Mandatory Edit Mode Setup

### Step 2: Import Layout
**Why this is important:** This step positions all the standard Blizzard UI elements (Unit Frames, Minimap, Action Bars) to their correct spots. Without this, the NoobTacoUI profiles will be applied to a messy default layout.
*   In the NoobTacoUI menu, find **Step 2: Mandatory Edit Mode Setup**.
*   Click **GET IMPORT STRING** and copy the code (Ctrl+C).
*   Open WoW's **Edit Mode** (Esc -> Edit Mode).
*   Click the **Layout** dropdown, select **Import**, and paste the code (Ctrl+V) into the box.
*   Name the profile something recognizable (e.g., "NoobTaco").
*   **Inspect your screen:** If anything looks drastically out of place, make adjustments now.

## 4. Apply Addon Profiles

### Step 3: Automated Application
**Why this is important:** This applies the specific visual settings (fonts, colors, bar sizes) to all your supported addons so they match the NoobTacoUI theme perfectly.
*   Return to the NoobTacoUI menu **Addon Integration** section.
*   Click **APPLY ALL PROFILES** to configure everything at once.
*   Alternatively, you can scroll down and install them one by one if you prefer more control.
*   **Reload your UI** to finalize the changes.

---

# Post-Install Cleanup

After the initial setup, there are a few manual steps needed to polish the look.

## 1. Adjust Cooldowns

**Why this is important:** The base game's cooldown tracking functionality is robust, but it needs to be sized correctly to fit the NoobTaco layout. Incorrect settings will cause icons to overlap your utilities or cast bars.

*   Open **Edit Mode** again and select **Advanced Options**.
*   Locate the settings for **Essential Cooldowns** and **Utilities**.
*   **Essential Cooldowns:** Set the visible icon count to **6**.
    *   *Reason:* Any more than 6 will cause the bar to wrap and obscure the row below it.
*   **Utilities:** Set the visible icon count to **12**.
    *   *Reason:* Ensure this is set to 12 to prevent it from overlapping with the cast bar.
*   *(Note: Adjusting these lists might be tricky during the pre-patch period as spell lists change, but these settings will ensure the UI requires minimal maintenance after patch launch).*

## 2. Cleaner Minimap (Optional - Requires Leatrix Plus)

If you want the clean, square Minimap look seen in the screenshots, you will need the **Leatrix Plus** addon.

*   **Enable Enhanced Minimap:**
    1.  Type `/ltp` to open Leatrix Plus.
    2.  Go to **Interface** menu.
    3.  Check **Enhanced Minimap**.
    4.  **Reload your UI** for this to take effect.
*   **Configure Button Drawer:**
    1.  Open `/ltp` again.
    2.  Click the **cog wheel** icon next to the Enhanced Minimap option.
    3.  **Select everything EXCEPT "Unclamp".**
    4.  *Why this is important:* This hides the clutter of addon buttons around your minimap and places them in a tidy "Button Drawer". You can access them by **Right-Clicking** anywhere on the minimap.

---

# Updates & Maintenance

## Checking for Updates
From time to time, profiles for specific addons may be updated to improve the look or fix issues.
*   When you update NoobTacoUI, check the **Addon Integration** menu.
*   Look for tags labeled **UPDATE** or **NEW**.
*   Simply click **APPLY PROFILE** on those specific addons to get the latest settings.

## Troubleshooting

### Resource Bar Alignment
**Issue:** Your power/resource bars don't line up perfectly with your cooldown bars.
**Fix:** This can happen if the profile didn't load fully on the first try.
*   Go to the NoobTacoUI menu.
*   Find **Sensei Class Resource Bar** in the list.
*   Click **APPLY PROFILE** again to force a realignment.
