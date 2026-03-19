local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Thunk);
local v5 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local v6 = require(l_script_FirstAncestor_0.Actions.SetPurchaseFlowUUID);
local v7 = require(l_script_FirstAncestor_0.Actions.RequestPremiumPurchase);
local v8 = require(l_script_FirstAncestor_0.Actions.ErrorOccurred);
local v9 = require(l_script_FirstAncestor_0.Network.getPremiumUpsellPrecheck);
local v10 = require(l_script_FirstAncestor_0.Network.getPremiumProductInfo);
local v11 = require(l_script_FirstAncestor_0.Network.getAccountInfo);
local v12 = require(l_script_FirstAncestor_0.Network.getBalanceInfo);
local v13 = require(l_script_FirstAncestor_0.Services.Network);
local v14 = require(l_script_FirstAncestor_0.Services.ExternalSettings);
local v15 = require(l_script_FirstAncestor_0.Thunks.resolvePremiumPromptState);
local v16 = require(l_script_FirstAncestor_0.Utils.hasPendingRequest);
local _ = require(l_Parent_0.AppCommonLib).Logging;
local v18 = require(l_Parent_0.LoggingProtocol);
local v19 = require(l_script_FirstAncestor_0.Flags.FFlagEnablePurchaseFlowUUIDMigration);
local v20 = require(l_script_FirstAncestor_0.Events.PurchaseFlowUUIDTelemetry);
local v21 = {
    v13, 
    v14
};
return function(_, _, _) --[[ Line: 33 ]] --[[ Name: initiatePremiumPurchase ]]
    -- upvalues: v4 (copy), v21 (copy), v13 (copy), v14 (copy), v19 (copy), l_HttpService_0 (copy), v6 (copy), v18 (copy), v20 (copy), v16 (copy), v7 (copy), v8 (copy), v5 (copy), v3 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy), v15 (copy)
    return v4.new(script.Name, v21, function(v25, v26) --[[ Line: 34 ]]
        -- upvalues: v13 (ref), v14 (ref), v19 (ref), l_HttpService_0 (ref), v6 (ref), v18 (ref), v20 (ref), v16 (ref), v7 (ref), v8 (ref), v5 (ref), v3 (ref), v9 (ref), v10 (ref), v11 (ref), v12 (ref), v15 (ref)
        local v27 = v26[v13];
        local v28 = v26[v14];
        if v19 then
            local v29 = l_HttpService_0:GenerateGUID(false);
            v25:dispatch(v6(v29));
            v18.default:logRobloxTelemetryCounter(v20.InitiatePurchaseCounter, 1, {
                method = "initiatePremiumPurchase"
            });
        end;
        if v16(v25:getState()) then
            return nil;
        else
            v25:dispatch(v7());
            if v28.getFlagOrder66() then
                v25:dispatch(v8(v5.PurchaseDisabled));
                return nil;
            else
                local v30 = not v28.isStudio();
                return v3.all({
                    canShowUpsell = v30 and v9(v27) or v3.resolve(true), 
                    premiumProductInfo = v10(v27), 
                    accountInfo = v11(v27, v28), 
                    balanceInfo = v12(v27, v28, false)
                }):andThen(function(v31) --[[ Line: 66 ]]
                    -- upvalues: v25 (copy), v15 (ref)
                    v25:dispatch(v15(v31.accountInfo, v31.balanceInfo, v31.premiumProductInfo, v31.canShowUpsell));
                end):catch(function(v32) --[[ Line: 76 ]]
                    -- upvalues: v25 (copy), v8 (ref)
                    v25:dispatch(v8(v32));
                end);
            end;
        end;
    end);
end;