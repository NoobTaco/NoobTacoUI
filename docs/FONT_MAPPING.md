# NoobTacoUI Font Mapping Research

Use this document to record which in-game UI elements are affected by each font category in NoobTacoUI.

## How to Test
1. Open NoobTacoUI Settings -> General.
2. Ensure **Enable Global Font Replacement** is checked.
3. Scroll down to **Identify Mode (Debug)**.
4. Toggle one category at a time (e.g., "Test Interface").
5. Look around the game for text that has changed to the "Monofett" font (hollow/distinct style).
6. Note the elements below.
7. Uncheck the test box before testing the next category.

---

## Font Category Mapping

### 1. Interface (Bags & Unit Frames)
*Formerly 'Interface Font (Main)'. Controls generic FrizQT elements.*
- [X] Unit Frame Names (Player, Target)
- [X] Interface Options
- [X] Macro Text on action bars
- [X] Quest Log Body Text
- [X] Quest Tracker Body Text
- [X] Bag Headers
- [X] Tooltip Header Text
- [X] Minimap Cluster Text
- [X] Calendar Text
- [X] Calendar Header Text
- [X] Option Menu Frame Title
- [X] Option Menu SideBar Text
- [X] Option Menu Text
- [X] Addons Menu Text
- [X] Addons Menu Header Text
- [X] Addons Menu Header Header Text
- [X] Macro Interface
- [X] Nameplate Text
- [ ] Bag Body Text
- [X] Tooltip Text
- [ ] Calender Fame Title (month)
- [ ] Edit Mode
- [ ] Spellbook Spell Names 


### 2. Chat & Info Labels
*Formerly 'Chat & Meter'. Targets ArialN elements.*
- [X] Chat Log (General, Combat, etc.)
- [X] Text on Bagbar Icons
- [X] Keybind Text on Actionbar Icons
- [X] Item counts on action bars

### 3. World Combat Text
*Formerly shared with Menu. Floating text and character labels.*
- [X] Scrolling Combat Text (Damage/Healing) - *Requires relog to see Test Font*
- [ ] Nameplates (Names and levels over characters)
- [X] Damage Numbers (Personal Damage/Healing)

### 4. Main Menu & Large Titles
*New Category. Decoupled from Combat.*
- [X] Main Menu Text (Escape)
- [X] Option Menu SideBar Header Text
- [X] Talking Head Text
- [X] Edit Mode Test 
- [X] Big Screen Alerts (Zone Progress Text top screen) 
- [X] Covenant/Rep interface 
- [X] Spellbook Headers


### 5. Quest & System Headers
*Formerly 'Quest Header Font'. Targets Morpheus and LOD Frame headers.*
- [X] Objective Tracker (Quest titles - Special)
- [X] Quest Log quest page headers
- [X] Professions Headers
- [X] Adventure Guide Headers
- [ ] Talent tree headers (Cant find these with our tests, yet they are themed with Poppins per the font mapping)

---

## Research Notes
*Add any general observations or suggestions for new categories here.*
- **SCT Testing Update**: In the latest update, the "Test Combat" flag is checked early enough for SCT. To test SCT, check the box and **completely Logout/Login**.
- **Overlap Fix**: Spellsheet and Main Menu headers have been moved out of "World Combat" and into their own respective categories.
