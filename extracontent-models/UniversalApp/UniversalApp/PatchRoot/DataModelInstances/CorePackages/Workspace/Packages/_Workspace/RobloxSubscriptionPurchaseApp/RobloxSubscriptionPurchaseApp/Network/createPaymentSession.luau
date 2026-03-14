local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local l_Url_0 = require(l_Parent_0.Http).Url;
local v4 = require(l_script_FirstAncestor_0.Enums.SurfaceContext);
local v5 = require(l_script_FirstAncestor_0.Enums.SurfaceName);
local _ = require(l_script_FirstAncestor_0.types);
local _ = require(script.Parent.CreatePaymentSessionTypes);
local v8 = require(script.Parent.HttpRequest);
local v9 = l_Url_0.APIS_URL .. "payments-gateway/v1/payment-sessions";
local v10 = {
    [v5.BuyRobuxPage] = true, 
    [v5.PrivateServerUpsell] = true, 
    [v5.PromptSubscriptionPurchase] = true, 
    [v5.RobuxTransferUpsell] = true
};
return function(v11) --[[ Line: 26 ]]
    -- upvalues: v4 (copy), v5 (copy), v10 (copy), v2 (copy), v8 (copy), v9 (copy)
    local v12 = v11 or {
        context = v4.Unspecified, 
        surfaceName = v5.Unspecified, 
        metadata = {}
    };
    if not v10[v12.surfaceName] then
        return v2.resolve("");
    else
        local v13 = {
            entryPoint = v12.surfaceName
        };
        local l_universeId_0 = v12.metadata.universeId;
        if l_universeId_0 ~= nil then
            v13.universeId = l_universeId_0;
        end;
        return v8.new():post(v9, v13):andThen(function(v15) --[[ Line: 49 ]]
            local l_paymentSession_0 = v15.paymentSession;
            local v17 = l_paymentSession_0 and l_paymentSession_0.id;
            if type(v17) == "string" then
                return v17;
            else
                return "";
            end;
        end):catch(function(v18) --[[ Line: 55 ]]
            -- upvalues: v2 (ref)
            return v2.reject((tostring(v18 and (v18.body or v18))));
        end);
    end;
end;