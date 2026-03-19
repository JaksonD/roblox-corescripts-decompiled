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
local v26 = require(script.Parent.purchaseItem);
local v27 = game:DefineFastInt("UpsellAccountBalanceRetryAttemps", 3);
local v28 = game:DefineFastInt("UpsellAccountBalanceRetryIntervalSec", 1);
local v29 = game:DefineFastFlag("RetryAfterUpsellV2", false);
local v30 = require(script.Parent.retryAfterUpsellV2);
local v31 = game:DefineFastFlag("AddUnifiedPurchaseRobuxUpsellCompletedTelemetry2", false);
local v32 = require(l_script_FirstAncestor_0.Utils.logUnifiedPurchaseTelemetryCounter);
local v33 = require(l_script_FirstAncestor_0.Events.UnifiedPurchaseTelemetry);
local v34 = {
    v18, 
    v17, 
    v19
};
if v29 then
    return v30;
else
    local function v35(v36) --[[ Line: 57 ]] --[[ Name: retryAfterUpsell ]]
        -- upvalues: v27 (copy), v25 (copy), v34 (copy), v18 (copy), v17 (copy), v19 (copy), v24 (copy), v11 (copy), v10 (copy), v3 (copy), v20 (copy), v7 (copy), v1 (copy), v16 (copy), v21 (copy), v22 (copy), v2 (copy), v23 (copy), v15 (copy), v5 (copy), v13 (copy), v12 (copy), v8 (copy), v4 (copy), v9 (copy), v31 (copy), v32 (copy), v33 (copy), v26 (copy), v28 (copy), v35 (copy)
        v36 = v36 or v27;
        return v25.new(script.Name, v34, function(v37, v38) --[[ Line: 60 ]]
            -- upvalues: v18 (ref), v17 (ref), v19 (ref), v24 (ref), v11 (ref), v10 (ref), v3 (ref), v20 (ref), v7 (ref), v1 (ref), v16 (ref), v21 (ref), v22 (ref), v2 (ref), v23 (ref), v15 (ref), v5 (ref), v13 (ref), v12 (ref), v8 (ref), v4 (ref), v9 (ref), v31 (ref), v32 (ref), v33 (ref), v26 (ref), v36 (ref), v28 (ref), v35 (ref)
            local v39 = v38[v18];
            local v40 = v38[v17];
            local v41 = v38[v19];
            local v42 = v37:getState();
            local l_requestType_0 = v42.promptRequest.requestType;
            local l_promptState_0 = v42.promptState;
            local l_purchaseFlow_0 = v42.purchaseFlow;
            local v46 = v24(v41.getPlatform());
            if l_requestType_0 == v11.None then
                return;
            elseif l_promptState_0 ~= v10.UpsellInProgress and l_promptState_0 ~= v10.PollingBalance then
                return;
            elseif l_requestType_0 == v11.Premium or l_requestType_0 == v11.Subscription then
                if l_promptState_0 == v10.UpsellInProgress then
                    v37:dispatch(v3());
                    v37:dispatch(v20());
                    return;
                else
                    return;
                end;
            else
                if l_purchaseFlow_0 == v7.RobuxUpsellV2 or l_purchaseFlow_0 == v7.LargeRobuxUpsell then
                    v37:dispatch(v1(v10.PollingBalance));
                end;
                return v16(v40, v41, false):andThen(function(v47) --[[ Line: 90 ]]
                    -- upvalues: v37 (copy), v21 (ref), v22 (ref), v2 (ref), l_purchaseFlow_0 (copy), v7 (ref), v41 (copy), v23 (ref), v15 (ref), v5 (ref), v13 (ref), v12 (ref), v1 (ref), v10 (ref), v46 (copy), v8 (ref), v4 (ref), v9 (ref), v31 (ref), v32 (ref), v33 (ref), v26 (ref), v36 (ref), v28 (ref), v35 (ref), v39 (copy)
                    local v48 = v37:getState();
                    local v49 = v48.accountInfo.membershipType == 4;
                    local v50 = v21(v48.productInfo, v49);
                    if not v22(v37:getState()) then
                        return;
                    else
                        local l_balance_0 = v48.accountInfo.balance;
                        local l_robux_0 = v47.robux;
                        v37:dispatch(v2(v47));
                        if l_balance_0 ~= l_robux_0 then
                            if v50 ~= nil and l_robux_0 < v50 then
                                if l_purchaseFlow_0 == v7.LargeRobuxUpsell then
                                    local v53 = v41.getPlatform();
                                    local v54 = v23(v53);
                                    return v15(v50, l_robux_0, v54):andThen(function(v55) --[[ Line: 112 ]]
                                        -- upvalues: v22 (ref), v37 (ref), v5 (ref), v13 (ref), v12 (ref)
                                        if not v22(v37:getState()) then
                                            return;
                                        else
                                            v37:dispatch(v5(v55.products, 1, v55.virtualItemBadgeType));
                                            v37:dispatch(v13(v12.UpsellModalShownAgain));
                                            return;
                                        end;
                                    end, function() --[[ Line: 126 ]]
                                        -- upvalues: v22 (ref), v37 (ref), v1 (ref), v10 (ref), v13 (ref), v12 (ref)
                                        if not v22(v37:getState()) then
                                            return;
                                        else
                                            v37:dispatch(v1(v10.LargeRobuxUpsell));
                                            v37:dispatch(v13(v12.UpsellGenericModalShownAgain));
                                            return;
                                        end;
                                    end);
                                else
                                    if v46 == v8.Web then
                                        v37:dispatch(v4(v9.InvalidFundsUnknown));
                                    else
                                        v37:dispatch(v4(v9.InvalidFunds));
                                    end;
                                    v37:dispatch(v13(v12.UpsellFailedNotEnoughRobux));
                                    return;
                                end;
                            else
                                if v31 and v48.purchaseAnalyticsMetadata then
                                    local l_purchaseAnalyticsMetadata_0 = v48.purchaseAnalyticsMetadata;
                                    v32(v33.UnifiedRobuxUpsellRobuxPurchaseCompletedCounter, l_purchaseAnalyticsMetadata_0.surface, l_purchaseAnalyticsMetadata_0.productType);
                                end;
                                v37:dispatch(v26());
                                return;
                            end;
                        elseif v36 > 0 then
                            delay(v28, function() --[[ Line: 160 ]]
                                -- upvalues: v37 (ref), v35 (ref), v36 (ref)
                                v37:dispatch(v35(v36 - 1));
                            end);
                            return;
                        else
                            v39.signalFailedPurchasePostUpsell();
                            if v46 == v8.Web then
                                v37:dispatch(v4(v9.InvalidFundsUnknown));
                            else
                                v37:dispatch(v4(v9.InvalidFunds));
                            end;
                            if v31 and v48.purchaseAnalyticsMetadata then
                                local l_purchaseAnalyticsMetadata_1 = v48.purchaseAnalyticsMetadata;
                                v32(v33.UnifiedRobuxUpsellRobuxPurchaseFailedCounter, l_purchaseAnalyticsMetadata_1.surface, l_purchaseAnalyticsMetadata_1.productType);
                            end;
                            return;
                        end;
                    end;
                end):catch(function(v58) --[[ Line: 184 ]]
                    -- upvalues: v37 (copy), v4 (ref)
                    v37:dispatch(v4(v58));
                end);
            end;
        end);
    end;
    return v35;
end;