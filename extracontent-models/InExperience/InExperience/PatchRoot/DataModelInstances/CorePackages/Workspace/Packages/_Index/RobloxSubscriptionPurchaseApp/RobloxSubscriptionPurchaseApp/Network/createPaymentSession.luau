local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local l_Url_0 = require(l_Parent_0.Http).Url;
local v4 = require(l_script_FirstAncestor_0.Enums.SurfaceContext);
local v5 = require(l_script_FirstAncestor_0.Enums.SurfaceName);
local _ = require(l_script_FirstAncestor_0.types);
local _ = require(script.Parent.CreatePaymentSessionTypes);
local v8 = require(script.Parent.HttpRequest);
local v9 = require(l_script_FirstAncestor_0.Utils.logRobloxSubscriptionUpsellCounter);
local v10 = require(l_script_FirstAncestor_0.Events.RobloxSubscriptionUpsellTelemetry);
local v11 = l_Url_0.APIS_URL .. "payments-gateway/v1/payment-sessions";
return function(v12) --[[ Line: 21 ]]
    -- upvalues: v4 (copy), v5 (copy), v8 (copy), v11 (copy), v9 (copy), v10 (copy), v2 (copy)
    local v13 = v12 or {
        context = v4.Unspecified, 
        surfaceName = v5.Unspecified, 
        metadata = {}
    };
    local v14 = {
        entryPoint = v13.surfaceName
    };
    local l_universeId_0 = v13.metadata.universeId;
    if l_universeId_0 ~= nil then
        v14.universeId = l_universeId_0;
    end;
    return v8.new():post(v11, v14):andThen(function(v16) --[[ Line: 40 ]]
        local l_paymentSession_0 = v16.paymentSession;
        local v18 = l_paymentSession_0 and l_paymentSession_0.id;
        if type(v18) == "string" then
            return v18;
        else
            return "";
        end;
    end):catch(function(_) --[[ Line: 46 ]]
        -- upvalues: v9 (ref), v10 (ref), v2 (ref)
        v9(v10.RobloxSubscriptionCreatePaymentSessionFailedCounter);
        return v2.resolve("");
    end);
end;