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

## 3. Action Bar Setup

**Why this is important:** NoobTacoUI defaults to a 3-bar layout. For the interface to look correct, you must enable the specific bars it expects.
*   Go to **Options > Gameplay > Action Bars**.
*   Enable **Action Bar 2** and **Action Bar 3**.
*   *Note: You can enable Action Bars 4 through 8 if you need more buttons, but they will appear in the middle of the screen and it is up to you to move and place them where you want.*

## 4. Mandatory Edit Mode Setup

### Step 2: Import Layout
**Why this is important:** This step positions all the standard Blizzard UI elements (Unit Frames, Minimap, Action Bars) to their correct spots. Without this, the NoobTacoUI profiles will be applied to a messy default layout.
*   In the NoobTacoUI menu, find **Step 2: Mandatory Edit Mode Setup**.
*   Click **GET IMPORT STRING** and copy the code (Ctrl+C).
*   Open WoW's **Edit Mode** (Esc -> Edit Mode).
*   Click the **Layout** dropdown, select **Import**, and paste the code (Ctrl+V) into the box.
*   Name the profile something recognizable (e.g., "NoobTaco").
*   **Inspect your screen:** If anything looks drastically out of place, make adjustments now.

## 5. Apply Addon Profiles

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

*   Open the game menu and navigate to **Options > Gameplay Enhancement > Advanced Cooldown Settings**.
*   This menu allows you to drag spells between categories. There is no automatic counter, so you must count them manually.
*   **Essential Cooldowns:** Drag icons here until you have **6** active spells.
    *   *Reason:* Any more than 6 will cause the bar to wrap and obscure the row below it.
*   **Utilities:** Drag icons here until you have **12** active spells.
    *   *Reason:* Ensure this is set to 12 to prevent it from overlapping with the cast bar.
*   **Not Displayed:** Drag any excess or unwanted icons into this section to hide them.
*   *(Note: Some icons may appear greyed out. This is normal and indicates the spell is not active for your current talent build).*

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

## 3. Keybindings

**Important:** NoobTacoUI does not change your keybindings.
If you wish to update them to fit the new layout, you can use **Quick Keybind Mode**:
*   Open the Game Menu (`Esc`).
*   Click **Quick Keybind Mode**.
*   Hover over a button on your action bar and press the key you want to use (e.g., `1`, `Q`, `Ctrl+F1`).
*   Click **Okay** to save.

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
