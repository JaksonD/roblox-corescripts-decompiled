local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_HttpService_0 = game:GetService("HttpService");
local l_Workspace_0 = game:GetService("Workspace");
local l_Players_0 = game:GetService("Players");
local l_ExperienceAuthService_0 = game:GetService("ExperienceAuthService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v6 = require(l_Parent_0.IAPExperience);
local l_isEconomicRestrictionResponse_0 = v6.Utility.isEconomicRestrictionResponse;
local l_parseEconomicRestrictionsFailureReason_0 = v6.Utility.parseEconomicRestrictionsFailureReason;
local l_parseEconomicRestrictionsExpirationTimeInMinutes_0 = v6.Utility.parseEconomicRestrictionsExpirationTimeInMinutes;
local v10 = require(l_script_FirstAncestor_0.Actions.SetPromptState);
local v11 = require(l_script_FirstAncestor_0.Actions.StartPurchase);
local v12 = require(l_script_FirstAncestor_0.Actions.ErrorOccurred);
local v13 = require(l_script_FirstAncestor_0.Actions.SetEconomicRestrictionError);
local v14 = require(l_script_FirstAncestor_0.Enums.PurchaseFlow);
local v15 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v16 = require(l_script_FirstAncestor_0.Enums.ItemType);
local v17 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local v18 = require(l_script_FirstAncestor_0.Enums.RequestType);
local v19 = require(l_script_FirstAncestor_0.Network.getToolAsset);
local v20 = require(l_script_FirstAncestor_0.Network.performPurchase);
local v21 = require(l_script_FirstAncestor_0.Network.performPurchaseV2);
local v22 = require(l_script_FirstAncestor_0.Network.performCreatorStorePurchase);
local v23 = require(l_script_FirstAncestor_0.Services.Network);
local v24 = require(l_script_FirstAncestor_0.Services.Analytics);
local v25 = require(l_script_FirstAncestor_0.Services.ExternalSettings);
local v26 = require(l_script_FirstAncestor_0.Utils.getPlayerPrice);
local v27 = require(l_script_FirstAncestor_0.Utils.isCreatorStoreAssetType);
local v28 = require(l_script_FirstAncestor_0.Thunk);
local v29 = require(l_script_FirstAncestor_0.Promise);
local _ = require(l_script_FirstAncestor_0.types);
local l_ProductTypeEnum_0 = require(l_script_FirstAncestor_0.types).ProductTypeEnum;
local v32 = require(l_script_FirstAncestor_0.Selectors.selectProductPrice);
local v33 = require(l_script_FirstAncestor_0.Thunks.performLuaPurchase);
local v34 = require(script.Parent.completePurchase);
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_Parent_0.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
local v36 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableCreatorStorePurchasingCutover);
local v37 = require(l_script_FirstAncestor_0.Utils.logUnifiedPurchaseTelemetryCounter);
local v38 = require(l_script_FirstAncestor_0.Events.UnifiedPurchaseTelemetry);
local v39 = require(l_script_FirstAncestor_0.Flags.FFlagPurchasePromptPriceShouldUseProductInfoPrice);
local l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 = require(l_Parent_0.SharedFlags).FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow;
local l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 = require(l_Parent_0.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs;
local v42 = {
    v23, 
    v24, 
    v25
};
isLuaPurchase = function(v43) --[[ Line: 70 ]] --[[ Name: isLuaPurchase ]]
    -- upvalues: l_ProductTypeEnum_0 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy)
    if v43 == nil then
        return false;
    else
        return v43.kind == l_ProductTypeEnum_0.Product and v43.universeId ~= nil or v43.kind == l_ProductTypeEnum_0.Experience or v43.kind == l_ProductTypeEnum_0.Look or l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v43.kind == l_ProductTypeEnum_0.DeveloperSubscription;
    end;
end;
return function() --[[ Line: 83 ]] --[[ Name: purchaseItem ]]
    -- upvalues: v28 (copy), v42 (copy), v23 (copy), v25 (copy), v24 (copy), v11 (copy), l_Workspace_0 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v37 (copy), v38 (copy), v18 (copy), l_ExperienceAuthService_0 (copy), v34 (copy), v14 (copy), v10 (copy), v15 (copy), l_HttpService_0 (copy), v39 (copy), v32 (copy), v26 (copy), l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 (copy), v33 (copy), v36 (copy), v27 (copy), v22 (copy), v29 (copy), v12 (copy), v21 (copy), l_isEconomicRestrictionResponse_0 (copy), l_parseEconomicRestrictionsFailureReason_0 (copy), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (copy), v13 (copy), v17 (copy), v20 (copy), v16 (copy), v19 (copy), l_Players_0 (copy)
    return v28.new(script.Name, v42, function(v44, v45) --[[ Line: 84 ]]
        -- upvalues: v23 (ref), v25 (ref), v24 (ref), v11 (ref), l_Workspace_0 (ref), l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v37 (ref), v38 (ref), v18 (ref), l_ExperienceAuthService_0 (ref), v34 (ref), v14 (ref), v10 (ref), v15 (ref), l_HttpService_0 (ref), v39 (ref), v32 (ref), v26 (ref), l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 (ref), v33 (ref), v36 (ref), v27 (ref), v22 (ref), v29 (ref), v12 (ref), v21 (ref), l_isEconomicRestrictionResponse_0 (ref), l_parseEconomicRestrictionsFailureReason_0 (ref), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (ref), v13 (ref), v17 (ref), v20 (ref), v16 (ref), v19 (ref), l_Players_0 (ref)
        local v46 = v45[v23];
        local v47 = v45[v25];
        local v48 = v45[v24];
        local v49 = v44:getState();
        local l_purchaseFlow_0 = v49.purchaseFlow;
        local l_requestType_0 = v49.promptRequest.requestType;
        local v52 = v47.getPlatform();
        v44:dispatch(v11(l_Workspace_0.DistributedGameTime));
        if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v44:getState().isUserEligibleForUnifiedPurchaseFlow then
            v37(v38.UnifiedProductPurchaseModalPurchaseAttemptedCounter, v49.purchaseAnalyticsMetadata.surface, v49.purchaseAnalyticsMetadata.productType);
            if v49.purchaseCallbacks and v49.purchaseCallbacks.onPurchaseAttempt then
                v49.purchaseCallbacks.onPurchaseAttempt();
            end;
        end;
        if l_requestType_0 == v18.AvatarCreationFee then
            local v53 = {
                avatarName = v49.productInfo.name, 
                avatarDescription = v49.productInfo.description, 
                priceFromToken = v49.productInfo.price
            };
            local v54 = {
                [1] = Enum.ExperienceAuthScope.CreatorAssetsCreate
            };
            l_ExperienceAuthService_0:ScopeCheckUIComplete(v49.promptRequest.id, v54, Enum.ScopeCheckResult.ConsentAccepted, v53);
            v48.signalAvatarCreationPurchaseSubmit();
            v44:dispatch(v34());
            return;
        else
            if l_purchaseFlow_0 == v14.RobuxUpsellV2 or l_purchaseFlow_0 == v14.LargeRobuxUpsell then
                v44:dispatch(v10(v15.PurchaseInProgress));
            end;
            local v55 = v44:getState();
            local v56 = l_HttpService_0:GenerateGUID(false);
            local l_id_0 = v55.promptRequest.id;
            local l_infoType_0 = v55.promptRequest.infoType;
            local l_equipIfPurchased_0 = v55.promptRequest.equipIfPurchased;
            local l_isRobloxPurchase_0 = v55.promptRequest.isRobloxPurchase;
            local l_purchaseAuthToken_0 = v55.promptRequest.purchaseAuthToken;
            local l_idempotencyKey_0 = v55.promptRequest.idempotencyKey;
            local l_collectibleItemId_0 = v55.promptRequest.collectibleItemId;
            local l_collectibleItemInstanceId_0 = v55.promptRequest.collectibleItemInstanceId;
            local l_collectibleProductId_0 = v55.promptRequest.collectibleProductId;
            local v66 = nil;
            if v39 then
                v66 = v32(v55);
            else
                local l_expectedPrice_0 = v55.promptRequest.expectedPrice;
                local v68 = v55.accountInfo.membershipType == 4;
                v66 = v26(v55.productInfo, v68);
                if l_collectibleItemInstanceId_0 and l_collectibleItemInstanceId_0 ~= "" or l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 and v55.productPayload and v55.productPayload.timedOptionDays ~= nil then
                    v66 = l_expectedPrice_0;
                end;
            end;
            local l_assetTypeId_0 = v55.productInfo.assetTypeId;
            local l_assetType_0 = v55.productInfo.assetType;
            local l_productId_0 = v55.productInfo.productId;
            local l_collectibleItemId_1 = v55.productInfo.collectibleItemId;
            local l_collectibleProductId_1 = v55.productInfo.collectibleProductId;
            local l_itemType_0 = v55.productInfo.itemType;
            v48.signalProductPurchaseConfirmed(l_productId_0, v55.requestType);
            local v75 = l_collectibleItemId_0 and l_collectibleItemId_0 ~= "" and l_infoType_0 == Enum.InfoType.Bundle;
            if l_FFlagEnableUnifiedProductPurchaseFlow_0 and isLuaPurchase(v55.productPayload) then
                v44:dispatch(v33());
                return;
            elseif v36() and v27(l_assetType_0) then
                return v22(v46, l_productId_0, l_assetType_0):andThen(function(v76) --[[ Line: 207 ]]
                    -- upvalues: v44 (copy), v34 (ref), v48 (copy), l_id_0 (copy), l_infoType_0 (copy), v66 (ref), v29 (ref)
                    v44:dispatch(v34());
                    v48.signalPurchaseSuccess(l_id_0, l_infoType_0, v66, v76);
                    return v29.resolve();
                end):catch(function(v77) --[[ Line: 216 ]]
                    -- upvalues: v44 (copy), v12 (ref)
                    v44:dispatch(v12(v77));
                end);
            elseif v75 or l_collectibleItemInstanceId_0 and l_collectibleItemInstanceId_0 ~= "" then
                return v21(v46, l_infoType_0, l_productId_0, v66, v56, l_isRobloxPurchase_0, l_collectibleItemId_0, l_collectibleProductId_0, l_idempotencyKey_0, l_purchaseAuthToken_0, l_collectibleItemInstanceId_0):andThen(function(v78) --[[ Line: 233 ]]
                    -- upvalues: l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v44 (copy), v34 (ref), v48 (copy), l_id_0 (copy), l_infoType_0 (copy), v66 (ref), v29 (ref)
                    if l_FFlagEnableUnifiedProductPurchaseFlow_0 then
                        v44:dispatch(v34(v78));
                    else
                        v44:dispatch(v34());
                    end;
                    v48.signalPurchaseSuccess(l_id_0, l_infoType_0, v66, v78);
                    return v29.resolve();
                end):catch(function(v79) --[[ Line: 248 ]]
                    -- upvalues: l_isEconomicRestrictionResponse_0 (ref), l_parseEconomicRestrictionsFailureReason_0 (ref), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (ref), v44 (copy), v13 (ref), v12 (ref), v17 (ref), v48 (copy), l_productId_0 (copy), l_infoType_0 (copy), v52 (copy)
                    if l_isEconomicRestrictionResponse_0(v79) then
                        local v80 = l_parseEconomicRestrictionsFailureReason_0(v79);
                        local v81 = l_parseEconomicRestrictionsExpirationTimeInMinutes_0(v79);
                        v44:dispatch(v13(v80, v81));
                        v44:dispatch(v12(v17.EconomicRestriction));
                        return;
                    else
                        if v79 == v17.TwoFactorNeeded then
                            v48.signalTwoSVSettingsErrorShown(l_productId_0, l_infoType_0);
                            if v52 == Enum.Platform.Windows or v52 == Enum.Platform.OSX then
                                v79 = v17.TwoFactorNeededSettings;
                            end;
                        end;
                        v44:dispatch(v12(v79));
                        return;
                    end;
                end);
            else
                local v82 = nil;
                if l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 then
                    v82 = v55.productPayload and v55.productPayload.timedOptionDays;
                end;
                return v20(v46, l_infoType_0, l_productId_0, v66, v56, l_isRobloxPurchase_0, l_collectibleItemId_1, l_collectibleProductId_1, l_idempotencyKey_0, l_purchaseAuthToken_0, if l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 then v82 else nil):andThen(function(v83) --[[ Line: 285 ]]
                    -- upvalues: l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v44 (copy), v34 (ref), l_itemType_0 (copy), v16 (ref), v48 (copy), l_id_0 (copy), l_infoType_0 (copy), v66 (ref), l_equipIfPurchased_0 (copy), l_assetTypeId_0 (copy), v19 (ref), v46 (copy), l_Players_0 (ref), v29 (ref)
                    if l_FFlagEnableUnifiedProductPurchaseFlow_0 then
                        v44:dispatch(v34(v83));
                    else
                        v44:dispatch(v34());
                    end;
                    if l_itemType_0 ~= v16.Bundle then
                        v48.signalPurchaseSuccess(l_id_0, l_infoType_0, v66, v83);
                    end;
                    if l_equipIfPurchased_0 and l_assetTypeId_0 == 19 then
                        return v19(v46, l_id_0):andThen(function(v84) --[[ Line: 303 ]]
                            -- upvalues: l_Players_0 (ref)
                            if v84 then
                                v84.Parent = l_Players_0.LocalPlayer.Backpack;
                            end;
                        end);
                    else
                        return v29.resolve();
                    end;
                end):catch(function(v85) --[[ Line: 312 ]]
                    -- upvalues: l_isEconomicRestrictionResponse_0 (ref), l_parseEconomicRestrictionsFailureReason_0 (ref), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (ref), v44 (copy), v13 (ref), v12 (ref), v17 (ref), v48 (copy), l_productId_0 (copy), l_infoType_0 (copy), v52 (copy)
                    if l_isEconomicRestrictionResponse_0(v85) then
                        local v86 = l_parseEconomicRestrictionsFailureReason_0(v85);
                        local v87 = l_parseEconomicRestrictionsExpirationTimeInMinutes_0(v85);
                        v44:dispatch(v13(v86, v87));
                        v44:dispatch(v12(v17.EconomicRestriction));
                        return;
                    else
                        if v85 == v17.TwoFactorNeeded then
                            v48.signalTwoSVSettingsErrorShown(l_productId_0, l_infoType_0);
                            if v52 == Enum.Platform.Windows or v52 == Enum.Platform.OSX then
                                v85 = v17.TwoFactorNeededSettings;
                            end;
                        end;
                        v44:dispatch(v12(v85));
                        return;
                    end;
                end);
            end;
        end;
    end);
end;