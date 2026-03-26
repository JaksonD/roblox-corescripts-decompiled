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
local v18 = require(l_script_FirstAncestor_0.Flags.FFlagEnablePromptRobloxSubscriptionPurchaseBinding);
local v19 = require(l_Parent_0.RobloxSubscriptionPurchaseApp);
local l_SurfaceContext_0 = v19.SurfaceContext;
local l_SurfaceName_0 = v19.SurfaceName;
return (v12(nil, function(v22) --[[ Line: 134 ]]
    -- upvalues: l_Players_0 (copy), v8 (copy), v5 (copy), v6 (copy), v7 (copy), v9 (copy), v10 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), l_ProductTypeEnum_0 (copy), v11 (copy), v18 (copy), v19 (copy), l_SurfaceName_0 (copy), l_SurfaceContext_0 (copy)
    local function v27(v23, v24, v25, _) --[[ Line: 135 ]] --[[ Name: onPurchaseRequest ]]
        -- upvalues: l_Players_0 (ref), v22 (copy), v8 (ref)
        if v23 == l_Players_0.LocalPlayer then
            v22(v8(v24, Enum.InfoType.Asset, v25, false, "", ""));
        end;
    end;
    local function v34(v28, v29, v30, _, v32, v33) --[[ Line: 141 ]] --[[ Name: onPurchaseRequestV2 ]]
        -- upvalues: l_Players_0 (ref), v22 (copy), v8 (ref)
        if v28 == l_Players_0.LocalPlayer then
            v22(v8(v29, Enum.InfoType.Asset, v30, false, v32, v33));
        end;
    end;
    local function v37(v35, v36) --[[ Line: 163 ]] --[[ Name: onRobloxPurchaseRequest ]]
        -- upvalues: v22 (copy), v8 (ref)
        v22(v8(v35, Enum.InfoType.Asset, v36, true));
    end;
    local function v42(v38, v39, v40, _) --[[ Line: 167 ]] --[[ Name: onProductPurchaseRequest ]]
        -- upvalues: l_Players_0 (ref), v22 (copy), v8 (ref)
        if v38 == l_Players_0.LocalPlayer then
            v22(v8(v39, Enum.InfoType.Product, v40));
        end;
    end;
    local function v45(v43, v44) --[[ Line: 173 ]] --[[ Name: onPurchaseGamePassRequest ]]
        -- upvalues: l_Players_0 (ref), v22 (copy), v8 (ref)
        if v43 == l_Players_0.LocalPlayer then
            v22(v8(v44, Enum.InfoType.GamePass, false));
        end;
    end;
    local function v54(v46, v47, v48, v49, v50, v51, v52, v53) --[[ Line: 179 ]] --[[ Name: onPromptCollectiblesPurchaseRequest ]]
        -- upvalues: l_Players_0 (ref), v22 (copy), v8 (ref)
        if v46 == l_Players_0.LocalPlayer then
            v22(v8(v47, Enum.InfoType.Asset, false, true, v52, v53, v48, v49, v50, v51));
        end;
    end;
    local function v57(v55) --[[ Line: 208 ]] --[[ Name: onServerPurchaseVerification ]]
        -- upvalues: v22 (copy), v5 (ref), v6 (ref), l_Players_0 (ref), v7 (ref)
        if not v55 then
            v22(v5(v6.UnknownFailure));
            return;
        else
            local l_playerId_0 = v55.playerId;
            if l_playerId_0 ~= nil then
                l_playerId_0 = tonumber(v55.playerId);
            end;
            if l_playerId_0 == l_Players_0.LocalPlayer.UserId then
                v22(v7());
            end;
            return;
        end;
    end;
    local function v60(v58, v59) --[[ Line: 222 ]] --[[ Name: onBundlePurchaseRequest ]]
        -- upvalues: l_Players_0 (ref), v22 (copy), v9 (ref)
        if v58 == l_Players_0.LocalPlayer then
            v22(v9(v59));
        end;
    end;
    local function v69(v61, v62, v63, v64, v65, v66, v67, v68) --[[ Line: 228 ]] --[[ Name: onCollectibleBundlePurchaseRequest ]]
        -- upvalues: l_Players_0 (ref), v22 (copy), v9 (ref)
        if v61 == l_Players_0.LocalPlayer then
            v22(v9(v62, v67, v68, v63, v64, v65, v66));
        end;
    end;
    local function v71(v70) --[[ Line: 253 ]] --[[ Name: onPremiumPurchaseRequest ]]
        -- upvalues: l_Players_0 (ref), v22 (copy), v10 (ref)
        if v70 == l_Players_0.LocalPlayer then
            v22(v10());
        end;
    end;
    local function v73(v72) --[[ Line: 259 ]] --[[ Name: onSubscriptionPurchaseRequest ]]
        -- upvalues: l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (ref), v22 (copy), v8 (ref), l_ProductTypeEnum_0 (ref), v11 (ref)
        if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 then
            v22(v8(v72, l_ProductTypeEnum_0.DeveloperSubscription));
            return;
        else
            v22(v11(v72));
            return;
        end;
    end;
    local function v74() --[[ Line: 267 ]] --[[ Name: onRobloxSubscriptionPurchaseRequest ]]
        -- upvalues: v18 (ref), v19 (ref), l_SurfaceName_0 (ref), l_SurfaceContext_0 (ref)
        if v18 then
            v19.initiateRobloxSubscriptionPurchase({}, nil, nil, l_SurfaceName_0.PromptSubscriptionPurchase, l_SurfaceContext_0.InGame, {
                skipWaitingForPurchaseResult = true
            });
        end;
    end;
    return {
        onPurchaseRequest = v27, 
        onPurchaseRequestV2 = v34, 
        onRobloxPurchaseRequest = v37, 
        onProductPurchaseRequest = v42, 
        onPurchaseGamePassRequest = v45, 
        onServerPurchaseVerification = v57, 
        onBundlePurchaseRequest = v60, 
        onPremiumPurchaseRequest = v71, 
        onPromptCollectiblesPurchaseRequest = v54, 
        onSubscriptionPurchaseRequest = v73, 
        onCollectibleBundlePurchaseRequest = v69, 
        onRobloxSubscriptionPurchaseRequest = v74
    };
end)(function(v75) --[[ Line: 36 ]] --[[ Name: MarketplaceServiceEventConnector ]]
    -- upvalues: l_MarketplaceService_0 (copy), v14 (copy), v15 (copy), l_Roact_0 (copy), v13 (copy), v18 (copy)
    local l_onPurchaseRequest_0 = v75.onPurchaseRequest;
    local l_onPurchaseRequestV2_0 = v75.onPurchaseRequestV2;
    local l_onProductPurchaseRequest_0 = v75.onProductPurchaseRequest;
    local l_onPurchaseGamePassRequest_0 = v75.onPurchaseGamePassRequest;
    local l_onServerPurchaseVerification_0 = v75.onServerPurchaseVerification;
    local l_onBundlePurchaseRequest_0 = v75.onBundlePurchaseRequest;
    local l_onPremiumPurchaseRequest_0 = v75.onPremiumPurchaseRequest;
    local l_onRobloxPurchaseRequest_0 = v75.onRobloxPurchaseRequest;
    local l_onPromptCollectiblesPurchaseRequest_0 = v75.onPromptCollectiblesPurchaseRequest;
    local l_onSubscriptionPurchaseRequest_0 = v75.onSubscriptionPurchaseRequest;
    local l_onCollectibleBundlePurchaseRequest_0 = v75.onCollectibleBundlePurchaseRequest;
    local l_onRobloxSubscriptionPurchaseRequest_0 = v75.onRobloxSubscriptionPurchaseRequest;
    local function v88() --[[ Line: 50 ]] --[[ Name: checkNewEventExists ]]
        -- upvalues: l_MarketplaceService_0 (ref)
        return l_MarketplaceService_0.PromptPurchaseRequestedV2;
    end;
    local v89 = nil;
    v89 = if not not v14() or v15() and pcall(v88) then l_Roact_0.createElement(v13, {
        event = l_MarketplaceService_0.PromptPurchaseRequestedV2, 
        callback = l_onPurchaseRequestV2_0
    }) else l_Roact_0.createElement(v13, {
        event = l_MarketplaceService_0.PromptPurchaseRequested, 
        callback = l_onPurchaseRequest_0
    });
    local function v90() --[[ Line: 70 ]] --[[ Name: checkPromptCollectiblesPurchaseRequestedEventExists ]]
        -- upvalues: l_MarketplaceService_0 (ref)
        return l_MarketplaceService_0.PromptCollectiblesPurchaseRequested;
    end;
    local v91 = nil;
    if pcall(v90) then
        v91 = l_Roact_0.createElement(v13, {
            event = l_MarketplaceService_0.PromptCollectiblesPurchaseRequested, 
            callback = l_onPromptCollectiblesPurchaseRequest_0
        });
    end;
    local function v92() --[[ Line: 81 ]] --[[ Name: checkCollectibleBundlePurchaseEventExists ]]
        -- upvalues: l_MarketplaceService_0 (ref)
        return l_MarketplaceService_0.PromptCollectibleBundlePurchaseRequested;
    end;
    local v93 = nil;
    if pcall(v92) then
        v93 = l_Roact_0.createElement(v13, {
            event = l_MarketplaceService_0.PromptCollectibleBundlePurchaseRequested, 
            callback = l_onCollectibleBundlePurchaseRequest_0
        });
    end;
    return l_Roact_0.createFragment({
        v89, 
        v91, 
        v93, 
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
        }), 
        if v18 then l_Roact_0.createElement(v13, {
            event = l_MarketplaceService_0.PromptRobloxSubscriptionPurchaseRequested, 
            callback = l_onRobloxSubscriptionPurchaseRequest_0
        }) else nil
    });
end));