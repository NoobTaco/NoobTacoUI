-- NoobTacoUI Addon Integration Profiles
-- Pre-configured profile strings for compatible addons

local addonName, addon = ...

-- Profile storage table
addon.AddonProfiles = addon.AddonProfiles or {}

-- Default WoW UI Edit Mode Profile
-- Optimized for NoobTacoUI aesthetic
-- Version: 1.0
-- Last Updated: 2026-01-12


addon.AddonProfiles.EditMode = {
  name = "EditMode",
  displayName = "Default WoW UI Edit Mode",
  description = "Optimized WoW Edit Mode layout providing a clean and functional interface base.",
  minTocVersion = 110000,
  downloadUrl = "N/A",
  instructions = {
    "Click the |cwarning|Apply Profile|r button below.",
    "Copy the profile string (CTRL+C) from the popup.",
    "Open WoW Edit Mode (ESC > Edit Mode).",
    "Click Import from the layout dropdown and paste the string."
  },
  isCustomApply = true,
  applyFunction = function()
    local _, _, _, tocVersion = GetBuildInfo()
    local isMidnight = (tocVersion >= 120000)

    -- Select appropriate profile string
    local profileString
    local clientName
    if isMidnight then
      profileString = addon.AddonProfiles.EditMode.profileStringMidnight
      clientName = "Midnight (12.0+)"
    else
      profileString = addon.AddonProfiles.EditMode.profileStringRetail
      clientName = "Retail"
    end

    if not profileString or profileString == "" then
      addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: Profile string is empty.")
      return
    end

    -- Copy to Clipboard fallback (Manual Copy)
    -- CopyToClipboard is receiving ADDON_ACTION_FORBIDDEN, so we must show a dialog

    StaticPopupDialogs["NOOBTACOUI_EDITMODE_COPY"] = {
      text = "CTRL+C to copy the " .. clientName .. " profile string.\nThen paste into Edit Mode > Import.",
      button1 = "Close",
      hasEditBox = true,
      editBoxWidth = 400,
      OnShow = function(self)
        self.EditBox:SetText(profileString)
        self.EditBox:SetFocus()
        self.EditBox:HighlightText()
      end,
      EditBoxOnEnterPressed = function(self)
        self:GetParent():Hide()
      end,
      EditBoxOnEscapePressed = function(self)
        self:GetParent():Hide()
      end,
      timeout = 0,
      whileDead = true,
      hideOnEscape = true,
      preferredIndex = 3,
    }
    StaticPopup_Show("NOOBTACOUI_EDITMODE_COPY")

    addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: Detected " .. clientName .. " client.")
    addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: Please Copy (Ctrl+C) the string from the popup window.")
    addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: 1. Open Edit Mode (ESC > Edit Mode)")
    addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: 2. Click Layout Dropdown > Import")
    addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: 3. Paste (Ctrl+V) and Import")
  end,
  profileStringRetail =
  "2 43 0 0 0 4 4 UIParent 0.0 -480.0 -1 ##$$%/&$'%)$+$,$ 0 1 0 6 0 MainActionBar 0.0 4.0 -1 ##$$%/&$'%(#,$ 0 2 0 8 2 MultiBarBottomLeft 0.0 4.0 -1 ##$$%/&$'%(#,$ 0 3 0 4 4 UIParent -20.0 160.0 -1 ##$$%/&$'%(#,$ 0 4 0 0 0 UIParent 771.4 -335.5 -1 ##$$%/&$'%(#,$ 0 5 0 0 0 UIParent 771.4 -304.5 -1 ##$$%/&$'%(#,$ 0 6 0 0 0 UIParent 771.4 -273.5 -1 ##$$%/&$'%(#,$ 0 7 0 0 0 UIParent 771.4 -242.5 -1 ##$$%/&$'%(#,$ 0 10 0 7 7 UIParent -387.0 40.0 -1 ##$$&&'% 0 11 0 7 7 UIParent -814.9 262.0 -1 ##$$&''%,# 0 12 0 7 7 UIParent -357.0 84.5 -1 ##$$&('% 1 -1 0 0 0 UIParent 856.0 -900.5 -1 ##$#%# 2 -1 0 2 2 UIParent 0.0 0.0 -1 ##$#%( 3 0 0 1 1 UIParent -258.0 -797.0 -1 $#3# 3 1 0 0 0 UIParent 1102.0 -797.0 -1 %$3# 3 2 0 1 1 UIParent 260.0 -929.5 -1 %#&#3# 3 3 0 0 0 UIParent 502.0 -422.0 -1 '$(#)#-;.=/#1#3# 3 4 0 0 0 UIParent 2.0 -513.0 -1 ,%-#.//#0#1$2( 3 5 0 2 2 UIParent -296.4 -242.4 -1 &$*#3' 3 6 0 2 2 UIParent -2.0 -275.0 -1 -#.#/#4& 3 7 0 4 4 UIParent -242.0 -421.5 -1 3# 4 -1 0 7 7 UIParent 0.0 402.0 -1 # 5 -1 0 7 7 UIParent 247.0 362.0 -1 # 6 0 1 2 0 MinimapCluster -10.0 -10.0 -1 ##$#%#&.(()( 6 1 0 0 0 UIParent 623.0 -472.0 -1 ##$$%#'((()( 7 -1 0 1 1 UIParent 7.0 -162.0 -1 # 8 -1 0 4 4 UIParent -715.5 -394.0 -1 #'$4%$&e 9 -1 0 7 7 UIParent -242.0 62.0 -1 # 10 -1 1 0 0 UIParent 16.0 -116.0 -1 # 11 -1 0 1 1 UIParent 533.0 -682.0 -1 # 12 -1 0 1 1 UIParent 828.0 -242.0 -1 #@$#%# 13 -1 0 1 1 UIParent -930.3 -2.0 -1 ##$#%&&, 14 -1 0 7 7 UIParent -515.2 1041.6 -1 ##$#%$ 15 0 0 7 7 UIParent 0.0 22.0 -1 # 15 1 0 1 1 UIParent 0.0 -1062.0 -1 # 16 -1 0 1 1 UIParent 369.0 -922.0 -1 #( 17 -1 1 1 1 UIParent 0.0 -100.0 -1 ## 18 -1 1 5 5 UIParent 0.0 0.0 -1 #- 19 -1 0 4 4 UIParent 0.0 415.8 -1 ## 20 0 0 0 0 UIParent 804.5 -819.5 -1 ##$)%$&('%(-($)#+$,$-$ 20 1 0 0 0 UIParent 817.0 -872.5 -1 ##$/%$&&''(-($)#+$,$-$ 20 2 0 7 7 UIParent -200.3 160.0 -1 ##$$%#&''%(-($)$+$,$-$ 20 3 0 8 2 PlayerFrame -20.0 -12.0 -1 #$$$%#&''#(-($)$*#+$,$-$",
  profileStringMidnight =
  "2 50 0 0 0 4 4 UIParent 0.0 -480.0 -1 ##$$%/&$'%)$+$,$ 0 1 0 6 0 MainActionBar 0.0 4.0 -1 ##$$%/&$'%(#,$ 0 2 0 8 2 MultiBarBottomLeft 0.0 4.0 -1 ##$$%/&$'%(#,$ 0 3 0 4 4 UIParent -20.0 160.0 -1 ##$$%/&$'%(#,$ 0 4 0 0 0 UIParent 771.4 -335.5 -1 ##$$%/&$'%(#,$ 0 5 0 0 0 UIParent 771.4 -304.5 -1 ##$$%/&$'%(#,$ 0 6 0 0 0 UIParent 771.4 -273.5 -1 ##$$%/&$'%(#,$ 0 7 0 0 0 UIParent 771.4 -242.5 -1 ##$$%/&$'%(#,$ 0 10 0 6 8 ChatFrame1 29.0 -32.0 -1 ##$$&&'% 0 11 0 7 7 UIParent -814.9 262.0 -1 ##$$&''%,# 0 12 0 1 1 UIParent -393.0 -962.0 -1 ##$$&('% 1 -1 0 0 0 UIParent 856.0 -900.5 -1 ##$#%# 2 -1 0 2 2 UIParent 0.0 0.0 -1 ##$#%( 3 0 0 1 1 UIParent -258.0 -797.0 -1 $#3# 3 1 0 0 0 UIParent 1102.0 -797.0 -1 %$3# 3 2 0 1 1 UIParent 260.0 -929.5 -1 %#&#3# 3 3 0 0 0 UIParent 502.0 -422.0 -1 '$(#)#-;.=/#1#3#5$6(7-7$ 3 4 0 0 0 UIParent 2.0 -513.0 -1 ,%-#.//#0#1$2(5$6(7-7$ 3 5 0 2 2 UIParent -296.4 -242.4 -1 &$*#3' 3 6 0 2 2 UIParent -2.0 -275.0 -1 -#.#/#4&5#6(7-7$ 3 7 0 4 4 UIParent -242.0 -421.5 -1 3# 4 -1 0 7 7 UIParent 0.0 402.0 -1 # 5 -1 0 7 7 UIParent 247.0 362.0 -1 # 6 0 1 2 0 MinimapCluster -10.0 -10.0 -1 ##$#%#&.(()( 6 1 0 0 0 UIParent 623.0 -472.0 -1 ##$$%#'((()(-$ 6 2 0 2 8 PlayerFrame -20.0 14.0 -1 ##$#%#&*(()(+#,-,$ 7 -1 0 1 1 UIParent 7.0 -162.0 -1 # 8 -1 0 4 4 UIParent -715.5 -394.0 -1 #'$4%$&e 9 -1 0 7 7 UIParent -242.0 62.0 -1 # 10 -1 1 0 0 UIParent 16.0 -116.0 -1 # 11 -1 0 1 1 UIParent 533.0 -682.0 -1 # 12 -1 0 1 1 UIParent 828.0 -242.0 -1 #@$#%# 13 -1 0 1 1 UIParent -930.3 -2.0 -1 ##$#%&&, 14 -1 0 7 7 UIParent -515.2 1041.6 -1 ##$#%$ 15 0 0 7 7 UIParent 0.0 22.0 -1 # 15 1 0 1 1 UIParent 0.0 -1062.0 -1 # 16 -1 0 1 1 UIParent 369.0 -922.0 -1 #( 17 -1 1 1 1 UIParent 0.0 -100.0 -1 ## 18 -1 1 5 5 UIParent 0.0 0.0 -1 #- 19 -1 0 4 4 UIParent 0.0 415.8 -1 ## 20 0 0 0 0 UIParent 815.0 -821.0 -1 ##$)%$&('%(-($)#+$,$-$ 20 1 0 0 0 UIParent 817.0 -872.5 -1 ##$/%$&&''(-($)#+$,$-$ 20 2 0 0 0 UIParent 822.3 -751.0 -1 ##$$%$&''%(-($)$+$,$-$ 20 3 0 8 2 PlayerFrame -20.0 -12.0 -1 #$$$%#&''#(-($)$*#+$,$-$.P 21 -1 0 1 1 UIParent -280.0 -942.0 -1 #$$# 22 0 0 7 7 UIParent 0.0 742.0 -1 ##$$%#&('((#)U*$+$,$ 22 1 0 7 7 UIParent 0.0 682.0 -1 &('()U*#+$ 22 2 0 1 1 UIParent 0.0 -182.0 -1 &('()U*#+$ 22 3 0 7 7 UIParent 0.0 822.0 -1 &('()U*#+$ 23 -1 0 1 1 UIParent 808.0 -862.0 -1 ##$#%$&#'t(#)U+$,$-'.(/6",
  version = "1.4",
  author = "NoobTaco",
  dateCreated = "2026-01-12"
}

-- BetterBlizzFrames Profile
-- Optimized for NoobTacoUI aesthetic with NoobTaco theme compatibility
-- Version: 1.1
-- Last Updated: 2026-01-06
addon.AddonProfiles.BetterBlizzFrames = {
  name = "BetterBlizzFrames",
  displayName = "BetterBlizzFrames",
  description = "Enhances Blizzard unit frames with customizable auras, castbars, and visual tweaks.",
  minTocVersion = 11500,
  downloadUrl = "https://www.curseforge.com/wow/addons/betterblizzframes",
  instructions = {
    "Click the button below to copy the profile string",
    "Type |cwarning|/bbf|r in chat to open BetterBlizzFrames config",
    "Navigate to the |cwarning|Import Profile|r section",
    "Paste the profile string and import"
  },
  isCustomApply = true,
  applyFunction = function(isBulk)
    -- Check if BetterBlizzFrames is loaded
    if not C_AddOns.IsAddOnLoaded("BetterBlizzFrames") then
      if not isBulk then
        addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: BetterBlizzFrames not loaded.")
      end
      return
    end

    if not BBF or not BBF.ImportProfile then
      if not isBulk then
        addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: BBF global or ImportProfile function missing.")
      end
      return
    end

    -- 1. Get the profile string
    local profileData = addon.AddonProfiles.BetterBlizzFrames
    local profileString = profileData.profileString

    -- 2. Import the profile
    -- The second argument "fullProfile" matches the export type used in BBF
    local data, err = BBF.ImportProfile(profileString, "fullProfile")

    if err then
      if not isBulk then
        addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: Error importing BBF profile: " .. tostring(err))
      end
      return
    end

    if not data then
      if not isBulk then
        addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: Failed to decode BBF profile data.")
      end
      return
    end

    -- 3. Apply to database
    -- BBF.ImportProfile returns the data table ready to be assigned
    BetterBlizzFramesDB = data

    -- 4. Track application
    if NoobTacoUIDB and NoobTacoUIDB.GeneralSettings and NoobTacoUIDB.GeneralSettings.AppliedProfiles then
      NoobTacoUIDB.GeneralSettings.AppliedProfiles["BetterBlizzFrames"] = profileData.version
    end

    if not isBulk then
      addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: BetterBlizzFrames profile applied successfully.")

      StaticPopupDialogs["NOOBTACOUI_RELOAD_UI_BBF"] = {
        text = "BetterBlizzFrames profile applied.\nA reload is required for changes to take effect.\nReload now?",
        button1 = "Yes",
        button2 = "No",
        OnAccept = function()
          ReloadUI()
        end,
        timeout = 0,
        whileDead = true,
        hideOnEscape = true,
        preferredIndex = 3,
      }
      StaticPopup_Show("NOOBTACOUI_RELOAD_UI_BBF")
    end
  end,
  profileString =
  "!BBF9PvZVTXXvCXq3MKgyajQVLCAz(ajnOicwYs2s5InjfLiLLiP5hw2ThmxT7qUB8YDMm7Uww(srnY5IGc0Bf5Gpu0l9IpKtPab6wbkAn0LMtffcf9ypW)c67nZSFthFqwy3zN595V3V3BuUpQSHMN2xLZ)CoRH2iI7EwCxV(Vq331JoQc1GWUZN(PfR64r4fLpSOo80INqSPNw0KWjRvCpcXU4aoHu0JcV1Xtt3R4isX7Cc1WAWzS5)cFIpPR1ic)ynUJLZq83VkBzpn(qIxvhB8)l5Z12JBrCmSpRpBHmVRQdze8I3Z0YG0ZXYBpoiVTS1oJW7qGt1OnXL6Z1jMJzeVkAUEL14hBz4z(pyZi3Tk0rmq2WDRpRGLJoNO5k28oECWo0NnnJEkHxHAt5vBuT9(p8G85ZLNvu3wZ1v849OGzOnH57P5zrD6sEQNpN0)c5j0L29HTOUF7uSvKpWGu2FWG9SSbdyzBRN9mnUr)ycyhDnBsE2mrNBNUL2F)QTpO1vU(ABTrE1)XMBaEW4xDIgVoOV45KJnnbnl1iA2EMIp)G85abEghkFKgCEK9bR0rehFt28rkrxHSjC4MSzY4Emzt77sA6qAfkvWN7qBr5GDYYRL1tj2LPCdc8Cqc0oXMu2A4UKtaD1Tp3Nbrve3twFTTx7Me2CmF44uwkXU1E)YhKd1SDKk42BXwIjCLkZIqAQqWWotwHSVcKAg3Yr4k7Wi221nanzHGWw4iCdJrC7FEKgwF3LER)0lcc9I7B00FSTfe7ZwwQqYqROva2L(S5J8th2RrP2pQvZJrFv(RV2nKEk8x3j)5ugiQq0m3TPt)le(oi2q5TxvE6LCmert1OCRNHPn27RXEt2S6MAodJIX3dEfKqOthDIMxDhdlDnpimXKEAhng(IOytC5brKSv0LgS6Ove8jEyuJ0Z3)c)47oB6wugZYX9t7qgzvMABWwmHnxi3kHF5aLPKXNdM7rGtQj41jEpmhi6jfYhiIrVws1TdeyAlCCYn89yACVZARzzieOYGJyiN67yCKMJMmMoxUCODDRuHcIS7RC1xQbBw3ZyqSo7Tds8MOaEbNqzeNMmm11185MAUD0EcXOpeJgL4xUzJhDu99R1v4x3r4x3s4IZdcq46Q3OtPg17(qXQ2uiGBd5PjSSn99STCiLB0Srv2SgA8hFeGEI5KDPuBplgKxfInf3YbHAasfiLGAIBuyAtE4FSPLGbXHZMoctPgXAOP38S54A6wA2rHmc79fO16ytlpcgUVaBvYt1gXSjfXNx8ZUrXFUbXM4rae8pzHYoGOYwTQAjLYUe2plv4QelcaPcdeNf830tpmeKxuIzS2jUu(jHcN54OK0s(gwuiY21tSxHRrMscMMrApvc2iorfUZ7XMZfskAHrtklbgXd(2uhLkUBADjykUwH59ZYJ(WBLJvWM662CqfWUZP2QLNeGsAJfVAri4r8QQ2GrvirOtgcfWsvnp5ZjGJ8jKUG34XO0xyaUe0s0MEAPrqKUhCKXlxuvaa1hW4IPlkCV5Ppbk4zArSnIdXHWWIsLgImla4Vv(1xBZGYgPdUkiSuHrms70h86seJxEjmv8AzlWDiX19ilqOiiODmzxATwMTIqAswtme3TqImhvvNcuixDeOoc96qyHOUkT3LeUvzDqvwu7Kr8HlnY1yYMnn2FjBBeaiqEv1xLyxZBW9TmkzFQ2zUiKlAjPGiS4eOHG4vq9Wu4XWINjS2DKFmegvDKrGv9dGWMSH9DhbrabCDGVxS0wA2AgwoL3hY2qjRua2rnQ3DjNzooQ4ngBc1kxkvA791S9LLAUmcI7OsnkbECaXjY5uEOkXUDhQTLXfc11sxQRMSvKg8igsvcnha5T0uqYsKInVWWKH43LrF6rnBC3dYjzgTduqAsvgpfyN4Igdi0fQ6h8ozWYeRmwYr3eGyBJa)xgbMQcdIs(teEi9It0rfBpKNAKjm0wFEqDxrn3RLcVExOCrDo1z3t14d6p2Mmut)mraiUH)b40fqMDadikdEEuh45wO183Es5MD728O38vF5Bx7oJ(9)9VBQPY9o1UZV8t(4)9ut9gb6tmVK0bDnoXWxNu1qgN0bG5frsLSzMqrM3nvqdgXhhPFfHtkisZTNlbiNPJMlxtrDNW09VzP347)Gp6v7EzhRHofPdkwwZZZM8(wg4lUCOVLTrr40gXGtFbyD7lEsf1tyZ6Q(optsrxDkYWewgB2oXEEh5ZHcjXx8JT4JSCHwxW1VqI1h(kaGeCaJo1YjHuWk0j8XbIY5bBUfxSMZd2r01T0pEM)iOLS5pgIhXhQve(npZZkcGoNHAlSG36x)pX1mtjoW8SylobGIeof49W7wkNZi89fWnCafuOWZg3a4TSPnPaHFBi4ROe6aL1PRf(qzY2ZHseGPNyaV95vv)o0wqY0hzEWREg4SNqwYUwUyOtLDb8AEyLIaiHx9fScpJshfc)iD9Szzjk1euawXluwDglbDzyPrxz(v68xzHQPH6)svkS0FHu5on569dkQgNTOXBFbIpc5mo6qfoaiEPe4L3Zh6AY7m8CmFraFTEwMSftsInI)6LdbO3JTCcRVJaWgehP1IlZFE1xc2azrlbdivdfMz4OjZ1NqHYJ180nX6FMtamscWi4BilfvHYDiIxzgdoFVETb2Q)iGJZ2BJ)3gBTd(F7aDHb0BI6aTzVdF0ETlT)rvB0TJOr0BSf(Zne)8wan4Lsdsh15(I(tgD431O7JAazbxFlfQ5eBnoBFUYaHPDbZLDSgsLeHff72lIIZ(artZa6XXbWleNYGmeFJUnBXwibRUybNZNLEdKYc9DcXELdyEI)IBPOE)tCwj7WFPrqzbKitwcHZRkHQuAxPl0KTAgZuCEaZ7Bbr0yTF0MeEqxoii8eTfUb1tZQGZMkYted9s0EwwBOlS2(btbiQcEyV4Y(UHnWzi023Iz7ktCix5QbPn1hXaypnzd7OG1NTQ8JEnKbNnGCouWXHyl5NNlFofxQK8KNxx0R4qcVf3cAM27mmr5NWwTvukh6Us(vZLX8Io4lG6dSEIbyCK7W4KHGeIQYPRmFeUsIeWzI4OCCjGjrt5uCU124pV564p3esEs3LS4Jph6fTIjbIim6z1pCIvrei(nJtHfMkoxkcRoPXofAvxiXUghkg977Y1gsD2Z(mbYuuBks27qZ1W2NLg4e6sFLx3SCigMbAwmSJ(bJJjaC9(eUhOJ2I(5xAGMb5ilDofhJv1NQtyE3d59G8QderrmNqcNlmwqEKQkqZihnue(HlIJMQvXWgdd2IoqqRWySyw9oLohJ2FNALaIZYbCT5MI5BDR8JbCdrHTMoI9bK0GYlIMtu7kCuipPW8fSElXww2B2KnTjBKyC05UB7E139abV4nftT46BMpfWNOBtiHjBRwHZw49NuzFKtDjbQvthBODIuyhMjBXrHefv(evCWENkawcdFsfOkt12qNAX8gYG5fs3heE4hb2OpoTmwdIqTXOus0ZansGySml1K8IsiUiqefMa0rUr2rdgVYBk9UNJbrdlAPBt0CK9OghetEYib9q0DZuSsuTdMGlKq7JXfsAnwkvVgXoOKOfpinyuRshwA36neGr7Ct18SuvYZILPk4g95vVFZ7QgY5gIpEBripKOWjYMr1ShPgM8hMIMesPfFLyQmnFc4zaGgaisOlzRkCEqxXQkP42FVOMCQEwydIzdkMxZWOxM0uZxWc1oZXb(BSi6inC6B6uO1l6Po33IaqdYAdGhDz)x38SE13WwjBNCjYHEPUa6PHS7)cNIj9hsXg0h2rNtioMXn7QWDbgpipcCQWdvHvXvxpt)jbWhlanB55h8oXqiA3C)EvLieY4GnxpFq(HsuAqr9uoC)(XJcA1UE1oDLyeRorglbFu0eyNWSnwm1W46sCfTAceXJRzT0GuRrw6sUclLvPd86jaEuu8zfcrWdts(O)ZFU)B16kzhjGkBjbho5ZMlX43cLZ0u2R5psZbNxlofA6qGLQyq7YOLLEJR(tLdlQLQJBxi5aI9WUcmzlpjWwrMt)XPyjayeHOvkZUSNAi1q)X4e)YhaTKeSF5SDUiNh(dYLDQxcOMXHzybCLUMso3LGAHrO4QMBATB)V(6V(7MAQPQD7)N8xIpTc0A(3awI6bryP)8C1U9xn90fHp7sxFoazaHrcKJ(JJ18sZk96CGyeTQMrY)6vn8Uis5MK(0exru4OoH8QfcmUH8ZvJlugGLYKMIyzCt1SjYSdMfFbhIVhxZoXn1HxT4horoQPtSJp9lKgASUX2wDpAxg2uSSRKKLuuTtNYM0GydnB((tqBslaxe5iQuRUKw765vh9y1jf10XQXVdn1O6JA6D2b4Tt6PgCLezflIMAoEs2ylqM4WOQD7)7a8FdJFNCT71OEf1DYjOFT9g5X5WNmJxTXF4pajcq04EyPzXT6aOYCc0qqjBpewbZdWPcNAa9cWN)64yHlsABPRB3cNjfADGm6yzjcPsDzOlMsIdMOwIlXD3QL6w7UnKxuf6pUf(Z1fLO34gQgbXRbtqZ6LYbckgVPKUFRNWeKpqRpoIMyt9T6HD62U5rhi52cMWfnKZ9rshfDYYrIBErc259NmGM6INcYWUV1qCwJj7w6WMvUR8oVVr0p3b7wAGA0cjUfcm1jH1pOTDPfTmuwwyvBrTCWRmygD5LLf)(rat24qyFPv67Z9RIvkiOS83ovavUez1lMKZQmfBPjzaKe4YWSmksySyJezFb3rSQbyGrtWoHRuIykK9OFWMLQywf1QoWfBcOJUTGsq0tVAMGYyqnHQVsskKAPIRljXvWiIZ5Gi4IdrB91U(1d5Xj18m9uelvRQJrqI2nVG8uKr49L7eBXYL37Zkk)RiO4X0JHFFJ1GqCwHGqPW52HQBwwzQRF9LDRvVrZEDpSEJQS5Wg8RevfqrCTq0ikJk1xaZt2Nt9zXkdphfOEeWpbnQazsKwAYP(anmjg)wslLmgzfzrOe0FvTA2xzUtw(yS4wOq6ZUyXE8(NYm8IqAWXrioQzJA9W2RePw3u0m66IEdV1o5NuBGh(eBZjhdRUl)yx)O6(NJFlKjjGiNK8FjQtgrevoi2wO)IBeo6VgaLbyCezjr36Q(ERjgQQigwney5ebJI4Lut)f)aHA7cAzI2dZNl6QDsFfPXTWjzJoDuECqr)K90PsCKdykZvsUquU(R7M9tmCKyCWJ7lfO9BlGj3CR8ph)74c)BG4Ld8TTBXPdSSj)))!BBF",
  version = "1.1",
  author = "NoobTaco",
  dateCreated = "2026-01-06"
}

-- Platynator Profile
-- Optimized for NoobTacoUI aesthetic with NoobTaco theme compatibility
-- Version: 1.3
-- Last Updated: 2026-01-12
addon.AddonProfiles.Platynator = {
  name = "Platynator",
  displayName = "Platynator",
  description = "High-performance nameplate addon with threat coloring and a user-friendly editor.",
  minTocVersion = 11500,
  downloadUrl = "https://www.curseforge.com/wow/addons/platynator",
  instructions = {
    "Click the button below to copy the profile string",
    "Type |cwarning|/platynator|r in chat to open Platynator config",
    "Navigate to the |cwarning|Import Profile|r section",
    "Paste the profile string and import"
  },
  isCustomApply = true,
  applyFunction = function(isBulk)
    -- Check if Platynator is loaded
    if not C_AddOns.IsAddOnLoaded("Platynator") then
      if not isBulk then
        addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: Platynator not loaded.")
      end
      return
    end

    if not C_EncodingUtil then
      if not isBulk then
        addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: C_EncodingUtil not available (requires Retail).")
      end
      return
    end

    -- 1. Get the profile data
    local profileData = addon.AddonProfiles.Platynator
    local profileString = profileData.profileString

    -- 2. Decode JSON
    local success, import = pcall(C_EncodingUtil.DeserializeJSON, profileString)
    if not success or not import then
      if not isBulk then
        addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: Failed to deserialize Platynator profile string.")
      end
      return
    end

    -- 3. Initialize Global Config if needed
    if not PLATYNATOR_CONFIG then PLATYNATOR_CONFIG = { Profiles = {} } end
    if not PLATYNATOR_CONFIG.Profiles then PLATYNATOR_CONFIG.Profiles = {} end

    -- 4. Create/Update NoobTacoUI Profile
    local profileName = "NoobTacoUI"
    local config = PLATYNATOR_CONFIG.Profiles[profileName]

    if not config then
      config = {
        designs = {},
        designs_assigned = {},
        style = "NoobTacoUI",
      }
      PLATYNATOR_CONFIG.Profiles[profileName] = config
    end

    -- 5. Inject Profile Settings and Designs
    -- Copy top-level settings from import to config (excluding metadata and designs)
    for k, v in pairs(import) do
      if k ~= "designs" and k ~= "version" and k ~= "addon" and k ~= "kind" then
        config[k] = v
      end
    end

    -- Correctly inject the designs
    if import.designs then
      if not config.designs then config.designs = {} end
      for designName, designData in pairs(import.designs) do
        -- Clean import data within individual designs if needed
        designData.version = nil
        designData.addon = nil
        designData.kind = nil
        config.designs[designName] = designData
      end
    end

    -- 6. Ensure Specific Style and Design Assignment
    -- Enforce NoobTacoUI style as the default for this profile
    config.style = "NoobTacoUI"

    if not config.designs_assigned then
      config.designs_assigned = {}
    end

    -- Assign specific designs
    config.designs_assigned["enemy"] = "NoobTacoUI"
    config.designs_assigned["friend"] = "NoobTacoUI-Simplified"
    config.designs_assigned["enemySimplified"] = "NoobTacoUI-Simplified"

    -- 7. Switch Profile
    PLATYNATOR_CURRENT_PROFILE = profileName

    -- 8. Track application
    if NoobTacoUIDB and NoobTacoUIDB.GeneralSettings and NoobTacoUIDB.GeneralSettings.AppliedProfiles then
      NoobTacoUIDB.GeneralSettings.AppliedProfiles["Platynator"] = profileData.version
    end

    if not isBulk then
      addon:Print(
        "|chighlight|NoobTaco|r|cffF8F9FAUI|r: Platynator profile |cwarning|NoobTacoUI|r applied successfully.")

      StaticPopupDialogs["NOOBTACOUI_RELOAD_UI_PLATYNATOR"] = {
        text = "Platynator profile applied.\nA reload is required for changes to take effect.\nReload now?",
        button1 = "Yes",
        button2 = "No",
        OnAccept = function()
          ReloadUI()
        end,
        timeout = 0,
        whileDead = true,
        hideOnEscape = true,
        preferredIndex = 3,
      }
      StaticPopup_Show("NOOBTACOUI_RELOAD_UI_PLATYNATOR")
    end
  end,
  profileString =
  '{"stack_region_scale_y":1.1,"design_all":[],"closer_to_screen_edges":true,"cast_scale":1.1,"simplified_nameplates":{"minor":true,"minion":true,"instancesNormal":true},"stacking_nameplates":true,"designs_assigned":{"friend":"NoobTacoUI-Simplified","enemySimplified":"NoobTacoUI-Simplified","enemy":"NoobTacoUI"},"stack_region_scale_x":1.2,"version":1,"current_skin":"blizzard","show_friendly_in_instances_1":"always","show_nameplates":{"player":false,"npc":false,"enemy":true},"addon":"Platynator","apply_cvars":true,"not_target_alpha":1,"designs":{"NoobTacoUI":{"highlights":[{"anchor":[],"color":{"a":1,"b":1,"g":1,"r":1},"layer":0,"height":1,"scale":1,"kind":"target","asset":"arrows","width":1}],"specialBars":[],"texts":[{"widthLimit":124,"truncate":true,"align":"LEFT","layer":2,"autoColors":[],"color":{"r":1,"g":1,"b":1},"anchor":["RIGHT",64,0],"kind":"creatureName","scale":0.8,"showWhenWowDoes":false},{"align":"LEFT","layer":2,"widthLimit":0,"truncate":true,"scale":0.7,"kind":"castSpellName","anchor":["TOPLEFT",-60,-9],"color":{"b":1,"g":1,"r":1}},{"widthLimit":0,"displayTypes":["percentage"],"align":"RIGHT","layer":2,"truncate":false,"anchor":["RIGHT",60,0],"kind":"health","color":{"b":1,"g":1,"r":1},"scale":0.8}],"font":{"outline":false,"shadow":true,"asset":"Poppins-Bold"},"bars":[{"relativeTo":0,"marker":{"asset":"none"},"layer":1,"border":{"height":1,"color":{"a":1,"b":0,"g":0,"r":0},"asset":"thin","width":1},"autoColors":[{"colors":{"tapped":{"r":0.4313725490196079,"g":0.4313725490196079,"b":0.4313725490196079}},"kind":"tapped"},{"colors":[],"kind":"classColors"},{"combatOnly":false,"colors":{"transition":{"a":1,"r":0.8156863451004028,"g":0.529411792755127,"b":0.4392157196998596},"warning":{"a":1,"r":0.7490196228027344,"g":0.3803921937942505,"b":0.415686309337616},"offtank":{"a":1,"r":0.5333333611488342,"g":0.7529412508010864,"b":0.8156863451004028},"safe":{"a":1,"r":0.3686274588108063,"g":0.5058823823928833,"b":0.6745098233222961}},"kind":"threat","useSafeColor":true,"instancesOnly":false},{"colors":{"unfriendly":{"a":1,"r":0.8156863451004028,"g":0.529411792755127,"b":0.4392157196998596},"neutral":{"a":1,"r":0.9215686917304992,"g":0.7960785031318665,"b":0.545098066329956},"friendly":{"a":1,"r":0.6392157077789307,"g":0.7450980544090271,"b":0.5490196347236633},"hostile":{"a":1,"r":0.7490196228027344,"g":0.3803921937942505,"b":0.415686309337616}},"kind":"reaction"}],"scale":1,"kind":"health","anchor":[],"background":{"color":{"a":0.44,"b":1,"g":1,"r":1},"applyColor":false,"asset":"black"},"absorb":{"color":{"a":1,"r":1,"g":1,"b":1},"asset":"wide/blizzard-absorb"},"foreground":{"asset":"white"}},{"marker":{"asset":"wide/glow"},"layer":1,"border":{"height":0.75,"color":{"a":1,"b":0,"g":0,"r":0},"asset":"thin","width":1},"autoColors":[{"colors":{"cast":{"r":1,"g":0.09411764705882352,"b":0.1529411764705883},"channel":{"r":0.0392156862745098,"g":0.2627450980392157,"b":1}},"kind":"importantCast"},{"colors":{"uninterruptable":{"b":0.7647058823529411,"g":0.7529411764705882,"r":0.5137254901960784}},"kind":"uninterruptableCast"},{"colors":{"cast":{"b":0,"g":0.5490196078431373,"r":0.9882352941176472},"interrupted":{"b":0.8784313725490196,"g":0.211764705882353,"r":0.9882352941176472},"channel":{"b":0.2156862745098039,"g":0.7764705882352941,"r":0.2431372549019608}},"kind":"cast"}],"foreground":{"asset":"white"},"anchor":["TOP",0,-7],"kind":"cast","scale":1,"background":{"color":{"a":0,"b":0.7803922295570374,"g":0.7803922295570374,"r":0.7803922295570374},"applyColor":true,"asset":"grey"}}],"markers":[{"scale":1,"color":{"b":1,"g":1,"r":1},"anchor":["LEFT",-78,0],"layer":3,"asset":"normal/quest-blizzard","kind":"quest"},{"scale":0.8,"color":{"b":0.9019608497619628,"g":0.9019608497619628,"r":1},"anchor":["TOP",0,-10],"layer":3,"asset":"normal/shield-soft","kind":"cannotInterrupt"},{"scale":1,"color":{"b":1,"g":1,"r":1},"anchor":["LEFT",-83,0],"layer":3,"asset":"special/blizzard-elite-midnight","kind":"elite"},{"scale":1.25,"color":{"b":1,"g":1,"r":1},"anchor":["BOTTOM",0,12],"layer":3,"asset":"normal/blizzard-raid","kind":"raid"}],"auras":[{"direction":"RIGHT","scale":1,"textScale":1,"sorting":{"reversed":false,"kind":"duration"},"showPandemic":true,"showCountdown":true,"height":1,"kind":"debuffs","anchor":["BOTTOMLEFT",-62,9],"filters":{"important":true,"fromYou":true}},{"direction":"LEFT","scale":1,"textScale":1,"sorting":{"reversed":false,"kind":"duration"},"anchor":["LEFT",-100,0],"height":1,"kind":"buffs","showCountdown":true,"filters":{"dispelable":true,"important":true}},{"direction":"RIGHT","scale":1,"textScale":1,"sorting":{"reversed":false,"kind":"duration"},"anchor":["RIGHT",87,0],"height":1,"kind":"crowdControl","showCountdown":true,"filters":{"fromYou":false}}]},"_custom":{"highlights":[{"color":{"a":0.468750149011612,"b":0.9294118285179138,"g":0.8980392813682556,"r":0.8980392813682556},"scale":0.51,"kind":"target","anchor":["BOTTOM",0,-14],"height":1.18,"layer":0,"asset":"glow","width":1}],"specialBars":[],"texts":[{"showWhenWowDoes":true,"truncate":false,"color":{"b":0.9686275124549866,"g":0.9686275124549866,"r":0.9686275124549866},"layer":2,"autoColors":[{"colors":[],"kind":"classColors"},{"colors":{"tapped":{"b":0.4313725490196079,"g":0.4313725490196079,"r":0.4313725490196079}},"kind":"tapped"},{"colors":{"unfriendly":{"b":0,"g":0.5058823529411765,"r":1},"neutral":{"r":1,"g":1,"b":0},"friendly":{"r":0,"g":1,"b":0},"hostile":{"r":1,"g":0,"b":0}},"kind":"reaction"}],"align":"CENTER","anchor":["BOTTOM",0,7],"kind":"creatureName","widthLimit":130,"scale":1.27},{"showWhenWowDoes":true,"truncate":true,"align":"CENTER","layer":2,"scale":0.91,"anchor":["BOTTOM",0,-4],"kind":"guild","color":{"r":1,"g":1,"b":1},"widthLimit":124}],"font":{"outline":true,"shadow":true,"asset":"RobotoCondensed-Bold"},"bars":[],"markers":[{"color":{"r":1,"g":1,"b":1},"scale":0.9,"anchor":["BOTTOMLEFT",-82,0],"kind":"quest","asset":"normal/quest-boss-blizzard","layer":3},{"color":{"r":1,"g":1,"b":1},"scale":1.45,"anchor":["BOTTOM",0,32],"kind":"raid","asset":"normal/blizzard-raid","layer":3}],"auras":[{"direction":"RIGHT","scale":1,"showCountdown":true,"filters":{"important":true,"fromYou":true},"textScale":1,"showPandemic":true,"height":1,"kind":"debuffs","anchor":["BOTTOMLEFT",-63,37],"sorting":{"reversed":false,"kind":"duration"}},{"direction":"LEFT","scale":1,"showCountdown":true,"filters":{"dispelable":true,"important":true},"textScale":1,"anchor":["BOTTOMLEFT",-90,2],"kind":"buffs","height":1,"sorting":{"reversed":false,"kind":"duration"}},{"direction":"RIGHT","scale":1,"showCountdown":true,"filters":{"fromYou":false},"textScale":1,"anchor":["BOTTOMRIGHT",90,2],"kind":"crowdControl","height":1,"sorting":{"reversed":false,"kind":"duration"}}]},"NoobTacoUI-Simplified":{"highlights":[{"color":{"a":0.468750149011612,"r":0.8980392813682556,"g":0.8980392813682556,"b":0.9294118285179138},"anchor":["BOTTOM",0,-14],"layer":0,"height":1.18,"scale":0.51,"kind":"target","asset":"glow","width":1}],"specialBars":[],"texts":[{"showWhenWowDoes":true,"truncate":false,"align":"CENTER","layer":2,"autoColors":[{"colors":[],"kind":"classColors"},{"colors":{"tapped":{"r":0.4313725490196079,"g":0.4313725490196079,"b":0.4313725490196079}},"kind":"tapped"},{"colors":{"neutral":{"b":0,"g":1,"r":1},"unfriendly":{"r":1,"g":0.5058823529411765,"b":0},"friendly":{"b":0,"g":1,"r":0},"hostile":{"b":0,"g":0,"r":1}},"kind":"reaction"}],"scale":1.27,"anchor":["BOTTOM",0,7],"kind":"creatureName","widthLimit":130,"color":{"r":0.9686275124549866,"g":0.9686275124549866,"b":0.9686275124549866}},{"showWhenWowDoes":true,"truncate":true,"scale":0.91,"layer":2,"widthLimit":124,"anchor":["BOTTOM",0,-4],"kind":"guild","color":{"b":1,"g":1,"r":1},"align":"CENTER"}],"font":{"outline":true,"shadow":true,"asset":"RobotoCondensed-Bold"},"bars":[],"markers":[{"color":{"b":1,"g":1,"r":1},"anchor":["BOTTOMLEFT",-82,0],"scale":0.9,"layer":3,"asset":"normal/quest-boss-blizzard","kind":"quest"},{"color":{"b":1,"g":1,"r":1},"anchor":["BOTTOM",0,32],"scale":1.45,"layer":3,"asset":"normal/blizzard-raid","kind":"raid"}],"auras":[{"direction":"RIGHT","scale":1,"showCountdown":true,"sorting":{"reversed":false,"kind":"duration"},"showPandemic":true,"textScale":1,"height":1,"kind":"debuffs","anchor":["BOTTOMLEFT",-63,37],"filters":{"fromYou":true,"important":true}},{"direction":"LEFT","scale":1,"showCountdown":true,"sorting":{"reversed":false,"kind":"duration"},"height":1,"anchor":["BOTTOMLEFT",-90,2],"kind":"buffs","textScale":1,"filters":{"dispelable":true,"important":true}},{"direction":"RIGHT","scale":1,"showCountdown":true,"sorting":{"reversed":false,"kind":"duration"},"height":1,"anchor":["BOTTOMRIGHT",90,2],"kind":"crowdControl","textScale":1,"filters":{"fromYou":false}}]}},"global_scale":1,"target_scale":1.2,"style":"NoobTacoUI","click_region_scale_y":1,"click_region_scale_x":1,"kind":"profile","show_nameplates_only_needed":false,"cast_alpha":1}',
  version = "1.3",
}


-- zBarButtonBG Profile
-- Optimized for NoobTacoUI aesthetic with NoobTaco theme compatibility
-- Version: 1.0
-- Last Updated: 2025-11-29
addon.AddonProfiles.zBarButtonBG = {
  name = "zBarButtonBG",
  displayName = "zBarButtonBG",
  description = "Customizable background frames for action bar buttons for a cleaner aesthetic.",
  minTocVersion = 110000,
  downloadUrl = "https://www.curseforge.com/wow/addons/zbarbuttonbg",
  instructions = {
    "Click the button below to copy the profile string",
    "Press |cwarning|Escape|r and go to |cwarning|Options > Addons|r",
    "Select |cwarning|zBarButtonBG|r and go to |cwarning|Profiles|r",
    "Paste the profile string and import"
  },
  isCustomApply = true,
  applyFunction = function(isBulk)
    -- Check if dependencies are loaded
    if not zBarButtonBGAce or not zBarButtonBGAce.db then
      if not isBulk then
        addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: zBarButtonBG not fully loaded.")
      end
      return
    end

    local LibDeflate = LibStub:GetLibrary("LibDeflate")
    local AceSerializer = LibStub:GetLibrary("AceSerializer-3.0")

    if not LibDeflate or not AceSerializer then
      if not isBulk then
        addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: Required libraries (LibDeflate/AceSerializer) not found.")
      end
      return
    end

    -- 1. Get the profile data
    local profileData = addon.AddonProfiles.zBarButtonBG
    local profileString = profileData.profileString

    -- 2. Decode the profile
    local decoded = LibDeflate:DecodeForPrint(profileString)
    if not decoded then
      if not isBulk then
        addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: Failed to decode profile string.")
      end
      return
    end

    local decompressed = LibDeflate:DecompressDeflate(decoded)
    if not decompressed then
      if not isBulk then
        addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: Failed to decompress profile string.")
      end
      return
    end

    local success, profileTable = AceSerializer:Deserialize(decompressed)
    if not success or not profileTable then
      if not isBulk then
        addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: Failed to deserialize profile data.")
      end
      return
    end

    -- 3. Switch to/Create "NoobTacoUI" profile
    zBarButtonBGAce.db:SetProfile("NoobTacoUI")

    -- 4. Apply settings
    -- We assume the exported string contains the profile table content directly
    -- zBarButtonBG's export is just 'self.db.profile', so we map it back
    for key, value in pairs(profileTable) do
      zBarButtonBGAce.db.profile[key] = value
    end

    -- 5. Force update the addon
    -- We manually trigger the update functions found in zBarButtonBG's source
    if zBarButtonBG and zBarButtonBG.enabled then
      -- Update character settings reference
      zBarButtonBG.charSettings = zBarButtonBGAce.db.profile

      -- Re-create backgrounds if functions exist
      if zBarButtonBG.removeActionBarBackgrounds and zBarButtonBG.createActionBarBackgrounds then
        zBarButtonBG.removeActionBarBackgrounds()
        zBarButtonBG.createActionBarBackgrounds()
      end
    end

    -- 6. Track application
    if NoobTacoUIDB and NoobTacoUIDB.GeneralSettings and NoobTacoUIDB.GeneralSettings.AppliedProfiles then
      NoobTacoUIDB.GeneralSettings.AppliedProfiles["zBarButtonBG"] = profileData.version
    end

    if not isBulk then
      print(
        "|cFF16C3F2NoobTacoUI|r: zBarButtonBG profile |cwarning|NoobTacoUI|r applied successfully.")

      StaticPopupDialogs["NOOBTACOUI_RELOAD_UI"] = {
        text =
        "zBarButtonBG profile applied.\nA reload is recommended for all settings to take full effect.\nReload now?",
        button1 = "Yes",
        button2 = "No",
        OnAccept = function()
          ReloadUI()
        end,
        timeout = 0,
        whileDead = true,
        hideOnEscape = true,
        preferredIndex = 3,
      }
      StaticPopup_Show("NOOBTACOUI_RELOAD_UI")
    end
  end,
  profileString =
  "nsvBtQjpu0Fr7ockc(rXzT1oU4og680(LmtacivmxEscJZ2F9nHeqa1P9d(69MCoN75Cb7GJXOuOHjpKNlOYFIJMHr1CiDDL8lvW1nqfW1nruvEDLhgXXroyuH(NlXOe9NUyjgDHKYHiYf6hGOuwcmmk8qC8H3Ta8FLzYt4OfUQd1iLadj)SIIrO)VHWP6MGQm4kBmIgaNza0a3iWgs7Z0ptkzzFLwwCsQyPRrj9YWcyeWuVNa8mkFiyogOuQXOo3HQZE3g4(rlCTQAlOEvrkey0HVhVFx0B3rot3ItW1qs65mouJdvxT977P5Y1z)QriVqzkwp)wPyOEsLrY5zUsG3qI3iOBQicr7r2XyuooPxoA2Jk)n1mS65T(VXOpG66sM4fe9szOYBgOy7zwAKfQcKAPvWv1Z0IBeOHTtAnQJay6uJYijv02JNtYOBSXb956giVteNPzXqyB(r350KQ1IpsRRiP0jiEtPw5pmsAHieux9LjJ9(BPlAnVZq7LMOPOGkK0S1P6S)djZGH(uXZjSc6owwzkrc8X2RVDh41fDjZz(wh2P1Il1U6JsYDjcNU21D3BIpYH7v63u6VmxtN2n59VTT7bf3dKbgdio3TSmA3CmUdsv9lTEdiXa)zWZOS7tpyGpr(ZDw0VsS6g76S6JAeN40wA(pOrT9FCKRPZJqJCKvSnWzPRVV38vbZ9MfSiaN)IxRFU1BPNJN)s3zURc8w47QRSuJYZQK8Skt3YpOjXO9T)UEKy8F(",
  version = "1.0",
}

-- XIV_Databar Continued Profile
-- Optimized for NoobTacoUI aesthetic with NoobTaco theme compatibility
-- Version: 1.0
-- Last Updated: 2026-01-05
addon.AddonProfiles.XIV_Databar = {
  name = "XIV_Databar",
  displayName = "XIV_Databar Continued",
  description = "FFXIV-inspired info bar for tracking gold, currency, durability, and more.",
  minTocVersion = 11500,
  downloadUrl = "https://www.curseforge.com/wow/addons/xiv-databar-continued",
  instructions = {
    "Click the |cwarning|Apply Profile|r button below.",
    "Type |cwarning|/xivbar config|r in chat to open XIV_Databar config if needed.",
    "The profile will be imported and applied automatically."
  },
  isCustomApply = true,
  applyFunction = function(isBulk)
    -- Check which folder name is used for XIV_Databar
    local xivFolder = ""
    if C_AddOns.IsAddOnLoaded("XIV_Databar") then
      xivFolder = "XIV_Databar"
    elseif C_AddOns.IsAddOnLoaded("XIV_Databar_Continued") then
      xivFolder = "XIV_Databar_Continued"
    elseif C_AddOns.IsAddOnLoaded("XIV_Databar-Continued") then
      xivFolder = "XIV_Databar-Continued"
    elseif C_AddOns.IsAddOnLoaded("XIV_Databar_Continued_Mainline") then
      xivFolder = "XIV_Databar_Continued_Mainline"
    end

    if xivFolder == "" then
      if not isBulk then
        addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: XIV_Databar Continued not loaded.")
      end
      return
    end

    -- XIV_Databar uses the folder name as its AceAddon name, but sometimes it retains "XIV_Databar" even if folder is different
    local XIVBar = LibStub("AceAddon-3.0"):GetAddon(xivFolder, true)
    if not XIVBar then
      XIVBar = LibStub("AceAddon-3.0"):GetAddon("XIV_Databar", true)
    end

    if not XIVBar or not XIVBar.ImportProfile then
      if not isBulk then
        addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: XIVBar addon object or ImportProfile function missing.")
      end
      return
    end

    -- 1. Get the profile data
    local profileData = addon.AddonProfiles.XIV_Databar
    local profileString = profileData.profileString

    -- Pre-initialize talent module frames to prevent crash if switcher is enabled in the new profile
    local talentModule = XIVBar:GetModule("TalentModule", true)
    if talentModule and talentModule.CreateLoadoutFrames and talentModule.talentFrame then
      talentModule:CreateLoadoutFrames()
    end

    -- 2. Track application
    if NoobTacoUIDB and NoobTacoUIDB.GeneralSettings and NoobTacoUIDB.GeneralSettings.AppliedProfiles then
      NoobTacoUIDB.GeneralSettings.AppliedProfiles["XIV_Databar"] = profileData.version
    end

    -- 3. Import the profile with pcall to catch any addon-specific refresh errors
    local success, result = pcall(function() return XIVBar:ImportProfile(profileString) end)

    if not isBulk then
      -- Define the reload prompt once
      StaticPopupDialogs["NOOBTACOUI_RELOAD_UI_XIVBAR"] = {
        text = "XIV_Databar profile applied.\nA reload is required for changes to take effect.\nReload now?",
        button1 = "Yes",
        button2 = "No",
        OnAccept = function()
          ReloadUI()
        end,
        timeout = 0,
        whileDead = true,
        hideOnEscape = true,
        preferredIndex = 3,
      }

      if success and result then
        addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: XIV_Databar profile applied successfully.")
        StaticPopup_Show("NOOBTACOUI_RELOAD_UI_XIVBAR")
      elseif not success then
        -- If it crashed (like the talent module error), settings are likely still partially changed
        -- Proceed with reload prompt as it's the only way for the user to recover
        addon:Print(
          "|chighlight|NoobTaco|r|cffF8F9FAUI|r: XIV_Databar profile applied with minor issues. A reload is highly recommended.")
        StaticPopup_Show("NOOBTACOUI_RELOAD_UI_XIVBAR")
      else
        addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: Failed to import XIV_Databar profile (invalid data).")
      end
    end
  end,
  profileString =
  "9v1sZnkoq4Fo7Pjfymg8X4xtMQg)OcS7SNyIm02Oncjwj5xZH8BF7wcBh7KzpHqDR(5x)1fHf5fzTA1gUaOJGKTwaZpzR5LRuAltykwxKzabuAHQNaM2wBSkjyq1TfzBbjOzcNzuCjEZ4PlYN(Cr2XLB2yaBXIGIS1m9kLHB5kzr2OL55lN7UCotVLlVOcRQIl3wSiQi70TVE2oHWuQbqwmYDXyvZAM9jEfqX3odmvS)p)gjudcMLVhwDB4iuLVcvKcnQQDciRLv6DwNhe8T1xmiEXp4v26IfHrdIPeTCNodygLCPuCIuPujuAkVLkDJVcWWW9HKymgOdPy1P77A)x0mCjRKIUlQ3ZREOt5qNQHKIyknEm5NA1EW5hTRyCwRzXrdshomPF4Wbj4N(fB(sCu3lFIEd(8Z1QUiLvmljoTFyssAqCuV0Ou3R6t2E2GK0W0HHPjrbjd7nCajza5VFNK1)oj(yihoADza(RfptbWgL0MX)fqLvevHLnXSRx1ZRqr2kvBlxA(sg0WhPevKjQFh077CdzUfHdd6fLGikT6vq)2l5AM0GnAgb0E7L5mRMFevlPxyYWISPwqlzcNE7reT(pmV9Y7G0fl6ffheIP2Zqf0kuNAaPfTJdWqUlkof7M58g4at86NzG(XdtWU0Qhw(q2d5pqbHX6vC6Xwny(OlhmifZbuQahr2dFWIdIrey2yLPHxENWWbrb9rH4LvcVTvAd0WKFiYctthgJv4jQgedIZY3lVFV4(O8CvdgcQnyvsDalIEwaYv9gMGnTVQbMDdZwtf8FGJyFwviinjarvtaOT6ai6k1tjva59khIPaMdt0mq6YqeUUfAiZmmiYNDNv3hzOvE7Lzcwdqid)8mXhLz1SkW8kxiUsM5M5n1Qd5kLWYBppuqthe0KjWM8DQluSk1oB2bUTet0PxL4v673k3XQWLDmgXb37pRlYqi3DU5dCkFg9lrPXKvyB7xWtg)8eIe0Q5GChzWT74IZeB8nCqF2XerrznZ6yWRvTo2eq4(YkRPpnmUKSZf2WE(y)RZxMpHu4F3bgNbArY4r3wtBXoljszYuLCMGM49JXDfvYFiH6JTTJX5AK4ZZBsm3tL05)rTJMiPJInBjJwRqQJ76yUAqdLTJ8g8DUdFjVujVj(DsD13AM2f7776cybxdYYt31hi6PLYNPfaND9FVcXiFcY5y7ih2z9vJLxJ7LkYcE3nhufzrb9sVE1seQJxf4wcSL40(iaDgANrSTuUCPeSKg0EgyIgZ5RYiAZX42ntxJvBZPYgcs6GhL0YU7CWvQ3Eb(Q409yp6Cr0ICAZOfzewfhz3dp2SQH28RXvjeJN30E6S)sj21a3NcwOL2O5wFzoH)28)pfIR7vstUcB6hqCt3yZJcXsjgGBU0l(Hs7a4Ozz6g)QSdmTeB4t2PzR5cU9KpVUZzFtSxC(8yLs3vGS3osHkuXem8QFwB(PbxAGiPSj(RULTIM9alJIacCHqAC6pBHsTgH3ytho2sTdQCHRDgKmOF)eA1JM6GfzFNZQqR7cHI)7p",
  version = "1.1",
}

-- Add more addon profiles here following the same structure

-- Sensei Class Resource Bar Profile
-- Optimized for NoobTacoUI aesthetic
-- Version: 1.1
-- Last Updated: 2026-01-06
addon.AddonProfiles.SenseiClassResourceBar = {
  name = "SenseiClassResourceBar",
  displayName = "Sensei Class Resource Bar",
  description = "Adaptive resource bar that automatically stylizes based on class and specialization.",
  minTocVersion = 110000,
  downloadUrl = "https://www.curseforge.com/wow/addons/senseiclassresourcebar",
  instructions = {
    "Ensure you have an active Edit Mode profile selected.",
    "Click the |cwarning|Apply Profile|r button below.",
    "Reload your UI (|cwarning|/reload|r) for changes to take effect."
  },
  isCustomApply = true,
  applyFunction = function(isBulk)
    -- Check if Sensei is loaded
    if not C_AddOns.IsAddOnLoaded("SenseiClassResourceBar") then
      if not isBulk then
        addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: Sensei Class Resource Bar not loaded.")
      end
      return
    end

    local LibDeflate = LibStub:GetLibrary("LibDeflate", true)
    local LibSerialize = LibStub:GetLibrary("LibSerialize", true)

    if not LibDeflate or not LibSerialize then
      if not isBulk then
        addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: Required libraries (LibDeflate/LibSerialize) not found.")
      end
      return
    end

    -- 1. Get the profile data
    local profileData = addon.AddonProfiles.SenseiClassResourceBar
    local profileString = profileData.profileString

    -- 2. Extract the encoded data part (SenseiClassResourceBar:1:<data>)
    local prefix, version, encoded = profileString:match("^([^:]+):(%d+):(.+)$")
    if not encoded or prefix ~= "SenseiClassResourceBar" then
      if not isBulk then
        addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: Invalid Sensei profile string format.")
      end
      return
    end

    -- 3. Decode and Deserialize
    local decoded = LibDeflate:DecodeForPrint(encoded)
    if not decoded then
      if not isBulk then
        addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: Failed to decode profile string.")
      end
      return
    end

    local decompressed = LibDeflate:DecompressDeflate(decoded)
    if not decompressed then
      if not isBulk then
        addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: Failed to decompress profile string.")
      end
      return
    end

    local success, data = LibSerialize:Deserialize(decompressed)
    if not success or not data then
      if not isBulk then
        addon:Print("|chighlight|NoobTacoUI|r: Failed to deserialize profile data.")
      end
      return
    end

    -- 4. Get active layout name
    local layoutName

    -- Try EditModeManagerFrame (Retail/Beta)
    if _G.EditModeManagerFrame and _G.EditModeManagerFrame.GetActiveLayoutInfo then
      local layoutInfo = _G.EditModeManagerFrame:GetActiveLayoutInfo()
      if layoutInfo then
        layoutName = layoutInfo.layoutName
      end
    end

    -- Try LibEditMode
    if not layoutName then
      local libEditMode = _G.LibStub and _G.LibStub("LibEditMode", true)
      if libEditMode and libEditMode.GetActiveLayoutName then
        layoutName = libEditMode:GetActiveLayoutName()
      end
    end

    -- Try C_EditMode API with correct structure
    if not layoutName and C_EditMode and C_EditMode.GetLayouts then
      local layouts = C_EditMode.GetLayouts()
      if layouts and layouts.activeLayout and layouts.layouts and layouts.layouts[layouts.activeLayout] then
        layoutName = layouts.layouts[layouts.activeLayout].layoutName
      end
    end

    -- Legacy EditModeManagerFrame check (just in case)
    if not layoutName and _G.EditModeManagerFrame then
      if _G.EditModeManagerFrame.GetLayoutName then
        layoutName = _G.EditModeManagerFrame:GetLayoutName()
      elseif _G.EditModeManagerFrame.layoutInfo and _G.EditModeManagerFrame.layoutInfo.layoutName then
        layoutName = _G.EditModeManagerFrame.layoutInfo.layoutName
      end
    end

    if not layoutName then
      layoutName = "Default"
      if not isBulk then
        addon:Print("|chighlight|NoobTacoUI|r: Edit Mode layout not detected. Using 'Default'.")
      end
    end

    -- 5. Apply to database
    if not _G.SenseiClassResourceBarDB then _G.SenseiClassResourceBarDB = {} end

    -- Apply BARS data (dbName -> barSettings)
    if data.BARS then
      for dbName, barSettings in pairs(data.BARS) do
        if not _G.SenseiClassResourceBarDB[dbName] then
          _G.SenseiClassResourceBarDB[dbName] = {}
        end
        _G.SenseiClassResourceBarDB[dbName][layoutName] = barSettings
      end
    end

    -- Apply GLOBAL data
    if data.GLOBAL then
      _G.SenseiClassResourceBarDB["_Settings"] = data.GLOBAL
    end

    -- 6. Track application
    if NoobTacoUIDB and NoobTacoUIDB.GeneralSettings and NoobTacoUIDB.GeneralSettings.AppliedProfiles then
      NoobTacoUIDB.GeneralSettings.AppliedProfiles["SenseiClassResourceBar"] = profileData.version
    end

    if not isBulk then
      addon:Print("|chighlight|NoobTacoUI|r: Sensei profile applied for layout: |cwarning|" .. layoutName .. "|r")

      StaticPopupDialogs["NOOBTACOUI_RELOAD_UI_SENSEI"] = {
        text =
        "Sensei Class Resource Bar profile applied.\nA reload is required for changes to take effect.\nReload now?",
        button1 = "Yes",
        button2 = "No",
        OnAccept = function()
          ReloadUI()
        end,
        timeout = 0,
        whileDead = true,
        hideOnEscape = true,
        preferredIndex = 3,
      }
      StaticPopup_Show("NOOBTACOUI_RELOAD_UI_SENSEI")
    end
  end,
  profileString =
  "SenseiClassResourceBar:1:ns5ZYTrrqy8sLscGXeK3GJXoy8MayOaSvsOGBCqRSuSQYYsz16KQOOkRz3T1ot5rZm1mJWr(yQCGZ6ripc(rGNGU0JqEeYzoKzwha)VdCuQ7D7VVFFDVv2mkQr8GFrD3bqMuKt0tJbJCIodIi6DI(ZV(TPKSJk0YjI8b2PCqT8GMXrHdGXSTSAIWOiAqyFDkr)mMHL66iCxIjmHOlaRRpoKzH8WEXHDeHnLJtj2ttL6Cq3uYL62bKQbPvckQeOR8gklh6seKEIyjhw4Cd)CnxnOOAGU6RTWlSTL6XeRU5eTxfQGXeZrne5rLdOuWrjuMiy6xulAK01XV2ryb9isguVrEEpHPEFoXovqSsD9ggdyn1B7A09)sLIjmB5TAKKNVT1o6LgQ84e3ChMsbwb1U8mNXh4aHLK2T1oDoO7SYwyzhzg(s)ehWobwnwjzcBAZw7N0kE(iIXPHdu5elygo7ywUL2vMdQ1hmvKf(CMLg2YjfHLr4oM5gU8yH5nMXsPL2xll0GX9Gw3u(pUOlHyAf1AEk(CkJdDDKZb)E6Nbuw2eoqvR5LxBnPym4l1xEmODrT3tu1DabXLG9(dqZjttKffCy48rmoFhM2LJmPy(EWiBOvgg7T)CFg03vYf9sXdE0Jv3B01(UVA8f8IkZ9gWfpzhjC(PACjiE1IVDKudNBLB2(jhUVlqF4phBYiCOQAdVdJ4StoHOZVYM7bm6PEY3BILZeGU3bj71z)wQnUEP9VYp6rpE7FAM3rn4ScbUIQ2ed8pV1gwoXqllFvZCkfiCl9SBM7J)iUfEZ0Dz55Ga)E8hWp6cDJlGFmUi(jbtFkEBvq562V3oUZV90KdpC7KK2yTH4sBGb4DWLxfVlUc(5dXvtDxgtiC8EdX1P4xsXngIH49Xh44o(vxCcvXBOw)8uYTLp1FYjSeptCmc)MxTi(D(CqvZ35ULw49xE4hCHdtCt1sL39TFsyBsoe63cWTXvM7iuthymLmzi(Wlid1N1xZgFLpQuci1s(nr)XEdtFWvtyP4nXBD5j)HlCz6Tj(TNrV)UgEB8tVEyHR9)ItEg4yLJdL5KlyC8WBmSo9sMj9j71lQXEB(xNbQsdBw40YvP3)J3b",
  version = "1.1",
  author = "NoobTaco",
  dateCreated = "2026-01-06"
}

-- Details! Profile
-- Optimized for NoobTacoUI aesthetic
-- Version: 1.1
-- Last Updated: 2026-01-07
addon.AddonProfiles.Details = {
  name = "Details",
  displayName = "Details! Damage Meter",
  description = "The premier damage and healing meter for advanced combat logging.",
  minTocVersion = 11500,
  downloadUrl = "https://www.curseforge.com/wow/addons/details",
  instructions = {
    "Click the |cwarning|Apply Profile|r button below.",
    "Details! will import the profile and create a new one named 'NoobTacoUI'.",
    "A reload may be required for all settings to take effect."
  },
  isCustomApply = true,
  applyFunction = function(isBulk)
    -- Check if Details is loaded
    if not C_AddOns.IsAddOnLoaded("Details") then
      if not isBulk then
        addon:Print("|chighlight|NoobTacoUI|r: Details! Damage Meter not loaded.")
      end
      return
    end

    -- Details global is usually _detalhes or Details
    local DetailsAddon = _G.Details or _G._detalhes
    if not DetailsAddon then
      if not isBulk then
        addon:Print("|chighlight|NoobTacoUI|r: Details! engine not found.")
      end
      return
    end

    -- 1. Get the profile data
    local profileData = addon.AddonProfiles.Details
    local profileString = profileData.profileString

    -- 2. Import the profile
    local success = false
    if DetailsAddon.ImportProfile then
      success = DetailsAddon:ImportProfile(profileString, "NoobTacoUI", true, true)
    end

    -- 3. Track application
    if NoobTacoUIDB and NoobTacoUIDB.GeneralSettings and NoobTacoUIDB.GeneralSettings.AppliedProfiles then
      NoobTacoUIDB.GeneralSettings.AppliedProfiles["Details"] = profileData.version
    end

    if not isBulk then
      if success then
        addon:Print("|chighlight|NoobTacoUI|r: Details! profile 'NoobTacoUI' applied successfully.")

        StaticPopupDialogs["NOOBTACOUI_RELOAD_UI_DETAILS"] = {
          text = "Details! profile applied.\nA reload is required for changes to take effect.\nReload now?",
          button1 = "Yes",
          button2 = "No",
          OnAccept = function()
            ReloadUI()
          end,
          timeout = 0,
          whileDead = true,
          hideOnEscape = true,
          preferredIndex = 3,
        }
        StaticPopup_Show("NOOBTACOUI_RELOAD_UI_DETAILS")
      else
        -- Fallback: Show manual import dialog
        StaticPopupDialogs["NOOBTACOUI_DETAILS_COPY"] = {
          text =
          "Automatic import failed or not supported.\nCTRL+C to copy the profile string.\nThen paste into Details! > Options > Profiles > Import.",
          button1 = "Close",
          hasEditBox = true,
          editBoxWidth = 400,
          OnShow = function(self)
            self.EditBox:SetText(profileString)
            self.EditBox:SetFocus()
            self.EditBox:HighlightText()
          end,
          EditBoxOnEnterPressed = function(self)
            self:GetParent():Hide()
          end,
          EditBoxOnEscapePressed = function(self)
            self:GetParent():Hide()
          end,
          timeout = 0,
          whileDead = true,
          hideOnEscape = true,
          preferredIndex = 3,
        }
        StaticPopup_Show("NOOBTACOUI_DETAILS_COPY")
        addon:Print("|chighlight|NoobTacoUI|r: Please Copy (Ctrl+C) the string and import manually in Details! options.")
      end
    end
  end,
  profileString =
  "S37AVT1XA6c(RzaodWyJ6EvRpANyLDW2roJLt3NgiWmuu0seMIunjv829Go)2NNNQQ1AvRlLe9U7909zojn6TPixxQlVxEEVwFu(Xp8XRE4W(pTz7A(X9)(6dl3UDXQTRxEyXU1F50(d3E3YJN(4R)4vRw(WPhpSEXH1l3Yl(o(V47p(W6TBxLVO73CC1nlpTKFE5JhI)76DRpC7x5NUz59lVDn(0PpE1H9FzXNwEZ6fB2HN2LYpEf(WLQpEP4Lk(7pSD5xxFyXnRpTCZ2Jl(YMD3S)l89EC1smAVWAegTSX782gvJt(Xp9cRc)6NXJ5Q3S93)LF8JxDnMfNw)34W(JxD1N)62n7wZN9UhVF9Hn45S44xpEA99Xx)JhxV44Qd73U9JxJH36h2F40cojxGB7ZhtF59yjkUcC)IpDy)9l2T8(1P59Un3)49l6wb3F)1lpT40g8ZxkfTt9f3V(eMuN(6d4R53UE5P7wCA)(TN28aMJ3C6UpEP2k6E)N2V4l3T)Jx9Dhw(VHb)XJV4v7(9nBVF5bUED80YDRwFCXX13E)6DNoUy7(vFE9nXfFmi2SBX(DRZlDhXAhM653fxiBFT3V8VTy51B2U50M1h)4LH062Q9B3FiTZGTePQjV5e)KU7tgEbNg(WEy9PJ8QVA51xFy9VVz5Pn7J7TKM5M1P9KbVaz(H3i9U0tV)jF9YvF(2d7FC3nDJgH1KVH4N0DFYWpfsKx4gwFdElha5h38UzZVV54(dZ8ELXhHS)vIfZhpU46B7jE(XDyF7tlxT(xV6NFZBF7RF37(R)6vKW)697)8l(zS1(cqcHDJ7WBaurRxVBXd7pMFnwH)L(4R6fyZ9Lw(o(0(DNwH))9p2TkNMtJN)51mSxF6XJyNPBvqNxd05vaD38)slMWx64)J)Jx9pV)W2BUc3(6)43UcRhR7F9yLyXHn3E3Pr7d(XdcY5aMH4LEP0pC)(0Yd32ULVbZPfh38VfLN8pNU2)s8Fo1T(Cy9wqs87R5t5H2Vf7vN2hzepEhenS8ESbEI7BhF8AUFS4lGK(HLpGnZxNg(8TaoStBZSyGN7(L7UjtOhFkxV)qCT7ULu4r((424hV697VE)P9V4NwFZMhVhuzPRCav)87h5RSJ047tsO(JF71lp864V9h)MUyb(Pj1Ylj7)0NoU(0Ox8P(5j(Ez3Ro)fgqOU8VT5EUma5k3T)M4Yx8w6MW5N)d73Slo2pDA)9fe4R2JhzMm9cRnimwLoOebL2yOi1iJ2fbTs5SkLjeKnoTG)sKS7ci)1i1gP3RTozJM)ILtVlScLti9gBJqP1(M0t7uMePFvmoei1Y7JsauYG3(XREBKN2hKk8hFO8pEDXLDAWuPuGvitjhYmhHmZb1TqTlhxmu4e2X(c5tALCV54IthwE8osb(4dqLguo8WAiB9cVsy92qJ3a1ocNknJVIccGy5pNeU1VNTekgIVJ09VaAkWd(3xVLJgJDQYi8p3F9(ThPcuWrCvujz6DtHU2XAno(aERCyMLZ)KAv71ze5PwTDZQptLm7Fy9o(mMGay1D4pxVlQ1(Qo9mjUtSjEKAMFGQnihiv3LvUPAhpQfr8arEs(P4JE3JpaDv3U)XihE)G6MnhxE921lOcO7GWMTrbou496pT8XTN4(8YTpC3soHWkb1l8WMD3Ua04B(3aHpwfVD5drDRjXihwVB5cOuhRiGSlUBEmPbNd2BEiQxpUtJD(DRW(8o8)ZVmjD86VMFgNwV8(edf3plHkK2oW0jrcESdCegEqpainE8tFcJNnBXIl2ppSz9UB2(1pTHspUbBE7pSKlW4bLUYhE8WdqOggb73Ivq8e(k00a(5wauaDWnjHhdOTavSoJJz92pLziIA(sRQhpDy9Pv3LqUqYhQnjcRjTASalhjekCkGjnUPB4fqrkNJEZ0kv7nMf32k99QlF3LVP9RsShaQX9F90DBwT4MhXkaMhfV0JlV)boOJxkfOEayTWm70jSHhxKJ7WjfaK4e7IGq7Q3(U)zSeMK39H39ZTagjVqlalbip(kugljr7FlsTqug3Cy)dpJgGmBupoRwDIkDR46fj9lxacY)43()(XL3WH1F8BFGiUOOHSOEYHKfSSHGl(9LBtkXVA)dClf8XCchzCII5UF)HVUaFfuSBk5z2ThauVoJpoUzDy16flxbnSBo91ie0fp87peXFNjesx8Ii3ZXwEci1dRKjKwyz(aiwxarlhtONwTDj41jpeGBEpKjuIj6v3CZ72D8xZAc)1nKi94VgVL1DxEbC1hF4HdalBwclx(tYBarahsPv22LHPi)dwJZ3GDXGwRskwuZWoqSjTIA1jPPlo(LLpq5D38vGCh0Dz5DCgI1OflpMwu6OD50lsRfvZ8XR(59pa5nhFXvRVFZRb3jFTR)DitKZfqt83lNtKugsu(YnetiKSGTS75dic8Aew8wK4T4WZuM9uG154epln6qKEU5hAPfOm95tXhopB1lXZnphCTtcxEwy8fmyx3ZGfzAZmWkROdu6uCyxTgIHaPFfoPS9UlockJig9xpwTxE(nsBhgF92LXx9rIZEQgtQuS8z(PTlVnVsgTn9NOPIl3U54PnRsx1Hnjn8B3U5M4ToqtovsMuLZpvOlhVRwo5wa3D7B2qV0ozCXQqLhuH(LLF9ysXwhvkFgfK6xMUTHtVED2axaO5xE9I13F96Bgr1ZVpAz8vq8ANapk0T8poc54DcJWTDIIb2)iGGL80qVhdWl6ZWGkWODGQl2DBu)qubCRMVo8gyKcfhzkTxekKGRsmkVqAkeOE6oij6oYjtzeqv(nurEKLgRbAAZ6(tjJiHCdOq6tNIl0ylRBitfU3Tz92Bo2lPSdy9v)LF5Yp8M3puJYljs2wROTTAwI4z)NF17F)p(UQxF(ALPl(9V7h(L30Xvb45cJJ4IZgg6LIgTF278NE1p8McR7BVLIhX075NFZhE(B5LXxOjbqd303)(F5h)(EBw7gsX710yKgGHE(H47U8V2p36MuUMYB5LDlF6K9aF)BE1h(l)1l)XF4Vm7GT2T9MlFZp9VuDtA0C6Q)YR(PxD5zSwmEZ9xU8VEjeloDsvB17NF)p(MR(WzUdp519ZV6TV67)XlRoTgVi8kibIQOR((eWKNG3eMFWcs33(UV7VEMB2tgTF)BWo(qUL2D7wxDuBG)xO1KN77D0O(xU8hE)7(LF(NF7R(xkEXp)wZB(NE3FT4gScDt6LeVT600x9usdg(oOf7h2V8g6Dvi)PqcBlsoiAgFK(k9yVG0RoTNgcnX7BDk06TBBXNxV(HfxV(4PfpaWC7pCFC)FG2pIBckboMGH3kER1sNrByoFRH3TULYmNyTx6Bnq31cJXOhlrRZRGTGemYjIUmYrg63eLU)Q3)MlF1I)L38232XUvI8QNFCU9(wNl26ArZy5yYokRwNpAglWAWlZ2utYK33rc0oWIldx9M3ErVVmAeYw3VQvsB7Yr67NYNhxWs8lT0vE9u5wTtI2PzWpNiQoeh5H3ePsdr0owuk2pKsFPDuVedAxpYxOt)yKavovaITLiX2Us6BQjPW1URjBgCTLkT0J2yJ0ax(MF5dV)vVDoQKzyZBxpSExh5rtONK7hE)BEZLJOKKf0rNAT152dlFaw(swTK7hI8zPimqE4XgZC6WMBVD9HwdAS9OBJwSSy9nBonNpAOrp4wsOxJHPyz07)5p(Z7PFBvez7YB2eX95eD4BUA)UKlI(seU3(BsEOnAhBuyXPOmH4FN87JCOxMAHoBJ(QSgCvJThBp04eHNLdOYGaPWj9UTFLa0jM(BpoN3nU(XtNsE6HFdqHsV6U7tBULVXpLKKMm8oE7)RpY53nRpTEvuqz0FiaIkx2xbOORUlUqaRSHXNhoDm)h3TElw(FyWiyOVmATRUFJC5QvR3MI(fHuNIWvegE2QZwVtrhx1ExhhSP(a((vlUFFA3PetFYFQxdd2h4sTePiM5lYXJadESVfJG3x)4fViyvgOq35SAiobIw(0lGaHR(BWm7MG0hugP1k8M0VqVK(XlW2LZR9oTpyLsD79Cx0dYwjUhRuyeQ09ezYoc9fPxjve93sEJjBuhnOtis8gKUJXTQDBpttLCQnyb2D7XOfF6fjhBZOLr)ocBpPpdPLO7IXJJE3mFjzg7SmrA3XnrhusTR3U4WhVW5dYqJuj0whW3eOdfG5AF6rgENcpUhD5yCecJGGLm5rzHZcJKEhFAt9ZoEl6lLfXiV(SEsP8woUqrUdy8ZIon)9UJksWrbjWaZB3T4(hb9XIIfpEnlw8LLhJE8nDph)YgY3qss6O0J9R)jZza)bSsA)J3ExRtdJJJOqQt4XIzDYm8sRa5Zn5fIRBxXBfCCgUdz1JhprFuYh6v))qtj)37CZazOtwU(6wjrLb0j6vMbxB0y3iSOcpZRBdnsRLIYKUgDN3yI3Dk(1rU7YX01dEdxFBIPUJmSZNex(Hfxckib9d)TGXdYii6jEVTsyFy7J3Ujjf)lyh9qwmu019Kc5M1hxIhgexL8kAAZkzx8HUbcxHB59BfY252Z(DP(OZDPOLzJUf)19KLD7vG342Q8gr(Re5yN)4BuXB66ZHH6CIZwRRJM6HNFifo4RkEkxyfbNrgCAiwYiKU07KbVQYVOR(lDrEnYQtMHDzY7KO0cC4B2r8lXnYFF52hJUyJIYW79mVq95EHMZ9cTN7f6o3l0FUxy4CVWMZ9cLIZ(kp79g5zV5ip7Dh5zV9ip39NtdyZQl1C41f5UVW7SoPSXgKkpdNBkGTJ1B0Qj8QHyN6Lb0)CtV5xZR(189(Asq(AsS96uMgC1XhOy4lFHQqY)P5D65yT5l2U5(n9rg5fj3uZqErF99HPjKYKfGsNp(06yswvdrLlIR7dfRYW2LKQoEiQ6aC4fTWlIc(gUxc4PRJOT7K43HiJRIqiB01W7wtn(Dc6WG5i9Q8qX)L4pI4AUEq67SRmPD08VHc97Z)1PrkU79nWvX8i51lpCfgNrh3UknyGvvF4v)4BVAXvF4vF4xU61V69l(53(l)WpE5IVlAu2vPefP(L9ZF)pFvNvj8b)0xzoEyF3ZJgGx2)ZFIP3Gi9hxev4)QvRaDkJ57F8B)mWSZ)y1xtxXRi8NoBtU60x3Mi0J)vxOq4F9V8tP8M4jNzx9MF4NEZLF4BymNrS)H2GHFEd7bZY8Cq(FoZHVlBz93YI(5oGDdgWQjdyGs6dTi5FQrpJPdDW(zStKYGqGdC5ui6zMzya0NhILT1QOw5CdraQ85vIsVsOZaSIXO9WJparlWeYih9If9rPAXIJ7w(WFHFSiffygaS8AcHGj60msvmDsveJcC2aU3n7sZbA8BcbpFBCCRZgYmCT4mqxnYqR(rCcozxYMD94uPR0lK9XDoznjnuuAe6MGt6S(O5F(OXKWmqyyVZAu0OXMGjBZyoo9V(DF4dV7NEF01y9XRNSrTdemw)u0cY8ivMcnfuJ9F64)618MtEQyoymWkYxeLWM2g(Nk0FqsUukH0bApMOnfxsVzwl)eDfbDd7uG9dPBhODA4pfvEmJTdrJax94byOu0Tq8kszetRJfIlM4p(4vxSeQ7leCFQvVD2MhggV4Zls0eNpFiZPEDRAHRNsufTUz)XnRwU))273HrYsAv3oGl8atIwAFvxIios3Fj94tiwTnH3M4N4SN)lsvYOJI68t2fbm3eQaxFmovtCA64or0LGQoMJOuWK)0UW0qgozWl9nwLiZ4DQnibPekDeeMVYnXUeHiAHyHpk(XV7DxE1V(Jx(pTaqC2SDXhyYxD)aRXMdZvN1XDbPoKilB5SPaX3txRett7uMLV6m9qs8staGZ0zXh3BlFC8DLGyEmL(ZP8elr)YpfPOJjduknjtoaoB(zr(OvmAUiMmxhVGjyWV(l)4lY)9Bbq3x8x6VH0ulY)LZgUbGPVU9982fZ4SbMQfB(B0fWphY2mg8pm)KA9PVW0rRx9(IVwen(2PzF6wVOiupTaR7wqtz1Z5OPPlFtQTvE5(9x)HLR2)l)4VYSXD5VEb1s(RJt1MxE60NOdCJY469KXqRgONr3g3EF8bWHg9ukOfIPQ9XF9vaiZRpetxp87Rp8dm)8E5pPy(M8L(RoMW0)6B(F(ZV6YR(X3DPq9RF)7E33)QV)QFf4MUz5Hdl)1V7DV97F17F)RaOQF5QxEVQ99vYaMEMLQlJFr3LiBVP(lPJmyOdWinJ8F)L)XVf)K(Fp(pQ)9EFKeHXFEy6QMZYQbsb6YxOtdtGivgHq5(qRJ4E7Ir0tVLzf1UJWiLo3M1sMLNGJjj6VGZLy5dPRh)YhiR)nci4c0k3USix0lhxybFvmFTAbKgVQ7xE8Zunxwg(O0vYpmT45)AkKomIPODA((fxhZjmCv)pAZnYUmrDgA34xdaJFnbaAYIfhFXK7Stwx7c)7Ri2OwkW2loj(0RYd3n)IpODpE)1jpI2JbltTwgt4Uz)C0W)XV9)it8()vh18)h)Fwqz26XuXIFGbKIOxgnClfq9usFUWAKkR1QbMHGweHlyTLs0lEs)9sT10tT1s60nvE1bMHrJ0RnKez4OOF23um7ZlMZUe)nlmE3(oIGi5wT6o4Bi4eJsZZI0lCsYs2tqxoBI5m4YdNYaIBLOWq1T4HJ5y11pNpU(HLaznbhLYVXUuWnodjhY0WEC9uVZFgXHO1pUFZXodqr1c8JsJNfNMOedRoOunn428bPX8NXo7pJD23qSZ6JE1)ycr2WiFvpczNBG8(ZyN9NXo7pJD2Fg7S)x4yN18)Ih7SIvRNnmA)xCSZ6Ik2GOLnmoAfry7)To2z)9fGPI4I90bL57odWXNxaZ(p0av(p4bAxuX(p0Ou9FkJY)m6xFRr)sMhV)38OFD5lyMy3iGYeDSe2)ZOE9Nr96)o4XG)UJ61zfQRH5KZFg1R)3YOEnJVXN4b()m6wNz0TgfiM)rgQO(3YOuR7jIF0P))dXF7)qr3QWv0)dpqwpv8I)pEmToNOvptqn(7pUbtJ(vTyDvgvTPri7FuX86VZaU8ngLNVHqM9pIOIvlqI)xqeZQgnW6XdBAGi7HnFUb(65dt7)FFaUEUyM)F6r9QS9mwT9tKMIKbTOBhCPtvuc1YgRwotLupQYVVuAC((I(CCfu)Y2l2LUANUOsVTJQm8XpA2QqoNwPaUq5t0VagFTQNOqXhETyUf6ls1UR2xzYPS9ZU26Uxo)yWCU9ucCT2NQxim(YDUVHoNaE4p1E30RUy1qRcYPRitVLMNA80vX8H8L7QUJp5ATE)tvX)J3BkiUNzGmS29V0gKpbD6KhT5jU4rpzLZ(eR4tUy3tr(n5Q7xq6ggH6x9tsApHm01uJ2E616fp1az8LxC11f7mMWsku1x0hYT5Lvh5JwtKcD9nNrpuvvc1rKhWa)NyHESahV(Pw6g9OlU4zOPNqMQp)oKbg12NyGmsCMtEMnfJlPNoQZRmEtUNx55A)jxwWdoLTAefh7MHR391fhxfJm96JhjO2rTQWKUw2YdAmYUEh1Xv3T((C6trOSl2WU(yYDgVEC3D8PAVvT1DEQE17R79yBw86d7)CUnLsyXDTMXf7H1ZB2TCBo4vl3blQUzrmutx33bKIrvk12QAFn0FVTTOTU01iAmWTB3F9YVpzQWvWQJfTDmKf99iSUiQtNJL9exkEs7ZnwUCX2N6ERaCXDFEXYBUjApXHJjpyF)9jpthBXW0ZY0txXcPpww(pa7lxKcx0n5oozUVc23dklFY4LV52VSbiLA3B67zVDDznNZ31fCIUi9WTR57ViesTnbsUWr3vcWx3WoV89B2LZdJlncrEQsxFckJh3L7ZIF4U1)XV9UT38h)2hygrWq0)4MTrxLbPXjXXzKzxkdz4bU2VqLe3O19FHP9lu5VW1(f6i7JWBh8muEvyWBrl162VWLETUUxRo)fU2VqLVfz3ZWfdulg9Xl13Ppo)WvjTaKXYLUdtACLrG5YVvCLQ2NzAQeIXPM9AX0xOY66vTZELQro4lW4s0(mSPxA0fP8h6E4S3Re)LM8VyA)L8alOgSGHRW29qtVxHimySRen93t2vGx8QF8T)Y7FZF8B)0RU8v)WBYXhdJ5eKOqNpdV6XBavWx2C6U)43E9JjC1AH02USjtj)aDDF73OZFJO7LQYFJS9Au5Tlx(huD7cPFW2Eh62FWK)ctp1r6TLwfeIM23MT1SHyxSBbBJQ3YUR2w2LnGepA42LdyaiRrQPEWEpYd8cJCdd6fPf(UzW337CQbFDULX338JN7xR9mBV5Uh9GwpxL3ynJPkCaWGRVlKB018D9E0ukd4tDi3YxA3ezWx)SpK5MxNXiDWl5BDMLFnFBtWQ7VTt8tfcwN0ykBjUITEV2(NysjsSvRCm2mB8oxJ1ZuOkhxOfR)BpS4WsCPR3LfdFmjZWfZkd8V20)245)cSxHOJVeIKxWAGa1xNfKL(72RRj99qKt67d5)U9(AsxNvK)(Od1uM8Zny853Jl)9603lD57lFDbr(3tJ3MMq(5BZp32)nD)gTpFDn5NFAC7d5V3KNpAt63LI8VNFU5XLmpVPmL46ti9VgtE(iYJFzAE1i95FppUTTpFD(3d5FxLV)84tMNxY86POD(jZ)EA)PrLFVQ86u7(uA9c)E(9QC5XRiVVMhFQ87n9VyF3LxF1PNtAFcIYBY)BACqdEJ3xADbp)0VhCY8VNhVHM87nDDmZKs)EMUjpUcT7Fn5F3jYV)06GrMV(M21925zE9YMN)59lDO95N)9U1P25FM(mtNgs0lkPOLUptVMPBdAx(3ZRR55HrzY)E78ZNV)mDNYM)9q(3B3hZ09TZFDt(3BPpvjw)pV(RhprCuJqrEHbiw8(gmbWAU1L7aWLilz0wDca6IDiytaxwkWPPQr13auDo(iaZHvXZoeq70gw(V7nXgl2t)Yo1fRGLpE7IhaGZnRyCVtkaZ9P7(Eh)xwEyh7t5uex0pAYyh3ccHYitBBe2LFxlKOR2UhOybe4lSbdgokToOaKumBsXc(ZB2U9y6eb4e06E3gSSD4RT5CjZtaNfldERx2eKgY4MAG)k8loNmiaVfeN1OvH0QuolmJ3AWgAScdiFDnkVV)ubW6Sw8ubEsSGQJhblgtBEz2zY1fgRvhmGDw4Hija)Q9Yg4aRlWdxRDnoCjcVpTDzBZjZINghdyrqt5bAFxqVV0n8Y4kKdSuacnUkz3L5h(sbKsNTrzvcW2A9DxwyWLz1khFEsR1knXKYnDzndUmp5LdwL2BWctmZbn2UmXS8XHHNxabwynri6FCYbgbFbgq43LnAJtGTbzkY3TzHzX1bDCcbVwLcIzf9x3WDIaBx2kEM5GNztW3FDd3ki)ImyKqIGhIFkUUH7fGAe)AaKnqdBEzjDDJ2mSnEplQxoPfnDRYNy86JNEaogb3JSlA)1KJ4BrO2t77AW4XRG2CqQz7Q(3mTVOkPpwzacEJpWdmiJw3t6B8q1h4IWUlwCvIKyGss)gNbAPXMkGqyuH(BfZzdLhOWOjkiVDMRBVviDK58JgCRG3R4wXFHLEi9laYsrONKZ0ERkPJheoWOlOB05khWABS3Mc5A0G0XSiqKNt24bqe21fLHI3QloAvAPvcHzb7y2gMvqyEaDXkWtOnfsiOqdYnfugmU739AzLUiGbSXc8iG7aOf09siWabRFwOrapvWh2X6NzVUWdqgkhKUaQ8OJRkoYrGaoLdZiN2lk4mBAVv89qvo0(RnMgJO4wTIgYN2yXYysI9q2qCVqXa2sDo8IbzzX9gGAFO6g7syejStynVaprnes5XfOSoPFW9sjeElew4KfIMAzxVG3Ka4kb9ewVSL3lqNi8e73OPRSJIYgzEWSfstTcrFQE5WFtkzS1rLUUUv5w2AOWdkXbHUGkDvXrMtML6ohxvjRPTK3SYtkACUzKUkSeeKXtogCtISWHoDv6AmSTYiN927zoBfbHFeR2QgiRh6VCD8WdL85atie(bLGGknKKufMrhKhchvc6RhhKMg1b1mvheXbyWLbTlGNsz7Um3OxQayZSbFWfaZEKBumJoizaMqGzl0I6bkTUllms)OeeLq7pKJcswt3LnshKhII5oeOTBsnAdRygDqGdqOLqbjTVblZ9x3O9bixakrTGMvXrq3CDKoiWlY(SSeyLCG9X1)8gPdYbUekpbSM4k7UUEcoXeDbq1SFiTfqsiW2jyITGtEKUaFvDbwkrrbPNwUpRlfORzE5rasyHtR9Jj3WYp4kHyxpf5ab7fSUc2my1GGiGTrxV28woxlupgaalAlQijXpFREG92yPSAbKe5CJ1f0UhauQcUM5OrkrPKjgC7OTkaDVbsfbeLgFt)LnKSm00aAdneulLqlLOc0iVv6GSqawKwOPmvGg51yb1aXxgGza6cRancuKqidTDuRKbRRc0OyCakjgKtPgGKMMbudyT1eaioaM34Djs0cjn(NrsZ83(ejnoqUjHOzRdS8GdRdO8ijnqep2Vaze2Xs8vZjPHsrHgrOecagnPnH5K004HQtj1mGDlVSIKMyxrbM6OBGYBHQNj1pIabguaTuqMeqx47VSrODbKyhn6b05GERxk4OTumEWEVgA3b7KX1lzqmEQgGvhq9wK1Yvtsdp8XGWbp4KGvkfYbhJ2vb4Zq0Le8R60s3SsAyE2kXGdlH4zAKD7eYXCxquotIwGyWOkwvgJ2fApGmdJKMZKYV787Dm)fGuy1yTrsv6((RZpE8btFLaWg3tA6w)EkjH5aa0t7drsnqbcHuI3RCSwwzvrHqpHaw9yjEcnpiK6Gtm)JCm)WL(M2OOpCzhMktfaaLeOCnoBfgaSicAqqTcGWHmOLWugaOPdRoq2iwLavwngalu1b08yOdR5ejlVMHbGs4bSsnK2dcmDfvTxQFjUGM8)LG3mK0hiKDuToWMaSRUQkzTrSI49bjUGYQNlFSs2gA6ig4wGc0yc1i99eQnuHzPtBc9K(fYlNQ8eMtpu5jjYnkW9QGa(KH26ZWqkMI64LBjQzkdS0hcgGExra5a6TCIeuSEHDgAGHM1hrILOZAiaxxWdDqlSOsmXqkSRsPFWeeO5Z5lUv8ibnHfpvGQt2y6U1ouVE60bGpdIOc0RBfA7HPbSyme0ilDV5B2EG6qvfSYt4BSsHOyUIDEA1lu0RucPFIHuE2MZyHvqQBvOFatM3xcAtr6)uLMqr0RcaFsbBhWGRyTfwGdJcmqfqdDbGySAy6AhlwFCy5amkYYHk2mWW1b7FLWyh7etOCc6AbyPeDsoW2uSazKSgry(2dBGdQPMqb1BqemeCWJesDedC3IlHjbcEQu1vGVOZekmIOspS9aRGaiKI7LvZGbdlWWagcZutOaNo0TAHQtfWaklHWbSzGGqsWi205c2itO45Bji6TyfMmAQslRbPf2SILgJkrgo0ekiWhWULm7jXJFGBeAO3sAyfhau8(cZVSD3l99fmngSay8n4EjqbyWjwnaMDv)92zxoyxTr6fWfyTf2LdugUOZ88K82xCV(o4Uq9tdSKb4mKjl3BVxOefCebIJ2n492swbXPKHeYBGArawOa0kGwIDqyCJbyie9U9t2sxfG0fUor3GzZy8Bb8sKN0FrssB2FVQotZXQlDKfbLzsg01IZgSgCT34Jmdn93BNonyvUJ9ooHbIggGrh0gqyCGvecKq1dnw1HVhAdb2uJM(rNU8V)EXK1dUwqNd0tfOVv6EAsiKNaCa2kMaqf3lpuyWSgQlOBw7V3o6kjGebezqsdthozHZtSw6ZzdwLLGHsLKthnhQZNnoUzybfaDqt57fVyy1m7IaG0QPNMu1sxXJqpmF1egaw2KLJzDiACLaeizP5P7TLUc8Ou6hwoHsi7WXmdVK2yXQTMbAPBm35Xh6smO2bWlyf90KpWyJ8cqOP3rfZaJLW0FVfYRiuDiYatlvsnzkY2qTEYPHTRmqQhK5PPtN5SO4TaovmK984BLI26El6cJeX4pqN3X64Z2FVyHwbtMnKXO1zjP7TLkkAYDaZCmpi8MI7nEA4s)lGrGti6VxD3QkTLLWjKeTVU4E1efK0rtTiOQ(7TZNHoAEo99mvW6lqZHXQG(lccPiA0UXCpKbfOJl8WZ8pQucAOgzfULKp4HstjfTby5zJgrFCbG0uiad8LTRi(P2DzHUaWm7z8rbqDBfp8aHgsqjdMmaNpJMEo7UmHynAcjMaNLtvXUR5NAtT7s6ONLAe0UWeJ)CWon0FJc2auHuyChDJTrE4XWJuyfD)lfk3FzJS7YJ1lGRHoCr4sEgBo7UOx3P)PCnmahExnWN0LKAHcAiaOhT2uZdpG32YGMbfvs6s3E7PgzbmexrF3r(eiUS37yJJYGJygHkCyNPktz(82)eZNVcAqWuzj(MaHB0Qi7ST9F(BFITob5l90AU0)zNZ)IEQLuGRb4skII2iJEIAHAaLfR0tLTIrpwUF0a(DW)jZAydZq9fOohaOurZr01S6hyzbzqGvwQh6S91S6hlTnGzuseHsTTc1hTFsci3yxg0RYQuFEkiZal6X0LQWQs95Jr7OjbZqvL6d7oEOttBP3XfLx3i5awkRamsAWlL3jML6tGLpiUqdZkj3zvR(PFU1gSidBvDQcUOro7Lqdbnc9akSLR46g5TxiENq8HcoyIHXEou9a4PzavVHEEgiVn0PHPMeuHKx7Z5WlybmGif8qrFtoeQHPcEnq5UJYKymjY1D7mo8Yh13tNDjIL3CfbVZpKNq6dv20OdqacDVH02C45wEeE3qNIa7s8GMZjPJIt(K8CCksVlnPpzSquh9GHPIIj6KhlHMt0c(ui1MB9z2bZ0qpiWugWhGXSU2sdFM1Nqt0yzS1bdFZaONr0GfpbpLjGHiDYB3lDKIjSLiHjcqncTZOFMosXeSrttlAJUGj0FzJ8kcnshaKIiEnfITg7qqlahrNjaqA(GV3fPJ9kc2aa6y8snn06S2x7tRGWp0BhmcJnERnwZBHwQ4ZomuZF7tOfWOtWWgr4DQS9uZbsrdrxKnqWWqiRggkjmpdI)b3cWGeQcsrOPUwfD0wRJCMX3yyuPzqJ8eRvYoX5cdfHjJDdixYiOzq1cdLuLIHS2spKulmuqyaifyUWb7pSjWSZggkacdxdJOQs8eHHYqx4c4)WIuV(jcdL1bAf6EafbnxeLSXGuAOntyMcOUMuK(E(WqLsQ3Y0XbyNHSpy0pg9ICsM8SIHHI7GNEniWif4s2PABdajruAv0nb2PXIaanywqtiPWijJpuERA6buibbsr8foHBcjOk2l(n0qLGUwiNMDQndsfNKYSIwO40QAzJdJNaOxGD1yy66H6pcPsd9jnd0PLUFYpv4VCg)BcCWdtuegtwfmueKE2mA7ciHpzIIaqWo2IoAuUcpAbSFEMMLqya5jdtsuKatpmgIdy6KiFK0NDkvGbAb7QGileMA9Yf0EqBGYcPZiTL(ObBVA6wijm)Pm7A68VPLgKgZKi6iObU3bGmOXgq0o0llM4FtaPryAyGjzmHmf5ycDcTNS4YyO66vx56mcNgAfdppa96kDifSA1ZqKb4xqy5KCUcZiyhkZhlytUh4nlUv6OXgLemeyVRiZPADBaZshJgdTq0XcLE50fDzQhwByagTj5MfNruijtYeMklfE2bssKSsXaboG(2mJxodnCdWfey0Mfy3EVq2b(oLLOdnfzftNxoJhKby2IDEiSPmrrWKPrcsci6bCeH(mIR3lNGp2qrTAMoNYYuQHsoOfXGz3gkt2JoVrHrmSFaq7KsLB47fMvYcYac(cPWmm2lNcUj4zwrc0CMcVVbeEq9bJ1TzKhsT9(nPba3CmMwq4IPW)fG6LE5hw1gAZ)RrE5KPTu0N7yHQXx4VMspvAZGag6LtWSAGjSmVvL60bgHn1DdaMLb(0eg2W8SaKp0ZOrWt2MwTAZiZOWNMTrgszFPZombzKQzekLQzKYSHjAZhmh2cUN2PXzdjnWMsymDhAIUISJABK2pMwoG2XzPlQC6XPIqNsY5gmt0bGncWXYSMXrel2A6acyX3ZOi0yBZuNz0bGHUIXPWgtJerT0oGYKeAI8dezExtTmYKz0kEqGUsBtruAU0oGottrdgbutkFPwgzYUfeHvdBFzY5jQLrMu3eZVfy0nWE10mntgNJwWp06nhiXeGFIjNmiEhz92ZslqFweZzGMGswIgFK5BEoJb8rlBEu2qTmJA2bZuAbpe1zO8EgW)GUMNlOR3ONlSukvmKBZzEctikRJTytwvdwtn)Mb9Anqfh))yisQ53mS9kzIAstOYwynJNlSAODqaSfeuTPiIZt8BMJNS2yXThSYCMN4Pl7H5qmWBGkZFoMQkdUHYfyqfCAgqxcFOfa15N7kZE7tnvfQOisenDDD2sHzWg6GqgmzOVXj)NOcTGHEhoalhJPmtvtvbqkg)udtqwqyvZuvyUldamSX0Y8AVFtEKFtG2fgBqSfQmLuwHr2DGhct5oiEW2iQL7km2JAiQeQ1zuq81OfSeBl91pDoVq6RqlaLVTTYIr2fcJVPh6yc2lYE9yoVwXS6NYUfm9SBksf5rETIHa2rddHKuycqHj2JYsEyaoK2kPisrjIv5yhyZK21eJeoirK18Afe1jjtdiIiOc1z51kHBiWClq)tqcKFHSmFJY9Oblgy3cmCJ)tT4feyG9fsaOK5bztpfG(zZV058y7SJ5P060Mzykj2eJbZRMCVMOHFaiem7tvSCpoJqj7fJ)kH92iRrRhJvnvgGn6CHvmNCpcpkMEHyGjl8nXytXdmI7MOjK6sVopwhiSgXWcjj2lddIZtUNzGCVlzXP1TZ7E6D(4fpnF8mm(JWCbFmJc9vC)MbsvauharpkuO2(m95ifPbHJqsQVPI(ndfQrXbalMUXwtMwqd0bklJCm0fkBQitd)oyQAi7SRfDYmEM3W6fXO1SPgcRD0v1VHXMbkSAGUWsxdo29BmJEz19rd5k8a9uxUiyWwvSMdGMW(jXyxUWkcJ2wXucWwqgo2LlgymkdagROqBWutgh2gcsS3czxkYFwZZ80f6wMjMmq5(c1(JR(eUIGDmjTs2hoxxkpmot(qSxPcubSSnSnJ0tlFIkVIySHIWglZc4ICDHU4XWkfGSWctTmCF(38u3mdQBUZYSXTv0IDoCCe9itnPO77CvW0dXomZuds2nBZJTzW0d2kJgIpLeJPwxpvIT0cbdu1J5SqxlvILm31b3v0dbAxTQSIEngB7aZkt41QvzfFw0HHnuzFQ2sMftp9caSRL4zCbRzAoh1nzd01TWgrlR2aXuS)6P0rGJDuKBcb6ojdDjqUC7CNFKB8YONMvSqCeHqnO)aqif4t)YfAQc3l0WmXGq0um0LUNaU30H8CIgDklZn3yC67EPpt6SAgLsbk6BjgGBMEL2HqeAEolJM9UNjtUPaC6QcfRdozflJ8SsFuq6sqbACBFW9hV8Ofmxqb4nMUn1CwVJUakI1kMd89P45OWiIRdyX8g6ORqvN17dmvmzADXsciiQ4SEleClOD0IeltTm5g6szMrrR3uQq4SCgo9D8WaTqhjc(hwlaw5i3Uw3z4q6SLHybMYWGkuM6JSe7dCi1etHXXg3qN9dPJbqysJilRuoxmFi1gS72fZ7H1KbKnq9FSorPTcfo7vhp)v0u0MW4M4G8lOZl8uQn9uTsxM5JcgRfV0fDYMBsjSEbl4tgfggL4MqtHYaIx3WSsukLQsFT0NVwyazygTtSmMcxmhlJnwWsIgwlUMP1NhuZGnhx0HV5m6PnvVO6c(t0EDTCIBxbwB8gDmPpGfM2c)Yrf0gMeywotf9(dSzC0pHwKaB95qettrIgoc8PLLRTNPSkGd57tuUXcRzEldDey4G3AZuxN2fovaFOr00K8zPFIBs7CEfZmzwiXmqFnYzQ)T58OZiXwmJSBG5KgwoO5c05BitOM)2NkwVH5tpekboINkG8nkhZ(mwrLyYlRfKrM3dqOGiEMmxnxu46J31eJtMlJFomxTUXkkgqCWEstPttg7rhiSuAIvuVxfPINlGZaAplUqQ3X2Yi5NRcumXeHIzErRO35TIN1IRLiuSKRVQLnuziJkydPTCYAiEjEghJtKL1eFrcumM4cSw0F4EY)icvTQ3RyLNbexqMkujjptpjnezbaWOKAyiumJwcYrEy(jIgj0UPIyYHGyB0qQ2Id1Yuiawtq3IwwBxfP7OM99b6IdFtmHQ9(SMN5gnZyDg2uGGFipTXfC1IgjHN1edikOadfP6VDCQOe99tmF5b2WXXUQxhRLvETqd5O6IiLo2JtwytMpwtvQSV1CZ49rMNKmPm0mrQ7X9mjR9ysDPy(jk8DDX(5cio4kzrJInfFtrPjmMwvb9fSSVmuTzbQSjcc55TU0YYYu7kFVJRBnOMKLdnGYyZzBSBwpqzyQSc88AVWvKzjYX1iRGQwP39A8nfrYECEtzI4g8SMsmzV64MlVPuXKVvryrMq)84jrFlI9fYYkfK9QcwCsKIQ1bNNFuyM92N6bklteDFmTAARL05WxI9xRaZgSZiuMAEBLe0mmgmIS6ISGzIfBqApqvOILLsvpVBzvRt(zi1uPkef6hJ9nWkEaas4UDnVTYG(iIjyKKT)hDf50qcaGrtmkmKN6QYPbljKyYcVMb9RXx1Z7SAhbUenRLdP)m98(ilX4qIMcRJMS0wipNRpPQC7tJihSZaqIfm9)1z9IZ55D2zoyf(WeiOuH3iAbfWYPILLRHE6UgTGNjDGgQPGo2q18hDWylfO45YkdA)dtufjXXv6FNXEJuYoBGNPrSRPWQQrjgeDtHKHHgYhCfWogRZ2WwPqGPZjla5Q0cGaGcwDngIZVObam2lvmNwzh5qYu5S0J46Hr4v)sw3JT)3Csabrp1jYEEtBekNZh8E21GyQjWchkue)JX1lQL13oZRwkxXDE(NIvG(qeOXQ1LkDnsxZOkI3vVO(AITMag4mqAj1Lj9c9(hMIIu6D2zIzN1xSJPbioe6og)dseeAojtQcwibYPvepdgfJDlpBw0dVvjHpcKigMsyfPKrxsVankAgNByCgldPIk7aWXKmwyyHWPlYLB7yT)ZSsnL5WfWBHKumdTc9XiFKlCjSxMWscoQ01cxTHXoHjwhyVL547yMlSuSD)WsUIjAFrRsASGswtqeFVgs)uYzAOoY58PzSjvwyXoDOmKDZcvjWEe(qeJ1jASHy)QWsFAqlhlZkM5EKZ47E2Ofa5guagsLs6C(0mqqZmNkjcmPZuj1z9mBMH04yH87l6DdJ34b8qpRBxw6zHA10b7kqm(6arR3x6JTjB8biBshTFkNacZyjtGnDNalzxmaZTAS50qY(QcrwrGasvVDrJ34vyKhlcDvShyvtQiJpB8eMIaCTbBvlzaaE2ogG0rMWi9Rjt8DVSjMS8miYL1dZKAPNNRyCxncsQhtZyzJGmrstDP4NbpVXjkqSsSyFdZ32Ex8ZGoeRjyxdQtiOLCCr9pthMk2zRgzbfZgMOBVDY2Ix75tCWqS0cvcwP3uQwHmuI8MfColctvFZoPxgkikcSJUfBXkMMHnKeSbZCkmMp8tkmAy7j9JKGcZObPL3k(wiLtQIb7xpLT5L0pKmkEmlOsN8FXUxKGfyPoqUTj2yfZbjw68rVeMRevtx2tX7Lzftquu5TUUBLOxzk5YsbjL0W50kJrFNkFmrPSIPoVYYobfW9e7Kwgt5BTH96Dq9QJHQyQZRaOa69jLID0QbL4OLoUY7Gi2yttAS4yMZGc6SnbBDlYygyNRNo2JiAAIz3SOjN9n65WVmlX0G6UdlutOjDJsFDxdWoOJzNMo3UC(gQ0dtS)Dq)PXs5Zu1H4Z(sMj9q4Ac7Qwcy5GUw8cSowGVys7yXjBm1czo7joSP)1qaVo75KD)4IdJG9GXoZ6pwJaUg7z2iG6MqZD3ZPTcaby9Fz0zFfpNVmaoixmDp0mXtk8iQzCEWjO3La0WoJCMRz(a0vX8LKIikRQ8rciz61yzbTg8TfHYCzvhlAwyualL5(gMu5IDyU83yOh(HuolDDxJIUGuBo3yG2rLXClfOLCXu(XulENG8bc)auoSk5tmoZqmo)GzQNJyp1sZwqJHzrQSc2awLSmyjen7GiMnjuYadbBWjKBX6QvwnnSmDGalMPznUqnphXq6QyMcy6AvqZ45ik0fkpaIQylcquZZrSZZb6tgBswDxIAEoYYiA1WyA5uHIKb7PJhUEyERzs1ZKHzkSnN4)Fl1(7S3(upEhyDHW2zgDkwrEum2pRggUg2q)eEDHVpgHte2X4mXWMbnonYQLvd0eYIQHRpYcxzpU6lnr3TaEpwQ41A5mXK)MPmcDPIQUNuuSIUyCtbWttHRpg34zWaYqaQSBU6R2ZL8yvZYg4bqEOtoMTsoEW0lxrYuiDt(ewpRHj2XwNg7kivR9xgvlCbbMSYaXy1QV0YtwDg2pU256ZfZNKg0lgvOh0sp2keBIqKYdQwAWNJeKTbhY1Z(vGv68vQcsaQbgGOz7Ff2BAQrco)yzgDJ024y7yHv8H98Yff9ipxX4Arljb0j2iggoVF(Onn7Tp1lMnns2(JGv8nTDrZzYJo2UBzC)J9r1MIwCKzCZZcyMGzJPEaw1(DMeyzDutL0BlBNJJZ7enJnrY9Yq1CT8OJcHBy)OrXstnuJ3tBOmbWeWEEJTkVhHtsOFmEN5oXZS1DFdmmgJq2HDzykRX7bTXmVyGQhvx67nBjTPzpNJyPGXTU68Emek6ytrwtKPUA8ESUJzNkb4xzXf1Cw0Gb1q)nzO10gAbV222ytoFEVyI2ZKWWPzBlUxs848yzUxY0GirC6XoldvvkQj(pq1JXCmYd20EX)p582ihb4uZUPbj5nmrynNDNNu3KcVRXXgrArK)n0jTS9tZE(RSrnnlhuXInaW28Eg90IBfycaWvVL9YZYg8uVnIa9VaIIz7dzGLP2y)QG(Ci22rAM4NntKPhusEwxm2Y8wZYA3LLTjwcCf5gwxwo4z)L05BOAz1GA1sZUuOp2pBcPgH0idfzDhc7qzjksfyfw75yFrM(vGELt6R1qVns2ENy9EOCLLLvyCRzDMTXPbTl27fXZI97ICkgAMVHEdu4Sd(2W2IJVw2ladcByNyIUVlKA6oZM9caaPiQLGvjHxvn7fOpOjbflmrTsoTZ)27oiSBeDmVwy77g69K(M5YYbtyC)EHT2aiSYfZRMVr9oZF7ZG)hs0boch72doNTIEhg0f27XuMydsQgtVZelCnMNuwMlU1W8XwRd1uak0qqwtVddujtvx6QPwO4Z1NnzcztdfOJefQA1TcDim7WtSyxX2STs2zzzUeXgivSrrf8vX85yhTHIkmSLwgQvk1endG6jJLZFPQ4j97fbT2hAoLeOUSQEN0sg0)BJnrMQDCdvSNKlI83zx9Cg97f9OO2rh2edKi7sLJJAx9SCGL5KIfZbdNP0xgOdAroRxDMBkgFZKAUo29Kyd6MbTsu2cczVOcW2jkk6sEDTO7n7GEQ9jSnq2eBmAn(GQMJtykLWkWNo5lyksBZXbwpWudKoQHPuqTi9Y4yZYGL2BRv6A1Aqm7DTSOA8DnuIz7nrWMxMAk0PT52N(Sr3tsvHAcOr2KTqE2O7PznYcmzb6byv1mYXzzp7GTXxPku2kCgrRY2giZOz2q6TLOvhNroSRqIhOKTfXYuUFspHvdCTSkWm8igrvR7Wyy4q4eGv4Za7SMub8(O)mBsnrTP8i6zoPegzxeJCeJiFSsyA0(ZotmbbiBhHSVGs)9pOnfYEgnZLAWJxO3EKO7zFXJzhUuhSV0pxphOXXErlKmjzpdsuZZyHO158G7iwQYv8mgZsCOTPrf7urY56S9Z19qKJG5AI9yp6NDA(Y3y55n)Tp1gtaXWkay8OP4MAjjGLDiwxS1EZAeRwcJWKSxg9Rod2OQAPSWIInWOjjCd8M7itTy7XI6buml2u1kLLu7rNDRewYMfEdzKkpanJrfx0e7vB6QLNNN1gd7ggXD5QjmsYjsbLLTQnxv3Ca6zAvg7sWSbQRQkgH1uSrZYXWgkRDSXU5WsKCmNV1mDUR2AP9SxtgB(SqhEUlAmB4Wyl6ufBmVe6GVw4WOuoz0wiO0AqjSoA3GA4nmnrnmHcnNNPoIXT3pHfBQSdK7nDbj5mmX7LYU(fhlcHMggGwPRI)EzQ8YcoL(yXv2Qkh7VxDSZjAI5TAXLnj4d8cIDGUbpn74lda)zpQ2251IHchMl4mmAWddGoBYgAIRfRu2V1(mLJlpSJiZMFSQWHTQXPwlH4dfnE2FLn1sNSzhmtLoW(1RsXKBNwpwRAoa9ipwcy4HzRprvt6a0Kk5Ajp928UQGm4Hnh2Mz7SqM74tZ2NPesqPX(IgdoCvhIZccxt(jfBpg2AblhYfI9IChK96mfzlLCsuYmStxgnEt7oV(mvZOc52ls1hpZv085FX3IdXN)2NQHftA60uwIa2Y0SECXTYekdGIKSeO01AgMXtbdpRnaABu9MHPMTOgp1qr3yOQ1d29mFhfEUxZe0RsPRW0)2Ycb0XwEUsuTpt1LLv80fOwFMIzopDGRn27QkEAJtRwf5Xyd(GhjqYQhcbX(9PHHppqhqyQ1j2zpYHPbRpDEIuttXLU26cFSb5WMJMyeK5XzXzDkOqVIoKKJzXjudbn4mkZYVXZ9I5V9zoHD4jMdZCPyTNjR2M7IEEHtjbeSwT1MXdlfLINjdSOEc16Je4DXSCXdJtmct1(irSV8WueGLbCt1(Vkf3ddu5r6utO65EHpg1AEmqW(UKTw1sX()bmli2YIA9hBZSKCmfCWklRjkRpuT5)7ylVM5hUX14k7CKJZvh2yVG5dkwmEfLg20QoietztvFH4nFEmYo4el6Gy19xToBJhbxMa76jahOrxTdyYd6GqStYsh4yQ1lbSSfklsTrfPVVdD(mGtgvTdb6n0yR(w12PB6bNOEIQnJTXbwHSqJQR8CzJ1zluislxzJvkm9qmqZc9ZZ6gekwmL9ckjZBElp5sO9gMj(HLElkWK1NTp3S3FnTLQjRgxftE22k0ZmmFhPth4zXJHHvWv0zKCmm0qrGKnlq5eOorJD55AIMhxxWS3YgYKH1naqsYJ6LP5a5fWid6IE27pHw705FGVn9fm6y18YSmQOBOpoPHNB)zAOx4or8y5R3RUdXHP1ZO71oYP8nSQEO8Dl9aqZ3OvASX0f9iMMNpu2AwPn)BzMKwKlDAQZ0lRNLmSxAWUsgp41eQ697tOpLX)GopBG8YXggWJoenf)2ynfHWACJLGhaknejDSKEQMw)0t7mEe8e)uxlGySBdWw6gRWN2SvDwR0c8SCGhHOXkGvx1zp4TzzlqLzyrWzQBLMYgBMf8GDv30uZXKGBHjZbGKyyVmOQvASmG5HkqGzbszhgFCdhWhp)9IhYx6bjv5ytM5r4ht4Z4HNLVQvAcQ7NfhJqDUbdoFgVxwslS9lq06S1XE2wPrkgwwTEi9iq3(uePfl9Kv80ktYe3BCwrrh5hdEndphOXlKRm)GzQ)qzg(0q3zRgEqLn(04tWSS1WMbMmNwhMz79kqtIG9nymxkeH6g3wYzb0e7qvUCcvoUrUnxfenkhOyD9WYWjO7G58nyYhqCjz7iK9SmtUYbNlhOyx)MaPembHu1WCn)GzME(apO3AINCbmBFRv1iXwEmuakyJAWxZHqGGjHrkvxs16LN0PZoEANiGTvL9xNX98Ha1NWSCZKlK9zBTWskui6jcHruVcIOLVXUaGlDI6uZKpgqD65OOVeksY7NPFgnUpU5SXtSjMKOMj5a1Zsly5HpBiwx1e1u1CGILwl5NS8y5vvTpUn3GzQAN4jXmPiIYDe1IXaBnsU4XJDWzDvRGO4HaQH99E1Gw6YeWa8CKXY2WJPE1Kres07X03Xktr3rE8rjiRXGMiaoxgbsy2()HiECVWJ8y84SpvBMMQLyxUrP7TC5zYjNr5oUlwenmJkCmYcJKl8SM)ZJU5OnXCahQvb4Z)wM90iie7CJwgtNQjJeRE0a7Ge0uwzTJGnlt4xEEoWC7QP39itOfanklelES1uMbBJZns6gnMov6UoC8SYfa40ycwZMuFrjwp2rXSRGPcXtyjJTkee2SlDXdSxMFDkD18HZz1n88W10WOAgQw3eW4pD84JhQ5ucF18Hd7a2y6LXCD2vn2OmSKmtKb2NyDjFw0GMrNq28yJWgptMIDrKW5w)c88xqhX6tLXc3GJYllZ)lEeQ5NPFZqEhvS)3Z(RBt5bQQJpsyxluiZYuE6b7MLhDZCXJDU1gDtzh9vWQcJouKEXAAJpMUjtWyUg9kAOStnZ((w84i1Yddn90gFmmIgl2XuVkKoI27WU0W2mPIXETTfUnSdCWMIel6c2ixAIWDDfNEygEC)gI5u4yBIIRWSm55HrVje9VVR9ybILadBtpSNGRStoHSzZ6fkTPB64UHU)wzaCWZIT3SUcdEMCyH95jg9jddBCXbEurPX4Nt(2yxDdJgIhIikI)T5Bv(2S3(u5B24bRn9fsO9GXF2(uj4LzBI1Mo7GQfimz08e2BTSICw5mB1YYMEVID(Tgr5X9Wy5BStIep3fLdkFSX(AIojLh9Og2CyQ11acXJgDhDQgDmURADHrf2k2fva)KUQRUzUiRPLKmvgLL1K64E3hBTFrVHZ8nUaF0KUgaimzMA5zemv1Qlmlb6hpcX5zfI1wRUWC07g0Is6WoxFQn806yTJm1jE(1htyq2g5eFJUyF(BFM(MBdbLXJwsv7H81C(7KrzbwMRIhC(HQDzfODkcIp46k8Iz93jp5GGmewDR54OmxoDWErbJbp7NRAvnS3Xdrsgu3ORXf2k6yTQgVITatk63weJNXUy3Ztbd2UBJTV9QyVdezEcEjZcP69nxnptnyGX9(YSJA858BGNkjSp(ey76vuTlRqhZbTuSp2ygCSJyMCOTccaEkI25QTZOlRmeZp3gzmKzYSX0RFKCWNTbUn7Tpti)yr3huKLPTw69ZwFSS5QWshpylpiFgFqBXwNBdp0tzhknujmp88VSj1aNBy1vxjmpuyQoUg68MgJPAoWXsJfl0GE1vEUofg3OjI1Wh3ezFcUsyEy)X1Youg43Adh5S(CVO9PLZRO5ZboECnqFCLIRv1ZAAMrry8Ze5RRovNlHay6BWWw6yLGlcvZROaJMkB4EAcgW1pDhNxr6yokXEKGmF2O9SXhIzIWiD2gfpNfzIo5YfIxVRH0p1PKFSXqWs02lvdlSFOstZK8k2UuNMRY6ikfEOgey72SWRsSzet3FZciEMgcenmGKumPpu5CLiJmdYRDXMHBi2xFS1CxettAxmykABzo9oYDrwE4k4zWaz3hOw6dXUZczvXJcGN69ZDr9B6Ml)HghvycOMvLvSP6k)gBYiZF7tfxq(7OHg8eAouf2eDCtGz8S01w84U5CraRSIyof34kJc)yptZAFsWUXjBTj(Azia9GmvLZdM7IY8CCzsX0XiE6FsGUIALtFSfPO5HrGZoqpzZ4KwIkWzSrSdG0nwCrJLuB8WWVP9GDXpBZwcKUIyH9y0LNFnYjHNpAfmlNQMqH9sJnluZt9vnpLAnnLTW)X5pKKNgf8aCv5SQIu9CC(drZULmiDXZyuvT8hkEOdcdNygeilUUN5e1YnUmqzjRyyLuWQ36Ctb3c3En92NPjDQCXerKLkqzZjvpUDu5jTm95SxjRPcK52RI9Sckq3v4sE742RodioR7E(jrTmDqZgtmpBR4AUju9y)KNJa845MTnkBTWoZJgo6iCQmpR7yovGLN1O5S)B2mDG9AMy92Jfe3GtERXTtDptVoAWaZYUQPboaKQ5HrjRBsxkqvZg2z2DjzHeYoHU3AR6QdQJKNH90g(2JmQzBVZcwWWmLdykkleNzyITJIocBOurvoXtr9ZvfiBCxwOqTHD)kvtzp(e4viMAGcj2HKNeMyE2vrZHm8doxr1VWuIwYWYh4r3vH08EvGMqSVxZINrwwZnoE0q5z5OYZhGGzA56evDkzja7y7uO4uNVX)sTFCBiLDsCntwtLVSNud848yJMhUGTepJBdPSiQyXQAS5JUO2BLTgD6kyMPRg5KkrNr8eC(EANkpOplNDCYrxcYwiHrpZP)eLzWm7JTLbVV4TYM0hZaFD64CEY5addwfZwyiZlqx6n4SQMETclMeUJWpT1KY1j221WVXJmyr592e7Ukmf0GL((Pf8Zf8uKrXKBNgtMxOY(TH0fuueun12IJgE6prpYYIcKGfvPm4TnW9SrsYdLNy)UQPAHbXZdWyq(P9(kRVwHbXtRqxSSPzQIkmtovNk6mMgA1cpxAZ(aEuWZeH5uDOhNsP0XB8WRG93i93QQJzV9zo4szvM6JvqeTLPEhtheEGMi62ZeSY5IEgpmgK0xKS31vTdcaCjS2YfybvAk7lIJpfKm018m6FeNtOsheGDoKyXYbCroFrVsyCheag0QPhIuTDl6z79KuDf9lVttLn179KWksMmKEgZUYtn0XrmjUhWG)7yzJxT3tAIYUzonrAzF9Epjzdz3KIXowAR27jzPkQSWga2Rslx8gtT2WI6Jv0Lr0uKyTpHQJ4pEC7YJ395f3S7MpE9hVA1(7VE5PfBUzXTB3F9YTypYrtSU6MnhFy7YVECX1FDXXhwVcVBCZpEC9HV7rq5E)vpSM0ZXVfpXtlwD3sWaSD)TloU5FBnNwGxzZ93V(WXn73T4XDBofFqBwUDXMv73D8JVgVL1lpD3IdRxT8bYdD8U9FzXX13E)6DNoYH36DlVE76B4Lg)TTB(06fpS(WkCb83pSE76FF5UvRxCAZ9RjbwEqUyZXfpS80H14vF8XhEy)HtRpW7y5b8mxCZ6RF8w(NhVBZ6T3Wb22Tyry1Yv3TUDsDIlER3TA)J7WnNUMfpSF)2flxTA9Xyw3WeiqWq6E1YhpTFX(hwVBXU1F54IVSz3n7)ch4lXDD8lBoT6UfyA)Pn3gNPRwUDDmEfFA)UtTlzCtQynRD5IRDXLRt3T5WnyED4efCCfFBhwIH9U9Nw3o0Jlu3TE5ny(Mx2UE5UJR3HV46hpDA)o(14R2cjq5P66pDA12nR(8P7oS)XBVlUWS6W617Ey)XHJw8fBoHXw8gpLg95bVc)1HL3VE1(T7p0NM8kzuQo)iDbmKpf)2gkz9QdBU9UjV6InDoXYezCISA7(JR7NeXx3Zoe5nw8E2hFiXvZdyD5bsqSImiVuWmQd7IhWAUmrCG7CnNE9VZhoSzh(mO2p1Ej7FGVUJDxt6TgPwwbIOBHy(fzQP)1hxNygV66dRx(zqHSltxDA51CASJxfz8ajq6xiPe4roIP6ID4)jUPYFaetNwUzhOmVBnNEXdttjJbOKwMLdhfacE929R(C6TKVYu0q6)6RxU6Z3I1)D3mCZt0U1XpOB)GHFqXj5d3T846(XXMJ8rM25kE6Cn(ZlkFYYeOT4ZuMFGrw34D1)a)YMBoDxSbPzPlzIHoU7u1lTkC9Ydfd)fl3IXeFCaYbVG)FBVVLLBBKM18zzw1xMF7FC)IJ4SGsIYwhlrPrG2E6j6OHbjHirlqagaGwwoC4NRz)5fBYVSkuOifeHSB5iolMU7qTejQSkKvEVYktD0KeAKH5O6R6sELA32s(jJKjMULP)aOEWOfd2Gd)cA2d(QDFJCN2fhBec4OP8Qr5(GNwJTOjHwRn9J43BuTV0MiJqjd8CHYNG2WK9GfeEBy(j(9D6omJj5zlleslGoga3jHSiRK1qg5t4XzNQivhv8SU4jmc2cSOwr(p1NhkyEcpSftftIbU9j8W2YytQZ3uwr4RD4zemmcUfDk793Y0q1LFkTI(Z8NWAWNXFpX9gWP8dT58er1IN)NbQ2sIQfsdtBAzhjBrMt2Ai0Sjzy7(2bzw1zt2F)OL8HmimAzk9jzZFWMvmRg57G7W8No7X)9zp7HSh5eUtPXXmOhDcL3CtDk9LVWSNVSDh5bAf03gFWwfVf1k1d5wPh6ckiRymBlff6t1U678KQ7AntXtYb76UhJVyfcL)hwNGYUUO6MKMT17PTAptLugk1QT1KN3h8o2(2HM8Pdx9ISdKjnNJ(m1K(5MTvP)v0zWa2BsMN(NJwS4YI6)8Kucu51)z26eYP1)epC9T3JnSEMoD8DhWvAA9F0DHw9BiRtCmqyVr3bOnie9is8GQd7ryaZgoBNDMnjlwKvSKV4ZpyzPrc)y846C37qMRn2ht(6apFpC3p1r0YD)KE(wU7Hw(7WDpWd3YD3pPEltU1JrORtS0li(XueMmRUSAw6ockN9ic(C)reucTnjFA5tb(INVkR57WwfEmPFEtYtswVP3JQD4GlQTByNJFcRh32356NaWD(USfHJnX3RMqHeINSMQvz7UWpiA)zshi2Qj7r2zp6HoYOeT5JGQYD5DBNUtRUhHrsjNONLHASg6Ml2EQKUlI9tHuGKNuxlI9b7BA5nz5P7gYMUhr4CdOB4iSfDY4rtFZBNC2RFZu(UEAJ0thDdDzjqWo8VI(WORV(SlVgcLnCqs4BgIWNXReY1POtU(DNDc7tfovo7aduhEf(uzGz4IlN8M3nz64Rf1ZDojwdndcKqahpv0vJoF0jNnHl0ibIULTfAlmoI1GiaErTGXHRULM4oF5HJcepKL2cfv)muGGScqpeJptBcsrrVz0fJMWnkwCzT4Uqessh81KQIlg96XCG)9XD0IR2pIRxoEjV66Zghnv0eHqUEaiBzYfcfghSdEe1DtKayoOG7Wv9nm9JF)LVvS65APGNTdqfIP3Nx9NF5XVLVG7oCpQdfjfdo)IW3RJiNGg5LLzWlXDBk66lF97gJ48gIASgABTOSzgiqUYTNjOoU6ey9sKScreKEl3v0qIgGC2eX)puUov7fy5BAGKXNlZn8cH9HvmCFu9J5ElhUKJIDHqriz3fFqRfVqUIQZLnBl58O2UWTgmeTnihBllXPrsZt7RLRhU5oMw8HmkQ4gGQuSBH8(2N4LqM3yjsZv8ol3TMG6nXlPVPJ0bzJeT3GUSdQsDm3Kz3EJhQxawwC4EXzg0Xci2BCXzds8bEOoijAFBmoEN9gdUzY9spCsbsAUjOGG79YGqf7sasae3qxKekiOnTeHmQfh(VbQ3sHOW)kW8U67me9bs4FrrKmqIrvH6k(UKQcYcO4SfMXs5T4UIYX9nMKcSTwitFrcm(lUEEvjz3Kk8L8xHWJglJRfzsvrAUkgBnqc4orCRP)yUPVqypUKHwdJDBbKpgldzgSXFnj4Je7LVr9H(bweo8IZMeF8LxC0OPXtp7IXaqJNC8Lm6o(ORhp6TNC5hOh5nJUEk(YpC2e6dIXow87MG)hp5NCw0OJoFC8LtyQZ4Rgnz85pgWU6nJIghPbTxF9LV7Q4lg92ZM8AZhBurxn(8Zh9URhfjupKw1eZrOSwyH)mSnmdw2pdVXZGjQZWrNmJft3urEJGiugZbOmwHUMbsSPJo78O4ZMC6LXtF30lV(SrNBX1Z6lF)4RhD(5NmA6OyIsDcVcNqsxJYlxIOSlXJFsgt5KIcIKyEQiiKLL3UgEYOpzNE51VESAwyKxFt)JIhi2HPm2d6ntH(X2OQPDyxrR3KVTweLmecD0KBd4dR(QQS667xMqEgLkICMjWutqIPriRjOw5Ga9tV84)SqL9pKnqfkkos8869FGDNkusnccC4P6TBk3iMclEkqluKNcu1zWu4Wtb5(ipfMH6tHTH2PTTZC46Y1ulXC8(KvvjmK855a5SfMdsMG41iKNdCeP4xT2zk0oOU9MbCF2DfZWhUVyo7N8eXBbzAmMadg62m0nuWUf34oeupp9Vt3wK2h6Xqd9)qi7neK5n4mgWUcucW2k4A9iW1VF4gI02GH7)5SYTvfFzxAglbYgPOaaUjdCxdBnK9mXJBPDYJ7ojiTHnXrXttYO6MQ)R)VRtketJH4fqIYv7PMY9utEA2HSr)KlF8P5ITvBwDF9n5j39WD2N800EYNp(8mMCBEvdo2poe18Ky(DnjDNuwXM5zlE8ZhR)dePo5tcrrTNahzunX4VO1210TIZQ7hrj0IKMKy(SqJjFSWthczwMq2BKPn)tl(NSSm(9QrESqKJCBirIcb47prTR9dFGG8PIAASahIkF4CKG90KITBepgUNaWKGUdcI9cqOFu)qbBpJWDdwuOmwrHYqffkdvvOLD75YfJi(aP3No6DN3c0YTnIW8m5YjJX5aQfMO)OC73(4OQ0V9XMv0poIEj)FWadiHhpUvgO7i1EoroHQtkYrTMSfh2h5A)64AsCfq3vP4qzJVBvkM6Ri13)bTfMuHdVvA5bWenKNxXjFQmBboMxTJSvfSa(edtRwEp)r3KxEN2hvLwtsfOnhHww(8MXzuJrs2MSOSinEDwHGlr7eGItMLLtut8afMZ0usmkKlMs7MiDPy(qADWEiVTkjMiDMFBQgvZoKKpoP7dpVqWxSq9OSHHaDBG(nIG9Z1GSYN)nu3c5FZWeDUUJ4BvIRL65c5Nd3hbYys8zwOSmi)mucefpNzGP83SnzOyAJRzR45GPZIXIoCdphMOEOkgbAV1QvGN8Z88fckSWL(u8B4odXWZIVBk8N5fqQ(KRa5Be3tjeZlkDtYvQNySCwDkwZi1eTAHSr7AjWXP99imu8EG8Ar8zOKQ3UQKVBwiJHf)gQyNsCQTcBqIm5VfPUTCErZKxHRSLqbon3U(CvRLwOyzihlTTzO(nh1kiu8BoOvTkwF(bTqM2QLqrHDX97tT(KFgN(LI513OBf43EK07AWVgPz09YZogvwucv6kYToe01p)xN(cCTNm5m0oqDzi8aTDg5Ar0rxoD6LxCn7T3osjjzUHgnPRzjVlsjk)0y5sy6XxEKqyljwKS4TMS)SjTcXTDMmtkePtcX0rFzsXIKkr4NbBXEjGIk)PSy)CgrJ(BFmAvjBDMwOVp74lNe9NNn59XFinzdX(EeXuBSZLJIt3UOXfFkRQSajHY3(4VEAcoiJL)wVqJxeXxKSmBE8Pq2sAfEE98WcDnp(ubJIMtIIwscwjvmz3s))F9kshFgHY(nXutE0jSQSnJGC6z9CsfPR4rxqJyXw3hhT9MBkH0e9K4YT3xVMSLBtp0R3OQ5KY34lYkwCbF6B3RNYxE9b0SQhbIa9hTfz4YPqfkEWOnzvzn6PhMFpG88KpLC4x5RxDFzoocW3xMtl4s9mjlOhigLNTo9WG8ysLfungFvzwnrXyyPN3zOdmka8PvL1nZkZbyViRQQS6BF8mqPl2yr5tEVCrtKr8ySVP8oqFrQBHbdaaKNWF7Jt5qF2nEB7DYrnuJbys(OZZ(Ky4LRNrJM46i3hj(6wAkplRDV0pWSJhJGmAvczkY(KJQmzdvN)a5SEt6S8YY10Goc))2vkUMD7KvBIv5fe)F6JtrCxz1IyJDtktloYu8OpBzblR6BFKy1s)L6V9Xt3wJ17usMXTk0exkh39kbqsrnef1PiISGO1ZHHn0cEX3(44wu1(aI8wXWXyNIzJLpQnWmC4rFpbfgw7TeqRevSccuJ0hAwXiFDEYISeYSs8gCwrnzRBwYdbbQ2qIsavlkex5AbiG)hj5q(w2n7lGB0cYCMhC2Eio3Xj8WIR5rjoOgTvN7dxDhLSyzpVD4cNZJ3uF8(pC8JxtMUS(HaaxQtgawAaWp8Ha4I0fqW7d3CSq3Sti12UJsXqIFoUKCg(BFS8MV9XtsQU9BF8dRYQXrM8GLckUloYeQVJyjW0ssFxwGLXRjl6EaEaDQA5q7iwdmfPVmnusXvfZtEv5DPvIvZ)7K8VKK95h(2Gisk6kEkqHwpidQpqcWRQ3q2S)GLpIoOGmXsrJIkqLG98TKS68uIgpQCB((J1dfDcBrhpPdd6iUX9rxx2mVI0WIr)EIsVK0MEczWWdwbOcrj3ic7WcOegP4s(2hFdYbZf9qhykYwFBdnCVNa3F8QmmDaRX(HC92I06(id8fHGPJwe8jmi(6uCJpSCELj)Fg0)k(nZxzAX)4Rek99KpBPYzk62SwtqKc)C44DpXULs1mev4a5w8YvnARWlqgzwbLZj6s9rNtM1yyRrP6jPuPLiFD)o8s88eiQ5dj3pN8KPHzm2IGNaQqE4m4D03gT(r3gT1iMTde2cDnzhHq90uYsU06hqiAHiEBj6DfTuW42viEjFd5MvZkiQvypNsXsG4Q71jEnWsU1DeX2wVjRNTCsYiU3eyCT0T(OCvOtVfXoh(0fmcDylIfUuYqULu2g9Ulp5oLPnxzco8w1jPZlRseQPaLXP5WjqXcNhoBzNHc(Mo(UDeROtPCy4pUchKl2kiZYsiQTtRswUwkqIhppbM6Vabp)VawAWp0x)fWyaA5R3skf4xGR3o7EbGjhATKxYhLrg(CrUrayMp04WW9S5SPilWBazcEDrsvAhtSWGAh1Qg9XUoGtARpmWF36zvP513UnNn7Guhqge2cDPUEhxDCIHI921H4rpm4Ji1DRFXyiNNv7wIt(GzU5bZq3tbDAxiSdJ7A54naMzrPu82vBryDOD4K7BPyCTK3ee)UvVPDlIh9Wn7ba)fjfzZHoYS0BO3defAw9cgjd5GoI9qVwAfuIhTdhGyN0J3a3uH4RJ3wvXMSpvsZWJNNGoUvCETAeJ2HdG4jVzYyB7P9aIMuWx1O4MSdf3Q6o2vuUh0P2nha5827RsU92eSRgrSR8emULD1aUQd4R4wj)QDT1GVR)aWNaQCV9KSTvf8eD8QsHbSMCTOhtGYol6JCTuId8mgIRA89PTAgl)uIqMkSa0puuwfuSRO0T5ibm97HMda4pOi2jUvgTqAjeSuIHZGVJH1YXshX7oePd5pzt6nWShM5sGqWfvtSUv8QO8m)tyh1txmMsvVhkqGHdsZ)3BzRLylGWfYjT1EtmAg8(D7Ni)ZeGhDpVWbKUFrzt7gAsX8MSBYMtOFLczhMHYnqtwtNqyt(S7pm8pDBvw5wc3CnPD9grSq6SqqiO0TJF1XWWPtGaAf1hg8VPCDAEsXca)myyzzvrRHGM(mQ3ZOd3eg0U4r)R3FantFGmxUEo0P(HvPn1nLfPTIAqVHIbUP((AOobPN7HH(O88xmLW(R3XIXALlvcctVwovukKKEeD0w(e0HEN0IVqgc(Rox9BpjJBe5i5FotaG4B4Xh3KLw58Y)EZsEcTvtOdINjhHe2gd2PRVZzkvoY9MdfBmXEekdv0m2rEHj0)k(97l3sOEYu8BEAtzkbH41CgsH5Wv9E4cxIKB7oMUHdP99uMJgm0ttYkyBLjQxbpxOj6I78e0PagPwKINlWWXAaEUTnjmuVGSulz96sylCuxmgeKTTS0OVCQ8FbogoKaP2qnXgRjSmbtMYXsHkaVaf(Xhv0Xwva2wEwdjqkt4ezA1gwbmSNqs2IrZqVLLgfKDtLkyuW9hY9Rt(7KQTBl(xK1jK4Ue5lstRZtwIwoVVkKzw2EMMQLpkuXdisAu9k4fHIPB86zK70KJq)(MQY5)UsJMu6KVk4AMOhpPMPquMGhyMMppnpTsQpJeWUyzEIe(8Wz4R4WnihGDugH6IIi7akJZtrulZ2Ugbvyo5senNf7tO63XrJ6GRUUNHmh61z3iDO9Dv1KZxW54w)1KaGNbvKPrp)UBZWX2EG9IZwwKYQhonV8UDLWk9CX3vF179Zy171jILpEBEgcDr1g4WtWrvjQ4kXKstjllsfBaIXZW3xNak45NakOtbNTtlbQdq(dS(NaHLRtG1UJxIjyfj0UtfxOOgge2jOa(njbVf(RbuXDeTGlZZAd2107YerE43RsjHsfcwnuHmTePzrhpnQ(fA(6nKmJZttUrBByuX8mwYePj53rko97)MY9gre6c68hgnMqLVzgOvHoK)QZUNTiiFJogJ7LTIyvhOXr3Qc9RtjtcitIn)oI9uR1KrR2NLoqf5it6fQt4nQujdSNCmPRuyOePKOvOQPWoVGw(yKGHDsI8TShqq0vKBEKDy4ekoUkzMaSO7JkcOyqhpmxvLuMNAAmKYMRY2icCmYbIfqHgTZIihIT1ESl4Yh1ueXrPVOAB2I4zeQD12LXZYtMF7DRipdAnnjOtyGBBa6jcJqxu(1o8sD6kY4Z5jK3Pe9(X5j3bQVKY0wIptu6u45WVZeRoj(4eBdDhqGW7tUnPE1)ssNloxM0fAKhIchvGMkfdVNjvkYXZtqOoNQ5ZaNQkYmwI64QYODp0Mi60O46mKdn3)llsyt3YZQ5mYsezzCk9aWMARCxnZE8DchYBa47YSKk2YqHO)wRE8LnlNoJ19ccdEEmkbMcVTo9b2Le25Qn3PP1e7pKpzSz)crliXQq4FpnxfcEX5he609U4eOc5jUH0dfrVZiUGIfP1Z5D2XKenoZs5iqG2TOyJOtMaP3YtXe45p0o8rP5Lv)sf9ZAfJW2cj8XWzWRXhts1F2vQh2fEmhBl3NlSVBGNO(xPzDULA57AXfUObSFUknz9Smuyhi0Z58HXwEJa9igppbHAY5CBLb55G(I5qkqAsMNFF9AeKp8gareh1U(j(vXjA351npL6AOgmiFvWRr2fJMKQCXLitCQ1MEYYVQPMgfh)NfnkRtQB(U0OKNb9jjlj3oXLdQvfIPHvNbFUQGGfAzr(XnGkKS1PVy6QS0B4tze7JIxDXGfqxZb9qp3)rAO2tXesMAn0AWZcA93bE93BpcDUzCiMlnJcCvI4rmkdgkcZJ2UCB19ASOxvr7m5QGCgyltRcpTPWZ5NYu4RBAJ3ZcgdxxWVlcX08B4S6uCbB7Odd001z15wgcK0GrrwW81Qw22uK7bgD(1B5gOImnB6HXqITtMdDzipSKjs694(k2z7ISu9PfVouoVLRA0RUhcJgTj7woqPIAZZDPkrhCkgiHVPM7sUg6kPhkYkxMC7kYYr(axFDbjAIdnuNIztzfJYsdV70j7ZAqnNhxMSCBUi4qVoTiTobHaRtZSSMsRz9pNK5sNxqL9FaQAIeEzYArSQ)ePEgbEAtRVrwbY64MJ263Z65XgjRaPmgtTaZzQcSLlAgoUdiE84QTW5iwd38KQpjdLmQBwEI0LW0u7yXcvsW8mcdmhkAbiW6cg()ZKLStsNjnBbnwbFzXr1VlWwEbkNT9SqMfmKIzOQ4Mm4UTiTSojRUf5ZJxmdDCTw2QdL8FM)2OmkD3(UBBAQ5zVPkSnO)675oGo6j3VElNXvVROk5tPIZVnQ1gpmErYLzOzePT5ZUrKMQmoIm8Y1Y6z(eCnv5JeaVt4Zc4H83azjJBNd3o4570dqYvlrqoAtHN5Z5buiL2z5QFqX2)mMbLACIdqfSgxI92WEOqTNs7cls4dwCAPmunYrkGTIF2LBJyA8ZUdOq760BW2kt6pA5YQ066SYo252IQUID21nqPegvcv3HyYEdeXvlpwu2uGfzZ7sYh5lGIj2j0r5gi)k6pGL8r3JBdbjJawYFuv6DitN6Wq(ckivUy5GkWHYiQqF07Rhiyc4063W(jCBs1I7lyJ7LZapEXmOyI5EeN2RarpnWRq2Ymz4YgrA2QY4ZlDU6LWuMGSQ01cEOPcRdY)wxVbu6Fm7kfXnFhmjknt6PPyOcGB3rdzRsObboCiGJT4fCw((LSBH5rFi5ZABbYjqPqg9WdLbfI25ZaM8xUwQuJZonqjDs6NkLj5fA)qYPqPvMmJiWrFpWDaj1rBRsVLq8)FstYlBAtIvHItIkVTiT619oe61fUIqF3HmR79L4ODVI416oHa5afG2xJcvL9umcCqk01BqYyY8WhxDFDdN9eDBaTuObDZGTYB2NtMSWosiRqlLzlMOjZ8DiLymjHqyXRCSIKUwJfoqfqA0AOdSgYKxYiR5Ic9dmjnP6fjV4AYhfupDWb72ElfKatmDD8ZOYf)ZGCvLVzoClAt52LzOHB4qut5KpuZL5bIWByPZPKlBsdxuPDgHXcDD2zdFasQPK1PZjRG5J1AkU1GRLoXlhUyc6yP9DvAnrtf0iyqJSlwkdvy0QeKEQCOs6YQcFzlGXvtQHz4Z22GaaIPyhMADnZMdLcRhNMuNMt6mPL(DjvRxI04OtUDBBSPt9mPWBNjyOtXN0dSy7CzEJtsvfj9D3m4klk0D6Nr)yt5SJH7GZW1PRlskA6YR8c(2EYgVWdxmbDS2(HkMpEj45)utMlrii4RBImC)KyA0pbf3ncdnfOQZYNLamyW2YQ4Boa0AwoNR90kPhImD20TJD2mWtx4Nz4qr1Ewkb(c218088BkRKh)QC0c43PB2lW08FS0PhipYTJzgfg7U8So0COtivO6560Knc5RCciMOo2mPtHUDmZKL36uPwdPaAuvYlEBsfc3sY8zvLLD8awsLpQCtdTY5qBDO7ouaraNvEz1cS2hTTzvzLMSilPh5UD2xheOu(4geI2FWaKpRWfsAHuykT8VLitLwzlgVyg60q76SJgARHcPqu2TefeRBdxEbiVyuvT2zGl3c60qheAOThhemes6AYb2cwA9BiUlCfE2(LVK2ANDqBClC7m02XYtxLGLXaVdNYx3IJsxLIC9rKsMPD(IGa8Z3ojdnSKTZZhwc1FjXmyQXQz4(Z4DWs3xnZDSfByB55ZsqpKRTYJKaqmfDSZ2Dh(TWPUHmvLCdzDzvYTSQZQfAUdkrqoDW20A3n5HC1mHyd(FTnnL3gUa3o1gzcNJyxkfv3LwAO276QDUidb)l3SHDX8teM5YQ2leLkTOexcrtpDnYDUBgImwCaHPVHu1lUfb3ke2nA(8QwX184fZqhVSVJV5ouPdTdF79K1kvLsrP0VrVoAY7K7VTSY0gGBxY4YLt)HYozryIEXB44)YSd33g0i(ULZWxDb6qFEuHJ8rhsFi5DNKLSM0NjsMis3W8sjgsoAXTd0O7fWkqjUJFKHIBu0CeCtP5DjGTRAzzttxuYLhaMkR04ojRz4obICiTYBBkxNWoKCAzzZmrSi1cePqKQkX0qECfARLHGdE9f2wiV6fJwN2SICRsLEGsJIu5KgHIO)PloTeRYqPp5vPv3KTqKvXxvv(3PWSLwRwSeXfHRwLTLO))gvaMKCTY4FBPYR6KKMeUoxkR)rXiFp5JFC)AD4DIBm4FfHBNo94KSVOOr)b9x89ohFEr6NjaZf0WwWTb1ZIhaRoam(8trnVajZsQOwuW1hKfj3)xrKJ(rI6EsCbkr9j81GVC(I2ckX(qvCHiINxwMJkhsBByaxAk0Deq95y76crn5hLSJnTfIQUc6jIyBKQ8ufTi9M0ciY5fOHciGhkjxIFRu(LI)Q7zv1NruLjB47m9(pcU7LW5XDQmyT13d8wExrx5YyVvXmTzEwpZ7SUzDwVZ5m1m2K1KN22ZawNglROT0W0lqX7Hq5rIsTzMQCKuwKFpr6uNTauqO0emNbR8ZJzSTO0giRKn7VlDtwEJSENM1KUgVayzGFNJqXJ9MIhOTEN07R6HWEhHstA5DlMlUwn7I549fzJajVKl2PmDx8kbxLi5X51qbt)gRkJkTte5C98yYVru8te14bmLp4XrbtHCdhfMhUgTigapy5OM1wgwWrJIsJaxPwQ7(8LPR5ydvhJcOHgu4nluIzqPUCXM6ExVIcH0SoXcO6s00UZGCBlE3QKJghUyfwHlj3(vR1DzZB5TBPpIjC0el0jjfLKOvY44SGMRkuOlQAxbYMtcEiA)GTcOTuiT((MvzeAABXs0ttyq6JTnsu3(cWsZPrNkkzsXI(JHQlTGNVTUjJpSe442vADxhkHRQgrRlxukQEGBNfN00uLnBBJOnBapm(ckyP5rfjB4QKd)m8JugJz7andbU6CHfaTbX7ZTajR(CfRzDb3wyeLLdWrvlQqHOqGiAsmCPJIwKP8IC3fOSXGqmHRffvP7)RtFbzJpAN(ONiXn3kzby9ZOXLHggg5kgAhVoUTTfI7qPW0Wd3viB)axubzKJbDvbx6tOX4I6GPOTXjQHU1L5LIPeRRpZRhKdgggyCYkhDtBPh5)MGMnLp73bA267gndJ)qZZZ0XpSTbv3IMTdiFQdrxElOR24(8GMTpeA2Qp08HWyTyOoKxZJVVyDO9LFy6y0c94UEVpA3(oDLRNaBF0nI9rFDZt2fHfiy0Y5rXjm0WhTCR26Q(kUrT7tgCAeYLVcpvpS6PJG7KqbjSs1i4Pnm)3Mg)Bl3V9rZWxzy)kdZVoAEt2NivpISG6v4B8mEzOSYI0ZaEDAZXRq4BjzFhtYfZtH(4ZkUP8x)n2F1If)lfWWzPZPutpa6cOcjs2FPUSymschsYxfF25F9BFeMKloMp2TuP6kC1KwkkAmjnYVIZFhL)RvBlEjxft7Boz0Yjc52NMvKvVkDbw308juPnRefO5QKAYPS)dcIvBt5Yx)UaZ6vUHF9)a)ds9vaZ)N07UeE0aX)GQXtFdJFVNIz4yrjOt9A)suTD6BihrlQt47XNe3ClcysozaB(R4)2N)5BZ(LBt4ZsHreQJOG)Y2qE9Vq0hBK5y145Rkr3jlyNPn4voEVY16WR0WEhYtCLoQy7SF5lP32m8sdAQ3DISELT1xLLH2RoF0Fm(64Zhp69JzyHsmiOgk(2hXw5tBnC4fG5ElaBZxz5FyKJPvVJ5PID(usr5N)8ta3yV30yrUU5(1lluCOxqIXqgL18R)gxgG67XLOYl(JPV5SJp5DtE94lNehnD01t5vqDAdydRPv46KBtBTBuWPatTzgLBiddt5NFrkzmhxRWGrGlRs2Sc(8spJPGpJ5xiUurDqV5(nP6FR(uC3Q0Iyuwav8I8Zi9CtyjjeVT3kGNyz1ntF(7EcETViDbU2TKPFkrk6ZYJkpG)wux0K1g4S1I1xOb)n8pA3tfBOKYmin8a7LQh7SfqSjxIunD7F76nJo)8X0Uu8fxEY42nkSkQyrHPq(ltk2j8uAP6lfDa89bQH7xhJ0sJM5(aox5L6Bq99W7m3MgG8boTvlxHVu4B3oaZ05voo9OiYXW8L2ECdLT3r8DPjY0JpprJEH0pxvrwM9pP)y6ISS6bAwdRmYYU3XDqXywo9oMbfJ5X)81PPFbvLRxNTm5ljB4p7YnPIQAYR4lFy5ILC4AT2NuhbSlyGfNxVJ5jU4IUlz9MB46j1bww7t3d1XodSSc6DmpXL1jPRrDZJV13NST8GlUD5k8FLR7RCmo8IZ2O3X8exChLrCax8YlF5f0)o6LhAXzBU3e54)kJWhvZKTvppEW)Fnt)e1m5PRzQ3DX90jrU2WfpRE3O(hPtY2zFGs2sgmGojB3Eh0pMoj05qSC(3gHT2D7y2VZroKZrCYLJgbspJ47uNuiNaN9cPFU6KqV0ONjvwzyzQQ4KBqahzInXmwwmpF7cKjeOFY0ZWjylkrg8I)6ue0A6VzPrJa0gLNdznP1NqKvVKlqw9(U)JPAeTxKDHMXtYpn4s((JZ0(Wssr0q6zmpvTpLBZFbAqvZeO2XZlFXjC2)mk)xwKuKX1XQDNaKtjd49OJxVJ5jUOMMKS6xMbYgU0Um6xUl5l)9JU82N(hoRo0YlO3X8exEJ(cT9X1fMhzfTpjTP1RCEuvo6hxelTE)tlIJql3eRqKt4Ju4MSQAUc(gjku6IOgPfNyKZQFogjy18gWMyUFWNfngBrHP3kaMvRn6UMVgoLNcPseIzElxiMBxT6hHH(c(roIJUdktfy8RhD2j7Ga4xm6DDOiPZhL3I4QY82gbTEm0vrqx2YY2RrJi)73ME)FfXLV92Z54Yz4WepUTFBXOnoO4rIk4O0pPeC9qpRybjrEXweKJRy41c3lPDO2IRnd(UjwFAI2oBkEbXYO)jAuUc244YXL6Kqh9cKj8GLZMk2BYU7IG84V()b",
  version = "1.1",
  author = "NoobTaco",
  dateCreated = "2026-01-06"
}

-- Helper function to get all available profiles
function addon.GetAvailableProfiles()
  local profiles = {}
  for key, profile in pairs(addon.AddonProfiles) do
    if type(profile) == "table" and profile.name then
      table.insert(profiles, profile)
    end
  end
  return profiles
end

-- Helper function to get a specific profile by name
function addon.GetProfile(profileName)
  return addon.AddonProfiles[profileName]
end

-- Apply all available addon profiles at once (excluding Edit Mode)
function addon.ApplyAllProfiles()
  local profiles = addon.GetAvailableProfiles()
  local appliedCount = 0

  for _, profile in ipairs(profiles) do
    -- Skip Edit Mode as it requires manual steps
    if profile.name ~= "EditMode" and profile.applyFunction then
      -- Only apply if the addon is loaded
      local addonLoaded = false
      if profile.name == "XIV_Databar" then
        addonLoaded = C_AddOns.IsAddOnLoaded("XIV_Databar") or
            C_AddOns.IsAddOnLoaded("XIV_Databar_Continued") or
            C_AddOns.IsAddOnLoaded("XIV_Databar-Continued") or
            C_AddOns.IsAddOnLoaded("XIV_Databar_Continued_Mainline") or
            C_AddOns.IsAddOnLoaded("XIV_DataBar")
      else
        addonLoaded = C_AddOns.IsAddOnLoaded(profile.name)
      end

      if addonLoaded then
        profile.applyFunction(true) -- Pass true for isBulk
        appliedCount = appliedCount + 1
      end
    end
  end

  if appliedCount > 0 then
    addon:Print("|chighlight|NoobTacoUI|r: Successfully applied |csuccess|" .. appliedCount .. "|r addon profiles.")

    -- Show a single consolidated reload prompt
    StaticPopupDialogs["NOOBTACOUI_RELOAD_UI_BULK"] = {
      text = "Multiple addon profiles applied.\nA reload is required for all changes to take effect.\nReload now?",
      button1 = "Yes",
      button2 = "No",
      OnAccept = function()
        ReloadUI()
      end,
      timeout = 0,
      whileDead = true,
      hideOnEscape = true,
      preferredIndex = 3,
    }
    StaticPopup_Show("NOOBTACOUI_RELOAD_UI_BULK")
  else
    addon:Print("|chighlight|NoobTacoUI|r: No loaded addon profiles found to apply.")
  end
end
