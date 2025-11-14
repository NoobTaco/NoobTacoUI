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
  "!BBF9L1sVT1XvyZOGgNgyaksrjzlNcgNa3wuebz36MeVXHuVdSKyePTS3DhDVd5DIhENPZ9sttVPf(hqr(buKfErr30ngODDG2vGc0aTPDrrxi01DH(f0ZzECFYeVWIyMHZCE(D(ohw72DdijKVU2hEMsEizmnEhMkoX71(tIteJ3ueqLF(h)XT3okHQABwSTpSA7tPCX02HufD927qP82dvuA7ebSBucXpP9yA7p)uraB4mzRFZe6e6a2yQ6eIkIfnc)81KxpHOgrt2oIJ)TZefzhfJgfWN5jxUYEBhrhpZ7sjnztsCsxI6ewqs4)qUO5KBkglH3fpPNSblYxrjX6Vy)efOJENBo3aXGN2textU0qbOq4DDkrTpi2pbxo3933NWPlu9CMVEdZ1150yH60or(Hc1DhCup5Q6JpxDAXk2HqzDAe5uoTlB0w0tNmCySNAIe8j04JVZ6FY6FMCj5e4IgqFrYefDtbxOoE3UFrTEV9gR)z3Db8pF69KnveFgHVFuaZNKiuwruYjZOkR6OF3q5IsflsBM6lPC((bXWAJjVOl847OGqa8dXDoltw3FRvV6F61oVL(Cmoep0Lt8FgNbHlYvm7T)yPqLqmx)UqaINCnJmeqN73BrTXYS52Adb8nSg2OGDWn3tOyVeJP47sKVJCzFX4tjjPAA)qX0(ejeW4ZjXXAdKwnSwmp5n8n6)(ymmyCtqF4a9B4jVUwaGyIobFfeDpMgLCeO(0KNwt2S0tPJpK3SO41FmHZ1wtt0srBUoe9TV2BiWbgmtsbv4DL3inqS6JEUIkK0OJKjmruC4RcjX9jpNg4Dg8PndP(pJg8iMNSzar9SdGeXDrvvi4jmzOSvAQqE52t2csmG7deODalzAq0cW)K1nH35ZEQNLdShLnkmPLCPsbygT9CuVojKLqr35YY1OVGmwYPTX1BF)Fz7FwaLttOayWpF5UrGOkxBB7r6u9iYMGTum9HPzoASOlZIe7mjGjaxDCcLWtctLMEABoONqCSjnshcyZO(a5sXquspIkzMvTWqap5seDYBjLcYGjb0dy(kXb0OjB)cFQm5lrzaWv4I44JgUjyfvcEbaI8r4D48qiXvlvBZbZJwCq3fC6qwa9Ot)kk4sEoDayxFgk6ngIhb16Jft7mwmjkjfJPy(XIYCkInPUL45uivGr5bXpkILOFVypx0OfKsFREoaTYbjlMIZLH9vp)B908X)5v3hsJJpGbplneEXCFdt0Z1L3OIfkhgW1nY4C3REEqwZ7xpVkzwYg2FCXqup3rZ8aHYMLbXaxfyrsf68LcKTcutybD4tjZIrCg0KjaR6hvecOJcWWXIN6iSJapHcCXLmOwhvt07VtM9hbjb3NrqpMkNKqWmvDkkixUSCTkyr0cZaTSsCgmINdCz(oN3FmeNCmnwmr5dOggqWEeojGf1DxiXY9EPXNgZ2LrIEaWUIWsWDJdV0Dq8MhtaONBvgLDpW1Zr3p4aIcq1V3cBS(VwUSw4RwP4Cn(nZ3e6gkVrfBsk(UN8dYa7nkr2XsX9xRAG6jKe)WhcrwGnCE1rMkubG)TziaVa19kwnDU1rmf(p(493DVbwO0CL(9Uidj1gsLvEOqOMXLoFVwDFZPXVKwLV)cOP8tQjxDEIK(cFJpfx7qdmqDN7Y(UWs3SeG(wWj2xjI2Akrn07soDeXFMoGh1()aiHAy4(GrgLZKereSodT4)(xb8E0wG357M8U79Td)DxP9vUsT37FF1Qjwgt5p9hiyjDnOc19RTqTltTmwaqDrNumI)6QV1)6dV93DVl6Zgf1wmSDxsscNElwaUXfJMW4bT9dHAoGKUmCUD1RSPDfzZy73ljK2o2xGKTGJjB2p369nRdfEYF4NXuJzXafy88lx48PBjBauMvJNYIkifYg9tx2jkN5UCMsFMZC3i6ww9hT4Fe0szRtGquCrsB4tjHZAdayZqTfoWv)T)t8mlQbKA3trbRVoNa2h2B1ArJX9BGx4qbOqPVnEbWUY6HIiHIdbFTnzpOSwFV0fnjBVIgHMEAaS7R22(zzRszuMuJVJjF)5fLUflgtf2CRSIuAkPquz0ON8EYfHNeOwXEPMHdwigapZYMWRWwJ66LqJHRjLcxHALAYy)Tlsl0gBs9kNTB4guhOsy02uwenkLYCKY3ZvIo)te8UV2LVHu1wPQ85KCd3)ELQ)bgapDHIaAKXuPOA(BN29Obdo6GkKXm5SZPkBo8ULkWAGgRbYdnSrmcWMcvevR9i64CCzgPohKMTGm1a4fO1mWH1BH7S(VYXRmp43Yf4gx1foxbV5qmqiXc8GY(lGYCRogl8apwvMuRvXmKhmDPY4(gjOLSe7q76)IFaKQTawGfqRwOwT5emJHHfcsSHDou9qsueLBa2b8oipk4asezev1tXGMFsMHgIFCk5(YGPfBe1YXRCVl6JErAZo6uZ3ycNYx7QGJTqYJJB88cmShVsh7ExM1PJbm4VaKICPF6CfOHOAvD)9q0wm1iSedwZTuxUYehj3UJY3A8xuRwnS249q0ibpqmn6Xm6uKccEDbGHr3kqQVWrllZRLMdIjhfrgCXkPpE1UPQqdshlbpzhDq6rr8zHN5CdgNsgwHP7RwLEvJsF6MBF4GTp2nxKmBfELhqdppTepkpOn4UYvcmGSiwlLJSSmCzbcNLqqEuuaLawNL85usKjvohn8Lle)Ml9Oi6N1yUAjUm5NtG18COi1azz0uBVh811Rd8gUYCc0nzm1vud)vcF8HgsILW(FmvLakex3MDzCDZL0aVIVmJkZ2ZaQITkjXwB6RLPsbWh1m9Rcex7dFuJwVMnzg69YPxy8Mr30K1Y(pzJPK4JIEOazDpQVVIsbe3vqwnPxUXJzQe1YWfRlFcvZhRNaEJyVuh(JzJ094xMsSXeLNjhAb(71Yn)H50)qvcQMS7vRYM2ALk2NJTcOSrkkwQ7)2)3)S3v792L6Q7j5BHRst0RKvFc6BbC0q3gyPqyNkW8o55gvVRUarIxsu6iCNCTPMHmQHXgoLqaH)ZWcyly4CAKpJt47LKXtazxpDhXOrCQE0sg8OvFRR9tMFDu9nawHsdScwQGrUhbskhZ81DhDr8efWQlamli5Um)uPU4FdAV6sgHvkNBlqzjJxwQerODWavAJEXCwdx9LR3ldW0n0q3akkpmsJh(Jk9n(E4PSA1zwACuHxKYiZmHsO0qgYtkHMYp(Huoqn6wZrCl)0NjKWnPyufKD6kD5Apn2nQW5hv1SaoOBOz1rNXwkYiWNZNPbkkYeWo(csqWJQupdHekoEQmLSfoC7eAhEcgldx0w4GkWHivehtpCJ1YZY0oDSSACLbRZv6vl(9EUu7em0UwPeMQBQaa5Z0IIpMaivvQmMw0Zgn8dWRcYdvjUbg8PY65qW0LDmZ8(8ctPZHHx53lO4iSSJ4hxrlRUYy5rWCEVMfIenRUIHcvwuXLqqPUxIJI0xy5HUBNtAkIRwaoN(ceNhQwfJTGUC3U7C)26P9dn1Dc8X7U(gRVX8WCI7b4GIPxtEtR9Blk(AbLRMU3d(pFZ38TqX09EW)Z8bOr0ceF0WAQNBeHU3z9n2O4K107FXioj4ewuk36f9nZjopzFSKwbeDdIzdx9PoUzphJ1jnd5XnhcBRpqpTAM7ZfIWcRCrQn050WWZDvIjYCqyTMWGkqW56jawFz8wxsafhCiQ4da9dq9kQYwwgPfisRUxUFR9MmMaie6PdIJ7lglCe7PS)eAEvsQYazUS0vfkVzUr3ANcFHj4MYx2ebIeMZAHvRD1aZQMBIEW5z)GeoXxt5DpD7K6yiT)5Cx(OJuB(uGCm8YxMTqfjNpppYFr6G2(fZ63(P2Uatt)QYFUHqMO7RthGHMSyVxH)eL4VEYBgoHZ7PedzC6))p!BBF",
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
