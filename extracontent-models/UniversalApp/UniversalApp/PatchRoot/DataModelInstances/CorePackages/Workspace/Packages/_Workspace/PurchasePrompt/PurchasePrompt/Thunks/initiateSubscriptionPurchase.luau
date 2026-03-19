local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local _ = require(l_script_FirstAncestor_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local v5 = require(l_script_FirstAncestor_0.Actions.SetPurchaseFlowUUID);
local v6 = require(l_script_FirstAncestor_0.Actions.RequestSubscriptionPurchase);
local v7 = require(l_script_FirstAncestor_0.Actions.ErrorOccurred);
local _ = require(l_script_FirstAncestor_0.Network.getPremiumUpsellPrecheck);
local v9 = require(l_script_FirstAncestor_0.Network.getSubscriptionPurchaseInfo);
local v10 = require(l_script_FirstAncestor_0.Services.Network);
local v11 = require(l_script_FirstAncestor_0.Services.ExternalSettings);
local v12 = require(l_script_FirstAncestor_0.Thunks.resolveSubscriptionPromptState);
local v13 = require(l_script_FirstAncestor_0.Utils.hasPendingRequest);
local _ = require(l_Parent_0.AppCommonLib).Logging;
local v15 = require(l_script_FirstAncestor_0.Thunk);
local v16 = require(l_Parent_0.LoggingProtocol);
local v17 = require(l_script_FirstAncestor_0.Flags.FFlagEnablePurchaseFlowUUIDMigration);
local v18 = require(l_script_FirstAncestor_0.Events.PurchaseFlowUUIDTelemetry);
local v19 = {
    v10, 
    v11
};
return function(v20) --[[ Line: 31 ]] --[[ Name: initiateSubscriptionPurchase ]]
    -- upvalues: v15 (copy), v19 (copy), v10 (copy), v11 (copy), v17 (copy), l_HttpService_0 (copy), v5 (copy), v16 (copy), v18 (copy), v13 (copy), v6 (copy), v7 (copy), v4 (copy), v9 (copy), v12 (copy)
    return v15.new(script.Name, v19, function(v21, v22) --[[ Line: 32 ]]
        -- upvalues: v10 (ref), v11 (ref), v17 (ref), l_HttpService_0 (ref), v5 (ref), v16 (ref), v18 (ref), v13 (ref), v6 (ref), v20 (copy), v7 (ref), v4 (ref), v9 (ref), v12 (ref)
        local v23 = v22[v10];
        local v24 = v22[v11];
        if v17 then
            local v25 = l_HttpService_0:GenerateGUID(false);
            v21:dispatch(v5(v25));
            v16.default:logRobloxTelemetryCounter(v18.InitiatePurchaseCounter, 1, {
                method = "initiateSubscriptionPurchase"
            });
        end;
        if v13(v21:getState()) then
            return nil;
        else
            v21:dispatch(v6(v20));
            if v24.getFlagOrder66() then
                v21:dispatch(v7(v4.PurchaseDisabled));
                return nil;
            else
                return v9(v23, v20):andThen(function(v26) --[[ Line: 58 ]]
                    -- upvalues: v21 (copy), v12 (ref)
                    v21:dispatch(v12(v26));
                end):catch(function(v27) --[[ Line: 61 ]]
                    -- upvalues: v21 (copy), v7 (ref)
                    v21:dispatch(v7(v27));
                end);
            end;
        end;
    end);
end;