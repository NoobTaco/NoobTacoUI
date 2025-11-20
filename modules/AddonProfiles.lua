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
