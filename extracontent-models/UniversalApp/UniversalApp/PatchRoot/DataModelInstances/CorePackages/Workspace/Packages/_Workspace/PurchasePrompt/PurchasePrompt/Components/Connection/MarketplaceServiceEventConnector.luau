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
local v19 = game:DefineFastFlag("RoutePremiumToBlackbirdUpsell", false);
local v20 = require(l_Parent_0.RobloxSubscriptionPurchaseApp);
local l_SurfaceContext_0 = v20.SurfaceContext;
local l_SurfaceName_0 = v20.SurfaceName;
return (v12(nil, function(v23) --[[ Line: 135 ]]
    -- upvalues: l_Players_0 (copy), v8 (copy), v5 (copy), v6 (copy), v7 (copy), v9 (copy), v19 (copy), v20 (copy), l_SurfaceName_0 (copy), l_SurfaceContext_0 (copy), v10 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), l_ProductTypeEnum_0 (copy), v11 (copy), v18 (copy)
    local function v28(v24, v25, v26, _) --[[ Line: 136 ]] --[[ Name: onPurchaseRequest ]]
        -- upvalues: l_Players_0 (ref), v23 (copy), v8 (ref)
        if v24 == l_Players_0.LocalPlayer then
            v23(v8(v25, Enum.InfoType.Asset, v26, false, "", ""));
        end;
    end;
    local function v35(v29, v30, v31, _, v33, v34) --[[ Line: 142 ]] --[[ Name: onPurchaseRequestV2 ]]
        -- upvalues: l_Players_0 (ref), v23 (copy), v8 (ref)
        if v29 == l_Players_0.LocalPlayer then
            v23(v8(v30, Enum.InfoType.Asset, v31, false, v33, v34));
        end;
    end;
    local function v38(v36, v37) --[[ Line: 164 ]] --[[ Name: onRobloxPurchaseRequest ]]
        -- upvalues: v23 (copy), v8 (ref)
        v23(v8(v36, Enum.InfoType.Asset, v37, true));
    end;
    local function v43(v39, v40, v41, _) --[[ Line: 168 ]] --[[ Name: onProductPurchaseRequest ]]
        -- upvalues: l_Players_0 (ref), v23 (copy), v8 (ref)
        if v39 == l_Players_0.LocalPlayer then
            v23(v8(v40, Enum.InfoType.Product, v41));
        end;
    end;
    local function v46(v44, v45) --[[ Line: 174 ]] --[[ Name: onPurchaseGamePassRequest ]]
        -- upvalues: l_Players_0 (ref), v23 (copy), v8 (ref)
        if v44 == l_Players_0.LocalPlayer then
            v23(v8(v45, Enum.InfoType.GamePass, false));
        end;
    end;
    local function v55(v47, v48, v49, v50, v51, v52, v53, v54) --[[ Line: 180 ]] --[[ Name: onPromptCollectiblesPurchaseRequest ]]
        -- upvalues: l_Players_0 (ref), v23 (copy), v8 (ref)
        if v47 == l_Players_0.LocalPlayer then
            v23(v8(v48, Enum.InfoType.Asset, false, true, v53, v54, v49, v50, v51, v52));
        end;
    end;
    local function v58(v56) --[[ Line: 209 ]] --[[ Name: onServerPurchaseVerification ]]
        -- upvalues: v23 (copy), v5 (ref), v6 (ref), l_Players_0 (ref), v7 (ref)
        if not v56 then
            v23(v5(v6.UnknownFailure));
            return;
        else
            local l_playerId_0 = v56.playerId;
            if l_playerId_0 ~= nil then
                l_playerId_0 = tonumber(v56.playerId);
            end;
            if l_playerId_0 == l_Players_0.LocalPlayer.UserId then
                v23(v7());
            end;
            return;
        end;
    end;
    local function v61(v59, v60) --[[ Line: 223 ]] --[[ Name: onBundlePurchaseRequest ]]
        -- upvalues: l_Players_0 (ref), v23 (copy), v9 (ref)
        if v59 == l_Players_0.LocalPlayer then
            v23(v9(v60));
        end;
    end;
    local function v70(v62, v63, v64, v65, v66, v67, v68, v69) --[[ Line: 229 ]] --[[ Name: onCollectibleBundlePurchaseRequest ]]
        -- upvalues: l_Players_0 (ref), v23 (copy), v9 (ref)
        if v62 == l_Players_0.LocalPlayer then
            v23(v9(v63, v68, v69, v64, v65, v66, v67));
        end;
    end;
    local function v72(v71) --[[ Line: 254 ]] --[[ Name: onPremiumPurchaseRequest ]]
        -- upvalues: l_Players_0 (ref), v19 (ref), v20 (ref), l_SurfaceName_0 (ref), l_SurfaceContext_0 (ref), v23 (copy), v10 (ref)
        if v71 == l_Players_0.LocalPlayer then
            if v19 then
                v20.initiateRobloxSubscriptionPurchase({}, nil, nil, l_SurfaceName_0.PromptSubscriptionPurchase, l_SurfaceContext_0.InGame, {
                    skipWaitingForPurchaseResult = true
                });
                return;
            else
                v23(v10());
            end;
        end;
    end;
    local function v74(v73) --[[ Line: 274 ]] --[[ Name: onSubscriptionPurchaseRequest ]]
        -- upvalues: l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (ref), v23 (copy), v8 (ref), l_ProductTypeEnum_0 (ref), v11 (ref)
        if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 then
            v23(v8(v73, l_ProductTypeEnum_0.DeveloperSubscription));
            return;
        else
            v23(v11(v73));
            return;
        end;
    end;
    local function v75() --[[ Line: 282 ]] --[[ Name: onRobloxSubscriptionPurchaseRequest ]]
        -- upvalues: v18 (ref), v20 (ref), l_SurfaceName_0 (ref), l_SurfaceContext_0 (ref)
        if v18 then
            v20.initiateRobloxSubscriptionPurchase({}, nil, nil, l_SurfaceName_0.PromptSubscriptionPurchase, l_SurfaceContext_0.InGame, {
                skipWaitingForPurchaseResult = true
            });
        end;
    end;
    return {
        onPurchaseRequest = v28, 
        onPurchaseRequestV2 = v35, 
        onRobloxPurchaseRequest = v38, 
        onProductPurchaseRequest = v43, 
        onPurchaseGamePassRequest = v46, 
        onServerPurchaseVerification = v58, 
        onBundlePurchaseRequest = v61, 
        onPremiumPurchaseRequest = v72, 
        onPromptCollectiblesPurchaseRequest = v55, 
        onSubscriptionPurchaseRequest = v74, 
        onCollectibleBundlePurchaseRequest = v70, 
        onRobloxSubscriptionPurchaseRequest = v75
    };
end)(function(v76) --[[ Line: 37 ]] --[[ Name: MarketplaceServiceEventConnector ]]
    -- upvalues: l_MarketplaceService_0 (copy), v14 (copy), v15 (copy), l_Roact_0 (copy), v13 (copy), v18 (copy)
    local l_onPurchaseRequest_0 = v76.onPurchaseRequest;
    local l_onPurchaseRequestV2_0 = v76.onPurchaseRequestV2;
    local l_onProductPurchaseRequest_0 = v76.onProductPurchaseRequest;
    local l_onPurchaseGamePassRequest_0 = v76.onPurchaseGamePassRequest;
    local l_onServerPurchaseVerification_0 = v76.onServerPurchaseVerification;
    local l_onBundlePurchaseRequest_0 = v76.onBundlePurchaseRequest;
    local l_onPremiumPurchaseRequest_0 = v76.onPremiumPurchaseRequest;
    local l_onRobloxPurchaseRequest_0 = v76.onRobloxPurchaseRequest;
    local l_onPromptCollectiblesPurchaseRequest_0 = v76.onPromptCollectiblesPurchaseRequest;
    local l_onSubscriptionPurchaseRequest_0 = v76.onSubscriptionPurchaseRequest;
    local l_onCollectibleBundlePurchaseRequest_0 = v76.onCollectibleBundlePurchaseRequest;
    local l_onRobloxSubscriptionPurchaseRequest_0 = v76.onRobloxSubscriptionPurchaseRequest;
    local function v89() --[[ Line: 51 ]] --[[ Name: checkNewEventExists ]]
        -- upvalues: l_MarketplaceService_0 (ref)
        return l_MarketplaceService_0.PromptPurchaseRequestedV2;
    end;
    local v90 = nil;
    v90 = if not not v14() or v15() and pcall(v89) then l_Roact_0.createElement(v13, {
        event = l_MarketplaceService_0.PromptPurchaseRequestedV2, 
        callback = l_onPurchaseRequestV2_0
    }) else l_Roact_0.createElement(v13, {
        event = l_MarketplaceService_0.PromptPurchaseRequested, 
        callback = l_onPurchaseRequest_0
    });
    local function v91() --[[ Line: 71 ]] --[[ Name: checkPromptCollectiblesPurchaseRequestedEventExists ]]
        -- upvalues: l_MarketplaceService_0 (ref)
        return l_MarketplaceService_0.PromptCollectiblesPurchaseRequested;
    end;
    local v92 = nil;
    if pcall(v91) then
        v92 = l_Roact_0.createElement(v13, {
            event = l_MarketplaceService_0.PromptCollectiblesPurchaseRequested, 
            callback = l_onPromptCollectiblesPurchaseRequest_0
        });
    end;
    local function v93() --[[ Line: 82 ]] --[[ Name: checkCollectibleBundlePurchaseEventExists ]]
        -- upvalues: l_MarketplaceService_0 (ref)
        return l_MarketplaceService_0.PromptCollectibleBundlePurchaseRequested;
    end;
    local v94 = nil;
    if pcall(v93) then
        v94 = l_Roact_0.createElement(v13, {
            event = l_MarketplaceService_0.PromptCollectibleBundlePurchaseRequested, 
            callback = l_onCollectibleBundlePurchaseRequest_0
        });
    end;
    return l_Roact_0.createFragment({
        v90, 
        v92, 
        v94, 
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