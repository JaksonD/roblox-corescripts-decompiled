local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local v1 = require(l_script_FirstAncestor_0.Actions.SetPromptState);
local v2 = require(l_script_FirstAncestor_0.Actions.BalanceInfoRecieved);
local v3 = require(l_script_FirstAncestor_0.Actions.PurchaseCompleteRecieved);
local v4 = require(l_script_FirstAncestor_0.Actions.ErrorOccurred);
local v5 = require(l_script_FirstAncestor_0.Actions.PromptNativeUpsellSuggestions);
local _ = require(l_script_FirstAncestor_0.types);
local v7 = require(l_script_FirstAncestor_0.Enums.PurchaseFlow);
local v8 = require(l_script_FirstAncestor_0.Enums.UpsellFlow);
local v9 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local v10 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v11 = require(l_script_FirstAncestor_0.Enums.RequestType);
local v12 = require(l_script_FirstAncestor_0.Enums.Counter);
local v13 = require(l_script_FirstAncestor_0.Thunks.sendCounter);
local _ = require(l_script_FirstAncestor_0.Models.RobuxUpsell);
local v15 = require(l_script_FirstAncestor_0.Network.getRobuxUpsellSuggestions);
local v16 = require(l_script_FirstAncestor_0.Network.getBalanceInfo);
local v17 = require(l_script_FirstAncestor_0.Services.Network);
local v18 = require(l_script_FirstAncestor_0.Services.Analytics);
local v19 = require(l_script_FirstAncestor_0.Services.ExternalSettings);
local v20 = require(l_script_FirstAncestor_0.Thunks.completeRequest);
local v21 = require(l_script_FirstAncestor_0.Utils.getPlayerPrice);
local v22 = require(l_script_FirstAncestor_0.Utils.hasPendingRequest);
local v23 = require(l_script_FirstAncestor_0.Utils.getPaymentPlatform);
local v24 = require(l_script_FirstAncestor_0.NativeUpsell.getUpsellFlow);
local v25 = require(l_script_FirstAncestor_0.Thunk);
local v26 = game:DefineFastFlag("AddUnifiedPurchaseRobuxUpsellCompletedTelemetry", false);
local v27 = require(l_script_FirstAncestor_0.Utils.logUnifiedPurchaseTelemetryCounter);
local v28 = require(l_script_FirstAncestor_0.Events.UnifiedPurchaseTelemetry);
local v29 = require(script.Parent.purchaseItem);
local v30 = game:DefineFastInt("UpsellAccountBalanceRetryAttemps", 3);
local v31 = game:DefineFastInt("UpsellAccountBalanceRetryIntervalSec", 1);
local v32 = {
    v18, 
    v17, 
    v19
};
local function v39(v33, _, v35, v36, v37) --[[ Line: 51 ]] --[[ Name: restartUpsell ]]
    -- upvalues: v15 (copy), v22 (copy), v5 (copy), v13 (copy), v12 (copy), v1 (copy), v10 (copy)
    return v15(v35, v36, v37):andThen(function(v38) --[[ Line: 54 ]]
        -- upvalues: v22 (ref), v33 (copy), v5 (ref), v13 (ref), v12 (ref)
        if not v22(v33:getState()) then
            return;
        else
            v33:dispatch(v5(v38.products, 1, v38.virtualItemBadgeType));
            v33:dispatch(v13(v12.UpsellModalShownAgain));
            return;
        end;
    end, function() --[[ Line: 64 ]]
        -- upvalues: v22 (ref), v33 (copy), v1 (ref), v10 (ref), v13 (ref), v12 (ref)
        if not v22(v33:getState()) then
            return;
        else
            v33:dispatch(v1(v10.LargeRobuxUpsell));
            v33:dispatch(v13(v12.UpsellGenericModalShownAgain));
            return;
        end;
    end);
end;
local function v40(v41) --[[ Line: 75 ]] --[[ Name: retryAfterUpsell ]]
    -- upvalues: v30 (copy), v25 (copy), v32 (copy), v18 (copy), v17 (copy), v19 (copy), v24 (copy), v11 (copy), v10 (copy), v3 (copy), v20 (copy), v7 (copy), v1 (copy), v16 (copy), v21 (copy), v22 (copy), v23 (copy), v2 (copy), v8 (copy), v39 (copy), v4 (copy), v9 (copy), v13 (copy), v12 (copy), v26 (copy), v27 (copy), v28 (copy), v29 (copy), v31 (copy), v40 (copy)
    local v42 = v41 or v30;
    return v25.new(script.Name, v32, function(v43, v44) --[[ Line: 78 ]]
        -- upvalues: v18 (ref), v17 (ref), v19 (ref), v24 (ref), v11 (ref), v10 (ref), v3 (ref), v20 (ref), v7 (ref), v1 (ref), v16 (ref), v21 (ref), v22 (ref), v23 (ref), v2 (ref), v8 (ref), v39 (ref), v4 (ref), v9 (ref), v13 (ref), v12 (ref), v26 (ref), v27 (ref), v28 (ref), v29 (ref), v42 (copy), v31 (ref), v40 (ref)
        local v45 = v44[v18];
        local v46 = v44[v17];
        local v47 = v44[v19];
        local v48 = v43:getState();
        local l_requestType_0 = v48.promptRequest.requestType;
        local l_promptState_0 = v48.promptState;
        local l_purchaseFlow_0 = v48.purchaseFlow;
        local v52 = v24(v47.getPlatform());
        if l_requestType_0 == v11.None then
            return;
        elseif l_promptState_0 ~= v10.UpsellInProgress and l_promptState_0 ~= v10.PollingBalance then
            return;
        elseif l_requestType_0 == v11.Premium or l_requestType_0 == v11.Subscription then
            if l_promptState_0 == v10.UpsellInProgress then
                v43:dispatch(v3());
                v43:dispatch(v20());
                return;
            else
                return;
            end;
        else
            if l_purchaseFlow_0 == v7.RobuxUpsellV2 or l_purchaseFlow_0 == v7.LargeRobuxUpsell then
                v43:dispatch(v1(v10.PollingBalance));
            end;
            return v16(v46, v47, false):andThen(function(v53) --[[ Line: 108 ]]
                -- upvalues: v43 (copy), v21 (ref), v22 (ref), v23 (ref), v47 (copy), v2 (ref), l_purchaseFlow_0 (copy), v7 (ref), v52 (copy), v8 (ref), v39 (ref), v46 (copy), v4 (ref), v9 (ref), v13 (ref), v12 (ref), v26 (ref), v27 (ref), v28 (ref), v29 (ref), v42 (ref), v31 (ref), v40 (ref), v45 (copy)
                local v54 = v43:getState();
                local v55 = v54.accountInfo.membershipType == 4;
                local v56 = v21(v54.productInfo, v55);
                if not v22(v43:getState()) then
                    return;
                else
                    local v57 = v23(v47.getPlatform());
                    local l_balance_0 = v54.accountInfo.balance;
                    local l_robux_0 = v53.robux;
                    v43:dispatch(v2(v53));
                    if l_balance_0 ~= l_robux_0 then
                        if v56 ~= nil and l_robux_0 < v56 then
                            if l_purchaseFlow_0 == v7.LargeRobuxUpsell or v52 == v8.Web then
                                return v39(v43, v46, v56, l_robux_0, v57);
                            else
                                v43:dispatch(v4(v9.InvalidFunds));
                                v43:dispatch(v13(v12.UpsellFailedNotEnoughRobux));
                                return;
                            end;
                        else
                            if v26 and v54.purchaseAnalyticsMetadata then
                                local l_purchaseAnalyticsMetadata_0 = v54.purchaseAnalyticsMetadata;
                                v27(v28.UnifiedRobuxUpsellRobuxPurchaseCompletedCounter, l_purchaseAnalyticsMetadata_0.surface, l_purchaseAnalyticsMetadata_0.productType);
                            end;
                            v43:dispatch(v29());
                            return;
                        end;
                    elseif v42 > 0 then
                        delay(v31, function() --[[ Line: 149 ]]
                            -- upvalues: v43 (ref), v40 (ref), v42 (ref)
                            v43:dispatch(v40(v42 - 1));
                        end);
                        return;
                    else
                        v45.signalFailedPurchasePostUpsell();
                        if v52 == v8.Web then
                            v39(v43, v46, v56, l_robux_0, v57);
                        else
                            v43:dispatch(v4(v9.InvalidFunds));
                        end;
                        if v26 and v54.purchaseAnalyticsMetadata then
                            local l_purchaseAnalyticsMetadata_1 = v54.purchaseAnalyticsMetadata;
                            v27(v28.UnifiedRobuxUpsellRobuxPurchaseFailedCounter, l_purchaseAnalyticsMetadata_1.surface, l_purchaseAnalyticsMetadata_1.productType);
                        end;
                        return;
                    end;
                end;
            end):catch(function(v62) --[[ Line: 175 ]]
                -- upvalues: v43 (copy), v4 (ref)
                v43:dispatch(v4(v62));
            end);
        end;
    end);
end;
return v40;