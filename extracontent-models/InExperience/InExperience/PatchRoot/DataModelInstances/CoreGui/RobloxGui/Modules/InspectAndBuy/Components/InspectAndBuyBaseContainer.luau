local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v7 = require(l_Parent_0.Components.AvatarViewport);
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceInspectAndBuy);
local l_useViewBreakpoints_0 = v8.Hooks.useViewBreakpoints;
local l_ResponsivePanelLayout_0 = v8.Components.ResponsivePanelLayout;
local l_useResponsivePanelLayoutProps_0 = v8.Hooks.useResponsivePanelLayoutProps;
local l_applyTryOnItemToHumanoidDescription_0 = v8.Utils.applyTryOnItemToHumanoidDescription;
local l_useInspectAndBuyFocusNavigation_0 = v8.Hooks.useInspectAndBuyFocusNavigation;
local l_buildBulkPurchaseAnalyticsPayload_0 = v8.Utils.buildBulkPurchaseAnalyticsPayload;
local v15 = require(l_Parent_0.Actions.UpdateBulkPuchaseResults);
local v16 = require(l_Parent_0.Thunks.GetProductInfo);
local v17 = require(l_Parent_0.Thunks.GetFavoriteForAsset);
local v18 = require(l_Parent_0.Thunks.GetFavoriteForBundle);
local v19 = require(l_Parent_0.Thunks.CreateFavoriteForAsset);
local v20 = require(l_Parent_0.Thunks.DeleteFavoriteForAsset);
local v21 = require(l_Parent_0.Thunks.CreateFavoriteForBundle);
local v22 = require(l_Parent_0.Thunks.DeleteFavoriteForBundle);
local v23 = require(l_Parent_0.Thunks.PromptPurchase);
local v24 = require(l_Parent_0.Thunks.GetItemDetails);
local v25 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useDispatch_0 = v25.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v25.Hooks.RoactRodux.useSelector;
local l_ItemTypeEnum_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Enums.ItemTypeEnum;
local v29 = require(l_Parent_0.Actions.OpenOverlay);
local v30 = require(l_Parent_0.Enums.Overlay);
local v31 = require(l_Parent_0.Components.Overlay);
local l_useUnifiedEventListenerInExperience_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).useUnifiedEventListener.useUnifiedEventListenerInExperience;
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local v34 = require(l_CorePackages_0.Packages.Foundation);
local l_useTokens_0 = v34.Hooks.useTokens;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v37 = require(l_Modules_0.Settings.Theme);
local v38 = require(l_Modules_0.TopBar.Constants);
local v39 = require(l_CorePackages_0.Packages.tutils);
local v40 = game:DefineFastFlag("EnableAvatarViewportAutoRotation", false);
local v41 = game:DefineFastInt("AXViewportCameraFieldOfView", 68);
local l_FFlagIBV2Attribution_0 = v5.FFlagIBV2Attribution;
local l_FFlagAXEnableBatchItemDetailsFetchV2_0 = v6.FFlagAXEnableBatchItemDetailsFetchV2;
local l_FFlagAXEnableInspectAndBuyFocusNavigation_0 = v6.FFlagAXEnableInspectAndBuyFocusNavigation;
local l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 = v6.FFlagAXEnableIaBTimedOptionsBulkPurchase;
local v46 = if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then v8.Contexts.ItemSelectionStoreContext else nil;
local v47 = if v46 then v46.Provider else nil;
local v48 = if v46 then v46.useItemSelectionStore else nil;
local function v50(v49) --[[ Line: 84 ]]
    return v49.assets;
end;
local function v52(v51) --[[ Line: 88 ]]
    return v51.collectibleResellableInstances;
end;
local function v54(v53) --[[ Line: 92 ]]
    return v53.bundles;
end;
local function v97(v55) --[[ Line: 96 ]] --[[ Name: InspectAndBuyBaseContainer ]]
    -- upvalues: l_useViewBreakpoints_0 (copy), v38 (copy), l_useTokens_0 (copy), l_useDispatch_0 (copy), l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 (copy), v48 (copy), l_useSignalState_0 (copy), l_useSelector_0 (copy), v50 (copy), v39 (copy), v52 (copy), v54 (copy), v4 (copy), l_GuiService_0 (copy), v15 (copy), l_ItemTypeEnum_0 (copy), l_buildBulkPurchaseAnalyticsPayload_0 (copy), v24 (copy), v17 (copy), v16 (copy), l_FFlagIBV2Attribution_0 (copy), l_FFlagAXEnableBatchItemDetailsFetchV2_0 (copy), v18 (copy), v20 (copy), v19 (copy), v22 (copy), v21 (copy), v29 (copy), v30 (copy), v23 (copy), l_applyTryOnItemToHumanoidDescription_0 (copy), v7 (copy), v40 (copy), v41 (copy), l_useResponsivePanelLayoutProps_0 (copy), l_useUnifiedEventListenerInExperience_0 (copy), l_FFlagAXEnableInspectAndBuyFocusNavigation_0 (copy), l_useInspectAndBuyFocusNavigation_0 (copy), v34 (copy), v37 (copy), l_ResponsivePanelLayout_0 (copy), v31 (copy)
    local v56 = l_useViewBreakpoints_0(v38.TopBarHeight);
    local v57 = l_useTokens_0();
    local v58 = l_useDispatch_0();
    local v59 = if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then v48() else nil;
    local v60 = if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then l_useSignalState_0(v59.getItemDataMap) else nil;
    local v61 = if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then l_useSelector_0(v50, v39.deepEqual) else nil;
    local v62 = if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then l_useSelector_0(v52, v39.deepEqual) else nil;
    local v63 = if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then l_useSelector_0(v54, v39.deepEqual) else nil;
    local v64 = v4.useCallback(function() --[[ Line: 121 ]]
        -- upvalues: l_GuiService_0 (ref)
        l_GuiService_0:CloseInspectMenu();
    end, {});
    local v76 = v4.useCallback(function(_, _, v67) --[[ Line: 129 ]]
        -- upvalues: v58 (copy), v15 (ref), l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 (ref), v60 (copy), l_ItemTypeEnum_0 (ref), l_buildBulkPurchaseAnalyticsPayload_0 (ref), v61 (copy), v63 (copy), v62 (copy), v55 (copy), v24 (ref)
        v58(v15(v67));
        for _, v69 in v67.Items do
            if v69.status == Enum.MarketplaceItemPurchaseStatus.Success then
                if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 and v60 then
                    local v70 = v69.type == Enum.MarketplaceProductType.AvatarAsset;
                    local l_id_0 = v69.id;
                    local v72 = if v70 then Enum.AvatarItemType.Asset else Enum.AvatarItemType.Bundle;
                    local v73 = if v70 then l_ItemTypeEnum_0.Asset else l_ItemTypeEnum_0.Bundle;
                    local v74 = v60[tostring(l_id_0)];
                    local v75 = l_buildBulkPurchaseAnalyticsPayload_0({
                        itemId = tostring(l_id_0), 
                        itemType = v73, 
                        assetsMap = v61, 
                        bundlesMap = v63, 
                        collectibleResellableInstances = v62, 
                        storedData = v74
                    });
                    if v75 then
                        v55.analytics.reportPurchaseSuccessUnifiedEvent(v73, l_id_0, v75);
                    end;
                    v58(v24(l_id_0, v72));
                elseif v69.type == Enum.MarketplaceProductType.AvatarAsset then
                    v55.analytics.reportPurchaseSuccess(l_ItemTypeEnum_0.Asset, v69.id);
                    v58(v24(v69.id, Enum.AvatarItemType.Asset));
                elseif v69.type == Enum.MarketplaceProductType.AvatarBundle then
                    v55.analytics.reportPurchaseSuccess(l_ItemTypeEnum_0.Bundle, v69.id);
                    v58(v24(v69.id, Enum.AvatarItemType.Bundle));
                end;
            end;
        end;
    end, {
        v58, 
        if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then v61 else nil, 
        if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then v63 else nil, 
        if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then v62 else nil, 
        if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then v60 else nil, 
        if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then v55.analytics.reportPurchaseSuccess else nil, 
        if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then v55.analytics.reportPurchaseSuccessUnifiedEvent else nil
    });
    local v78 = v4.useCallback(function(v77) --[[ Line: 186 ]]
        -- upvalues: l_ItemTypeEnum_0 (ref), v58 (copy), v17 (ref), v16 (ref), l_FFlagIBV2Attribution_0 (ref), l_FFlagAXEnableBatchItemDetailsFetchV2_0 (ref), v24 (ref), v18 (ref)
        if v77.itemType == l_ItemTypeEnum_0.Asset then
            v58(v17(v77.id));
            v58(v16(v77.id));
            if l_FFlagIBV2Attribution_0 and l_FFlagAXEnableBatchItemDetailsFetchV2_0 then
                v58(v24(v77.id, Enum.AvatarItemType.Asset));
                return;
            end;
        elseif v77.itemType == l_ItemTypeEnum_0.Bundle then
            v58(v18(v77.id));
        end;
    end, {
        v58
    });
    local v81 = v4.useCallback(function(v79, v80) --[[ Line: 205 ]]
        -- upvalues: l_ItemTypeEnum_0 (ref), v58 (copy), v20 (ref), v19 (ref), v22 (ref), v21 (ref)
        if v79.itemType == l_ItemTypeEnum_0.Asset then
            if v80 then
                v58(v20(v79.id));
                return;
            else
                v58(v19(v79.id));
                return;
            end;
        else
            if v79.itemType == l_ItemTypeEnum_0.Bundle then
                if v80 then
                    v58(v22(v79.id));
                    return;
                else
                    v58(v21(v79.id));
                end;
            end;
            return;
        end;
    end, {
        v58
    });
    local v83 = if l_FFlagIBV2Attribution_0 then v4.useCallback(function(v82) --[[ Line: 222 ]]
        -- upvalues: v58 (copy), v29 (ref), v30 (ref)
        v58(v29(v30.AttributionTraversal, v82));
    end, {
        v58
    }) else nil;
    local function v91(v84, v85, v86, v87, v88, v89, v90) --[[ Line: 260 ]]
        -- upvalues: v58 (copy), v23 (ref)
        v58(v23(v84, v85, v86, v87, v88, v89, v90));
    end;
    local v94 = v4.useCallback(function(v92) --[[ Line: 282 ]]
        -- upvalues: v55 (copy), l_applyTryOnItemToHumanoidDescription_0 (ref), v4 (ref), v7 (ref), v40 (ref), v41 (ref)
        if v55.localPlayerModel and v55.localPlayerModel.Humanoid then
            local v93 = v55.localPlayerModel.Humanoid.HumanoidDescription:Clone();
            l_applyTryOnItemToHumanoidDescription_0(v92, v93);
            return v4.createElement(v7, {
                size = UDim2.new(1, 0, 1, 0), 
                position = UDim2.new(0.5, 0, 0.5, 0), 
                humanoidDescription = v93, 
                model = v55.localPlayerModel, 
                visible = true, 
                backgroundTransparency = 1, 
                disableAutoRotation = not v40, 
                offsetOptions = {
                    defaultCameraOffset = CFrame.new(0, 0.5, -5), 
                    toolOffset = CFrame.new(0, 2, -8)
                }, 
                cameraFieldOfView = v41, 
                resetCameraAndAutoRotationOnModelChange = true
            });
        else
            return nil;
        end;
    end, {
        v55.localPlayerModel
    });
    local v95 = l_useResponsivePanelLayoutProps_0({
        onInspectMenuClosed = v64, 
        onBulkPurchaseFinished = v76, 
        onItemDetailsOpened = v78, 
        onToggleFavorite = v81, 
        openAttributionOverlay = if l_FFlagIBV2Attribution_0 then v83 else nil, 
        onPromptPurchase = v91, 
        renderTryOnViewport = v94, 
        localPlayerModel = v55.localPlayerModel, 
        analytics = v55.analytics
    });
    l_useUnifiedEventListenerInExperience_0();
    if l_FFlagAXEnableInspectAndBuyFocusNavigation_0 then
        local v96 = l_useInspectAndBuyFocusNavigation_0();
        return v4.createElement("Frame", {
            ref = v96.setFocusRef, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            SelectionGroup = v96.focusNavigationProps.SelectionGroup, 
            SelectionBehaviorDown = v96.focusNavigationProps.SelectionBehaviorDown, 
            SelectionBehaviorLeft = v96.focusNavigationProps.SelectionBehaviorLeft, 
            SelectionBehaviorRight = v96.focusNavigationProps.SelectionBehaviorRight, 
            SelectionBehaviorUp = v96.focusNavigationProps.SelectionBehaviorUp
        }, {
            Content = v4.createElement(v34.View, {
                Size = v56.OverlaySize, 
                Position = v56.OverlayPosition, 
                backgroundStyle = v57.Color.Common.Shadow, 
                stateLayer = {
                    affordance = v34.Enums.StateLayerAffordance.None
                }, 
                onActivated = function() --[[ Line: 342 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_GuiService_0 (ref)
                    l_GuiService_0:CloseInspectMenu();
                end
            }, {
                ContainerView = v4.createElement(v34.View, {
                    AnchorPoint = v56.ContainerAnchorPoint, 
                    ClipsDescendants = true, 
                    Size = v56.ContainerSize, 
                    Position = v56.ContainerPosition, 
                    backgroundStyle = {
                        Color3 = v37.color("MenuContainer"), 
                        Transparency = v37.transparency("MenuContainer", 1) * l_GuiService_0.PreferredTransparency
                    }, 
                    stateLayer = {
                        affordance = v34.Enums.StateLayerAffordance.None
                    }, 
                    onActivated = function() --[[ Line: 358 ]] --[[ Name: onActivated ]]

                    end
                }, {
                    UICorner = v4.createElement("UICorner", {
                        CornerRadius = v37.DefaultCornerRadius
                    }), 
                    ResponsivePanelLayout = v4.createElement(l_ResponsivePanelLayout_0, v95)
                }), 
                Overlay = if l_FFlagIBV2Attribution_0 then v4.createElement(v31) else nil
            })
        });
    else
        return (v4.createElement(v34.View, {
            Size = v56.OverlaySize, 
            Position = v56.OverlayPosition, 
            backgroundStyle = v57.Color.Common.Shadow, 
            stateLayer = {
                affordance = v34.Enums.StateLayerAffordance.None
            }, 
            onActivated = function() --[[ Line: 376 ]] --[[ Name: onActivated ]]
                -- upvalues: l_GuiService_0 (ref)
                l_GuiService_0:CloseInspectMenu();
            end
        }, {
            ContainerView = v4.createElement(v34.View, {
                AnchorPoint = v56.ContainerAnchorPoint, 
                ClipsDescendants = true, 
                Size = v56.ContainerSize, 
                Position = v56.ContainerPosition, 
                backgroundStyle = {
                    Color3 = v37.color("MenuContainer"), 
                    Transparency = v37.transparency("MenuContainer", 1) * l_GuiService_0.PreferredTransparency
                }, 
                stateLayer = {
                    affordance = v34.Enums.StateLayerAffordance.None
                }, 
                onActivated = function() --[[ Line: 392 ]] --[[ Name: onActivated ]]

                end
            }, {
                UICorner = v4.createElement("UICorner", {
                    CornerRadius = v37.DefaultCornerRadius
                }), 
                ResponsivePanelLayout = v4.createElement(l_ResponsivePanelLayout_0, v95)
            }), 
            Overlay = if l_FFlagIBV2Attribution_0 then v4.createElement(v31) else nil
        }));
    end;
end;
local function v99(v98) --[[ Line: 404 ]] --[[ Name: InspectAndBuyBaseContainerWithSignalsProvider ]]
    -- upvalues: v4 (copy), v47 (copy), v97 (copy)
    return v4.createElement(v47, {}, {
        Inner = v4.createElement(v97, v98)
    });
end;
if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then
    return v99;
else
    return v97;
end;