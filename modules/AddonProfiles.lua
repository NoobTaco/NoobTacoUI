-- NoobTacoUI Addon Integration Profiles
-- Pre-configured profile strings for compatible addons

local addonName, addon = ...

-- Profile storage table
addon.AddonProfiles = addon.AddonProfiles or {}

-- Default WoW UI Edit Mode Profile
-- Optimized for NoobTacoUI aesthetic
-- Version: 1.0
-- Last Updated: 2026-01-23


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
    local profileString = addon.AddonProfiles.EditMode.profileString
    local clientName = "Midnight (12.0+)"


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
  profileString =
  "2 50 0 0 0 4 4 UIParent 0.0 -480.0 -1 ##$$%/&$'%)$+$,$ 0 1 0 6 0 MainActionBar 0.0 4.0 -1 ##$$%/&$'%(#,$ 0 2 0 8 2 MultiBarBottomLeft 0.0 4.0 -1 ##$$%/&$'%(#,$ 0 3 0 7 7 UIParent 240.0 42.0 -1 ##$&%/&$'%(#,$ 0 4 0 0 0 UIParent 771.4 -335.5 -1 ##$$%/&$'%(#,$ 0 5 0 0 0 UIParent 771.4 -304.5 -1 ##$$%/&$'%(#,$ 0 6 0 0 0 UIParent 771.4 -273.5 -1 ##$$%/&$'%(#,$ 0 7 0 0 0 UIParent 771.4 -242.5 -1 ##$$%/&$'%(#,$ 0 10 0 7 7 UIParent -365.6 44.0 -1 ##$$&&'% 0 11 0 7 7 UIParent -814.9 262.0 -1 ##$$&''%,# 0 12 0 1 1 UIParent -393.0 -962.0 -1 ##$$&('% 1 -1 0 0 0 UIParent 837.2 -903.3 -1 #%$#%# 2 -1 0 2 2 UIParent 0.0 0.0 -1 ##$#%( 3 0 0 1 1 UIParent -258.0 -797.0 -1 $#3# 3 1 0 0 0 UIParent 1102.0 -797.0 -1 %$3# 3 2 0 1 1 UIParent 546.5 -729.5 -1 %#&#3# 3 3 0 0 0 UIParent 502.0 -422.0 -1 '$(#)#-;.=/#1#3#5$6-7-7$ 3 4 0 0 0 UIParent 12.0 -494.0 -1 ,%-#.//#0#1$2(5$6(7-7$ 3 5 0 2 2 UIParent -296.4 -242.4 -1 &$*#3' 3 6 0 2 2 UIParent -2.0 -275.0 -1 -#.#/#4&5#6(7-7$ 3 7 0 2 8 PlayerFrame -16.0 17.0 -1 3# 4 -1 0 7 7 UIParent 0.0 402.0 -1 # 5 -1 0 7 7 UIParent 247.0 362.0 -1 # 6 0 1 2 0 MinimapCluster -10.0 -10.0 -1 ##$#%#&.(()( 6 1 0 0 0 UIParent 623.0 -472.0 -1 ##$$%#'((()(-$ 6 2 0 2 8 PlayerFrame -20.0 14.0 -1 ##$#%#&*(()(+#,-,$ 7 -1 0 1 1 UIParent 7.0 -162.0 -1 # 8 -1 0 4 4 UIParent -715.5 -394.0 -1 #'$4%$&e 9 -1 0 7 7 UIParent -242.0 62.0 -1 # 10 -1 1 0 0 UIParent 16.0 -116.0 -1 # 11 -1 0 1 1 UIParent 533.0 -682.0 -1 # 12 -1 0 2 8 MinimapCluster 0.0 -4.0 -1 #7$#%# 13 -1 0 1 1 UIParent -930.3 -2.0 -1 ##$#%&&, 14 -1 0 7 7 UIParent -515.2 1041.6 -1 ##$#%$ 15 0 0 0 0 UIParent 674.5 -2.5 -1 # 15 1 0 0 0 UIParent 674.5 -18.5 -1 # 16 -1 0 7 7 UIParent -220.0 62.0 -1 #( 17 -1 1 1 1 UIParent 0.0 -100.0 -1 ## 18 -1 1 5 5 UIParent 0.0 0.0 -1 #- 19 -1 0 4 4 UIParent 0.0 415.8 -1 ## 20 0 0 4 4 UIParent 0.0 -306.5 -1 ##$)%$&(''(-($)#+$,$-$ 20 1 0 1 7 UIParent 0.0 206.0 -1 ##$/%$&&''(-($)#+$,$-$ 20 2 0 1 1 UIParent 0.0 -752.0 -1 ##$$%$&'''(-($)$+$,$-$ 20 3 0 8 2 PlayerFrame -20.0 -12.0 -1 #$$$%#&''#(-($)$*#+$,$-$.P 21 -1 0 1 1 UIParent -280.0 -942.0 -1 #$$# 22 0 0 7 7 UIParent 240.0 322.0 -1 #$$$%$&('((#)U*$+$,$-#.#/U0% 22 1 0 7 7 UIParent 0.0 762.0 -1 &('()U*#+$ 22 2 0 1 1 UIParent 0.0 -182.0 -1 &('()U*#+$ 22 3 0 7 7 UIParent 0.0 822.0 -1 &('()U*#+$ 23 -1 0 4 4 UIParent 808.0 -420.0 -1 ##$#%$&#'j(#)U+$,$-/.&/#",
  version = "1.9",
  author = "NoobTaco",
  dateCreated = "2026-02-23"
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
    local importedTable
    local err

    -- Try OldImportProfile first (returns table)
    if BBF.OldImportProfile then
      importedTable, err = BBF.OldImportProfile(profileString, "fullProfile")
    end

    if importedTable and type(importedTable) == "table" then
      -- Mirror BBF's internal hard-apply logic (wipe and copy)
      if not BetterBlizzFramesDB or type(BetterBlizzFramesDB) ~= "table" then
        BetterBlizzFramesDB = {}
      end
      for k in pairs(BetterBlizzFramesDB) do BetterBlizzFramesDB[k] = nil end
      for k, v in pairs(importedTable) do
        BetterBlizzFramesDB[k] = v
      end
    else
      -- Fallback to standard ImportProfile (usually returns boolean/true)
      local success, importErr = BBF.ImportProfile(profileString)
      if not success then
        if not isBulk then
          addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: Error importing BBF profile: " ..
            tostring(importErr or err or "Unknown error"))
        end
        return
      end
      -- BBF.ImportProfile merges internally, no assignment needed
    end

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
  "!BBF9P1ZVTXX1FXq3MKg4cjkr9tNVL5hiPbfrWswYskxSjPOePTejd)HvCVyUI7qUB8YDNm7sllF5lQZ9IGc0Bf5Gpu0l9Ib63tFpeOBfOO1qxAovuiu0J9a)lOV3mZo7S7shDqsy3LZ(M37Z7Z7Z7nmZhvY0iW4BYm(cgTUXiI)b2m)GEVO)y)aVrL9mj07(PFAHkUbewbXfl0hUAHtjoENvWIWiRx4acXPWagHuiWdURBGr)GcJifU7PEM2doNM)Rgtgt6ypIWoXG5A7oe))RtxjWGnKeuX1b)BXXmJdy2extNZ7rxm19Q4sgb349SSnjDDTdoGb2BthJZjS2e4TA2I47nM1NynHsckB4huYGDITzG1FJoNy1k7nIc2gUA9UAOJH5j2UDyg9FmH1Jol17mcRSNJhRs9kTo8H3lB2mzPf67y47ZV8bEGhOfHooWiW2ZTd5PbJzKE0vgG3WKuA8Gbhy7aUQso2p7zgmZE0f43dTMtny1aZ8lA65NrZcB33WHKLox0BVDNIhEyLw3R51U56BVzw5FOZJBCUjaBJtncoecaw0zjOBPkXWjWI)PVx2mGvNJYDmfp13JDAr3(wESn70OjnF0UPd3LWd6w05sfIGLESpPHlPPYWSO5D9A6Xcyg2bnTFkXPKhZKW4wHXPoKs2d3NCk4f87DfFFJEA0o97rZRCeLeoc5gFEW)BB4uZ10UVrGh7HO)j0(Lpo3UaJKYSD5rV2uIJtntWWxmePc2NVcw437IOnuT9x(T(dVieTPhKGiVJna3PljUxTruy3ziEhODdMDuC5OU1l26rnBCcgBYEZ1VLiYG)7EzVWJcgkaFz(nC7rNtdsuH7B6rxt8sk6AYJIv9y2pdtwCo0G(M057Bz4omczFaClinOppwR8oTT8oRTbfVreSeFCfyC1(sxmMYYgtdqFTiw37YX6RoD2MEuQTR)N2MmYUKNJjDPyUDEesgMey8oEDkA(LGhFeXnObeNjbpmdy6XnsoeNEJ4B32JmCC4XoXc(EudwW5TmSn5gujiwmK5n218ydxdbsotMmOZD7eObEo91U(lnGfRZ5uc4(EB6QI32unWlzepkXTbfZA9TEULHFBJNqWStTC(snQ)OJRDy1o8G7E8G7284mMoPEUA1BxSETopK)uBXnWDZsxiMNTX4ahBxsP6nQxHoVPb7XhdCMhIHjppNaBkKjPyK09CaEd4NaRe2M4cXFJToSeqfLnlD2bYSFfjgqAPisQsShAfKNUqIekH)(s0BDILDabr8lsxJ8uJruhsb86f(SBv4NBsCibeG3(twSKlyQ01QiFKIPFe6plbCvWabCCkG48q827SJuu78cltm4mskJZAsuEAXXM2EaY2pGVwQNrWXdUMrgpvqVWFJsMM3JUGpKu0ertASlqSnXRsI7wEGHj5y7(mVJjUJR80(eAWNJ2qpAohpF)gdkdoEMNJ85xif5Erhhla5WTQkoGhLBoyegEAKKUXPFjbIIpHOQTKBa(iOBOL3zfhbW8aGJtabItsmhvBJi59Y79eOgNLnXXuNIlbjpFvvfCsIRMtN(vU1(GxxkOE5evs4n0nxHN4iIV)X2GfrSaJrZWfyXvORoLkJks3veM)uV3SsYd(wtusyw9DR4sYKOwXb89cF0OGJfD(KS)queZ)dnA9QZ08MSX2MfDoZ4CFKXf9MEGdFPPO9aPRSOFyCYUImOGiwALdlBaHpg8jtefKrxfZQ0mI4VaiFFGVW07m3hytacibib4TE3raKiuVd8r5V8MgGIgB3sh2tOvOyitsvVG7to3AsuXBeScfpxors8dmCglk8mjK0cdVJmacRCkgUsdL54TA75yBEjVsKDFbQ0IUQW5hPtQSQsfOElP(JPiNsOuiLYVRI(Oh3O(9VxgHYO9GAttRi5zG0eF0tayzqdqC5ftTiPqMuRwynGRI4vLqIOsqXGkIO3utjMKWSazsHEv5YaERBKGTEF4jQX8C3)md2GEtCidn6Foh)Hw(VdEHCcZ2GpdFTbbEUW1Trh4V(0sn60PXXV5R(63U6Dh9B)RF3mZK5DQE3F5N8X)ZzM5nsd2f(IBWiMJ7tQykGfTboEoWPOd1cQW8XjDvvHuBhm9MeDnOe1NLjlKJI4U9zgd9CpW5CufjVUJkX()B5347)Gp6v7FvB7HUf8guOKrqGd59TnXBC1WX2oMfaq5ikyalcp3H8RuwEf68(YpxGfPGFFa(pKapgD(2AxVT46qHe9h(X2Sr2(qdl4ZVySNxDlAoqljB0z2UXScAU2QlhAkxeU42m(ZCr4kIbVL)XZ97HDjn)jaieVOrb4)cSoVaW6CoUBHh4T(F)74ZmhNROqtgbcp8eb4(W9woJ7i8(5WfCGhSHuVBCbG7cEBpxpMdG4kiOFqBD2QQlkYWEoXfD9et4UpVI8)rMLyGtb4)vpJ(Utl1yFBFe)xEFOOdtvViKh4vFfn3Z88gPiCWpcGTNpkjstWFmQDEP6Ruvh9fjvjtAff0NfQ)l2sQs)5sK90G1hSqB3(mIHpFfBd8DbamwwSvxcP5BdeGtzZYtlEryQAxBRW2duS7rQyrIwtIRWhXejoV6RPlHOEv3eO3J4ivLKmFNNNFvK(YwfpSIOhU0fppXiOV1rqa0kLls444Ype1Lk7XCjCpNL2QFq3wGY1F0nxFND3f)ZMBVh(N92dAWCzTwqB09OhDaykhxPEN28orV124V3K)7DajXZfZHkE9lPQrGvfJed(BQ35r1HuHBcs5DjJHqItSowH(SVuPFhD)))ZqN1hOpC06(uObE10QqunBFz0gOC1ACRENn4vjWTxQoXf0FlgR3cnCAoDCQm9ipiFmrXPOrwmpKLoYiqsnl289IlBrGbwEewu1(ztrO4YXSgHmkU9SeDTuWbD5xlKSgOCScUOnboiE3hOIxRW2i0cCaY30iG43AJ13D9DHcfi)Pm2PAbjJ0rI)z3TNevnUvJd7cqw(TVn(7T2iAae8M1biV7qOrXLt3vFzcM6b92dj3LcL2J)JFXeDJYZz5BRRDDOLtrCeOeDDjoC7GxbAfXKiAMqAj8(r1u8Mlhsynz2q33bNJ5s)e6AI3Z0LPEzO8mzFuqHeAxU76yFynxRPAFYn94Q5ZhLKed0LlDF2zt1gT4rNlYrFsrqCsdXGH2zx833EdU)g7qL3eum(2EtsWrKi0lxFDD7HwsSCBzJLxaTnx2Ia4uZU29sK)JR1VIUiF5NYuuMnAtuTB9oYHBD7D4yj(Cu2ABaS2x0AlXKdBaql25XoHtUjK(9bewaSHC499)l(bKNSpOKnMefGwfKGhwSHdOGfjdDT0ABNYuiMtmQPigjOe3SH4q4pcqywUnduXkWMaIlRjUCc9IAu6AoP2vlECX6IuUT2I7L2jlObnrtUHvuvVQ2GJNp7U8PIoIi08XHjIwq0YL3Vv3A7lYL3IpcKBUvwC6EC6oTWYgRVfnFSzEeFufV)0kSI6YlY57A46a9JKOui4b03GC45vrLHXxoSXsGPfeZNwUcIQ0AsrzswHJsoYNJV9JXww9ObCEy(gddc(jAaNdr(ZxQKTJligF3m90e1cK5tSX66AsmWPn13Hy4kEBA96oVGmaRBy3xsvyLqWs4Ka0IuvGUG0tM4WKn4bTD2lRQHLKdcijamYqUsvcoS4r0BRzXJkUFT63lIKFBLsG0KCc1aA45kpOX9LtnDt(hExEkfaTyerRSgoJKJIE2et2mCwY4O94b7xkAZH3N2fH3s8kZHl2Nh1GuLZv9tMo8VsAvDHtm8fu1(bkTgg(5ZtqYpyfQez6LJxzCQEQLdf8LDQwREJUDoQw9k0vt)yXYJEzFo3rD58EoZWVH7rEyx(dBdACjUiKGZkPM)MKzIjpph1yNFn6iZp2ga540dqATOsaPRF)fVdnVOD0sGPYBjTPNTlMZSsSYz19qFK4ObIr93SvTkT7iNLPwNT8xPqwH2CCtpoKRunaifiSS(wRPbKMnYUVOIZYP31HX9ydHjStGCkouvcXh9V(J9ERMxR3eoJapkfMyOmse2jLENiPV64rgOwVPrekbRPd(xeorEX04JuZ3I4dav7r8geTctU1MXIy8kVBIb6exgEVjQmbPafE35qQs)hJ06j18kNO4Rnp5lYOpFcCt9xGAPYkIGneULXxLO4iV2y0VO3q6D2NG7htLtswkT6D(hF73(DZmZmvVZ)r8pVeDjLmgI6R7P1VHQUD8A2x5pMbTxdarEx2qOmQtOgL72(E8Q1YoBsFwuYUAmfD)kAJdHxIjdM4WNuZrfsiwmKYqPWxogsb2lH)nHesT4J2yOKchJvvqch)WPQbnvQ(QVo13etl9HRHnGQ1R3UHnqnBeHxO(2KoS6eNb9OV)u2qPSML0ANjrQBSHx(5JH2xcoN3iRq(svEl38XfWL5EzSSXmAttq2HhzQJ2Q6D(3dWFgsxzQIve(2LsCkcDGerCTS0pzWwDRxRS8Kb5A22DtGIlpofIasrNamner54uL7fEUQrJf1svftyWjlr3eBhdD4wIbS18juE0dH8GJmHIOWz8MqTqXovVFDXXBHrvU07n4fJ38wzNOCHIsSFFMF60QBet0IA3FCXkh1UtRghFprshS1xkvVQsY3lJD6lqjTWefv8gpmAXBwRj7EjAd6OgLVV48XVv0V3d0IetbPaoOBO1lcudzZEj6fbAp3(axcZkTyonpE0r3i6dI3WWCXMwHCIfZpLE3xIUqIWJaxnbkLXHOnC5PizypHW8rpWgRFZBgUuIZnt2)Q1LKNInw9aXdsxSuPd(Sc8o2lCI3jW)U56GED68EYJBicG5pvXo(nHkiENDD6cEqWjmheVdOIHO(kymLjJKaFYpkL8gMMDtrhdSo8axiO0VRpPnL0x2nuo9sXHhG5SjhXsVPNHY3i9KOCLYzFb5JfuiAAxpuwYcyF8LJOVLIpZfr4gLPNdHlhY8gt16vzvb3FSMDLTFHJcsovOyNKg(1jj24GKhTa)GS9go0HWpREHNB5346)pt5uh4met4NpfESs(yTB)EQouEG9qqhWeTQmIronLE1o6jowP7ttR95kUMindMtFB6n0ods5jqRFuKF4pW6ajASGWvA3i6zoAcfmWDK8dko6ljG0tojscexGkuZVFOkZKQfYu9oFZSZwaujeo8WOmaHOtXiatDCHRPpZi5jmRY6cBVzkNaS(j1QalXgVT4l7J8kJvFxywmsrz6wNZhF2qqbprTVOwksEw7V6p9C8BXf(DH4Ldg740K5nW2H8F)d!BBF",
  version = "1.1",
  author = "NoobTaco",
  dateCreated = "2026-01-06"
}

-- Platynator Profile
-- Optimized for NoobTacoUI aesthetic with NoobTaco theme compatibility
-- Version: 1.4
-- Last Updated: 2026-01-18
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

    -- 1. Decode the profile data
    local profileData = addon.AddonProfiles.Platynator
    local profileString = profileData.profileString

    -- 2. Try to use Platynator API (Modern/Programmatic approach)
    local Platy = _G.Platynator
    local profileName = "NoobTacoUI"

    if Platy and Platy.API and Platy.API.Import then
      -- The API typically handles its own JSON deserialization and state updates
      -- We attempt to import via the API first.
      -- Note: Platynator API import might prompt a dialog in some versions,
      -- but programmatic calls often bypass it or have specific signatures.
      local success, err = pcall(Platy.API.Import, profileString, profileName)
      if success then
        -- Tracking below...
      else
        addon:Print(
          "|chighlight|NoobTaco|r|cffF8F9FAUI|r: Platynator API import failed, falling back to manual injection.")
      end
    end

    -- 3. Fallback or Manual Injection (If API failed or doesn't exist)
    if not PLATYNATOR_CURRENT_PROFILE or PLATYNATOR_CURRENT_PROFILE ~= profileName then
      -- 3.1 Decode JSON
      local success, import = pcall(C_EncodingUtil.DeserializeJSON, profileString)
      if not success or not import then
        if not isBulk then
          addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: Failed to deserialize Platynator profile string.")
        end
        return
      end

      -- 3.2 Initialize Global Config if needed
      if not PLATYNATOR_CONFIG then PLATYNATOR_CONFIG = { Profiles = {} } end
      if not PLATYNATOR_CONFIG.Profiles then PLATYNATOR_CONFIG.Profiles = {} end

      -- 3.3 Create/Overwrite NoobTacoUI Profile
      local config = {
        designs = {},
        designs_assigned = {},
        style = "NoobTacoUI", -- Default fallback
      }

      -- Copy all settings from import to our new config
      for k, v in pairs(import) do
        if k ~= "version" and k ~= "addon" and k ~= "kind" then
          config[k] = v
        end
      end

      -- Ensure designs are cleaned up if they contain metadata
      if config.designs then
        for _, designData in pairs(config.designs) do
          designData.version = nil
          designData.addon = nil
          designData.kind = nil
        end
      end

      -- 3.4 Specifically ensure design assignments point to valid designs
      -- In the current NoobTacoUI profile, we only have "NoobTacoUI" and "_custom"
      if config.designs and config.designs["NoobTacoUI"] then
        config.designs_assigned = config.designs_assigned or {}
        config.designs_assigned["enemy"] = "NoobTacoUI"
        config.designs_assigned["friend"] = "NoobTacoUI"
        config.designs_assigned["enemySimplified"] = "NoobTacoUI"
      end

      -- 3.5 Apply to Global Database
      PLATYNATOR_CONFIG.Profiles[profileName] = config

      -- 3.6 Switch active profile
      PLATYNATOR_CURRENT_PROFILE = profileName
    end

    -- 4. Track application
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
  '{"stack_region_scale_x":1.2,"design_all":[],"closer_to_screen_edges":true,"global_scale":1.5,"cast_scale":1.1,"simplified_nameplates":{"minor":true,"minion":true,"instancesNormal":true},"stacking_nameplates":true,"designs_assigned":{"enemySimplified":"NoobTacoUI","friend":"NoobTacoUI","enemy":"NoobTacoUI"},"version":1,"stack_region_scale_y":1.1,"simplified_scale":0.4,"show_friendly_in_instances_1":"always","cast_alpha":1,"addon":"Platynator","apply_cvars":true,"not_target_alpha":1,"show_nameplates_only_needed":false,"designs":{"_custom":{"highlights":[{"color":{"a":0.468750149011612,"r":0.8980392813682556,"g":0.8980392813682556,"b":0.9294118285179138},"height":1.18,"kind":"target","anchor":["BOTTOM",0,-14],"scale":0.51,"layer":0,"asset":"glow","width":1}],"specialBars":[],"texts":[{"showWhenWowDoes":true,"truncate":false,"scale":1.27,"layer":2,"autoColors":[{"colors":[],"kind":"classColors"},{"colors":{"tapped":{"r":0.4313725490196079,"g":0.4313725490196079,"b":0.4313725490196079}},"kind":"tapped"},{"colors":{"unfriendly":{"r":1,"g":0.5058823529411765,"b":0},"neutral":{"b":0,"g":1,"r":1},"friendly":{"b":0,"g":1,"r":0},"hostile":{"b":0,"g":0,"r":1}},"kind":"reaction"}],"color":{"r":0.9686275124549866,"g":0.9686275124549866,"b":0.9686275124549866},"anchor":["BOTTOM",0,7],"kind":"creatureName","widthLimit":130,"align":"CENTER"},{"widthLimit":124,"truncate":true,"scale":0.91,"layer":2,"align":"CENTER","anchor":["BOTTOM",0,-4],"kind":"guild","color":{"b":1,"g":1,"r":1},"showWhenWowDoes":true}],"font":{"outline":true,"shadow":true,"asset":"RobotoCondensed-Bold"},"bars":[],"markers":[{"color":{"b":1,"g":1,"r":1},"scale":0.9,"anchor":["BOTTOMLEFT",-82,0],"kind":"quest","asset":"normal/quest-boss-blizzard","layer":3},{"color":{"b":1,"g":1,"r":1},"scale":1.45,"anchor":["BOTTOM",0,32],"kind":"raid","asset":"normal/blizzard-raid","layer":3}],"auras":[{"direction":"RIGHT","scale":1,"showCountdown":true,"filters":{"fromYou":true,"important":true},"showPandemic":true,"textScale":1,"anchor":["BOTTOMLEFT",-63,37],"kind":"debuffs","height":1,"sorting":{"reversed":false,"kind":"duration"}},{"direction":"LEFT","scale":1,"showCountdown":true,"filters":{"dispelable":true,"important":true},"textScale":1,"height":1,"kind":"buffs","anchor":["BOTTOMLEFT",-90,2],"sorting":{"reversed":false,"kind":"duration"}},{"direction":"RIGHT","scale":1,"showCountdown":true,"filters":{"fromYou":false},"textScale":1,"height":1,"kind":"crowdControl","anchor":["BOTTOMRIGHT",90,2],"sorting":{"reversed":false,"kind":"duration"}}]},"NoobTacoUI":{"highlights":[{"anchor":[],"scale":1.02,"kind":"target","color":{"a":1,"r":1,"g":1,"b":1},"height":1,"layer":0,"asset":"arrows","width":1}],"specialBars":[],"texts":[{"widthLimit":93,"truncate":true,"align":"LEFT","layer":2,"autoColors":[],"scale":1,"anchor":["TOPLEFT",-60,4.5],"kind":"creatureName","color":{"b":1,"g":1,"r":1},"showWhenWowDoes":false},{"anchor":["TOPLEFT",-62,-19],"scale":1,"widthLimit":0,"truncate":false,"align":"LEFT","layer":2,"kind":"castSpellName","color":{"b":1,"g":1,"r":1}},{"widthLimit":35,"truncate":false,"color":{"r":1,"g":1,"b":1},"layer":2,"align":"RIGHT","anchor":["TOPRIGHT",60,4.5],"kind":"health","displayTypes":["percentage"],"scale":1}],"font":{"outline":true,"shadow":false,"asset":"Poppins SemiBold"},"bars":[{"scale":1,"layer":1,"border":{"height":0.75,"color":{"a":0.2499999403953552,"b":0,"g":0,"r":0},"asset":"soft","width":1},"autoColors":[{"colors":{"cast":{"r":1,"g":0.09411764705882352,"b":0.1529411764705883},"channel":{"r":0.0392156862745098,"g":0.2627450980392157,"b":1}},"kind":"importantCast"},{"colors":{"uninterruptable":{"b":0.7647058823529411,"g":0.7529411764705882,"r":0.5137254901960784}},"kind":"uninterruptableCast"},{"colors":{"cast":{"b":0,"g":0.5490196078431373,"r":0.9882352941176472},"interrupted":{"b":0.8784313725490196,"g":0.2117647058823529,"r":0.9882352941176472},"channel":{"r":0.2431372549019608,"g":0.7764705882352941,"b":0.2156862745098039}},"kind":"cast"}],"marker":{"asset":"none"},"foreground":{"asset":"white"},"anchor":["TOP",0,-8],"kind":"cast","background":{"color":{"a":0.5,"r":1,"g":1,"b":1},"applyColor":false,"asset":"wide/bevelled-grey"},"interruptMarker":{"asset":"none"}},{"absorb":{"color":{"a":1,"b":1,"g":1,"r":1},"asset":"white"},"scale":1,"layer":1,"border":{"height":0.98,"color":{"a":0.2460939139127731,"b":0,"g":0,"r":0},"asset":"thin","width":1},"autoColors":[{"kind":"eliteType","colors":{"boss":{"a":1,"b":0,"g":0.1098039215686274,"r":0.7372549019607844},"melee":{"a":1,"b":0.9882352941176472,"g":0.9882352941176472,"r":0.9882352941176472},"caster":{"a":1,"r":0.9568628072738648,"g":0,"b":0.9333333969116212},"trivial":{"a":1,"b":0.3333333333333333,"g":0.5568627450980392,"r":0.6980392156862745},"miniboss":{"a":1,"r":1,"g":0.7333333492279053,"b":0.1803921610116959}},"instancesOnly":true},{"colors":[],"kind":"classColors"},{"colors":{"tapped":{"b":0.4313725490196079,"g":0.4313725490196079,"r":0.4313725490196079}},"kind":"tapped"},{"combatOnly":false,"colors":{"transition":{"r":1,"g":0.6274509803921569,"b":0},"warning":{"r":0.8,"g":0,"b":0},"offtank":{"r":0.05882352941176471,"g":0.6666666666666666,"b":0.7843137254901961},"safe":{"b":0.9019607843137256,"g":0.5882352941176471,"r":0.05882352941176471}},"kind":"threat","instancesOnly":false,"useSafeColor":true},{"colors":{"unfriendly":{"a":1,"b":0.4392157196998596,"g":0.529411792755127,"r":0.8156863451004028},"neutral":{"a":1,"b":0.545098066329956,"g":0.7960785031318665,"r":0.9215686917304992},"friendly":{"a":1,"b":0.5490196347236633,"g":0.7450980544090271,"r":0.6392157077789307},"hostile":{"a":1,"b":0.415686309337616,"g":0.3803921937942505,"r":0.7490196228027344}},"kind":"reaction"}],"relativeTo":0,"foreground":{"asset":"white"},"anchor":[],"kind":"health","background":{"color":{"a":0.44,"r":1,"g":1,"b":1},"applyColor":false,"asset":"wide/bevelled-grey"},"marker":{"asset":"none"}}],"markers":[{"scale":0.9,"anchor":["TOPLEFT",-77.5,9],"color":{"b":1,"g":1,"r":1},"kind":"quest","asset":"normal/quest-blizzard","layer":3},{"scale":1,"anchor":["BOTTOM",0,7],"color":{"b":1,"g":1,"r":1},"kind":"raid","asset":"normal/blizzard-raid","layer":3},{"anchor":["TOPRIGHT",61,-19],"color":{"a":1,"b":0.9372549653053284,"g":0.9058824181556702,"r":0.7411764860153198},"scale":0.5,"kind":"cannotInterrupt","asset":"normal/shield-soft","layer":3},{"openWorldOnly":false,"scale":0.8,"kind":"elite","anchor":["LEFT",-79,0],"layer":2,"asset":"special/blizzard-elite-star","color":{"r":1,"g":1,"b":1}},{"anchor":["LEFT",-80,0],"color":{"r":1,"g":1,"b":1},"scale":0.8,"kind":"rare","asset":"normal/blizzard-rare-midnight","layer":2}],"auras":[{"direction":"RIGHT","scale":0.82,"showCountdown":true,"filters":{"important":true,"fromYou":true},"textScale":1,"showPandemic":true,"anchor":["BOTTOMLEFT",-64,8],"kind":"debuffs","height":1,"sorting":{"reversed":false,"kind":"duration"}},{"direction":"RIGHT","scale":0.78,"showCountdown":true,"filters":{"fromYou":false},"textScale":1,"anchor":["LEFT",66,0],"kind":"crowdControl","height":1,"sorting":{"reversed":false,"kind":"duration"}},{"direction":"LEFT","scale":1.16,"showCountdown":true,"filters":{"dispelable":true,"important":true},"textScale":1,"anchor":["LEFT",-88,0],"kind":"buffs","height":1,"sorting":{"reversed":false,"kind":"duration"}}]}},"click_region_scale_y":1,"style":"NoobTacoUI","click_region_scale_x":1,"target_scale":1.2,"kind":"profile","current_skin":"blizzard","show_nameplates":{"player":false,"npc":false,"enemy":true}}',
  version = "1.4",
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
  "1Avs3TTnq4Fo9u8JlIKIhTKLIZ7fT8mzB6jgdrose1GaSaqB(G)TNzaLSwIQB6HEHIAWGz9B(gw4xKxK1Qvl5cGEfKSfcyYEBnVCUsBzctXIImdiGslu9iW02AJvjbdQUTiBfibnt4mJIlrjdhnnF0tfz7MTCPbSft9kYwW0ZvgULRKfzdMLNpBIt4eMEfx(UkSQkUCvX0WIS9xE7XRfctPgazXaNGHQMfm7J8kGIV1gyKyZV)f6qniyw(gy(LHJqv(curk0OQwlGSwwzNZo4bbFv97gef8nELTUyQFyCeLOLR1zaZOKZKI9KkLkHst5TuPB6QaSIXjEHX9ts89c8d8sJ9kw(PimD0OHWIL75c6jArUKvsbA3nN6Dxq0TveZUHdjxwR2a6doQxIFVeV4W04KKE98CoQhDNXrXr(rjXbEbP9J6LeqNKq2CC)KO00EHHrXb(PHPbhUJ(KFEK8a6SJf5dP4h5pQdTY9utp7StoSZ6Iz8Vw8DYilvsBg)vGQPD)RiBUQTLlnFkdA4duIkeQH1sX4tQgqMO(mC3x5gYCt9t9ccX8AGw9cOF75CntAWUmJqzV98eMvZ3HQLe4NKwKnYcAjt40BdcN1)M5TNpdpxmnimYZpUi7jOcAfQ9nG0I2XHwi3fg1VFrwoVb2YeVCld0lknbRdZVB2Dz3LFhfegBNIJ21QbZp7YyeTGb3o0HgelC95EPEHiQ4mHV9SA5BpBRXxglynuKfh61RtPkrNpuAd0WK)ue63VFAuqr2dQge9Hd0xFEVGOE455QMdokxTflMDubu80pXd76paqB1wqCOmoImbiV2yXbPjyN(ZAGzxYqnWU03WHYBv68XuaZHh0mqYlPuqOwbnurngb04CSY04o4SRzpomtKrzwnRcmVWfItmzUbEtTABUsjS82JaBcHtqtMaBYxPUqXQuRTzB52smMhD6KoL(6LN7Ou4Yd0frEx7pRlYqi35UzXniuUf3lXNXKvy76v4rt38ewg0QjGCnzWkUHU1ab)1xz6QjVFgAWvR5IJmE8LCqFmOiYLYAM1rTxRADClGW97FVgmUdAyCjzP3jkd6YSppzw(dKvzL1KETG9u03vVBrKbjtzYuLCMGydCJYhl4K)qM27BBhIt6inyhHkrPpssV)xQ100k9Qy5kYO1kKw5QUPR(0qz7GodEM7WBYlvYlIE3PKUyYRDX(MdDiSzObz5(RGce11m5t0MHJU(pNJ4NBGQ21oWHRwCYy514cRImVZKSvvKf6f0)KOziogf513TnLOaVmeUQbpGTYmOl4Paym6bueLLVxCMrtApbmrJ5GiTnNkFiqYC8Izen7qCf5bqvjTF8kxFIWoWRR(oAd29owETit4yA3hHWrYGnW9nZBOpwqJlriEYot3rc(hkX6g46jtl0sB(CRFm7X)28XZU4xiOKMCfch2IiQddB3leZKyaU89U03uAh0hnlt30TeBltlrOWdR1SfCb3UVlVUYzFrSrC89HkLUQRaD5sOHi2h(pSe6JxT8)WEJpG08FDjqCAV(xSY5xyVW)m99VWgm7LKCeONjyOOVxB(UbRG48B2dDI(5faGLrDxAKgjsq(4SVYznBxlwI92DTe4N7wtMe3ponSVp9vw00rr29sxDMZKUoCXpc",
  version = "1.3",
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

-- EnhanceQoL Profile
-- Quality of Life enhancements
-- Version: 1.0
-- Last Updated: 2026-02-23
addon.AddonProfiles.EnhanceQoL = {
  name = "EnhanceQoL",
  displayName = "Enhance QoL",
  description = "Little tweaks for enhancing your Quality of Life in WoW.",
  minTocVersion = 110000,
  downloadUrl = "https://www.curseforge.com/wow/addons/enhance-qol",
  instructions = {
    "Click the |cwarning|Apply Profile|r button below.",
    "The profile will be decoded and written to your EnhanceQoL saved variables.",
    "A reload is required for settings to take effect."
  },
  isCustomApply = true,
  applyFunction = function(isBulk)
    -- Check if EnhanceQoL is loaded
    if not C_AddOns.IsAddOnLoaded("EnhanceQoL") then
      if not isBulk then
        addon:Print("|chighlight|NoobTacoUI|r: EnhanceQoL not loaded.")
      end
      return
    end

    local LibDeflate = LibStub:GetLibrary("LibDeflate")
    local AceSerializer = LibStub:GetLibrary("AceSerializer-3.0")

    if not LibDeflate or not AceSerializer then
      if not isBulk then
        addon:Print("|chighlight|NoobTacoUI|r: Required libraries (LibDeflate/AceSerializer) not found.")
      end
      return
    end

    -- 1. Get the profile data
    local profileData = addon.AddonProfiles.EnhanceQoL
    local profileString = profileData.profileString

    -- 2. Decode the profile string (EncodeForPrint -> Deflate -> AceSerializer)
    local decoded = LibDeflate:DecodeForPrint(profileString)
    if not decoded then
      if not isBulk then
        addon:Print("|chighlight|NoobTacoUI|r: Failed to decode EnhanceQoL profile string.")
      end
      return
    end

    local decompressed = LibDeflate:DecompressDeflate(decoded)
    if not decompressed then
      if not isBulk then
        addon:Print("|chighlight|NoobTacoUI|r: Failed to decompress EnhanceQoL profile string.")
      end
      return
    end

    local success, payload = AceSerializer:Deserialize(decompressed)
    if not success or not payload then
      if not isBulk then
        addon:Print("|chighlight|NoobTacoUI|r: Failed to deserialize EnhanceQoL profile data.")
      end
      return
    end

    -- 3. Validate payload metadata
    if type(payload) ~= "table" or not payload.meta or payload.meta.kind ~= "EQOL_PROFILE" then
      if not isBulk then
        addon:Print("|chighlight|NoobTacoUI|r: Invalid EnhanceQoL profile payload.")
      end
      return
    end

    -- 4. Write profile data to EnhanceQoLDB
    if not EnhanceQoLDB then
      EnhanceQoLDB = {}
    end
    if not EnhanceQoLDB.profiles then
      EnhanceQoLDB.profiles = {}
    end
    if not EnhanceQoLDB.profileKeys then
      EnhanceQoLDB.profileKeys = {}
    end

    -- Determine the active profile name
    local playerGUID = UnitGUID("player")
    local activeProfile = (EnhanceQoLDB.profileKeys and EnhanceQoLDB.profileKeys[playerGUID])
        or EnhanceQoLDB.profileGlobal
        or "Default"

    -- Write the deserialized settings
    if payload.data then
      EnhanceQoLDB.profiles[activeProfile] = payload.data
    end

    -- 5. Track application
    if NoobTacoUIDB and NoobTacoUIDB.GeneralSettings and NoobTacoUIDB.GeneralSettings.AppliedProfiles then
      NoobTacoUIDB.GeneralSettings.AppliedProfiles["EnhanceQoL"] = profileData.version
    end

    if not isBulk then
      addon:Print("|chighlight|NoobTacoUI|r: EnhanceQoL profile applied successfully.")

      StaticPopupDialogs["NOOBTACOUI_RELOAD_UI_EQOL"] = {
        text = "EnhanceQoL profile applied.\nA reload is required for settings to take effect.\nReload now?",
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
      StaticPopup_Show("NOOBTACOUI_RELOAD_UI_EQOL")
    end
  end,
  profileString =
  "S3x22TnsY2(5CEPKxCE48gfhSyxIdfbLD19QwYgIesexdcWgauYQEW)l3hp)d336FSBSJitGet0sEOkx1rDxljzsmKzKrgtze7466xV(AR9oX243hcdU11Z5AR5bb3S2EtWvtV26ENWi3a)RT6(Qg1EvTZUHU4oxBzVDl(WX(7S9348lbxET1hC93sFYVS4Y3TC1IjtVC81woBDJNfS15s7hdogN9jREDVr9cMx)A6c2AlJL1bbEXUhM9y8o3nwBccDOhJ7TUoHxBzDX0jyyhCmYzLR)DlddUl0jkYk(rm6hTG(Y7D83geUmiiC6D(0D)w7WBcosdWZV2k6FF0MEEU(U7TpyfBhhDPDSJ)Mhhg4feEzWdyayFnnGScVEETRTUJ)7BWFtdX)9rNO41H2B(Gt4VG)Ei9GJxC7TroX)kF9Qbp)4E9rxVTZT37C9njFXv(UXw7cEyTD4Do0Dk)gxqSTNJF8kN9eT0jCWMy37DohpHmpyC)x4U1zQ)OJ(35qle0TgAtZ49ZWyzu4r3TZdS25EB8B3rlP8N6Sfxwjt(Gn2X0s8vro)RaFhEudYKRFumwCh5E7TUBo6f)4Ka)yl3F3HihTiken6c8p3oedLZdcPbCeEdjF(a)n7cch5CRnDZ9U268fRxVy2LJXIN9X4aSMqd6xh4XJSSZDlSATWhVCNqAXHPFfh8twAXd4lCVB3Px2o9Q(m3TzUDA9Mw1R9QoTtx4DzoPr2UEpYR78S9UnBjsWBD3gV765nQrR(f4lb9z0XqIt16b3de1Rj9qRCLoLalVV1HU37A7L)nkR)lDIp3ooMy7lL6mK4)366tC3rgRDnU26iXbnjK4kT2qCCJ9TVXtypYT4rlZRxSuwYQM4NFlJI4Ls52q7M3g8G)sBFhVOXKqHGqHJM23gCmCJdrdJO9Xq(dTBNisRXwn1gj9(fMngJsZTGyJu62qW4UZX2lE3m7nHb6zg9PIeHR83eSFFGViv48GXLlqyTlTH9uIkYsotOA8ln73TjW)w3W9lTJdd8xGDjJOLZG7W84wp7OpSm0HyXdD2E(JRcOvsZzEYKB6OP(8S8s5oJOz90cBq5NzOlntJU0nkEKdj4eYEshrejNia3yJNZY7pGByplJDP3XOHhPHHF8YJEEz3QtZHyBxFrIuGVSXg7xE865NXm9FKxnpe4slqwdhpF94vyX1JKSCVZYmFSskVWliZ2Csde5Hd3ztczJHe)tj2sKxzkXwy)ej2SsLn6NelSFsq4EApdTD0GV)OlVtGwliP4qpf(N0LiJTbB24CGelhbcetcg)XnEh3sclbTeCkcvDTZhJlB3ucFXIJX0JL0sT4Q1xoDoPISAbYz5J2rB4H8z8kWY2dgspNxVr3UDR1VE3(9pTcQ)jVorQxGUVZpghtsWD9jA4X9(rxpN2VhtS(KU6voEo2rSCfrrq8qs1S3JrMZpWfoZnkIPLevMuds2l4z)4cFS6DlKWaIJAFmRlCLT)hswZ4vi1QfPRLxTabx92xE)sfHEDGhjIWMLr5WIR(LJUB(Wp784nKQslAF0oATypPoHzPnNFrKyJiNaAGLLB)8vkL4IKirQbPeC4XO4G9whC8i2t6HDial4QRfFawjUWnEQ)wxsZjzLbnHLhEw5CGPCRO9d8504oo8r8he5m2DdwiLLJ78cEyLJ92h17SF7oh)X7peZFGT3d2pgbjbSej634RNhqc3zHQ6Bk5FJRcAp5h5eLfDGNd3lwxUZHNy8)u9qyUk1JN2LS5dYvKmq59Gj)lmyOLyJbaMcKoo2qcEoLEXkPfjsfmEmIbBPBfsFbIvgKMQ0RgBhYomKfU05AIGXyN90cjMc0DqRoW2tIUFxyWdX7usJs0RT1vTN(ARvtF9f019bHRIwCoJgbexhjWEf9ZJ0oKE0Bu996jwYtcmg50jR5iE9MTJcTFqmaql)MeRc6(XqEtYMDoB(WYGhuSsY6KX7qKJrFMAAJvjweroQyUx54T3XVXGd2BCJFKeaT4wLylS3ZLgeIXB6nL0NsK15n4F2K)zlykupqmFi0(WOuc2OfVDUSHyQ)qpsXtS1ghIvdCsjJVK1sYe17CusimKsYxjrSPrJAgwuYxwUTOyItZ(ARzJhn9QzMtcn90A04jdU6sSzdgAlEtW80QLZaWRP4vvRNrIrbtjUh1vMoCnjoe9beNxr)gKh8BMarM1bLnQDfPl3S2bzVQIn4Cw1s6Icr8efjGgWKd96UyZSIVmDTszKOmZL)rtYRm(wj2JZYSWAqQv0xWztxYbWSTMuzNzP)vTvZp6308tMDSKzfDYy1jDZqzCIA6Q5aWG6iubdQdizm7k9zh9pgbX8fhEDudp63m5N(TEakB1HdNxB96vthjR(z5Dahm7XMi8ivKyg5PyZcn4OfAf39BCiJKe7SnzsZT3lDfs8hKFhkYaTU0GOIeDu7tnwT5TEIvqhsTismAj(8J3qKad6Dtd3lE9WrApFLz8QXZgmD(05VUcB1V6a5DnTrLmP6EBpq6AqoIK4UIWg1LgWIc2ldcIJo4SHv0g9GB8MDPo8uCFMR39SvJfTWzV9D0CiG0hjU1YQH1oVlm(qOqijfjNXCWL7xrlbSRyquSIrugGKQS4PZwzt3x40fITVKbhVXnY9gxpsw3e7TowXKjT3bNZiI9wXD5)b5YHVThMGKA(neHxwStDDhExT8nlz5fgEOGp2GrqSu5GTl7VSHd4dTJITinItS98GYA8B1oEiRKPO)dYO41b0fIxsXWDS0ouSA4gYOFwEkccc(d1KiI(BW0yADcX0bZyuVkWbHr8Lo2H(x5t2ZfYglK11tL5oWGbXwbH17cY)HGWhHMEXmrzJQ4ld5X2oY4W1bFWXhIltTkJCnln2kIELQ9Ws2Jaj)DtibIGpZOPuE8eOvZmYgXAbtxXQ6BDJ3Xr)qTDf(s4tUBOMu4s(LJeDk2LmsynynohBoPF0e)Of(rB8Jo4hDXp6HFutO5QvlqByZeNs0LP(SD9jreGOLEgkkfxOpEBgFCTgC5L5xosnaLdxf2Qy76DtWhhcFW2i8e)Q99KLUUH(NnliW)tV)1erNJFXgTZqLzy9gYk5ORTwUA6yl6A9HX5PpkWPB7TNuQA8ivHS7gYM9Zg4qEw(P3V0X(dzEvzJr2K2n70RF)UTQ3Vtx6xTU(2ZA3KvmkV(zlM)Z6xoc0iE2jVBZ3bDlx6AV)HJE3E2aFAJc9(T9ZnlN0Ut76T72PrTg971Uv3g41rCt3D9KEDB3VFRMnB3Pr9(n7ZFd5FJwgIA4mA1vqpHqm0VV0Xt67f(16fCClpEE7JH7jbdXF69KRHexEEcc7utvJGBUUIrDkrkZOk51MmSk86ZsRU31BVn7tSb)W3DkL6TI9h7cTj3hD9pnDIOdDA3PF)2DB0Qx3g9R1RNWSaAxR(TAxVr)gTO1061BZRE03esu1o171PDZ(DA1UtN2nu3tkTB5GlhmAkzwQSMMmyoj171bH7JDjbK2FMbTMBFs3(1B0Ow3A160Sg9h8WGyVOjv3E160Oz)(DAqSET7ul)oaRlgmBqY4Z4nFYr4m3py7fCpTvO8L3ETQ1PB9(962TgrmBQjyGu2RwZEnPThnR1PxJeImrkB1TtV2172UgThQDnzZJ5E13oy1LlgMSDvnem2DKUMJPX)5)RF5dVVlen6Tv6izKJD8oLuJsiv00Ut)gnR3REJoT62SrD9ceVJTv3UnjglIBSEZoD6ccczxnTO2RE)wD71UBV(DQ1TFt(Be79fXAJgpy9f)8CXbsHZlzGu6WCsyquC1dt8kBwRwxIbVzZMT62UNsskgMDjPD1BrFpnER3t49uBo6xRoT43LgRDB0GgH5gMZg86X6XxYiO8fuBp7TKQ4Qxs)MkK716xxPdMbH3f87NnMSjISM6tVhN6torU0IA)M9A0MwEA3UxBrCVikHul0IKw0QttsPKsra9nyNkT9TbwR71Rb9tLkI0fvI)F10fR0emEuKm(YoAOBYANn5JhVKwLAzw5dZOvQqmEmrl21iPFKaU(y5xKRKoMwT41xLSeM(kRs99kY47pZMHV70n9yO89boH39F()fvLGJ)iwxNidHshEddc3eAxPu3)auGjJGshCl266)z43M0TrnY(OA1GwGU96PeCX7lQtYb71UtVA1HWoT8fi5PpjwPlz8wZo97rMZLNhC8Bw8Zia)ICo9OOkwqYlNtkN7BQjCQxwPKR1KByoX2rK(HQwqlgo6sTA24jvoxdSuCZo3tyFEfgkNgmC(WMlXOz2Cq6zxf5(nKJn7d83(NjpREmukXzLZwhN9)N)NTNqmzvciR2YWkTMSsldtghvrjjFWTV3XRsc53ugx1lRuk25HKJTeR7UJ7VPAdaR1UjPNRz)U9HXCnvgKcZfArM(vVdzWqRM1AvtzqkSLgYf6swQ2JSXUBhTrJPuSlUsojpzJU5WO0X5BcCf)Jk1iv691Ul9)B1SrRoDBqM3Rhj0ySt3E17rkI72KmVQr)oIHlScXAK7K9jBHArU41OvbZPhnMCPm7avpokBqQoHPHi1g84mLyIN7D7IXXcM6(ELrwdb)BKB0bCixhqeK1hHPoBiKayyeYtjdbo3EZhUle(0Ne6mRfxcxptp)v5Mu50XexpC2N3Op56rK7MHbpkxdhghYfRdbHXtSVpi0nMJKbhCrCo34WWc8hgAFlFqNF8GTpsJh11uzUqqol5eTlWBlos)5TRPFCJp4UrIo(foHbUB4tdJpBqjhfK4R)wYt4OLoHxIiHmNw9k(EWbRNn22QKlauMzhJD2Yj(HACE4ONhUJWld8VJpt(51PXeI1Zm7WpS22)dzYbg14WmgsYjSLMRkbXFWXmrwAiH7kBaIQ409L4zPtZOKdyOq6eHr6vronADrWro8xzpsZINuOKrezpM8kYJgYBeZ8OrIe6mjerd2Uf5b15bbFaVvvGJw5S3z)nen0okELZg3d4yA0JQH7ccIC4mlGpwQQsnQ8XoMSIvrSr8)qugx)isTfC(f4axcTD9h45Lg6qzfqDkQgbgtD0gLepyAhMbhMT3hig5lCKJaEFzh6SzWJXXcizSfh840W(uzE3KJ6NnZ14OUHOShYbGItYTRM8ovIBLlriAqEu(0sfcRDoq0Z1ZXD8GkhIAGtji9veSoFIw0MKB(mF(yNS65xVh)8tL6KCo4Q3ZZlBoSI4JnGEbgd6ZdixIfQIo7qGANN5GUvV8eLmmr8jPt8AJ9SpejzVuXJYnxgPCR9wAWsJKCjUs5zQIvKXjdS3(JioVrIGnEstdqJj9sh(qMnFYN9fWkySu1OwkRaosHBKG6H3qRCPCZ6flHYUYY3MeMS60wIeMSmRxtc2CuVG9SZNNtWex5MTVgwT6S3WPzE6)DMZwsrFQxiPKkJcXFwes8h1blP3yRsPJVWmC6euKCzsvKsa5x4lIpnX5RB8ImPSjE2lYKukO((ktI0a(IKJ)kl5ijp)h7D)lYqErgYl21yM(YvBC(l21K3Y8Vh21KwfsV4YvM8Q)ZyEJ223Zqy00(CP8ZoNlcQpvZPx0JRV1RRvx3lF9Ue8f7DyMejsCrSR48k5lokTHZqyhZ7EvM76hdpftlcbqnVnWpEI9gNRTq8SI(TjRM(V(L1V7DVA96jf8fFBsYB3KN6i4SQQ6WZX((8zMN(GmnlZIkC)0bjC4tOknWWvLkRv52B9oY6rAOeKfHkwBqs9lXx5pExFLO(Y1Lchq4z2XB2jLjgxtbz2qNKMojvDOU(Z6rtyvwqsU6DZDzIXfhvRKiCPRpXsYc9BUlFqNVHdLzXS4mwLp6P5p9bv1vwihtLhHrEUkFq2OW1R8XyfSk6OtaN3ruomycLhEsEpFBzPxxYQn9wfQ(kver4AD7ARRMU0gv4eOKgrOxE2PFWFDdVGrYQ(ovEq9U6V7IXdUC9fIa2jN1QtN69B0RBNw963VjN)uTO9802QEgbUmPOgYTuLwSdQTwqoHX6ghsc7OT0)9Ihf)55rrsGS(UguYVJba4VOX377NNb8gRBSVZkimMlJudbyjNEIrnbWLo2X4a5eEg54H6WuvCrfpMhJkfwQSyDXLIdksosX0Za0Sy61jzUKh)xgC3A7BmpGR346qV00CYhcfUkMtpFDbxixc(ILxo4FoE17UyG17wpy1RhVwY36XrrKqBxBVN6Dq3JxqqmNE9Y5OYP5Dt8oiAfzmeMwhCKFJkxGl5Kd3fcJ)qvJnV1Z4AB)0VwC067SJVkYzqyyWd)SZJCPgLEAmZdUWX2ZHSxiKpG1sRgY3swp4esJ2OCvWlsj9H7a(eGtnLNDLFgSgNWjPSuofXm5UVrvjihNAY57LAKzAb)r6pmRjdu4fg195iNBoE7TcFLQqNYF0XZdI5d1(anQd8T9wLw1fYRpZPBNYkEfVMPpsCCC42E4fPQkvJ6LiFrFquQbEEPN4F2IGd4)ak5T8NHiFSjY(HP(CjaB545HITwo998vlsUII7Kft8GBPfvp3BLYNdf4nXyUWFMdQ2c)yPAAl9qANS0kPwkOLIYlZf1XUZLzx6HjbYhoqyJJK9IfKJclMVEWLIpekJUilr9dI5Yhk84HyxuboQYnGlzqIAj1fh9BUWSOFRlmlTbUYf2xDHDvxiDx6lumfd7Ne(jgWoC2ENtILFzEuvvMIbQQVIMRjw0AnC15F69YYm9Bp3F)3Td3(P3pejWR7Mp9(17C9XA47ExsbArZzusxkJCLtPr8l6m(uO0Env2f0bxasCMs(s(7etuv(9(SDTrBxwEtBPh8XiNxRwwz(B1FlwWpCG16ZhSYGWmF97MtuLATsj66kuvVypXXz7niLpOvd9JJCLpmtLdk1fPuvKgvnO(6h7VTyvuw4Qz(EIKJ3eEJBddoKJD4ZXbaIRI0pZ(JOGNJ4vnJZ(0OUjHl(4LYy0IAJxIGn6FRyLYDUR0Z303snFGGTazkfpAXG5WsWvfUKdPnGjO(cD9QCekRpoWrUXFmo0wH6cHXpeikfuPEbe0ro4Z1XQuxI6Y2sowXezcNHSMjvl(GBIc8ogdXl4(suvQKOnDKsyRus8KOyajcIy)SW(Ywh)l4eQrDdBU3ouxkF85jpGmaz5XODCzsToqMiWVylifsvlOI(FT5m4Buz1IUU9b16AlAkG1OdE2XolvQjG(UeDk4kcTD3Y7iIujPLbThp5d3F4eFn9wkrvOc8IaRp7uFMYzvz1dk7z7q3aUk5sxhemwjx1kxEbT12aQvsSNZa)ssQuFb5HufbEH81XWqow0PuPKkk9mBF77iVOnHlbEhDWXdOO4YaShnlCe6NoylW8uVGnFy0rhs9ndrljMxLformHVfD2jbO5G1ULjkE0(30KUibHgw5S5izOaUbA07tM4AhVWhWwcB2dEkKHYycPWBLKc8pPQWlj9xKmftNvDrVni0B7m7dglbftumA8HKDdjfcOwhVnLDtTLWe6la7Rj0xu7v1nr)c(FsurJYlejxflnuTnf1J77(3gfKlB0HA7soq9a3deHGcKfps2qZuHaZC9HaGrU3QssNYTAaV9L2B3QlqwtZ80cDyUCyZxgdc3645eZvtVulKmO3K4nXk7qNIqZvAAGrB515G5Pkk4Us8Litki6q1iuu5W7KbOEPL4478ObsFugUfjSjjGOd5yL9JoBTIj1ukThNBFN40Xmh)JPS0KKdz)voOWQioBXtyw(5fdXptkMZAVc5elpHBWfF063M57felJzIMT8YRSYDZs1pQqYHzN6lNR)20YVUFYBgp(lNSQI3CkdSg2MalWLo37WozjBIZGXkgPTQgEMYPHQY0sm9jsEuDEGeC1mxTkNnfmOibzyg6De1tkJ5psj5Ws2VqhUyAjklErLM2TQAGEfueTXrb7nAp1eGcY6is(wdhGsbSTu3FQg3Fml(5JKtg27pOaRo1WMt1TslLDZBnlq(ua(8YgPIYaTOjKa1vaYoy(rfwnK6bZRHwJP(37kIHtGumsMie0DPQS77OxZrWMfBEedrxmzcBQkukTKRI9en5STFQnrSWLrcSacRUyN7mGViqmKDVWzAYQhNlC8iTdzf1uvMqBQNWessqsiZ2EnM4d4IUME3vJzBmkt4bW9HUmjNO5XTiSilRubbVzYH6ulw5JXlNTc5R6DtnPmvH4ZfB)maog1H8jejrMBjsLu40hznSz(fNIJIfg2kqwYY1)dxe4zSeb1KtNHqCGLj26uAbnN9l5s3wZSwp3M)sXNmX8NuGQWiupggiR33TcNce5k(MpGWAfEmXK50NTqxG9dpiPAmNH0A7vncoGcCfW(a6H5egRz7WnKykDjOQqwUNldS3UWNHOPHa4F0sqeWumk6CaybSPmkZboVKqOyyPGGDBBEC6OmRTI55mUCOGyJmZlgiukh1oYyhwwL7Ks3cyGLGFLm6uPmCY0sueIlT18jobWHyB2IRSgV4nJxLfAfG)cfG4YCSqkd2YazMwomYUXkpLK48SMn635SA1RvV3OAitjNxVgceiovqYLx1FGVG)eelp4(iTp(KfMXqaNgIRrjcGw54rRQxnnpCKvQDjLwfeSRHcmRPaQltKulX(ny8uUDj52kOE60DWymygWqe2fYAHHezWRzip(KrgUeaKH8OsB2n5lwih3rodPlcjIYrrZXp6w6p)TbBPnar)wkyZ(BZC26A)BYHvVm4WbYYOZSC27EEG32xfhFBQPXA2JKGsMHBf2SkXlcj0qeTBM2kLaNGSG5bEh2XH4d1ye8AjbjnnDDPmmJ0m435dm(yY08d7bkyPcTCLgUKOO(SMzCNxVl1qxKOEylxJgZxcdcbVj2nHQSWd6DmdRArOKbZixda0nXjRSy3k8vNLD4XWrxIlwyVRDiWSppNnXoBjkvuAuj5iSsghKLfdrx3eyAy0UvksOu9YzXIZSrYLKVS1X)sGYj(3TKCAT6kxsbFTzqknzHX6b7dywHq0MahmLI1Kmg0s7(P)NHPhJi(cj8A08XOCxs5VqEfuU78Kmst9O5v0iLrvkTqQxRc6ytJcCkEksRhFWXHMyBDdSE0FtoGBnvKUHa)S2cMGOVc83G4pbB5ULrNjSuPkbng3LfcGk8stNvqX2qRHF69CrB9P3Zb1jfhmlM3hLblnLx6pLwmpLHfuYsnKiwG6fifOxkq3k1NuHyMmzjqjePW3GmOJ7VEEtIrGD026dUhgs(4dlz4fSQ9YKZ2d(Duw6XKvysLLMhr(FTZ(if7woX)LC8iz04PG(egsJG7Jjh8VzSM)MLcaNie0iQ7Le3B(4tEx4nSCB9WljsQivcQiMV4JZv(KPAsKylWlZ)2vtpt(NNh8XZsl6YRjo0ynGSLl5xsFqACcepf1FFMceR4bMmcGzFcYULEWeapjsUGNeskMnBzQa0ffdrYLEfskwKG(2jw49TqblWFDbzEtRUvlsJ2Xu)hNVy(ymcYznMH7ZyVtAasehvZjZXI0PT3MJiGiAm9VaseJ)fKzzyl(oTetZjVi0pNpl5rvzGXBIyUsDEDcdyYS7Bi(eSIheXzaj1kFozRLeCA2cEyoXnuaLnJx1q7JEBdrbIbzeLzZrUqrKkB)C77saDs8Py)FUn(qd8p7h8GFwnVPwzPTUgIVvNRzwq(MLlLrP8ixgHfr8bZ47sriidEPNl6I6OskOtlDlHKhiJ)iPwIzmVaJN0aqJcCfwzM3YyJdYqB5tkJ2W1RUmbZ5SiDXoXQOUKgjZS2quW(R8hhBw8sN10fAlGfyoc(nSx0W5wHhtw9zGO3AWvRxuwzdt(UJZYqfryynH4O0GF3bfODcA)L3SXkHHCvFjiv5eTsnVoQqqtf2KckaC4KvoK9zLFaXxQmsk9eHibwPQQtdpFtG2ICSWuN6V0AcmYCUs85eyGg5h5BPPA(ZtVyggE82e(lZGLJecWhH3oUSQRV8KyqDLI7lehiG4zjarag2rqOmGOFz3NHD15bkDSZrtNYSFiZPIWzc8ZifulnS0gUgBCgDKjJ3qsc8U3BzqKlh3eG((QW3uD8cZ4rVHd)fGACKAZKSgb6dFuoyfyyNGQJOfkmmikwdOJPH(Xi4NCODYKjhqsDvDTcIC(HCMNwmnlQWCP8OgAASAfNxxg6cyp4r(iEy36b(3scNzqBve0HJIwXMR)Gw4aJOlkByQZua7c))Po1bKvU6aTxoRzI)DPU3PdgfYVN4D4qqtdUd(oYScW(xI3AvsFvO5UglvZ7ky1Smm0vE8MFhuI0rb(uYdZ8HqcsWIICJiF)wPHnztFit844BHbiQ4yK64N(ququfHAeYUUf(Rd4eFsFyD8bRzVzhAEcwys9FxVthIYFb5lB0NEFWTF69daRbCnxDbnAbRg8iB2cjM0p9(rohI3fLC3agCxe6EtG(JA0SDFaMGo0LA)G)nHo2FaIBK3gohplAaIt6D3NE)qIVu9vDBsCCyCidJy8ay46eyzPC3nA1IE0J3eC2OG90xpW7)ARTVR(z3VhEX2)U99Khk)K6r8ghxphYJlKMyq(SmmQbUn8gg)XGT4u25pUlYSddsXBiZJ1FxJM16DTfVx6rJrizEziE8t848MwEmnPN(i69r7)cJ50LbQK1tIM9i5xl4JLL259FJ7niy7D4qAvtZMnPjYOGq)G7il)KpSjuM9Z2H2)(Ue6r36TjYXE6j5rdHreLEpzJHEu0Hi1ehhgbGGISqjzzRnS8KMEefaF3yYbuFBIYFUxquuW(K1Yw4W2dWxGEkaW0uFs5Zrp7KHAlYX(RG7W75U1apw7GufHS)lCF0oxhVTQpUhrD5p9bY)5mR9OAfabJSPlu)qQxhtaskOnmZvVarx3XOyYAxVGh4f1OD6NorvNsMvEBaPiozLGEeZDiPiiLd8)Viw8lbieR4caQopY2JMAAoSonONs2pQj0JX8)0kPZ(da5FLL52y8jFXQGa6NxGGJOzvrkIJtSHhpF69l27CNnhbbbLBYxtajgOMiKinBYuwsyMDGg9ZOe4TbU1PuKaVf0c7GvezYRgoVkLJlljMfAJvsdNC6bWbNbUYhWbo3xzy72ZF07JYOBvmeG2fygzNYL))eQ3L0gobhYe5iW4rXE0QRE8xxsw7QutKXUDOabrftDdjrfwHqqqk(mNOioOzAkghQWro(KDfO4EYAKxUZIHtAaNieh9xt8Jqq7dfJPpuzsM8hjnlktBgnmPbE0lXVuODIVwsezsnIhbVj1gJ9exyYHWNgg)U1pR2OoTB1SvxjDBPRcf2t)EnB0OlI8KaeN5WSXtHTF6diOt32NvBqR(1o)8rzE2Dz4NfEZQGo5Sql7NhaXk)ei0d(wnA2VxDKBwFbGrSAWdYYKr1R3BcJcekYsZEn70Pwnsiw5uLtIiJQNm5)crvQp88w9L2eNqXbGP2fiDB5p5pdgzAoQhoQg90nE0TB3REJ2WfKYOhNgHqZ8GB2RDxvcCZJ5o9Q3KuocJb1O16ZcZW0hLeZd2U(KAKWttks3(TBaih1GM8uXnxZX95dg3Ju8yWD3QDVA96aZnvd8IyhCvWGR5dU3GgJp38b3Qw)uIroat(e4nzwEUbtYSvSzn0xZ(sHd3S7f7D(KMduPRVSpVbG24gPd6NheuM9PFEJMdB03KoxVEJgnXHfPg(ptqwvVJPoyqgmQtVZByY(1QxVATQxJ0bxUCKNgevNNtPEpZTo9A2TdXPyScycS5NcvmZSO2yCNMtmPmD72Sr)MPIxZIE8FoCWutyA1OdKL0UvToMJ6EKCkYEO6KDHFbOdFwcYO29YWH3TrhYKDyhV6r)mXYWmKLw1h2jJQHATRvVz3APd8mi2(PWYXclJMmIDA1IKD1cMsxoRYjbwZSBp71SPPW1UeXUwdyxRMu)KHc6s2BY5LwQo46nB3Tz6G2eJ))CWvA2h(GU1AsEMzOjRvJw1HgOecYZR9fKBR5OMKgDZhpj2UBx4RyzQCEAiVFHxXqA)s6mGwsjVSoHeCfUZNawLLGU)Kb2hVLt4kj7LXJ)a5fM0oXGZ8bE8H3wARyAN7D7ymUexTUUky3NLMpvAX(AF3DH8ZXmh7v97iJMbfNHHjj0bhWB(42562o5TDb3Z1OxPUAm4Jfq6wF48okwVaQ84S44YyqB8M4GGM0g2Yn5Yw5kGUS0HS)uz4j(2IDQMtp64zn53dNH)VE1IRwMR6a0rgeN0GuBhjDptegqAzsHRyi)2kuOlinsE2f6c52Q6SOkq0Oxj3GN0j1ioQ6JH2Qwrxsh)ClxCwmdLt4ka7Na105oL2VM0r00jcB(E5Mmnv(pKXRiJd8h5fKbq6XXkoZzdkf1pxqnQvxASkdH)j6NVOhJvOz1LK1nsZJLyLLgeh5IXV)P3)lhT3IEeg5CREhI0v7q(5Rt6Puxr3Btda6LkL3J8QL3Sk6R85zwiGQ8tQ0w1LeHynzRQtcftkeeBhUfYKzSv2lt6HyPbRh2ROYS)YZHltIMKFv00GJjIibrTGtt8TQ49BuecpvEGTz6CCvueqBdlFeUvdGaQ6Rryfy5iz4T0TuutgjM6TsN2zMT)WtYIPxD5vwH56ZXRHyCFsgSewQs6VNq6CshvuOdkgpIdHz8G59vYjzUcNYWwo)ys1P9e49kisfbQ0Oz5jAbsz5QG7pdu5sRAFReMK22HFYIoYkYj)AQOGIy1nN4iF7m7aMQuyuTE9zx21InkrIYtwgYZznRiValcOkHqNGR8zk3aj)m6qO0Uud9QKZgO(gnszzanQenvoIdsF7gfudBwGDLR6TqHsMaXP07gFzM87I1LcLB63bTWvOq7WDnpySNN7HixvZanmWZHL1MTctv4Xskth98XzQYIjhnaDnfwqZ6bZ)ziMgjwJoLvzaFvj2YksAiGRNoN0Cvf0zKiedLEOuzcCbHM858rzzhlyYkMgpHcNm5YuL55LdSSU2YZXgDhVIZyrFx68UC8Hk94hHp4Kuf1WLl3gputhfZZC(JnQAkURFYveEwAUDskysCnKjIO)PLKwMSXaOUCJIlFWtE)Am6fqeVk6TAfsn2zLl8GmJAzf)2z8kb)1zrbC(JkRnGs(CN2MuzBetVu1AXvKDGZeJZ5cHzqmTNHZCsw5p6XL5ioSn92Cy5j2o0DDhF7T449Two9xhFP8r8jW47efj2SrFcp(Kx6OPwlXfMqMXXcayZjHgJJ6hp40U)o(NYzkIl80PXeptXniPIFYBVsJ7tUHjHO6a93ajFClOe3RkPjOvv8QtzFOxcQPZYzcO3BkhCzR)kOSkHVLbSzKxmOCdLTxzQVxdl4l6)Givdz0a6PJeZJUJ)9eCBGtRh4UI2CLbt(50ehNZ)MYLlQDKqBae7ZJUmJvoHWn5u1WrvdAJMJ6aWKtUG(BqzvWJ06aZm84qO792XodkXzHudw5m4JnrG0(aZsNFeGmV0XSfqwkH4kSu5W8kHUZmp0ijb(XsKrGhKCnjDRwgZS0fHA27hvPVPRMCkaWxViAWMH9d2ulfssLu6xkxoK2TIE2Ot7xyYC6(JexBtb(9NGVTsduMz)FQE2cjwC93YEWLtTl9X45mYXZDVlQInhAYV1o8XRT(07ffWpvDxYO)sNB1qxUSbGLbI3Xqg82U2IZ5Vk4qloNKNkx0nyONIzcjpx(nQEQKEBU0b0mqCXF91u4)YRxn0nF)8sCgsNqXY8rRDcrazmiMi)b1vagrtK5LAWRIRaSZX6X93eWfupt5ozGoaZaglQuINdwusnXXh)Nli7dUKtBXBStrQnvtdjJtmgy7purt0Yr40GhynKxn5stwoTrSCyFdDf3Kd6o0985(Mn95AVQReYdtma5uSELGmdA0ajDpaStJBX(YqOml3KHyAEIPVWsw7W8cLctvxUMdE54vqeAvmXP6BLhgxie8FLh58sFH5)MV2ncPp5vKrcHroOUP5GRLymaubLoalzNt6ZOmtvAQaCf63ChlNxE)wSzRAjiQDldVA1kM8F6nNcj3C6RkwjzsByv5j2ZkpeJR9RBtk2pnZjExW2RTMoF04F1a6pWoRQS6mVpfByMEaFx5IuzKdPWKu4oZXZXHl4woKwCaPnZUnZwmjuKz24JGbGYrqqRSwQdhd1HL6upGX(CVFeiBkhE(5iVFuNN98(jTfy2kF54VMZz1K0SsNxNEH62b6860BtFo7WmcYtjZbk7LegHk3K4bNYjkvT19oN)DG3uYqmbHF2Z0K)adp5ZjOcMrw6BxufkRpP)zcc5j9N)RlsKvhzHSEb95cd2PIxu2GlLpyKLedfJ4t(udgzPbnSQGpMl8OwpPizwiq0CbWL1vsJOywiIANi43NM4wkRhcAxUt05Zfcsj006apkgNvEqg)I43YhHZpxmWljCSMb5TKat)5JDfhv4V3bJ85SYw2Px8ueLusuezJbsolJYJdCM4sw65tC697fzHEorP8eNQr2ayx9b285xInekZMsxs8Y(dlqyzJIt(yS8Dkuog4JxLrXbFrPrB5zfZMNrSGoruC(2fwWIHrJdkI4)4jpf4)Oo1xvWA(BuSRK4jXEIOICvMiA9nl2vPC1Nm2vFNcq7tjQWfd49jdtnPFoVJaNkm1iY)YjcWbR4Pf7)SbP6l)GAulWAKq8p1dQXuZxwWGxcNHaMSEa6sb27X1AycImIR4f3TWzwX6gZZa(NsUNufxF2yGze4lJqIrZHV6qVQZBOtMau8lIX03BH4U)qpTqZtfSYto040clp49MNHysWJHiHmHT8Bv8JRiyQFJdBmd1D4v9NyyJRis58qJTWlBqItcoF2WjxAKOsJVkFSQKX7dd8oUhTAusDaoTk0uLLpJdRcBUZRnssPtfa4)MCAoghGtMd2rPTKpyVYo9MFCI79t7uby5pQSAi9ef(roG4fc36Zio4LUZ(eH2nn82gH3TQWJ)JsSWtMKFdIf(jd5FUJnO6tQOqQYu4mzGunJ4EpFWSXCY7sIGS0XofOJFXtM6Rp9FF6AQlpTMtU)V4SzUKCPv5l3pWHPwJVwiFrYL7SVK7BaVrVA9LtXXy)mdU0l5mBAgr)soZY9Kc4OmVN6h1CM9LSV)jKb0)HN99LhM6tNWC)VT068RlEzpLa49sADMwcw1k0aDEjTo)RFADACGWF(uhZmCdKf9j5l2NnaRF9g6)uZgY)yRFXFGJoQg18lKHGCeHo)XKYsK)3U(3jzLJv9FQXp18NA9tT)Po)u3FcyIS2hoa(w)ixseLhKZ)ECehF)dp7PcA53H079hH40Agm18bMTY8aSIO1wm62FloiINQuV8b(ffkX)lmWVpV04V(Fbce8lja98ZkvuXFNsa6VLb9T0OE)NAcqxmsWFTz78ZlhI)RtYrtAm0fZdF2EiaYVKAcjPMqsx(VkB8)Uem)m2)MjRrkEOh)P4oqjUT9hQz6p3CriBnhvz2luSMMFjhnFjhnZwFzVKJMFP1x8l5OPoNr)Xmhnlpwgzt0XsY2NVL1F8t9O1FIjL33)iy8scM9TpbZ(Bs0Z(7bkf8LMxBFMqbLljc)41Z7(JvvG)s2WveEeEjB4Qg2gkTYW)dmB4kTGdkggKxkH5tJJIFrLu6tdmfFPeM5kr(Zd8ifXsZxkHzbvHuGG2lLWSg3EmrM1sWkXNsEM(sjmxgsdxazwlPmT(6tWINO7ECrIL2u6QQ1KEiim22ZSv(EZ1wUE37DvKdAAyQ(kMiaIePKR7PV0ElAMVmEdW9T(3g8Woh7Tx66ZD)8TsJImTPZM20xY0DNXaySN9HijrmVX(oGPkCMomYn0r6T7PqAn99sRfMX9X0oRwMD8gn33mn3mggwcIqxtlAHFMEBi9v7dUNBPuwhCC2ceLZak9oDxMf9AnsrjrjuZ6)rWralVxgeGN2MKwOcDfOp1G280AB)pm1x1HC4((uiRRfF)qB)noEPTPwKd4gDXVvkCElxJEjPx686HJwggCxOtu0tTTNX(FGH7L2pgCKLxeLaPAj42gn8nWPT0WUZW7iAypmoRbWH0OEoKaEmK(2lCJIdcFelZPnq5ZxDUQ3mImWf9pkx)Oyqas6XOpAs)Y1)8tAz4A7fqlB0jeJbR4qh)7IPvM6PKDa5soHjeEniRBTj0XXN2gRHsqSxG70n8uskW(InbDZUWVSJdnTT6nK()jTPrTn8JB8oY1HO3LenGOUj7qxgeeoLFrQ2g5ExF0qMMeeS9n2Ehv0K8nC6X0dMBoKsJTmcB6aSJjT1tABX1t62SBTgDB3QE)U971VzZRV9Swj132Ljajk6xOj4OE6Rz4XqG6Flp6XyGw2TSgWTtANlpBhCsv8XO9hUW)CIxp5DOAGqXX2B2LPbcL08yrlJvyGwCZ)hib4E0B03GDizUg1MNjUEXaQcP5VrltiT5cr06kAnqgFtJ(DoRw9A17nQg6xbPFt2oYt6NNRF6K7gsAgo5)CDVSj7NN2fAYD9j9qMCFEslGPWav1gxkmPt6blf(MK(NIXKlxRpPKrf3VsY)219BeJNuUEfsHNKQrFK)jPBrhL9Mrl2OW8w1FmkFERAZ(v0CkkoV19vIY(gPDqWkzlxAFsN4mxRKNeUBIP(PD6Cz)F2oMVzRUfn9Evd1Qq7Dpt3IvAYZS8oh)Dqg62v2ORAQB8xs5tUYH7wbN)Ojuyb9oKIfh7iNL3VCSiXAq0o025eq9lFpdEMUjflqjHDOd3U1T5UhVcHfHsHZpEdTvMbmEDpShOkk3VZu7Rp3OWZgnEYGRUK2mR66)aw4jZlcdEe3UNT0xNtaVvznvo4XftMCTLhPfJ7nVqimJpVySKIPV1iTmkyknJw9CTY0BeCWL)jPzMXVb2oh1qMPgU)UJO9I730mwr65adR0aoQAsmmy)(aFzD(T2H3akKgkaXT(6aVTl8NXTKRePTjDT3ro3AF0loxNQlL8a9kAAtIPcPnlDdZyu6hKX85U(W6ivhrp)GFKDmYUbKLd6E0N0S9mxezJv2fqMu9lG0KRRIZMemDwUgqTPPKmsHk94wwDj)843YLb3L2r54(Bknj11eh66dP2tOwbsbGw(XWn4FBpVhxCWXFiX8z76lkqY3PGbryXd(RiwQ95B(DZSJ3S7TUBjRiaac4erg2THSFmmc3f3Pbf7wZRGEEsdrhdM7cIICpmf9CiIGMFaySajglP2PnK0dcaHLnedSfkthZzdJ24rUlyg4ftViIZxm81OdmsBK3gSNhYJiTPX7Em8nUOTcEUZTeBj)f5nntXRNZqZsAeT2XabOtStJyvZ3vSN9y8o(XXst8DLTiRdp6VHU5KU7SqaERnjBA)EAexgzFXX4f3M25ht7n9oE3ZihsPS5j9ZF8iZzfzgcfCMJ2BqBin7K7zmVDT7EhI45sdvGLIM2goHSyIr9XetVHKKxHE0O63v3QHvni8Nq3MuOUd8Ih65UH8JGLwJjgmydJUqXW4wMDj)vorWQoXLk2HhsQo3kjn4a9ULDa78hx5YToOJ3A0JIyzTWql1jksBT19cEwjaAyU2xBD5I3cb8H0)0Ta8y(VpsAksLojTBii9wG2zf8zYTvOeW9q16g4UBKazUS(xjkUz6c8fZVh6EF(nINToW8uNTCxjatTNrN5PoAkxK(NC48Cd0QQJNceyo8iPOgofzGQW1a062aSi0VBQ(TgOPZGeVVQV6c7QUq6U0xOg4TlPf1iqHFHgZGberRbNCnMCF6uBgbqIMLkSZMDD)RbMNZ26jOr1dSu35nWUl90sJu6RgpBW05tN)AbTo0qCexcGhLwwm4RYag8MDGIKKeJwQawJlazhAiW4rO7Ep4BkJqc3DjsjPnanv1tH68gO6MjUKJJvqSsmpI1FgjeNJpo07IMjdyMu3kQLovl(rbzslDcjzKKBAc4UJWBuz3djp6yMFX2e)d1DvPsARtNX9BHd6G)qumZgWIc6BLEaSkTnyOBmh6kQE56UeKjU7Md86fuFxdx(5sfn9hRPyMTwGSR9sKpzYAH1evsMd85LKqYk4Zg)J8KQCpAPmRY9SXCwdK7Iqei1mf4EgE1Qzd(1SDqnOLqebqoQdza0)0eQ5tQRHuCopl08OLAbWKzsyWE13cthqRO2zlukWmDZgmFa2HyTEWRr2Bs)5BwmD07MnE9GzlwT8IfwtTKEm1Za)pYbi8jG0TZ(dXpoZ(JtOHbKsWXhujHL1UWMPR42amhxYjbAKwz0gHVozn63nghgSV6pMn6tApejM(DkO1)0GGDim23OX2eAGg407V0QyPma8WCF2EYhNDmEIJNaps19fUgCj3wSndGw8Bg1nFL8AFdylEUSaF7w0p9k2PwRnKEuYU5N8IPyZ6ehNT8(bdtDOf0uwD0OjJ4(gZavhVOEJMOD3lFiw99ci7N5yKt7LxFLvAZkulDK43q)qhT(OfJE9ySxF14jxoE4A8NtNVE8QvxTK)hKV36pF8BgmIV2PZMD1C(VE7IRMZTqDae443NZTfz6pgCU1IvNJ)A88XRE90)L6Tqcr4N7SPwqAI1YbRw9pfXkv1OwKzMeFt1BekC(oKEqWGavDouExi5BDxmH8kYqvE59ZeAUwgUxLIhUgmGzfjYamV7TKtVGDq3HDkHmtZBLTZOLhKtgOzdSkpCvM3evd1tfSERCGoO8Sb(z0lMQW8vw5BoGKf7nY17QKDDzAXOLrF4IolbjYsvaY2UFR9gNFB4oB4cTQdK(Bxn9mCErsRilhIeomiiKJgg0Mx7vsN5G(tyIVQVnGOYtVXSnYOC91oPBdL3MwJgCeFcov0zkPhErOui9EPV20y7NB9zZwlMVpWsZTKz4j7VSCHq4VfSTIpFLz4gPuZWYn4PPGCI8k1xbMWvIi8y7dJC8DD2M15mDhvr1DWW6yPoNL1hU0lQkiFRu4w7Pa4Ip9wCY3an1Lyp2Pus(1POolCMjXEED2vLK9bv1wGQk)YKgpchoCvmfYzuDwzQpz95LMpzIqBTHzOf3L1LGKVbTUV7Z26JlBxWzvSnG8qM3HxwVbKiFvQPv2dbh6qqjd2iDqTVIq7iU)95dDt2a(KpGqSdJLeANQ68GYbkELV0)S2soj75jrtoPLeIN4pyrgkFSk((hBiZqB81fgOYIRsDwk)PczssuCozWPsB)OgXacbiOyCAmr260wrGHbsMH55eHq6RtCfhyfZaH9sOH48cYi0qieV)Dk0qMHqkxwYO6qEN1WiQq5IFuPHgkNT8Fl9u)VsrfkxWrkXUJsmz7RB)7FQbd6KHa5jB9XlHg6BhlWlHg6Lqdn)V8HgQ8WV8JviIk6QLr30wh9MkIOrfnV2tfEOxcgKCiv6Gb9KA(5VeAiC6JQZQ7h8qd9)V9oB7QnrIIJ)jQQ12UT(sTv3MDvtQjE6z3Jh7bdJroLaSarB(2V3hgGlWWdrWh2S8Y2AJKHzUZDUZ)7)FPoI9qPHQJy0dLgkJa6TR0qXwHluKCw6qTHkxLN(u2pBx1gkVfQ8ORmudQMjrMlDRwqYZc)Cjjiciy5oICnsIAtfiexiRQviuJsSQ9Ygsm2v)krUcVTt2qvuPLm5ej(TAguS6ZDUrslsknxudsvkDOM0HKuArc5oLEXPphIjA)FJgVLYjQQxvVrOSOCWlQOCIkkIOQ)afvokThSE9uZOY3Muh0wubwhZabRxLnuHck131jGzaeRJn(cvzzw2SuIQ6MRQ7E1kkLOUOaLhtnJ6G(1Q7RvzVlUALNQV1UcZuETQKid(Depqu18Mh51pwworvTFsl0w0Rt9czqxqg0(uMUOeZVtc9MXX3Tf5evVDdXxxSrm6bHTCtcDjJeW6Ggs1yXIqF8ou3uLDyG1w5exIrHm1lvRkv5ssb4GPYOv5emu0fbnvNaAQsv967L)ELBRk2IbfmvJGPeTyTbDnLFN1wkcPnwQtnREQNADnLlGjkuWc6OqmouJKkKIZFqorOezO(nJeldU8r04n9HEWFwLtudqA9TVprHmBKwImSZo8TkV8ImQBjtQB6ZRII9xYXieQFPapS3e5evsvDnSoG3QqEaM8YjQQ0jkT3rICIcADbJAPvr3t7f9AqfqW(Rj9hwVPcOAQ1tJfSOBfaQYMSQwTavumsgL9d26xBQSFOgIGsTH6DQwxMOUDYWgeb0gwOhdIF7jVbQEZqrpQwOmdf9G7Y96p862trpG4oMmd5nTP9gk6ri3QIdf94X1Kudf9a3(x0viN)o4yj6wHdsJkhnPKxrGPIEuLHe0pQwNAQTK2ObVGQHkDGT5e7Ob6UMjRDyk3Rwdv6OHo4AOshYdjRloHOiyTLaIBVQJ5fQshv1Hw9wLoqlWiNxkiBCQx8kDWQJzJ0iZZChwIUreAiMfCuN)d13upfvmP1vgyOVPWgk3G178KwYKMQ4izBu0TvL283fScQN8sM8b(xDV66mdTwuFCbdMmCMHwlsyWo9ERfjRyYtyVS1d9Y(RvTIm46mO9Xm46mV2DDMErSgcDzKZa5ylji1PcRZGeRZ9zgATOxuFMPvQDjRCzV9t0UhMTl0(P6C0TQpy1m(H3muXeSIKyeguAsrQpJc1or6fBlwntTvm5f3QzUXpQgNM55iqq3QiYG59TzM3xVl2LxGs3ioxE384M86zPsxpgVbjmlMRNM56ChABp2l6QZ99VzM1C)lhDfXBHRq0keD1e)GahVO3mvT05iFx7DIJVnV9iNVTYQ2eFK6NPB14PHoqROT5yq3lTRNN2QSk5uS6lMZvmP7lNoB8zinREb98XInuFP5Y1kz6ctU3LNCV7exR41EOjIT7HrrQ4ODPz37AE29g4CKLVXX6mlGQWw))B9pYMU9Xn3V6O5Usd3UZL(u(bKZHK3wA3JhR7XMhk9v4vHc0n0fRe8fYN96(z7kBx7pH1XCWtUi7VfvhsoRWvFUSTap56XthIOe869EeZd5n39EsyIg6EH20eM1lJp8t4vtFz2lPx849cS8HoKwsPJTsddGPRxEJp5G)MS7FPJmNdxgVTrAzO5ECbyzO)BXwuE)dOkSssCnvlfPt2qzcWT(tHYVM4bYhiPtXE78XekrWn16GD5K2f4gwru3T8yOTOkvGQUDEmJDKuFCmZ6xP0cl3HWp3VI7h3yUWn)xOXPQxorwo2g9oFPrpubczEwL1dv)YceM8J5jmPrAUQXWm6H635)GMLYhgg6)qEENvjK3yulIN4wFZnK10JSdof4ptJqMNC8VIdTeKfBUV3ToHlj6KDHAP)9wUZqqotKdt56EOR7FSY7NeqWi3csJbp0A9JOoy1boyOkIVgBnsExf7)NQ1WpsidVUewfIuvCShfrIqKgdhPLlrt2FncJ4jirjMVw88veiNAG8QD2eKbHid7CMtiTMEOl9uEYecZfiO(oC(Cvqmn2mY7ENy1VVYbH8OlXVYY)xhVk21XdHy5LZoD05hZFkLjYjY6wR5j4aeHjPLNnYpsyxLuSeWCguWir4CwWrQvJ9o1FHdb)TYuwg50i2cIeiPshitijnXPB7feF9edjKBBpIOccYoCSzrBb(64kOI)W4P7VEkxbRtUy0F)Tz)4h7mB2jeRRICIILu6Mj9Bgxi1CVtJh0m0k7bFWtS8uUJSjyOwbblzpJ(JWgFjy7m67(HU2NzfWeN0kIbLNzoVYCze)8RCTcnuq0bh3tL(zj6)P5kkXyu4RVE88syUj9loqnpzA0fQalNqAUdsr5mADaRUuE2iYvdH3Zm6gRIC28ALuojIiFofU2omqO8s5v5DQqFh63V7TeVmJHfSpy5(t0vNH)ihvHH4s6alsBYV4tpeXWOIxmSa3bE8cXVphsiC(i87q2ZFYj)t5cnoBf)PXijm9PNVofLU4ClCsYjwZHLiMMUyyXyLtTkXM(myNYbbqQCxf38nmzY1Anpx6ayyo7ta7gy3vXidSZdwtgeSC0eCiTyKNJ)Nvobek6vXcmIZuKvtc4QI)KgD8DCaaCinLeUqWFgwqy3DdHxeHp(Ut8D2Hwpq)teIi1W)uCHHzm9m7HGbtFgphLR(Hrdty0ncMk5jIwrtbkGFxyXYE7CG5))8Jb9(b(2fabk0po4StRfkKD6jZ)quORXmhL4mrQTK(gz24j4Sys493stxpmiibkoIONzmkdP8ps7tyS7BRGTvWjRzXJKy(n)Uhmr8WvjcG1RzslU8W3JbVp9WMvGFkSrOY6ix)5)KrQm88E(mer5M(hsVzGJDV34pc6Szi4ADMh6FMYB15(XPidsGq4A3)vVn)uC0Bk)6N)RKBmBm3JcCKLtJkLyPtDTIUtG9v4fqiU2bEf6WeUc(nQpfJyhiXf42uMdTzNPIlzg5DQJhm2JR3mnVTg6kJrVOKpM5VybtRlXZnft)cDm9Gq1TQWZ0tEZIjKq(yCpeeIXHixrXuzGhtAw5zw)cE(ur7VhmVuNu3XWBdyhHXEy(a3I)u5d)iy7)Frlh0pvFfsEccYJ4gFsO6EhffmOMvRIV75twbsJ3IDeRvEZDTwg8flCH5zk9233GZNNa5STMZnIt5GIhIW))Olke7jnMurMy)EAsbtowXy75t(839F4oLLn(YZCUAyEO8Wl8AYMEcGLg2kpDANh7QWqWAqMNdx5xg8GvODe8WKfTedcsyvhtsstJcQ)ZtY0PWKpiWiNhqsob6e2gDg8k9RqIp(HWi4(FihBHHSLNgd7mUajJ6E78jKOyLscvtr4KLPmBZ0RB4LCtl9)PY0zXTAZyRrcW41VEy6iEom3ZCY10rfWVGKCtXx3m0NDI5vdzBLctRts0KsKH2GK(HleZyURFK6iRfrJ9G8(h5fPGe)XuUPGOPtpqwyNmV4bDoDIJqCzGnIRlKNxWPq0Czo7v1PkR7Z43mN3MP3xLYdgBwrmXO4RV(F)",
  version = "1.0",
  author = "NoobTaco",
  dateCreated = "2026-02-23"
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
