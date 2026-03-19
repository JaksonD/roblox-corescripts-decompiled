local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.LoggingProtocol);
local v3 = require(l_script_FirstAncestor_0.Enums.SurfaceName);
local v4 = require(l_script_FirstAncestor_0.Store.RobloxSubscriptionStore);
local _ = require(l_script_FirstAncestor_0.types);
logRobloxSubscriptionUpsellCounter = function(v6) --[[ Line: 13 ]] --[[ Name: logRobloxSubscriptionUpsellCounter ]]
    -- upvalues: v4 (copy), v3 (copy), v2 (copy)
    local v7 = v4.get().getEntryContext();
    local v8 = if v7 then v7.surfaceName else v3.Unspecified;
    v2.default:logRobloxTelemetryCounter(v6, 1, {
        surface = v8
    });
end;
return logRobloxSubscriptionUpsellCounter;