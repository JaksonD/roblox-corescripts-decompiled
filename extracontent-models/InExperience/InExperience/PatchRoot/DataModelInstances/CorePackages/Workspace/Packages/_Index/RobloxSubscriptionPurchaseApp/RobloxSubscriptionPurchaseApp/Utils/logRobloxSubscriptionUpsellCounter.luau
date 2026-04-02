local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.LoggingProtocol);
local v3 = require(l_script_FirstAncestor_0.Enums.SurfaceName);
local v4 = require(l_script_FirstAncestor_0.Store.RobloxSubscriptionStore);
local _ = require(l_script_FirstAncestor_0.types);
local _ = require(l_script_FirstAncestor_0.Enums.ErrorReason);
logRobloxSubscriptionUpsellCounter = function(v7) --[[ Line: 14 ]] --[[ Name: logRobloxSubscriptionUpsellCounter ]]
    -- upvalues: v4 (copy), v3 (copy), v2 (copy)
    local v8 = v4.get();
    local v9 = v8.getEntryContext();
    local v10 = v8.getErrorReason();
    local v11 = if v9 then v9.surfaceName else v3.Unspecified;
    v2.default:logRobloxTelemetryCounter(v7, 1, {
        surface = v11, 
        errorReason = v10 and tostring(v10) or nil
    });
end;
return logRobloxSubscriptionUpsellCounter;