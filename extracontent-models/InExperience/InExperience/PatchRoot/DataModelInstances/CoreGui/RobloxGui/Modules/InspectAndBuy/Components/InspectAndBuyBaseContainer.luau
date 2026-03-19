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
local v14 = require(l_Parent_0.Actions.UpdateBulkPuchaseResults);
local v15 = require(l_Parent_0.Thunks.GetProductInfo);
local v16 = require(l_Parent_0.Thunks.GetFavoriteForAsset);
local v17 = require(l_Parent_0.Thunks.GetFavoriteForBundle);
local v18 = require(l_Parent_0.Thunks.CreateFavoriteForAsset);
local v19 = require(l_Parent_0.Thunks.DeleteFavoriteForAsset);
local v20 = require(l_Parent_0.Thunks.CreateFavoriteForBundle);
local v21 = require(l_Parent_0.Thunks.DeleteFavoriteForBundle);
local v22 = require(l_Parent_0.Thunks.PromptPurchase);
local v23 = require(l_Parent_0.Thunks.GetItemDetails);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_ItemTypeEnum_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Enums.ItemTypeEnum;
local v26 = require(l_Parent_0.Actions.OpenOverlay);
local v27 = require(l_Parent_0.Enums.Overlay);
local v28 = require(l_Parent_0.Components.Overlay);
local l_useUnifiedEventListenerInExperience_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).useUnifiedEventListener.useUnifiedEventListenerInExperience;
local v30 = require(l_CorePackages_0.Packages.Foundation);
local l_useTokens_0 = v30.Hooks.useTokens;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v33 = require(l_Modules_0.Settings.Theme);
local v34 = require(l_Modules_0.TopBar.Constants);
local v35 = game:DefineFastFlag("EnableAvatarViewportAutoRotation", false);
local v36 = game:DefineFastInt("AXViewportCameraFieldOfView", 68);
local l_FFlagIBV2Attribution_0 = v5.FFlagIBV2Attribution;
local l_FFlagAXEnableBatchItemDetailsFetchV2_0 = v6.FFlagAXEnableBatchItemDetailsFetchV2;
local l_FFlagAXEnableInspectAndBuyFocusNavigation_0 = v6.FFlagAXEnableInspectAndBuyFocusNavigation;
return function(v40) --[[ Line: 65 ]] --[[ Name: InspectAndBuyBaseContainer ]]
    -- upvalues: l_useViewBreakpoints_0 (copy), v34 (copy), l_useTokens_0 (copy), l_useDispatch_0 (copy), v4 (copy), l_GuiService_0 (copy), v14 (copy), l_ItemTypeEnum_0 (copy), v23 (copy), v16 (copy), v15 (copy), l_FFlagIBV2Attribution_0 (copy), l_FFlagAXEnableBatchItemDetailsFetchV2_0 (copy), v17 (copy), v19 (copy), v18 (copy), v21 (copy), v20 (copy), v26 (copy), v27 (copy), v22 (copy), l_applyTryOnItemToHumanoidDescription_0 (copy), v7 (copy), v35 (copy), v36 (copy), l_useResponsivePanelLayoutProps_0 (copy), l_useUnifiedEventListenerInExperience_0 (copy), l_FFlagAXEnableInspectAndBuyFocusNavigation_0 (copy), l_useInspectAndBuyFocusNavigation_0 (copy), v30 (copy), v33 (copy), l_ResponsivePanelLayout_0 (copy), v28 (copy)
    local v41 = l_useViewBreakpoints_0(v34.TopBarHeight);
    local v42 = l_useTokens_0();
    local v43 = l_useDispatch_0();
    local v44 = v4.useCallback(function() --[[ Line: 73 ]]
        -- upvalues: l_GuiService_0 (ref)
        l_GuiService_0:CloseInspectMenu();
    end, {});
    local v50 = v4.useCallback(function(_, _, v47) --[[ Line: 80 ]]
        -- upvalues: v43 (copy), v14 (ref), v40 (copy), l_ItemTypeEnum_0 (ref), v23 (ref)
        v43(v14(v47));
        for _, v49 in v47.Items do
            if v49.status == Enum.MarketplaceItemPurchaseStatus.Success then
                if v49.type == Enum.MarketplaceProductType.AvatarAsset then
                    v40.analytics.reportPurchaseSuccess(l_ItemTypeEnum_0.Asset, v49.id);
                    v43(v23(v49.id, Enum.AvatarItemType.Asset));
                elseif v49.type == Enum.MarketplaceProductType.AvatarBundle then
                    v40.analytics.reportPurchaseSuccess(l_ItemTypeEnum_0.Bundle, v49.id);
                    v43(v23(v49.id, Enum.AvatarItemType.Bundle));
                end;
            end;
        end;
    end, {
        v43
    });
    local v52 = v4.useCallback(function(v51) --[[ Line: 106 ]]
        -- upvalues: l_ItemTypeEnum_0 (ref), v43 (copy), v16 (ref), v15 (ref), l_FFlagIBV2Attribution_0 (ref), l_FFlagAXEnableBatchItemDetailsFetchV2_0 (ref), v23 (ref), v17 (ref)
        if v51.itemType == l_ItemTypeEnum_0.Asset then
            v43(v16(v51.id));
            v43(v15(v51.id));
            if l_FFlagIBV2Attribution_0 and l_FFlagAXEnableBatchItemDetailsFetchV2_0 then
                v43(v23(v51.id, Enum.AvatarItemType.Asset));
                return;
            end;
        elseif v51.itemType == l_ItemTypeEnum_0.Bundle then
            v43(v17(v51.id));
        end;
    end, {
        v43
    });
    local v55 = v4.useCallback(function(v53, v54) --[[ Line: 125 ]]
        -- upvalues: l_ItemTypeEnum_0 (ref), v43 (copy), v19 (ref), v18 (ref), v21 (ref), v20 (ref)
        if v53.itemType == l_ItemTypeEnum_0.Asset then
            if v54 then
                v43(v19(v53.id));
                return;
            else
                v43(v18(v53.id));
                return;
            end;
        else
            if v53.itemType == l_ItemTypeEnum_0.Bundle then
                if v54 then
                    v43(v21(v53.id));
                    return;
                else
                    v43(v20(v53.id));
                end;
            end;
            return;
        end;
    end, {
        v43
    });
    local v57 = if l_FFlagIBV2Attribution_0 then v4.useCallback(function(v56) --[[ Line: 142 ]]
        -- upvalues: v43 (copy), v26 (ref), v27 (ref)
        v43(v26(v27.AttributionTraversal, v56));
    end, {
        v43
    }) else nil;
    local function v65(v58, v59, v60, v61, v62, v63, v64) --[[ Line: 180 ]]
        -- upvalues: v43 (copy), v22 (ref)
        v43(v22(v58, v59, v60, v61, v62, v63, v64));
    end;
    local v68 = v4.useCallback(function(v66) --[[ Line: 202 ]]
        -- upvalues: v40 (copy), l_applyTryOnItemToHumanoidDescription_0 (ref), v4 (ref), v7 (ref), v35 (ref), v36 (ref)
        if v40.localPlayerModel and v40.localPlayerModel.Humanoid then
            local v67 = v40.localPlayerModel.Humanoid.HumanoidDescription:Clone();
            l_applyTryOnItemToHumanoidDescription_0(v66, v67);
            return v4.createElement(v7, {
                size = UDim2.new(1, 0, 1, 0), 
                position = UDim2.new(0.5, 0, 0.5, 0), 
                humanoidDescription = v67, 
                model = v40.localPlayerModel, 
                visible = true, 
                backgroundTransparency = 1, 
                disableAutoRotation = not v35, 
                offsetOptions = {
                    defaultCameraOffset = CFrame.new(0, 0.5, -5), 
                    toolOffset = CFrame.new(0, 2, -8)
                }, 
                cameraFieldOfView = v36, 
                resetCameraAndAutoRotationOnModelChange = true
            });
        else
            return nil;
        end;
    end, {
        v40.localPlayerModel
    });
    local v69 = l_useResponsivePanelLayoutProps_0({
        onInspectMenuClosed = v44, 
        onBulkPurchaseFinished = v50, 
        onItemDetailsOpened = v52, 
        onToggleFavorite = v55, 
        openAttributionOverlay = if l_FFlagIBV2Attribution_0 then v57 else nil, 
        onPromptPurchase = v65, 
        renderTryOnViewport = v68, 
        localPlayerModel = v40.localPlayerModel, 
        analytics = v40.analytics
    });
    l_useUnifiedEventListenerInExperience_0();
    if l_FFlagAXEnableInspectAndBuyFocusNavigation_0 then
        local v70 = l_useInspectAndBuyFocusNavigation_0();
        return v4.createElement("Frame", {
            ref = v70.setFocusRef, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            SelectionGroup = v70.focusNavigationProps.SelectionGroup, 
            SelectionBehaviorDown = v70.focusNavigationProps.SelectionBehaviorDown, 
            SelectionBehaviorLeft = v70.focusNavigationProps.SelectionBehaviorLeft, 
            SelectionBehaviorRight = v70.focusNavigationProps.SelectionBehaviorRight, 
            SelectionBehaviorUp = v70.focusNavigationProps.SelectionBehaviorUp
        }, {
            Content = v4.createElement(v30.View, {
                Size = v41.OverlaySize, 
                Position = v41.OverlayPosition, 
                backgroundStyle = v42.Color.Common.Shadow, 
                stateLayer = {
                    affordance = v30.Enums.StateLayerAffordance.None
                }, 
                onActivated = function() --[[ Line: 262 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_GuiService_0 (ref)
                    l_GuiService_0:CloseInspectMenu();
                end
            }, {
                ContainerView = v4.createElement(v30.View, {
                    AnchorPoint = v41.ContainerAnchorPoint, 
                    ClipsDescendants = true, 
                    Size = v41.ContainerSize, 
                    Position = v41.ContainerPosition, 
                    backgroundStyle = {
                        Color3 = v33.color("MenuContainer"), 
                        Transparency = v33.transparency("MenuContainer", 1) * l_GuiService_0.PreferredTransparency
                    }, 
                    stateLayer = {
                        affordance = v30.Enums.StateLayerAffordance.None
                    }, 
                    onActivated = function() --[[ Line: 278 ]] --[[ Name: onActivated ]]

                    end
                }, {
                    UICorner = v4.createElement("UICorner", {
                        CornerRadius = v33.DefaultCornerRadius
                    }), 
                    ResponsivePanelLayout = v4.createElement(l_ResponsivePanelLayout_0, v69)
                }), 
                Overlay = if l_FFlagIBV2Attribution_0 then v4.createElement(v28) else nil
            })
        });
    else
        return (v4.createElement(v30.View, {
            Size = v41.OverlaySize, 
            Position = v41.OverlayPosition, 
            backgroundStyle = v42.Color.Common.Shadow, 
            stateLayer = {
                affordance = v30.Enums.StateLayerAffordance.None
            }, 
            onActivated = function() --[[ Line: 296 ]] --[[ Name: onActivated ]]
                -- upvalues: l_GuiService_0 (ref)
                l_GuiService_0:CloseInspectMenu();
            end
        }, {
            ContainerView = v4.createElement(v30.View, {
                AnchorPoint = v41.ContainerAnchorPoint, 
                ClipsDescendants = true, 
                Size = v41.ContainerSize, 
                Position = v41.ContainerPosition, 
                backgroundStyle = {
                    Color3 = v33.color("MenuContainer"), 
                    Transparency = v33.transparency("MenuContainer", 1) * l_GuiService_0.PreferredTransparency
                }, 
                stateLayer = {
                    affordance = v30.Enums.StateLayerAffordance.None
                }, 
                onActivated = function() --[[ Line: 312 ]] --[[ Name: onActivated ]]

                end
            }, {
                UICorner = v4.createElement("UICorner", {
                    CornerRadius = v33.DefaultCornerRadius
                }), 
                ResponsivePanelLayout = v4.createElement(l_ResponsivePanelLayout_0, v69)
            }), 
            Overlay = if l_FFlagIBV2Attribution_0 then v4.createElement(v28) else nil
        }));
    end;
end;