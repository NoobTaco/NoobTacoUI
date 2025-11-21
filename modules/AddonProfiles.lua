-- NoobTacoUI-Media Addon Integration Profiles
-- Pre-configured profile strings for compatible addons

local addonName, addon = ...

-- Profile storage table
addon.AddonProfiles = addon.AddonProfiles or {}

-- BetterBlizzFrames Profile
-- Optimized for NoobTacoUI aesthetic with Nord theme compatibility
-- Version: 1.0
-- Last Updated: 2025-11-14
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
  "!BBF9L1YVTXXzCZOGM4gyukQ3wofmPbonOiQ(rtBQVytkrjQallgrARKEAhU7qUB8YDMo7sttFPa(pGICP3kYbFOOx6fFONl0Tcu0AiGIMtffcf9ypW(pq)(Mx7ZeFWIyMHZ89433VVhS21B7rsiFzTF8zc(ditOX7hiItCEH704e2KDzEu(9(WpSzNOeQOPAXMUWQnhsdzZA6tf0DAUpLg2CKGsBMWGDJsiUjnNqBEVHmVGrZ5R9lNsNshemHkoLiIcIgJF(k8TsiIX0KorH4FBnvq2xeqJ8cN7WxV0EDIOtGnEh)ap6dJcs2xaYBVqYCQOpfEvVtOXSPcxQ)conzxsCsBI40aVe))gFz1TTlBchKn82CUyCiX70GObcI7JPchEt3qsC8USqMyFgOQNq5ttijbSOb0NMmvqD4Bnc3WJ2E6Or7hec2K2Hbp7zeHNd)QQNOYnZiq9DjH0L4RGAH8zazAij5aWA6ZxoIjMqGVf9aq3oIgn1NVwQynq(cs3eC2sgvFEDAezyiTDW49OdbXi25cPeJkm(cXo81KlOfMdbZMwG2KlTK6nKx7Uu0R7ZBuEl455IGiPLSpNggEOxS)lrDQnzCmCkNZsfVd3BZ383)cJ3oR5bS8HbaCJVLsWvEZ0takLdFB1ZN3WA)MlNXL0rEjW3q9sTI8Kw4UmrWZquz4be(BWx3vAXpmYlWLKWe99zZ6t4aKldaaXww3EEdG0G19U)VBF77DPlvtJjgWg0Y7lG4JjGr7yWYtt(8A8vk8uFwpwCn(1YlE9bpEO0qQ8e5Fnja(1VYljWbgmNdad(LnyTkF0ZfugNgDmhrUX(p3Ne3N8eQNZzWN21NcGDVhg4WxXJiE8rqOmc1gWyHjbCaTzduYk3o2aiLq95s9O(in(1gtXRNc07sdg7NSgFvi(kGeMAULA55O(CQFqcfDJRZ3M(uYeEiTjUEZ7C7M)qpAinHc0iFW6TJarKVDh9rAv(i8vaBiB29T8iswSfPyWwt9cyGlooHsct8TsJcXb69eYtvXmsxVo85D4RgdOJEerY8mHmo8vjdJzIHfukEDx4qdjsFNehDNL6T0n25NvJ3iKfhF8ODbyOGfQp(QLOtAfgcYcVW7zVDVJirKXaFhtKid4BmcLwuJpHnR1e20Oe4TYYezIjwo7LQJHxJ9e4U8dOHEXwgvGJaOrKSUEsujWg1BPBUZprlULGgnKMiRFxzGQN95(8SW(SQ79PXXhfaVmfzzY8nuGNT4xTcc3usdEb6Im71Gb4)jGOl1H7dRfxWgidS(Zga)j5bPOciV8oHGWjTl(8vksGbElakyV0HkLxfKVMNyAGxRWzK5XiddA2yGmSrfPVqVQp)9Ytl0saCIixVe9Dm4PeW30q4L3rULR22Je2IP8euoK3cKaWGqIvUblFLwKtzqCmAyHi43EcGtmjxHVO8m9iq6ZGO2h4SiI1dWJcsqcsNaPMwx(ehoHdltujjWSpolmuoOpFcH7l0fD4CUK6nWvHa95xvz9ttbVRLAgQaOygXkYuVDzW2PKexFej4Z3ukGvU1wvLDygt4b(Uv8bYdiFMzpLb9Qvz8Bf56ZeNCYHh0DaarMccJw2KY9jh0(tQ171VXo)8BTe(Np(JUiL5udGstdKdyTvbzpBm0MvjkQVwDJTxFHGr(AfyM3doXHcw0EZiIrolcPJjUZL4wur)TWtl5t7dMAuassyrW6bOD)xpS9XdgC8rVXRIVC37n538x)tqQX3Q79(fFW7)VU0LEnJYKXFQCLxtq9M6s74PWo9bcDxC7wHCFiDY7xuF6ciYqevstxdSL3P2sqYw1BGIxGRwlZYqQGZq(ZAYKpwYI)4MV2x)dU(R(Ol6hmoQjBuZ2KKKq67g4HBCX4PbHEnD9HCpGGToCUdKRSREf(kX6VxIpTzSld91WX4R0pZ69vRdjGYE4hhiMeedfrJNF9CN3UfWVc(MjZcIYjf8g9TlBeLZmxEGqEMZm3i6v387S8Vd0s(ANcGzCrst4tj(ZBc0yZrTfoWB(R(h4zwws(0SNGcKBs)fSpS3M1IMG73aVWrmqHSVnEbWU86(mOi2qau2ufcIYA9U2fvrSphYWaMEQhS7Z7O)CwehcA)l14VDva69cIrx9U75ysjLgJOcj3CebjzCfmSg6op1LYt(ue7c0NUQ6vYMCdYqdONCzW0PC3OqE(b0yjqfk1wZwR2xvuqXmbsHjdbSksSilIoHjuaIY2yR9OrH4ZJfUoMK7ztI5D5xycUFyGpFJc5rsRSCvwu48EKip6KaxCDG3G6i7fXJgPmTcva4RIlv4MIwOIuYzypnKwfRryvmRxp9EIiQuP9ZW5PPs)MAcH6zBdr1YbiArJ)S3YudAwIZ1ZDjPoZZTfnRo3MtWSqaa44HFbQ0pHABfC7s6yww2vlMIqzD)rFlKv7b19LJWAPA1QqHGwgYxOTgXykR0NefrdvvwIuEBKron(vzMwORrtTI9ebq)pjZrh03Drbr3)CGdI)qUhjHEum0S1kyXCDL4bjKvboxlvOYfNvzDhgWMbtklHsN8ZpVdtDlvKRoBdELgeGJPvsde)ruOCyxz7DxgQpYeVjdoq(EGucHFpHlruOO4xUB0Ei)mwRmebn1uFw7XzZA)j1Qvdzl(OsXgDNoHePTEPLcRRoBLu)STTwiuX(i7dGdBvblb)J)UvAxH7ULeNEmeg7FMPoofltkda(oW1xGLrvqYWD78GbDoXmDLuThVYJO(NBRsaLhuxVvzlv249c2HhcyqIheV7gsjrko2m(Y1ZbUZawYZQPTBfRsl9IwOMQrgU3vkiikKvzCRUyibvvtljCIECkMGr5DQmw3AWX94ncICfusSer1hQYnbWFRLFGaGJrYNXBG36NMwKuN5uZexkzQlOZkdXl4wP1MIjxxCqwI2MMuXpe3cQ)uowUCLBRBq05LUs6tvr28gZiXhhDFgw4(4(GArbzE7EPOt8wZ32yEZISbtNYWZmmDDI8q3hcD(Pq6t4wTcgM3MgAYvwO9ke0TeFn5yoyJhhsXZPd(281UY3)mghErravaQacWm8BQee4PX(gSC8v0DZMz5zYtxUzzkiJBkx)w68T8g2N3ckV()(p48M9EDN00mkm4gLYLyU5nstkcDxbSzqpryUxCMF5PPv4XxfWRxyevX2UG1c4dyOnRnuIhKhtwNlGeDFmwNJnklVZCRYLlOgL0NP5n3tqgdDtgoxsBDnTVFpk(SEwiGEChDV7)8R(kO4)l19U)x1hu5(lLJ9cRzsH8ViEQak6eeBzTNoLMDMYAUYiCcPj6EqisYCh9msTv9hBNQdrwmdCUYCSQshl13)YzOwSMOcHizdq2WtvnQcCJOjvp)q)8vgyvIcTy5GsgQlSvdAcYlscNTGKIKFpGgcfQ9Uvi1LjWjEEpSu2oGvi7az1dgZM7s8eikeTR3CNBCJfwhPcL(svNGYoFT5O0vMrRSpVU39)mc)3y(6M0pw4IA0l63iZySFVVfkiaCismKqFmaoa(7eARWemKfHU4KzCQUVDLr3XMh8rbJrurXurzkwOEMUwKqzv)8q0DE)Qzgj(5hdLc9Va83Y6ToosQXqrr6A(aNJr(W3tfMjBzj9)GnXc4IhEZD(4DUP7556(bIousy7WPuPu2JbxzCHz0j9qlKRiLatI5SSFMbcTsokh1QBuXal0nJvLDwTvEcjfj3Fhz)yHESzrpkGodZOGkUNZ50NIjsEKc7X3OD79VttLgdDYEk85BTZn25gvrOf3dOyzZUc)Q2IUEebmhLzfuLNMRyZgf89YP(vpBErDkTI9IQa95YFOTQFJCUqdanmqVwgUlGlz7kj4008lke(JfZKwlLTJ1gip8bc2uE6jVW(Jxin(FDTVxEntxUuw3KYZTAb0Tgglh6joRYymRtSjWPYFHVISw6XEv8lO)z)UwMzvR)jhYmY6fwFKMxoTRBPKHXtYQKK)cbP)Il6YKwKMjUhBg2b4gUM8PfZWvR7D)Y61BIz2wBAauqayzKFPu3BotyUkrlnR)vZnw(QNUGYWOBRV8uvHgETrTLa0NBCWkr754V2l(Zi9Yrtdd7jyJccP))p!BBF",
  version = "1.0",
  author = "NoobTaco",
  dateCreated = "2025-11-14"
}

-- Platynator Profile
-- Optimized for NoobTacoUI aesthetic with Nord theme compatibility
-- Version: 1.0
-- Last Updated: 2025-11-20
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
  '{"highlights":[{"color":{"r":1,"g":1,"b":1},"scale":1,"kind":"target","asset":"wide/arrows","anchor":[]}],"specialBars":[],"addon":"Platynator","auras":[{"direction":"RIGHT","scale":1,"height":1,"kind":"debuffs","showCountdown":true,"anchor":["BOTTOMLEFT",-62,9]},{"direction":"LEFT","scale":1,"height":1,"kind":"buffs","showCountdown":true,"anchor":["LEFT",-100,0]},{"direction":"RIGHT","scale":1,"height":1,"kind":"crowdControl","showCountdown":true,"anchor":["RIGHT",87,0]}],"font":{"outline":false,"shadow":true,"asset":"Dosis-Bold"},"version":1,"kind":"style","bars":[{"relativeTo":0,"scale":1,"aggroColoursOnHostiles":true,"border":{"color":{"r":0,"g":0,"b":0},"asset":"wide/thin"},"marker":{"asset":"none"},"colors":{"npc":{"tapped":{"r":0.4313725490196079,"g":0.4313725490196079,"b":0.4313725490196079},"hostile":{"r":1,"g":0,"b":0},"neutral":{"r":1,"g":1,"b":0},"friendly":{"r":0,"g":1,"b":0},"unfriendly":{"b":0,"g":0.5058823529411765,"r":1}},"threat":{"warning":{"r":0.8,"g":0,"b":0},"transition":{"r":1,"g":0.6274509803921569,"b":0},"safe":{"r":0.05882352941176471,"g":0.5882352941176471,"b":0.9019607843137256},"offtank":{"r":0.05882352941176471,"g":0.6666666666666666,"b":0.7843137254901961}}},"background":{"applyColor":false,"asset":"black","alpha":0.44},"anchor":[],"kind":"health","foreground":{"asset":"white"},"absorb":{"color":{"b":1,"g":1,"r":1},"asset":"wide/blizzard-absorb"}},{"foreground":{"asset":"white"},"scale":1,"colors":{"normal":{"r":0.9882352941176472,"g":0.5490196078431373,"b":0},"uninterruptable":{"r":0.5137254901960784,"g":0.7529411764705882,"b":0.7647058823529411},"interrupted":{"r":0.9882352941176472,"g":0.211764705882353,"b":0.8784313725490196}},"background":{"applyColor":false,"asset":"white","alpha":0.15},"anchor":["TOP",0,-7],"kind":"cast","border":{"color":{"r":0,"g":0,"b":0},"asset":"75/thin"},"marker":{"asset":"none"}}],"markers":[{"color":{"r":1,"g":1,"b":1},"anchor":["LEFT",-78,0],"kind":"quest","asset":"normal/quest-blizzard","scale":1},{"color":{"r":1,"g":0.9019608497619629,"b":0.9019608497619629},"anchor":["TOP",0,-10],"kind":"cannotInterrupt","asset":"normal/shield-soft","scale":0.8},{"color":{"r":1,"g":1,"b":1},"anchor":["LEFT",-83,0],"kind":"elite","asset":"special/blizzard-elite-midnight","scale":1},{"color":{"r":1,"g":1,"b":1},"anchor":["BOTTOM",0,12],"kind":"raid","asset":"normal/blizzard-raid","scale":1.25}],"texts":[{"widthLimit":124,"truncate":true,"align":"LEFT","colors":{"npc":{"tapped":{"b":0.4313725490196079,"g":0.4313725490196079,"r":0.4313725490196079},"hostile":{"b":0,"g":0,"r":1},"neutral":{"b":0,"g":1,"r":1},"friendly":{"b":0,"g":1,"r":0},"unfriendly":{"b":0,"g":0.5058823529411765,"r":1}}},"color":{"b":1,"g":1,"r":1},"anchor":["RIGHT",64,0],"kind":"creatureName","scale":0.8,"applyClassColors":false},{"color":{"r":1,"g":1,"b":1},"widthLimit":0,"truncate":true,"align":"LEFT","kind":"castSpellName","scale":0.7,"anchor":["TOPLEFT",-60,-9]},{"displayTypes":["percentage"],"color":{"r":1,"g":1,"b":1},"widthLimit":0,"truncate":false,"anchor":["RIGHT",60,0],"kind":"health","scale":0.8,"align":"RIGHT"}]}',
  version = "1.0",
  author = "NoobTaco",
  dateCreated = "2025-11-20"
}

-- Add more addon profiles here following the same structure
-- Example:
-- addon.AddonProfiles.AnotherAddon = {
--   name = "AnotherAddon",
--   displayName = "Another Addon",
--   description = "Profile description...",
--   downloadUrl = "https://...",
--   command = "/command",
--   instructions = {
--     "Step 1",
--     "Step 2",
--   },
--   profileString = "...",
--   version = "1.0",
--   author = "NoobTaco",
--   dateCreated = "2025-11-14"
-- }

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
