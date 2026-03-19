local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Roact_0 = require(l_Parent_0.PurchasePromptDeps).Roact;
local v5 = require(l_script_FirstAncestor_0.Actions.ErrorOccurred);
local v6 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local v7 = require(l_script_FirstAncestor_0.Thunks.completePurchase);
local v8 = require(l_script_FirstAncestor_0.Thunks.initiatePurchase);
local v9 = require(l_script_FirstAncestor_0.Thunks.initiateBundlePurchase);
local v10 = require(l_script_FirstAncestor_0.Thunks.initiatePremiumPurchase);
local v11 = require(l_script_FirstAncestor_0.Thunks.initiateSubscriptionPurchase);
local v12 = require(l_script_FirstAncestor_0.connectToStore);
local v13 = require(script.Parent.ExternalEventConnection);
local v14 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnablePromptPurchaseRequestedV2);
local v15 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnablePromptPurchaseRequestedV2Take2);
local l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 = require(l_Parent_0.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs;
local l_ProductTypeEnum_0 = require(l_script_FirstAncestor_0.types).ProductTypeEnum;
return (v12(nil, function(v18) --[[ Line: 120 ]]
    -- upvalues: l_Players_0 (copy), v8 (copy), v5 (copy), v6 (copy), v7 (copy), v9 (copy), v10 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), l_ProductTypeEnum_0 (copy), v11 (copy)
    local function v23(v19, v20, v21, _) --[[ Line: 121 ]] --[[ Name: onPurchaseRequest ]]
        -- upvalues: l_Players_0 (ref), v18 (copy), v8 (ref)
        if v19 == l_Players_0.LocalPlayer then
            v18(v8(v20, Enum.InfoType.Asset, v21, false, "", ""));
        end;
    end;
    local function v30(v24, v25, v26, _, v28, v29) --[[ Line: 127 ]] --[[ Name: onPurchaseRequestV2 ]]
        -- upvalues: l_Players_0 (ref), v18 (copy), v8 (ref)
        if v24 == l_Players_0.LocalPlayer then
            v18(v8(v25, Enum.InfoType.Asset, v26, false, v28, v29));
        end;
    end;
    local function v33(v31, v32) --[[ Line: 149 ]] --[[ Name: onRobloxPurchaseRequest ]]
        -- upvalues: v18 (copy), v8 (ref)
        v18(v8(v31, Enum.InfoType.Asset, v32, true));
    end;
    local function v38(v34, v35, v36, _) --[[ Line: 153 ]] --[[ Name: onProductPurchaseRequest ]]
        -- upvalues: l_Players_0 (ref), v18 (copy), v8 (ref)
        if v34 == l_Players_0.LocalPlayer then
            v18(v8(v35, Enum.InfoType.Product, v36));
        end;
    end;
    local function v41(v39, v40) --[[ Line: 159 ]] --[[ Name: onPurchaseGamePassRequest ]]
        -- upvalues: l_Players_0 (ref), v18 (copy), v8 (ref)
        if v39 == l_Players_0.LocalPlayer then
            v18(v8(v40, Enum.InfoType.GamePass, false));
        end;
    end;
    local function v50(v42, v43, v44, v45, v46, v47, v48, v49) --[[ Line: 165 ]] --[[ Name: onPromptCollectiblesPurchaseRequest ]]
        -- upvalues: l_Players_0 (ref), v18 (copy), v8 (ref)
        if v42 == l_Players_0.LocalPlayer then
            v18(v8(v43, Enum.InfoType.Asset, false, true, v48, v49, v44, v45, v46, v47));
        end;
    end;
    local function v53(v51) --[[ Line: 194 ]] --[[ Name: onServerPurchaseVerification ]]
        -- upvalues: v18 (copy), v5 (ref), v6 (ref), l_Players_0 (ref), v7 (ref)
        if not v51 then
            v18(v5(v6.UnknownFailure));
            return;
        else
            local l_playerId_0 = v51.playerId;
            if l_playerId_0 ~= nil then
                l_playerId_0 = tonumber(v51.playerId);
            end;
            if l_playerId_0 == l_Players_0.LocalPlayer.UserId then
                v18(v7());
            end;
            return;
        end;
    end;
    local function v56(v54, v55) --[[ Line: 208 ]] --[[ Name: onBundlePurchaseRequest ]]
        -- upvalues: l_Players_0 (ref), v18 (copy), v9 (ref)
        if v54 == l_Players_0.LocalPlayer then
            v18(v9(v55));
        end;
    end;
    local function v65(v57, v58, v59, v60, v61, v62, v63, v64) --[[ Line: 214 ]] --[[ Name: onCollectibleBundlePurchaseRequest ]]
        -- upvalues: l_Players_0 (ref), v18 (copy), v9 (ref)
        if v57 == l_Players_0.LocalPlayer then
            v18(v9(v58, v63, v64, v59, v60, v61, v62));
        end;
    end;
    local function v67(v66) --[[ Line: 239 ]] --[[ Name: onPremiumPurchaseRequest ]]
        -- upvalues: l_Players_0 (ref), v18 (copy), v10 (ref)
        if v66 == l_Players_0.LocalPlayer then
            v18(v10());
        end;
    end;
    local function v69(v68) --[[ Line: 245 ]] --[[ Name: onSubscriptionPurchaseRequest ]]
        -- upvalues: l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (ref), v18 (copy), v8 (ref), l_ProductTypeEnum_0 (ref), v11 (ref)
        if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 then
            v18(v8(v68, l_ProductTypeEnum_0.DeveloperSubscription));
            return;
        else
            v18(v11(v68));
            return;
        end;
    end;
    return {
        onPurchaseRequest = v23, 
        onPurchaseRequestV2 = v30, 
        onRobloxPurchaseRequest = v33, 
        onProductPurchaseRequest = v38, 
        onPurchaseGamePassRequest = v41, 
        onServerPurchaseVerification = v53, 
        onBundlePurchaseRequest = v56, 
        onPremiumPurchaseRequest = v67, 
        onPromptCollectiblesPurchaseRequest = v50, 
        onSubscriptionPurchaseRequest = v69, 
        onCollectibleBundlePurchaseRequest = v65
    };
end)(function(v70) --[[ Line: 29 ]] --[[ Name: MarketplaceServiceEventConnector ]]
    -- upvalues: l_MarketplaceService_0 (copy), v14 (copy), v15 (copy), l_Roact_0 (copy), v13 (copy)
    local l_onPurchaseRequest_0 = v70.onPurchaseRequest;
    local l_onPurchaseRequestV2_0 = v70.onPurchaseRequestV2;
    local l_onProductPurchaseRequest_0 = v70.onProductPurchaseRequest;
    local l_onPurchaseGamePassRequest_0 = v70.onPurchaseGamePassRequest;
    local l_onServerPurchaseVerification_0 = v70.onServerPurchaseVerification;
    local l_onBundlePurchaseRequest_0 = v70.onBundlePurchaseRequest;
    local l_onPremiumPurchaseRequest_0 = v70.onPremiumPurchaseRequest;
    local l_onRobloxPurchaseRequest_0 = v70.onRobloxPurchaseRequest;
    local l_onPromptCollectiblesPurchaseRequest_0 = v70.onPromptCollectiblesPurchaseRequest;
    local l_onSubscriptionPurchaseRequest_0 = v70.onSubscriptionPurchaseRequest;
    local l_onCollectibleBundlePurchaseRequest_0 = v70.onCollectibleBundlePurchaseRequest;
    local function v82() --[[ Line: 42 ]] --[[ Name: checkNewEventExists ]]
        -- upvalues: l_MarketplaceService_0 (ref)
        return l_MarketplaceService_0.PromptPurchaseRequestedV2;
    end;
    local v83 = nil;
    v83 = if not not v14() or v15() and pcall(v82) then l_Roact_0.createElement(v13, {
        event = l_MarketplaceService_0.PromptPurchaseRequestedV2, 
        callback = l_onPurchaseRequestV2_0
    }) else l_Roact_0.createElement(v13, {
        event = l_MarketplaceService_0.PromptPurchaseRequested, 
        callback = l_onPurchaseRequest_0
    });
    local function v84() --[[ Line: 62 ]] --[[ Name: checkPromptCollectiblesPurchaseRequestedEventExists ]]
        -- upvalues: l_MarketplaceService_0 (ref)
        return l_MarketplaceService_0.PromptCollectiblesPurchaseRequested;
    end;
    local v85 = nil;
    if pcall(v84) then
        v85 = l_Roact_0.createElement(v13, {
            event = l_MarketplaceService_0.PromptCollectiblesPurchaseRequested, 
            callback = l_onPromptCollectiblesPurchaseRequest_0
        });
    end;
    local function v86() --[[ Line: 73 ]] --[[ Name: checkCollectibleBundlePurchaseEventExists ]]
        -- upvalues: l_MarketplaceService_0 (ref)
        return l_MarketplaceService_0.PromptCollectibleBundlePurchaseRequested;
    end;
    local v87 = nil;
    if pcall(v86) then
        v87 = l_Roact_0.createElement(v13, {
            event = l_MarketplaceService_0.PromptCollectibleBundlePurchaseRequested, 
            callback = l_onCollectibleBundlePurchaseRequest_0
        });
    end;
    return l_Roact_0.createFragment({
        v83, 
        v85, 
        v87, 
        RobloxPurchase = l_Roact_0.createElement(v13, {
            event = l_MarketplaceService_0.PromptRobloxPurchaseRequested, 
            callback = l_onRobloxPurchaseRequest_0
        }), 
        l_Roact_0.createElement(v13, {
            event = l_MarketplaceService_0.PromptProductPurchaseRequested, 
            callback = l_onProductPurchaseRequest_0
        }), 
        l_Roact_0.createElement(v13, {
            event = l_MarketplaceService_0.PromptGamePassPurchaseRequested, 
            callback = l_onPurchaseGamePassRequest_0
        }), 
        l_Roact_0.createElement(v13, {
            event = l_MarketplaceService_0.ServerPurchaseVerification, 
            callback = l_onServerPurchaseVerification_0
        }), 
        l_Roact_0.createElement(v13, {
            event = l_MarketplaceService_0.PromptBundlePurchaseRequested, 
            callback = l_onBundlePurchaseRequest_0
        }), 
        l_Roact_0.createElement(v13, {
            event = l_MarketplaceService_0.PromptPremiumPurchaseRequested, 
            callback = l_onPremiumPurchaseRequest_0
        }), 
        l_Roact_0.createElement(v13, {
            event = l_MarketplaceService_0.PromptSubscriptionPurchaseRequested, 
            callback = l_onSubscriptionPurchaseRequest_0
        })
    });
end));