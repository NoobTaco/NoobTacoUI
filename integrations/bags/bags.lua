local NoobTacoUI, E, L, V, P, G = unpack(select(2, ...))
local WagoAnalytics = LibStub("WagoAnalytics"):Register("9rN49x6D")

function NoobTacoUI:IntegrationBag()
  -- Defaults On
  E.private["bags"]["enable"] = true

  -- TODO: Add more bag mod checks
  if (C_AddOns.IsAddOnLoaded("Baganator")) then
    E.private["bags"]["enable"] = false
    print("NoobTacoUI: Baganator is loaded. Disabling ElvUI bag integration.")
    -- WagoAnalytics:IncrementCounter("BaganatorCounter") -- Increase the counter by 1
    WagoAnalytics:IncrementCounter("BaganatorCounter")
  end
end
