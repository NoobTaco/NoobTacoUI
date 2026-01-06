-- NoobTacoUI Addon Integration Profiles
-- Pre-configured profile strings for compatible addons

local addonName, addon = ...

-- Profile storage table
addon.AddonProfiles = addon.AddonProfiles or {}

-- Default WoW UI Edit Mode Profile
-- Optimized for NoobTacoUI aesthetic
-- Version: 1.0
-- Last Updated: 2025-11-28


addon.AddonProfiles.EditMode = {
  name = "EditMode",
  displayName = "Default WoW UI Edit Mode",
  description =
  "Import the default WoW UI Edit Mode layout optimized for NoobTacoUI. This layout provides a clean and functional interface base. Optimized for 4K display.",
  downloadUrl = "N/A",
  command = "Open Edit Mode",
  instructions = {
    "Click the button below to copy the layout string",
    "Open Edit Mode (ESC > Edit Mode)",
    "Click the dropdown menu for layouts",
    "Select |cFFEBCB8BImport|r",
    "Paste the layout string and import"
  },
  profileString =
  "1 43 0 0 0 0 0 UIParent 870.0 -1117.5 -1 ##$$%/&%'%)$+$,$ 0 1 0 1 1 UIParent 0.0 -1082.0 -1 ##$$%/&%'%(#,$ 0 2 0 7 7 UIParent -0.0 122.0 -1 ##$$%/&%'%(#,$ 0 3 0 3 3 UIParent 1708.7 -365.0 -1 ##$$%/&%'%(#,# 0 4 0 7 7 UIParent 896.1 242.0 -1 ##$$%/&$'%(&,# 0 5 0 4 4 UIParent 161.7 168.6 -1 ##$$%/&('%(#,$ 0 6 0 4 4 UIParent 154.1 168.3 -1 ##$$%/&('%(#,$ 0 7 0 4 4 UIParent 154.6 165.5 -1 ##$$%/&('%(#,$ 0 10 0 7 7 UIParent -450.7 40.3 -1 #$$$&&'% 0 11 0 3 3 UIParent 6.3 -291.1 -1 ##$$&''%,# 0 12 0 7 7 UIParent -171.3 162.0 -1 ##$$&('% 1 -1 0 7 7 UIParent 0.8 247.8 -1 #%$#%# 2 -1 0 2 2 UIParent 0.0 0.0 -1 ##$#%( 3 0 0 7 7 UIParent -253.4 266.2 -1 $#3# 3 1 0 7 7 UIParent 253.5 264.5 -1 %$3# 3 2 0 8 8 UIParent -416.2 262.5 -1 %#&#3# 3 3 0 0 0 UIParent 18.5 -459.5 -1 '$(#)#-?.;/#1#3# 3 4 0 0 0 UIParent 19.4 -515.2 -1 ,%-'.//#0#1$2( 3 5 0 2 2 UIParent -241.3 -263.8 -1 &$*$3' 3 6 0 2 2 UIParent -11.4 -460.4 -1 -#.#/#4& 3 7 1 4 4 UIParent 0.0 0.0 -1 3# 4 -1 0 7 7 UIParent -0.3 144.2 -1 # 5 -1 0 7 7 UIParent 411.4 42.2 -1 # 6 0 1 2 0 MinimapCluster -10.0 -10.0 -1 ##$#%#&.(()( 6 1 0 4 4 UIParent -262.1 -102.4 -1 ##$$%#'((*)( 7 -1 0 1 1 UIParent 7.0 -162.0 -1 # 8 -1 0 4 4 UIParent -636.5 -346.3 -1 #($%%%&$ 9 -1 0 4 4 UIParent -320.0 -440.0 -1 # 10 -1 1 0 0 UIParent 16.0 -116.0 -1 # 11 -1 0 8 8 UIParent -26.3 51.1 -1 # 12 -1 0 5 5 UIParent -6.1 10.2 -1 #@$#%# 13 -1 0 1 1 UIParent -930.3 -2.0 -1 ##$#%&&, 14 -1 0 6 8 MicroMenuContainer 3.6 -0.4 -1 ##$#%$ 15 0 0 0 0 UIParent 866.8 -1153.2 -1 # 15 1 0 0 0 UIParent 866.8 -1164.1 -1 # 16 -1 0 7 7 UIParent -239.0 53.6 -1 #( 17 -1 1 1 1 UIParent 0.0 -100.0 -1 ## 18 -1 1 5 5 UIParent 0.0 0.0 -1 #- 19 -1 0 4 4 UIParent 0.0 415.8 -1 ## 20 0 0 4 4 UIParent 0.6 -314.4 -1 ##$)%$&('%(-($)#+$,$-$ 20 1 0 7 7 UIParent 0.1 180.6 -1 ##$+%$&('%(-($)#+$,$-$ 20 2 0 4 4 UIParent 0.5 -234.9 -1 ##$$%$&*'%(-($)#+$,$-$ 20 3 0 1 1 UIParent 472.0 -670.6 -1 #$$$%#&('((-($)#*#+$,$-$",
  version = "1.0",
  author = "NoobTaco",
  dateCreated = "2025-11-28"
}

-- BetterBlizzFrames Profile
-- Optimized for NoobTacoUI aesthetic with Nord theme compatibility
-- Version: 1.1
-- Last Updated: 2026-01-06
addon.AddonProfiles.BetterBlizzFrames = {
  name = "BetterBlizzFrames",
  displayName = "BetterBlizzFrames",
  description =
  "Import a pre-configured profile for BetterBlizzFrames that complements the NoobTacoUI aesthetic. This profile includes optimized frame styling and positioning.",
  downloadUrl = "https://www.curseforge.com/wow/addons/betterblizzframes",
  command = "/bbf",
  instructions = {
    "Click the button below to copy the profile string",
    "Type |cFFEBCB8B/bbf|r in chat to open BetterBlizzFrames config",
    "Navigate to the |cFFEBCB8BImport Profile|r section",
    "Paste the profile string and import"
  },
  profileString =
  "!BBF9PvZVTXXvCXq3MKgyajQVLCAz(ajnOicwYs2s5InjfLiLLiP5hw2ThmxT7qUB8YDMm7Uww(srnY5IGc0Bf5Gpu0l9IpKtPab6wbkAn0LMtffcf9ypW)c67nZSFthFqwy3zN595V3V3BuUpQSHMN2xLZ)CoRH2iI7EwCxV(Vq331JoQc1GWUZN(PfR64r4fLpSOo80INqSPNw0KWjRvCpcXU4aoHu0JcV1Xtt3R4isX7Cc1WAWzS5)cFIpPR1ic)ynUJLZq83VkBzpn(qIxvhB8)l5Z12JBrCmSpRpBHmVRQdze8I3Z0YG0ZXYBpoiVTS1oJW7qGt1OnXL6Z1jMJzeVkAUEL14hBz4z(pyZi3Tk0rmq2WDRpRGLJoNO5k28oECWo0NnnJEkHxHAt5vBuT9(p8G85ZLNvu3wZ1v849OGzOnH57P5zrD6sEQNpN0)c5j0L29HTOUF7uSvKpWGu2FWG9SSbdyzBRN9mnUr)ycyhDnBsE2mrNBNUL2F)QTpO1vU(ABTrE1)XMBaEW4xDIgVoOV45KJnnbnl1iA2EMIp)G85abEghkFKgCEK9bR0rehFt28rkrxHSjC4MSzY4Emzt77sA6qAfkvWN7qBr5GDYYRL1tj2LPCdc8Cqc0oXMu2A4UKtaD1Tp3Nbrve3twFTTx7Me2CmF44uwkXU1E)YhKd1SDKk42BXwIjCLkZIqAQqWWotwHSVcKAg3Yr4k7Wi221nanzHGWw4iCdJrC7FEKgwF3LER)0lcc9I7B00FSTfe7ZwwQqYqROva2L(S5J8th2RrP2pQvZJrFv(RV2nKEk8x3j)5ugiQq0m3TPt)le(oi2q5TxvE6LCmert1OCRNHPn27RXEt2S6MAodJIX3dEfKqOthDIMxDhdlDnpimXKEAhng(IOytC5brKSv0LgS6Ove8jEyuJ0Z3)c)47oB6wugZYX9t7qgzvMABWwmHnxi3kHF5aLPKXNdM7rGtQj41jEpmhi6jfYhiIrVws1TdeyAlCCYn89yACVZARzzieOYGJyiN67yCKMJMmMoxUCODDRuHcIS7RC1xQbBw3ZyqSo7Tds8MOaEbNqzeNMmm11185MAUD0EcXOpeJgL4xUzJhDu99R1v4x3r4x3s4IZdcq46Q3OtPg17(qXQ2uiGBd5PjSSn99STCiLB0Srv2SgA8hFeGEI5KDPuBplgKxfInf3YbHAasfiLGAIBuyAtE4FSPLGbXHZMoctPgXAOP38S54A6wA2rHmc79fO16ytlpcgUVaBvYt1gXSjfXNx8ZUrXFUbXM4rae8pzHYoGOYwTQAjLYUe2plv4QelcaPcdeNf830tpmeKxuIzS2jUu(jHcN54OK0s(gwuiY21tSxHRrMscMMrApvc2iorfUZ7XMZfskAHrtklbgXd(2uhLkUBADjykUwH59ZYJ(WBLJvWM662CqfWUZP2QLNeGsAJfVAri4r8QQ2GrvirOtgcfWsvnp5ZjGJ8jKUG34XO0xyaUe0s0MEAPrqKUhCKXlxuvaa1hW4IPlkCV5Ppbk4zArSnIdXHWWIsLgImla4Vv(1xBZGYgPdUkiSuHrms70h86seJxEjmv8AzlWDiX19ilqOiiODmzxATwMTIqAswtme3TqImhvvNcuixDeOoc96qyHOUkT3LeUvzDqvwu7Kr8HlnY1yYMnn2FjBBeaiqEv1xLyxZBW9TmkzFQ2zUiKlAjPGiS4eOHG4vq9Wu4XWINjS2DKFmegvDKrGv9dGWMSH9DhbrabCDGVxS0wA2AgwoL3hY2qjRua2rnQ3DjNzooQ4ngBc1kxkvA791S9LLAUmcI7OsnkbECaXjY5uEOkXUDhQTLXfc11sxQRMSvKg8igsvcnha5T0uqYsKInVWWKH43LrF6rnBC3dYjzgTduqAsvgpfyN4Igdi0fQ6h8ozWYeRmwYr3eGyBJa)xgbMQcdIs(teEi9It0rfBpKNAKjm0wFEqDxrn3RLcVExOCrDo1z3t14d6p2Mmut)mraiUH)b40fqMDadikdEEuh45wO183Es5MD728O38vF5Bx7oJ(9)9VBQPY9o1UZV8t(4)9ut9gb6tmVK0bDnoXWxNu1qgN0bG5frsLSzMqrM3nvqdgXhhPFfHtkisZTNlbiNPJMlxtrDNW09VzP347)Gp6v7EzhRHofPdkwwZZZM8(wg4lUCOVLTrr40gXGtFbyD7lEsf1tyZ6Q(optsrxDkYWewgB2oXEEh5ZHcjXx8JT4JSCHwxW1VqI1h(kaGeCaJo1YjHuWk0j8XbIY5bBUfxSMZd2r01T0pEM)iOLS5pgIhXhQve(npZZkcGoNHAlSG36x)pX1mtjoW8SylobGIeof49W7wkNZi89fWnCafuOWZg3a4TSPnPaHFBi4ROe6aL1PRf(qzY2ZHseGPNyaV95vv)o0wqY0hzEWREg4SNqwYUwUyOtLDb8AEyLIaiHx9fScpJshfc)iD9Szzjk1euawXluwDglbDzyPrxz(v68xzHQPH6)svkS0FHu5on569dkQgNTOXBFbIpc5mo6qfoaiEPe4L3Zh6AY7m8CmFraFTEwMSftsInI)6LdbO3JTCcRVJaWgehP1IlZFE1xc2azrlbdivdfMz4OjZ1NqHYJ180nX6FMtamscWi4BilfvHYDiIxzgdoFVETb2Q)iGJZ2BJ)3gBTd(F7aDHb0BI6aTzVdF0ETlT)rvB0TJOr0BSf(Zne)8wan4Lsdsh15(I(tgD431O7JAazbxFlfQ5eBnoBFUYaHPDbZLDSgsLeHff72lIIZ(artZa6XXbWleNYGmeFJUnBXwibRUybNZNLEdKYc9DcXELdyEI)IBPOE)tCwj7WFPrqzbKitwcHZRkHQuAxPl0KTAgZuCEaZ7Bbr0yTF0MeEqxoii8eTfUb1tZQGZMkYted9s0EwwBOlS2(btbiQcEyV4Y(UHnWzi023Iz7ktCix5QbPn1hXaypnzd7OG1NTQ8JEnKbNnGCouWXHyl5NNlFofxQK8KNxx0R4qcVf3cAM27mmr5NWwTvukh6Us(vZLX8Io4lG6dSEIbyCK7W4KHGeIQYPRmFeUsIeWzI4OCCjGjrt5uCU124pV564p3esEs3LS4Jph6fTIjbIim6z1pCIvrei(nJtHfMkoxkcRoPXofAvxiXUghkg977Y1gsD2Z(mbYuuBks27qZ1W2NLg4e6sFLx3SCigMbAwmSJ(bJJjaC9(eUhOJ2I(5xAGMb5ilDofhJv1NQtyE3d59G8QderrmNqcNlmwqEKQkqZihnue(HlIJMQvXWgdd2IoqqRWySyw9oLohJ2FNALaIZYbCT5MI5BDR8JbCdrHTMoI9bK0GYlIMtu7kCuipPW8fSElXww2B2KnTjBKyC05UB7E139abV4nftT46BMpfWNOBtiHjBRwHZw49NuzFKtDjbQvthBODIuyhMjBXrHefv(evCWENkawcdFsfOkt12qNAX8gYG5fs3heE4hb2OpoTmwdIqTXOus0ZansGySml1K8IsiUiqefMa0rUr2rdgVYBk9UNJbrdlAPBt0CK9OghetEYib9q0DZuSsuTdMGlKq7JXfsAnwkvVgXoOKOfpinyuRshwA36neGr7Ct18SuvYZILPk4g95vVFZ7QgY5gIpEBripKOWjYMr1ShPgM8hMIMesPfFLyQmnFc4zaGgaisOlzRkCEqxXQkP42FVOMCQEwydIzdkMxZWOxM0uZxWc1oZXb(BSi6inC6B6uO1l6Po33IaqdYAdGhDz)x38SE13WwjBNCjYHEPUa6PHS7)cNIj9hsXg0h2rNtioMXn7QWDbgpipcCQWdvHvXvxpt)jbWhlanB55h8oXqiA3C)EvLieY4GnxpFq(HsuAqr9uoC)(XJcA1UE1oDLyeRorglbFu0eyNWSnwm1W46sCfTAceXJRzT0GuRrw6sUclLvPd86jaEuu8zfcrWdts(O)ZFU)B16kzhjGkBjbho5ZMlX43cLZ0u2R5psZbNxlofA6qGLQyq7YOLLEJR(tLdlQLQJBxi5aI9WUcmzlpjWwrMt)XPyjayeHOvkZUSNAi1q)X4e)YhaTKeSF5SDUiNh(dYLDQxcOMXHzybCLUMso3LGAHrO4QMBATB)V(6V(7MAQPQD7)N8xIpTc0A(3awI6bryP)8C1U9xn90fHp7sxFoazaHrcKJ(JJ18sZk96CGyeTQMrY)6vn8Uis5MK(0exru4OoH8QfcmUH8ZvJlugGLYKMIyzCt1SjYSdMfFbhIVhxZoXn1HxT4horoQPtSJp9lKgASUX2wDpAxg2uSSRKKLuuTtNYM0GydnB((tqBslaxe5iQuRUKw765vh9y1jf10XQXVdn1O6JA6D2b4Tt6PgCLezflIMAoEs2ylqM4WOQD7)7a8FdJFNCT71OEf1DYjOFT9g5X5WNmJxTXF4pajcq04EyPzXT6aOYCc0qqjBpewbZdWPcNAa9cWN)64yHlsABPRB3cNjfADGm6yzjcPsDzOlMsIdMOwIlXD3QL6w7UnKxuf6pUf(Z1fLO34gQgbXRbtqZ6LYbckgVPKUFRNWeKpqRpoIMyt9T6HD62U5rhi52cMWfnKZ9rshfDYYrIBErc259NmGM6INcYWUV1qCwJj7w6WMvUR8oVVr0p3b7wAGA0cjUfcm1jH1pOTDPfTmuwwyvBrTCWRmygD5LLf)(rat24qyFPv67Z9RIvkiOS83ovavUez1lMKZQmfBPjzaKe4YWSmksySyJezFb3rSQbyGrtWoHRuIykK9OFWMLQywf1QoWfBcOJUTGsq0tVAMGYyqnHQVsskKAPIRljXvWiIZ5Gi4IdrB91U(1d5Xj18m9uelvRQJrqI2nVG8uKr49L7eBXYL37Zkk)RiO4X0JHFFJ1GqCwHGqPW52HQBwwzQRF9LDRvVrZEDpSEJQS5Wg8RevfqrCTq0ikJk1xaZt2Nt9zXkdphfOEeWpbnQazsKwAYP(anmjg)wslLmgzfzrOe0FvTA2xzUtw(yS4wOq6ZUyXE8(NYm8IqAWXrioQzJA9W2RePw3u0m66IEdV1o5NuBGh(eBZjhdRUl)yx)O6(NJFlKjjGiNK8FjQtgrevoi2wO)IBeo6VgaLbyCezjr36Q(ERjgQQigwney5ebJI4Lut)f)aHA7cAzI2dZNl6QDsFfPXTWjzJoDuECqr)K90PsCKdykZvsUquU(R7M9tmCKyCWJ7lfO9BlGj3CR8ph)74c)BG4Ld8TTBXPdSSj)))!BBF",
  version = "1.1",
  author = "NoobTaco",
  dateCreated = "2026-01-06"
}

-- Platynator Profile
-- Optimized for NoobTacoUI aesthetic with Nord theme compatibility
-- Version: 1.1
-- Last Updated: 2025-12-17
addon.AddonProfiles.Platynator = {
  name = "Platynator",
  displayName = "Platynator",
  description =
  "Import a pre-configured profile for Platynator that complements the NoobTacoUI aesthetic. This profile includes optimized nameplate styling and positioning.",
  downloadUrl = "https://www.curseforge.com/wow/addons/platynator",
  command = "/platynator",
  instructions = {
    "Click the button below to copy the profile string",
    "Type |cFFEBCB8B/platynator|r in chat to open Platynator config",
    "Navigate to the |cFFEBCB8BImport Profile|r section",
    "Paste the profile string and import"
  },
  profileString =
  '{"highlights":[{"scale":1,"anchor":[],"color":{"a":1,"b":1,"g":1,"r":1},"layer":0,"asset":"wide/arrows","kind":"target"}],"specialBars":[],"addon":"Platynator","auras":[{"direction":"RIGHT","scale":1,"showCountdown":true,"anchor":["BOTTOMLEFT",-62,9],"kind":"debuffs","textScale":1,"height":1},{"direction":"LEFT","scale":1,"showCountdown":true,"anchor":["LEFT",-100,0],"kind":"buffs","textScale":1,"height":1},{"direction":"RIGHT","scale":1,"showCountdown":true,"anchor":["RIGHT",87,0],"kind":"crowdControl","textScale":1,"height":1}],"font":{"outline":false,"shadow":true,"asset":"Poppins-Bold"},"version":1,"kind":"style","bars":[{"relativeTo":0,"marker":{"asset":"none"},"layer":1,"border":{"height":1,"color":{"a":1,"b":0,"g":0,"r":0},"asset":"thin","width":1},"autoColors":[{"colors":{"tapped":{"r":0.4313725490196079,"g":0.4313725490196079,"b":0.4313725490196079}},"kind":"tapped"},{"kind":"classColors"},{"combatOnly":false,"kind":"threat","colors":{"safe":{"a":1,"r":0.3686274588108063,"g":0.5058823823928833,"b":0.6745098233222961},"transition":{"a":1,"r":0.8156863451004028,"g":0.529411792755127,"b":0.4392157196998596},"offtank":{"a":1,"r":0.5333333611488342,"g":0.7529412508010864,"b":0.8156863451004028},"warning":{"a":1,"r":0.7490196228027344,"g":0.3803921937942505,"b":0.415686309337616}},"instancesOnly":false},{"colors":{"unfriendly":{"a":1,"r":0.8156863451004028,"g":0.529411792755127,"b":0.4392157196998596},"hostile":{"a":1,"r":0.7490196228027344,"g":0.3803921937942505,"b":0.415686309337616},"friendly":{"a":1,"r":0.6392157077789307,"g":0.7450980544090271,"b":0.5490196347236633},"neutral":{"a":1,"r":0.9215686917304992,"g":0.7960785031318665,"b":0.545098066329956}},"kind":"reaction"}],"scale":1,"kind":"health","anchor":[],"background":{"color":{"a":0.44,"b":1,"g":1,"r":1},"applyColor":false,"asset":"black"},"absorb":{"color":{"a":1,"r":1,"g":1,"b":1},"asset":"wide/blizzard-absorb"},"foreground":{"asset":"white"}},{"marker":{"asset":"wide/glow"},"layer":1,"border":{"height":0.75,"color":{"a":1,"b":0,"g":0,"r":0},"asset":"thin","width":1},"colors":{"importantChannel":{"r":0.0392156862745098,"g":0.2627450980392157,"b":1},"normalChannel":{"b":0.2156862745098039,"g":0.7764705882352941,"r":0.2431372549019608},"interrupted":{"b":0.8784313725490196,"g":0.211764705882353,"r":0.9882352941176472},"importantCast":{"r":1,"g":0.09411764705882353,"b":0.1529411764705883},"uninterruptable":{"b":0.7647058823529411,"g":0.7529411764705882,"r":0.5137254901960784},"normalCast":{"b":0,"g":0.5490196078431373,"r":0.9882352941176472}},"foreground":{"asset":"white"},"anchor":["TOP",0,-7],"kind":"cast","scale":1,"background":{"color":{"a":0,"b":0.7803922295570374,"g":0.7803922295570374,"r":0.7803922295570374},"applyColor":true,"asset":"grey"}}],"markers":[{"anchor":["LEFT",-78,0],"scale":1,"color":{"b":1,"g":1,"r":1},"layer":3,"asset":"normal/quest-blizzard","kind":"quest"},{"anchor":["TOP",0,-10],"scale":0.8,"color":{"b":0.9019608497619628,"g":0.9019608497619628,"r":1},"layer":3,"asset":"normal/shield-soft","kind":"cannotInterrupt"},{"anchor":["LEFT",-83,0],"scale":1,"color":{"b":1,"g":1,"r":1},"layer":3,"asset":"special/blizzard-elite-midnight","kind":"elite"},{"anchor":["BOTTOM",0,12],"scale":1.25,"color":{"b":1,"g":1,"r":1},"layer":3,"asset":"normal/blizzard-raid","kind":"raid"}],"texts":[{"widthLimit":124,"truncate":true,"align":"LEFT","layer":2,"autoColors":[],"color":{"r":1,"g":1,"b":1},"anchor":["RIGHT",64,0],"kind":"creatureName","scale":0.8,"showWhenWowDoes":false},{"align":"LEFT","layer":2,"widthLimit":0,"truncate":true,"scale":0.7,"kind":"castSpellName","anchor":["TOPLEFT",-60,-9],"color":{"b":1,"g":1,"r":1}},{"widthLimit":0,"displayTypes":["percentage"],"align":"RIGHT","layer":2,"truncate":false,"anchor":["RIGHT",60,0],"kind":"health","color":{"b":1,"g":1,"r":1},"scale":0.8}]}',
  version = "1.1",
  author = "NoobTaco",
  dateCreated = "2025-12-17"
}


-- Cooldown Manager Tweaks Profile
-- Optimized for NoobTacoUI aesthetic with Nord theme compatibility
-- Version: 1.0
-- Last Updated: 2025-11-27
addon.AddonProfiles.CooldownManagerTweaks = {
  name = "CooldownManagerTweaks",
  displayName = "Cooldown Manager Tweaks",
  description =
  "Import a pre-configured profile for Cooldown Manager Tweaks that complements the NoobTacoUI aesthetic. This profile includes optimized tracker styling and positioning.",
  downloadUrl = "https://www.curseforge.com/wow/addons/cooldown-manager-tweaks",
  command = "/cmt",
  instructions = {
    "Click the button below to copy the profile string",
    "Type |cFFEBCB8B/cmt|r in chat to open Cooldown Manager Tweaks config",
    "Navigate to the |cFFEBCB8BProfiles|r section",
    "Paste the profile string and import"
  },
  profileString =
  'CMT1:{"trackers":{"items":{"cooldownTextScale":1,"zoom":1,"borderAlpha":1,"hSpacing":2,"compactMode":false,"vSpacing":2,"barIconSide":"LEFT","compactOffset":-4,"reverseOrder":false,"aspectRatio":"1:1","alignment":"CENTER","layoutDirection":"ROWS","iconSize":40,"barSpacing":2,"rowPattern":[1,3,4,3],"barIconGap":0},"buffs":{"cooldownTextScale":1,"zoom":1.1000000238419,"borderAlpha":0.5,"hSpacing":0,"compactMode":false,"vSpacing":0,"barIconSide":"LEFT","compactOffset":-4,"reverseOrder":false,"aspectRatio":"1:1","alignment":"CENTER","layoutDirection":"ROWS","iconSize":35,"barSpacing":2,"rowPattern":[6],"barIconGap":0},"essential":{"cooldownTextScale":1,"zoom":1.1000000238419,"borderAlpha":0.5,"hSpacing":0,"compactMode":false,"vSpacing":0,"barIconSide":"LEFT","compactOffset":-4,"reverseOrder":false,"aspectRatio":"1:1","alignment":"CENTER","layoutDirection":"ROWS","iconSize":43,"barSpacing":2,"rowPattern":[6,6],"barIconGap":0},"utility":{"cooldownTextScale":1,"zoom":1.1000000238419,"borderAlpha":0.5,"hSpacing":0,"compactMode":false,"vSpacing":0,"barIconSide":"LEFT","compactOffset":-4,"reverseOrder":false,"aspectRatio":"1:1","alignment":"CENTER","layoutDirection":"ROWS","iconSize":30,"barSpacing":2,"rowPattern":[8,6],"barIconGap":0}},"version":"4.4.0","profileName":"NT"}',
  version = "1.0",
  author = "NoobTaco",
  dateCreated = "2025-11-27"
}

-- zBarButtonBG Profile
-- Optimized for NoobTacoUI aesthetic with Nord theme compatibility
-- Version: 1.0
-- Last Updated: 2025-11-29
addon.AddonProfiles.zBarButtonBG = {
  name = "zBarButtonBG",
  displayName = "zBarButtonBG",
  description =
  "Import a pre-configured profile for zBarButtonBG that complements the NoobTacoUI aesthetic. This profile includes optimized button styling.",
  downloadUrl = "https://www.curseforge.com/wow/addons/zbarbuttonbg",
  command = "Options > Addons",
  instructions = {
    "Click the button below to copy the profile string",
    "Press |cFFEBCB8BEscape|r and go to |cFFEBCB8BOptions > Addons|r",
    "Select |cFFEBCB8BzBarButtonBG|r and go to |cFFEBCB8BProfiles|r",
    "Paste the profile string and import"
  },
  isCustomApply = true,
  applyFunction = function()
    -- Check if dependencies are loaded
    if not zBarButtonBGAce or not zBarButtonBGAce.db then
      print("|cFF16C3F2NoobTacoUI|r: zBarButtonBG not fully loaded.")
      return
    end

    local LibDeflate = LibStub:GetLibrary("LibDeflate")
    local AceSerializer = LibStub:GetLibrary("AceSerializer-3.0")

    if not LibDeflate or not AceSerializer then
      print("|cFF16C3F2NoobTacoUI|r: Required libraries (LibDeflate/AceSerializer) not found.")
      return
    end

    -- 1. Get the profile string
    local profileString = addon.AddonProfiles.zBarButtonBG.profileString

    -- 2. Decode the profile
    local decoded = LibDeflate:DecodeForPrint(profileString)
    if not decoded then
      print("|cFF16C3F2NoobTacoUI|r: Failed to decode profile string.")
      return
    end

    local decompressed = LibDeflate:DecompressDeflate(decoded)
    if not decompressed then
      print("|cFF16C3F2NoobTacoUI|r: Failed to decompress profile string.")
      return
    end

    local success, profileTable = AceSerializer:Deserialize(decompressed)
    if not success or not profileTable then
      print("|cFF16C3F2NoobTacoUI|r: Failed to deserialize profile data.")
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

    print(
      "|cFF16C3F2NoobTacoUI|r: zBarButtonBG profile |cFFEBCB8BNoobTacoUI|r applied successfully.")

    StaticPopupDialogs["NOOBTACOUI_RELOAD_UI"] = {
      text = "zBarButtonBG profile applied.\nA reload is recommended for all settings to take full effect.\nReload now?",
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
  end,
  profileString =
  "nsvBtQjpu0Fr7ockc(rXzT1oU4og680(LmtacivmxEscJZ2F9nHeqa1P9d(69MCoN75Cb7GJXOuOHjpKNlOYFIJMHr1CiDDL8lvW1nqfW1nruvEDLhgXXroyuH(NlXOe9NUyjgDHKYHiYf6hGOuwcmmk8qC8H3Ta8FLzYt4OfUQd1iLadj)SIIrO)VHWP6MGQm4kBmIgaNza0a3iWgs7Z0ptkzzFLwwCsQyPRrj9YWcyeWuVNa8mkFiyogOuQXOo3HQZE3g4(rlCTQAlOEvrkey0HVhVFx0B3rot3ItW1qs65mouJdvxT977P5Y1z)QriVqzkwp)wPyOEsLrY5zUsG3qI3iOBQicr7r2XyuooPxoA2Jk)n1mS65T(VXOpG66sM4fe9szOYBgOy7zwAKfQcKAPvWv1Z0IBeOHTtAnQJay6uJYijv02JNtYOBSXb956giVteNPzXqyB(r350KQ1IpsRRiP0jiEtPw5pmsAHieux9LjJ9(BPlAnVZq7LMOPOGkK0S1P6S)djZGH(uXZjSc6owwzkrc8X2RVDh41fDjZz(wh2P1Il1U6JsYDjcNU21D3BIpYH7v63u6VmxtN2n59VTT7bf3dKbgdio3TSmA3CmUdsv9lTEdiXa)zWZOS7tpyGpr(ZDw0VsS6g76S6JAeN40wA(pOrT9FCKRPZJqJCKvSnWzPRVV38vbZ9MfSiaN)IxRFU1BPNJN)s3zURc8w47QRSuJYZQK8Skt3YpOjXO9T)UEKy8F(",
  version = "1.0",
  author = "NoobTaco",
  dateCreated = "2025-11-29"
}

-- XIV_Databar Continued Profile
-- Optimized for NoobTacoUI aesthetic with Nord theme compatibility
-- Version: 1.0
-- Last Updated: 2026-01-05
addon.AddonProfiles.XIV_Databar = {
  name = "XIV_Databar",
  displayName = "XIV_Databar Continued",
  description =
  "Import a pre-configured profile for XIV_Databar Continued that complements the NoobTacoUI aesthetic. This profile includes optimized bar styling and positioning.",
  downloadUrl = "https://www.curseforge.com/wow/addons/xiv-databar-continued",
  command = "/xivbar config",
  instructions = {
    "Click the button below to copy the profile string",
    "Type |cFFEBCB8B/xivbar config|r in chat to open XIV_Databar config",
    "Navigate to the |cFFEBCB8BProfiles|r section",
    "Paste the profile string and import"
  },
  profileString =
  "9v1sZnkoq4Fo7Pjfymg8X4xtMQg)OcS7SNyIm02Oncjwj5xZH8BF7wcBh7KzpHqDR(5x)1fHf5fzTA1gUaOJGKTwaZpzR5LRuAltykwxKzabuAHQNaM2wBSkjyq1TfzBbjOzcNzuCjEZ4PlYN(Cr2XLB2yaBXIGIS1m9kLHB5kzr2OL55lN7UCotVLlVOcRQIl3wSiQi70TVE2oHWuQbqwmYDXyvZAM9jEfqX3odmvS)p)gjudcMLVhwDB4iuLVcvKcnQQDciRLv6DwNhe8T1xmiEXp4v26IfHrdIPeTCNodygLCPuCIuPujuAkVLkDJVcWWW9HKymgOdPy1P77A)x0mCjRKIUlQ3ZREOt5qNQHKIyknEm5NA1EW5hTRyCwRzXrdshomPF4Wbj4N(fB(sCu3lFIEd(8Z1QUiLvmljoTFyssAqCuV0Ou3R6t2E2GK0W0HHPjrbjd7nCajza5VFNK1)oj(yihoADza(RfptbWgL0MX)fqLvevHLnXSRx1ZRqr2kvBlxA(sg0WhPevKjQFh077CdzUfHdd6fLGikT6vq)2l5AM0GnAgb0E7L5mRMFevlPxyYWISPwqlzcNE7reT(pmV9Y7G0fl6ffheIP2Zqf0kuNAaPfTJdWqUlkof7M58g4at86NzG(XdtWU0Qhw(q2d5pqbHX6vC6Xwny(OlhmifZbuQahr2dFWIdIrey2yLPHxENWWbrb9rH4LvcVTvAd0WKFiYctthgJv4jQgedIZY3lVFV4(O8CvdgcQnyvsDalIEwaYv9gMGnTVQbMDdZwtf8FGJyFwviinjarvtaOT6ai6k1tjva59khIPaMdt0mq6YqeUUfAiZmmiYNDNv3hzOvE7Lzcwdqid)8mXhLz1SkW8kxiUsM5M5n1Qd5kLWYBppuqthe0KjWM8DQluSk1oB2bUTet0PxL4v673k3XQWLDmgXb37pRlYqi3DU5dCkFg9lrPXKvyB7xWtg)8eIe0Q5GChzWT74IZeB8nCqF2XerrznZ6yWRvTo2eq4(YkRPpnmUKSZf2WE(y)RZxMpHu4F3bgNbArY4r3wtBXoljszYuLCMGM49JXDfvYFiH6JTTJX5AK4ZZBsm3tL05)rTJMiPJInBjJwRqQJ76yUAqdLTJ8g8DUdFjVujVj(DsD13AM2f7776cybxdYYt31hi6PLYNPfaND9FVcXiFcY5y7ih2z9vJLxJ7LkYcE3nhufzrb9sVE1seQJxf4wcSL40(iaDgANrSTuUCPeSKg0EgyIgZ5RYiAZX42ntxJvBZPYgcs6GhL0YU7CWvQ3Eb(Q409yp6Cr0ICAZOfzewfhz3dp2SQH28RXvjeJN30E6S)sj21a3NcwOL2O5wFzoH)28)pfIR7vstUcB6hqCt3yZJcXsjgGBU0l(Hs7a4Ozz6g)QSdmTeB4t2PzR5cU9KpVUZzFtSxC(8yLs3vGS3osHkuXem8QFwB(PbxAGiPSj(RULTIM9alJIacCHqAC6pBHsTgH3ytho2sTdQCHRDgKmOF)eA1JM6GfzFNZQqR7cHI)7p",
  version = "1.1",
  author = "NoobTaco",
  dateCreated = "2025-11-30"
}

-- Add more addon profiles here following the same structure

-- Sensei Class Resource Bar Profile
-- Optimized for NoobTacoUI aesthetic
-- Version: 1.1
-- Last Updated: 2026-01-06
addon.AddonProfiles.SenseiClassResourceBar = {
  name = "SenseiClassResourceBar",
  displayName = "Sensei Class Resource Bar",
  description =
  "Import a pre-configured profile for Sensei Class Resource Bar that complements the NoobTacoUI aesthetic. This profile includes optimized resource bar styling and positioning.",
  downloadUrl = "https://www.curseforge.com/wow/addons/senseiclassresourcebar",
  command = "/scrb",
  instructions = {
    "Ensure you have an active Edit Mode profile selected.",
    "Click the |cFFEBCB8BApply Profile|r button below.",
    "Reload your UI (|cFFEBCB8B/reload|r) for changes to take effect."
  },
  isCustomApply = true,
  applyFunction = function()
    -- Check if Sensei is loaded
    if not C_AddOns.IsAddOnLoaded("SenseiClassResourceBar") then
      print("|cFF16C3F2NoobTacoUI|r: Sensei Class Resource Bar not loaded.")
      return
    end

    local LibDeflate = LibStub:GetLibrary("LibDeflate", true)
    local LibSerialize = LibStub:GetLibrary("LibSerialize", true)

    if not LibDeflate or not LibSerialize then
      print("|cFF16C3F2NoobTacoUI|r: Required libraries (LibDeflate/LibSerialize) not found.")
      return
    end

    -- 1. Get the profile string
    local profileString = addon.AddonProfiles.SenseiClassResourceBar.profileString

    -- 2. Extract the encoded data part (SenseiClassResourceBar:1:<data>)
    local prefix, version, encoded = profileString:match("^([^:]+):(%d+):(.+)$")
    if not encoded or prefix ~= "SenseiClassResourceBar" then
      print("|cFF16C3F2NoobTacoUI|r: Invalid Sensei profile string format.")
      return
    end

    -- 3. Decode and Deserialize
    local decoded = LibDeflate:DecodeForPrint(encoded)
    if not decoded then
      print("|cFF16C3F2NoobTacoUI|r: Failed to decode profile string.")
      return
    end

    local decompressed = LibDeflate:DecompressDeflate(decoded)
    if not decompressed then
      print("|cFF16C3F2NoobTacoUI|r: Failed to decompress profile string.")
      return
    end

    local success, data = LibSerialize:Deserialize(decompressed)
    if not success or not data then
      print("|cFF16C3F2NoobTacoUI|r: Failed to deserialize profile data.")
      return
    end

    -- 4. Get active layout name
    local layoutName
    local libEditMode = _G.LibStub and _G.LibStub("LibEditMode", true)
    if libEditMode and libEditMode.GetActiveLayoutName then
      layoutName = libEditMode:GetActiveLayoutName()
    end

    if not layoutName and C_EditMode and C_EditMode.GetActiveLayout then
      local layoutInfo = C_EditMode.GetActiveLayout()
      if layoutInfo then
        layoutName = layoutInfo.layoutName
      end
    end

    if not layoutName then
      layoutName = "Default"
      print("|cFF16C3F2NoobTacoUI|r: Edit Mode layout not detected. Using 'Default'.")
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

    print("|cFF16C3F2NoobTacoUI|r: Sensei profile applied for layout: |cFFEBCB8B" .. layoutName .. "|r")

    StaticPopupDialogs["NOOBTACOUI_RELOAD_UI_SENSEI"] = {
      text = "Sensei Class Resource Bar profile applied.\nA reload is required for changes to take effect.\nReload now?",
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
  end,
  profileString =
  "SenseiClassResourceBar:1:ns5ZYTrrqy8sLscGXeK3GJXoy8MayOaSvsOGBCqRSuSQYYsz16KQOOkRz3T1ot5rZm1mJWr(yQCGZ6ripc(rGNGU0JqEeYzoKzwha)VdCuQ7D7VVFFDVv2mkQr8GFrD3bqMuKt0tJbJCIodIi6DI(ZV(TPKSJk0YjI8b2PCqT8GMXrHdGXSTSAIWOiAqyFDkr)mMHL66iCxIjmHOlaRRpoKzH8WEXHDeHnLJtj2ttL6Cq3uYL62bKQbPvckQeOR8gklh6seKEIyjhw4Cd)CnxnOOAGU6RTWlSTL6XeRU5eTxfQGXeZrne5rLdOuWrjuMiy6xulAK01XV2ryb9isguVrEEpHPEFoXovqSsD9ggdyn1B7A09)sLIjmB5TAKKNVT1o6LgQ84e3ChMsbwb1U8mNXh4aHLK2T1oDoO7SYwyzhzg(s)ehWobwnwjzcBAZw7N0kE(iIXPHdu5elygo7ywUL2vMdQ1hmvKf(CMLg2YjfHLr4oM5gU8yH5nMXsPL2xll0GX9Gw3u(pUOlHyAf1AEk(CkJdDDKZb)E6Nbuw2eoqvR5LxBnPym4l1xEmODrT3tu1DabXLG9(dqZjttKffCy48rmoFhM2LJmPy(EWiBOvgg7T)CFg03vYf9sXdE0Jv3B01(UVA8f8IkZ9gWfpzhjC(PACjiE1IVDKudNBLB2(jhUVlqF4phBYiCOQAdVdJ4StoHOZVYM7bm6PEY3BILZeGU3bj71z)wQnUEP9VYp6rpE7FAM3rn4ScbUIQ2ed8pV1gwoXqllFvZCkfiCl9SBM7J)iUfEZ0Dz55Ga)E8hWp6cDJlGFmUi(jbtFkEBvq562V3oUZV90KdpC7KK2yTH4sBGb4DWLxfVlUc(5dXvtDxgtiC8EdX1P4xsXngIH49Xh44o(vxCcvXBOw)8uYTLp1FYjSeptCmc)MxTi(D(CqvZ35ULw49xE4hCHdtCt1sL39TFsyBsoe63cWTXvM7iuthymLmzi(Wlid1N1xZgFLpQuci1s(nr)XEdtFWvtyP4nXBD5j)HlCz6Tj(TNrV)UgEB8tVEyHR9)ItEg4yLJdL5KlyC8WBmSo9sMj9j71lQXEB(xNbQsdBw40YvP3)J3b",
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
