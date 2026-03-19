local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local v7 = require(l_CorePackages_0.Packages.FitFrame);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.CompactInlineBanner);
local v11 = require(l_Modules_0.AvatarExperience.Common.Enum.CompactInlineBannerPlacement);
local v12 = require(l_Modules_0.AvatarExperience.Common.Enum.CompactInlineBannerVariant);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.LoadableGridView);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemInfo.ItemInfoList);
local v17 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v18 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v19 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v20 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_Constants_0 = v20.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v20.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Thunks.NavigateDown;
local v25 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local l_ToastType_0 = require(l_CorePackages_0.Workspace.Packages.ToastRodux).Enums.ToastType;
local l_InventoryItemAvailability_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.InventoryItemAvailability;
local l_withStyle_0 = v6.Style.withStyle;
local l_getPageMargin_0 = v6.App.Container.getPageMargin;
local l_LoadableImage_0 = v6.App.Loading.LoadableImage;
local l_GridMetrics_0 = v6.App.Grid.GridMetrics;
local l_ItemTile_0 = v6.Tile.ItemTile;
local l_CatalogItemCard_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Components.CatalogItemCard.CatalogItemCard;
local v34 = require(l_CorePackages_0.Packages.Foundation);
local l_Skeleton_0 = v34.Skeleton;
local l_FitFrameVertical_0 = v7.FitFrameVertical;
local l_FitTextLabel_0 = v7.FitTextLabel;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v39 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXModeratedItemsFlow_0 = v39.FFlagAXModeratedItemsFlow;
local l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 = v39.FFlagAXFixGamepadNavigationOnOutfitManagement;
local v42 = {
    toastMessage = "CommonUI.Messages.Label.ActionNotAvailableOnCurrentDevice", 
    isLocalized = false, 
    toastType = l_ToastType_0.InformationMessage
};
local v43 = {
    minimumItemsPerRow = 3, 
    minimumItemWidth = 110
};
local v44 = l_GridMetrics_0.makeCustomMetricsGetter(v43);
local v45 = v2.PureComponent:extend("OutfitDetailsContainer");
v45.validateProps = v5.strictInterface({
    outfitId = v5.string, 
    itemType = v5.optional(v5.string), 
    itemsGridRef = v5.optional(v5.table), 
    NextSelectionUp = v5.optional(v5.table), 
    showCustomOutfitNames = v5.boolean, 
    isWebViewSupported = v5.boolean, 
    outfitInfo = v5.optional(v5.table), 
    outfitName = v5.optional(v5.string), 
    itemsList = if l_FFlagAXModeratedItemsFlow_0 then v5.optional(v5.array(v5.tuple(v5.union(v5.string, v5.table), v5.optional(v5.string)))) else v5.optional(v5.array(v5.string)), 
    screenSize = v5.Vector2, 
    assetInfos = v5.table, 
    navigateDown = v5.callback, 
    setCurrentToastMessage = v5.callback, 
    bottomPadding = if l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 then v5.optional(v5.number) else nil
});
v45.init = function(v46) --[[ Line: 122 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_getPageMargin_0 (copy), l_AppPage_0 (copy), v42 (copy)
    v46.attributionRef = v2.createRef();
    v46.itemsGridRef = v46.props.itemsGridRef or v2.createRef();
    v46:setState({
        margin = l_getPageMargin_0(v46.props.screenSize.X)
    });
    v46.containerSizeChanged = function(v47) --[[ Line: 129 ]]
        -- upvalues: l_getPageMargin_0 (ref), v46 (copy)
        local v48 = l_getPageMargin_0(v47.AbsoluteSize.X);
        if v48 ~= v46.state.margin then
            v46:setState({
                margin = v48
            });
        end;
    end;
    v46.goToAppealsPortal = function() --[[ Line: 138 ]]
        -- upvalues: v46 (copy), l_AppPage_0 (ref), v42 (ref)
        if v46.props.isWebViewSupported then
            v46.props.navigateDown({
                name = l_AppPage_0.GenericWebPage, 
                detail = "https://www.roblox.com/report-appeals#/", 
                extraProps = {
                    title = ""
                }
            });
            return;
        else
            v46.props.setCurrentToastMessage(v42);
            return;
        end;
    end;
end;
v45.renderOutfitName = function(v49, v50) --[[ Line: 153 ]] --[[ Name: renderOutfitName ]]
    -- upvalues: v2 (copy), l_FitTextLabel_0 (copy), l_Skeleton_0 (copy)
    local l_Theme_0 = v50.Theme;
    local l_Font_0 = v50.Font;
    if v49.props.outfitName then
        return v2.createElement(l_FitTextLabel_0, {
            width = UDim.new(1, 0), 
            BackgroundTransparency = 1, 
            Text = v49.props.outfitName, 
            LayoutOrder = 1, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Size = UDim2.new(1, 0, 0, l_Font_0.Header1.RelativeSize * l_Font_0.BaseSize), 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
            TextWrapped = true, 
            Font = l_Font_0.Header1.Font, 
            TextSize = l_Font_0.Header1.RelativeSize * l_Font_0.BaseSize
        });
    else
        return v2.createElement(l_Skeleton_0, {
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, l_Font_0.Header1.RelativeSize * l_Font_0.BaseSize)
        });
    end;
end;
v45.renderOutfitThumbnail = function(v53) --[[ Line: 180 ]] --[[ Name: renderOutfitThumbnail ]]
    -- upvalues: l_Constants_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v18 (copy), v17 (copy), v2 (copy), l_LoadableImage_0 (copy)
    local l_Outfit_0 = l_Constants_0.RbxthumbTypes.Outfit;
    local v55 = l_getRbxthumbWithTypeSizeAndOptions_0(v53.props.outfitId, l_Outfit_0, 420);
    local v56 = nil;
    if v18.isModerationPendingOrRejected(v53:getModerationStatus()) then
        v55 = v17.BrokenAvatarThumbnail;
        v56 = 0.25;
    end;
    return v2.createElement("Frame", {
        LayoutOrder = 3, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, -24, 0, 300)
    }, {
        AspectRatioConstraint = v2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1, 
            AspectType = Enum.AspectType.FitWithinMaxSize, 
            DominantAxis = Enum.DominantAxis.Width
        }), 
        MaxSize = v2.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(1e999, 300)
        }), 
        LoadableImage = v2.createElement(l_LoadableImage_0, {
            BackgroundTransparency = 1, 
            ImageTransparency = v56, 
            Image = v55, 
            Size = UDim2.fromScale(1, 1), 
            useShimmerAnimationWhileLoading = true, 
            ZIndex = 1
        })
    });
end;
v45.renderItemWithAvailabilityStatus = function(v57, v58) --[[ Line: 217 ]] --[[ Name: renderItemWithAvailabilityStatus ]]
    -- upvalues: l_Constants_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v2 (copy), l_CatalogItemCard_0 (copy), v34 (copy), l_InventoryItemAvailability_0 (copy)
    local v59 = v58[1];
    local v60 = v58[2];
    local v61 = nil;
    local v62 = nil;
    if typeof(v59) ~= "table" then
        local l_Asset_0 = l_Constants_0.RbxthumbTypes.Asset;
        v62 = l_getRbxthumbWithTypeSizeAndOptions_0(v59, l_Asset_0, 150);
        local v64 = v57.props.assetInfos[v59];
        v61 = v64 and v64.name;
        if v64 and v64.outfitModerationStatus then
            v62 = v62 .. ("&filters=__%*__"):format(v64.outfitModerationStatus);
        end;
    end;
    return v2.createElement(l_CatalogItemCard_0, {
        title = v61, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        presentationSlot = v2.createElement(v34.Image, {
            tag = "size-full clip radius-medium", 
            Image = v62, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            ScaleType = Enum.ScaleType.Crop
        }), 
        itemStatus = if not (v60 ~= l_InventoryItemAvailability_0.Unavailable) or v60 == l_InventoryItemAvailability_0.Revoked then {
            type = "placeholder", 
            iconType = "Error"
        } else nil
    });
end;
v45.renderItem = function(v65, v66) --[[ Line: 258 ]] --[[ Name: renderItem ]]
    -- upvalues: l_Constants_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v2 (copy), l_ItemTile_0 (copy), v19 (copy)
    local v67 = nil;
    local v68 = nil;
    if typeof(v66) ~= "table" then
        local l_Asset_1 = l_Constants_0.RbxthumbTypes.Asset;
        v68 = l_getRbxthumbWithTypeSizeAndOptions_0(v66, l_Asset_1, 150);
        local v70 = v65.props.assetInfos[v66];
        v67 = v70 and v70.name;
        if v70 and v70.outfitModerationStatus then
            v68 = v68 .. ("&filters=__%*__"):format(v70.outfitModerationStatus);
        end;
    end;
    return v2.createElement(l_ItemTile_0, {
        name = v67, 
        titleTextLineCount = v19.ItemTileTitleMaxLines, 
        thumbnail = v68
    });
end;
v45.renderItemsGrid = function(v71, v72) --[[ Line: 283 ]] --[[ Name: renderItemsGrid ]]
    -- upvalues: v19 (copy), v18 (copy), v2 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FitFrameVertical_0 (copy), l_Focusable_0 (copy), v14 (copy), v44 (copy), l_FFlagAXModeratedItemsFlow_0 (copy)
    local l_itemsList_0 = v71.props.itemsList;
    local l_ShimmerCardsToDisplay_0 = v19.ShimmerCardsToDisplay;
    local v75 = l_itemsList_0 and #l_itemsList_0 or l_ShimmerCardsToDisplay_0;
    local l_Font_1 = v72.Font;
    local v77 = l_Font_1.BaseSize * l_Font_1.Header2.RelativeSize;
    local l_BundleItemTile_0 = v19.ItemTileType.BundleItemTile;
    local v79 = v18.GridItemHeightGetter(l_BundleItemTile_0, v77);
    return v2.createElement(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_FitFrameVertical_0 else l_Focusable_0[l_FitFrameVertical_0], {
        width = UDim.new(1, 0), 
        LayoutOrder = 4, 
        BackgroundTransparency = 1, 
        [v2.Ref] = v71.itemsGridRef, 
        NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v71.attributionRef, 
        NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v71.props.NextSelectionUp
    }, {
        LoadableGridView = v2.createElement(v14, {
            getItemMetrics = v44, 
            items = l_itemsList_0, 
            totalNumItems = v75, 
            renderItem = l_FFlagAXModeratedItemsFlow_0 and function(v80) --[[ Line: 313 ]]
                -- upvalues: v71 (copy)
                return v71:renderItemWithAvailabilityStatus(v80);
            end or function(v81) --[[ Line: 316 ]]
                -- upvalues: v71 (copy)
                return v71:renderItem(v81);
            end, 
            getItemHeight = v79, 
            windowHeight = v71.props.screenSize.Y
        })
    });
end;
v45.getModerationStatus = function(v82) --[[ Line: 326 ]] --[[ Name: getModerationStatus ]]
    local l_outfitInfo_0 = v82.props.outfitInfo;
    if l_outfitInfo_0 then
        return l_outfitInfo_0.moderationStatus;
    else
        return nil;
    end;
end;
v45.renderWithProviders = function(v84, v85, v86) --[[ Line: 335 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 (copy), v7 (copy), v18 (copy), v2 (copy), l_FitFrameVertical_0 (copy), v10 (copy), v12 (copy), v11 (copy), v16 (copy)
    local l_outfitInfo_1 = v84.props.outfitInfo;
    local v88 = l_outfitInfo_1 and l_outfitInfo_1.creatingUniverseId or nil;
    local l_Theme_1 = v85.Theme;
    local v90 = if l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 then v7.Rect.quad(v84.state.margin, v84.state.margin, v84.props.bottomPadding or v84.state.margin, v84.state.margin) else v7.Rect.square(v84.state.margin);
    local v91 = v84:getModerationStatus();
    local v92 = v18.isModerationPendingOrRejected(v91);
    local v93 = v91 == Enum.ModerationStatus.ReviewedRejected;
    return v2.createElement(l_FitFrameVertical_0, {
        BackgroundColor3 = l_Theme_1.BackgroundDefault.Color, 
        BackgroundTransparency = l_Theme_1.BackgroundDefault.Transparency, 
        BorderSizePixel = 0, 
        width = UDim.new(1, 0), 
        contentPadding = UDim.new(0, 24), 
        margin = v90, 
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        [v2.Change.AbsoluteSize] = v84.containerSizeChanged
    }, {
        ItemName = v84.props.showCustomOutfitNames and v84:renderOutfitName(v85), 
        FullBleedFrame = v92 and v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, v90.left + v90.right, 0, 0), 
            Position = UDim2.fromOffset(-v90.left, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 2
        }, {
            ModerationStatusBanner = if v93 then v2.createElement(v10, {
                contentText = v86.moderated, 
                variant = v12.Alert, 
                placement = v11.Bleed, 
                actionText = v86.details, 
                onActivated = v84.goToAppealsPortal
            }) else v2.createElement(v10, {
                contentText = v86.pending, 
                variant = v12.Default, 
                placement = v11.Bleed
            })
        }), 
        ItemThumbnail = v84:renderOutfitThumbnail(v86), 
        ItemsGrid = v84:renderItemsGrid(v85), 
        ItemInfoList = if v88 then v2.createElement(v16, {
            itemId = v84.props.outfitId, 
            outfitInfo = v84.props.outfitInfo, 
            itemType = v84.props.itemType, 
            LayoutOrder = 5, 
            attributionRef = v84.attributionRef, 
            NextSelectionUp = if l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 then nil else v84.itemsGridRef
        }) else nil
    });
end;
v45.render = function(v94) --[[ Line: 411 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withLocalization_0 (copy)
    return l_withStyle_0(function(v95) --[[ Line: 412 ]]
        -- upvalues: l_withLocalization_0 (ref), v94 (copy)
        return l_withLocalization_0({
            details = "Feature.Avatar.Label.DetailsButton", 
            moderated = "Feature.Catalog.Message.AvatarModerationModerated", 
            pending = "Feature.Catalog.Message.AvatarModerationPending"
        })(function(v96) --[[ Line: 417 ]]
            -- upvalues: v94 (ref), v95 (copy)
            return v94:renderWithProviders(v95, v96);
        end);
    end);
end;
v45 = l_RoactAppPolicy_0.connect(function(v97, _) --[[ Line: 423 ]]
    return {
        showCustomOutfitNames = v97.getCustomOutfitNames(), 
        isWebViewSupported = v97.getWebViewSupport()
    };
end)(v45);
local v105 = l_memoize_0(function(v99) --[[ Line: 430 ]]
    -- upvalues: l_FFlagAXModeratedItemsFlow_0 (copy)
    local v100 = {};
    for _, v102 in v99 do
        for v103, v104 in v102 do
            table.insert(v100, if l_FFlagAXModeratedItemsFlow_0 then {
                v103, 
                v104.availabilityStatus
            } else v103);
        end;
    end;
    return v100;
end);
return v3.connect(function(v106, v107) --[[ Line: 444 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v105 (copy)
    local l_OutfitInfos_0 = v106.AvatarExperience.AvatarEditor.OutfitInfos;
    local v109 = nil;
    local v110 = nil;
    if l_OutfitInfos_0[v107.outfitId] then
        v109 = l_OutfitInfos_0[v107.outfitId].name;
        v110 = v105(l_OutfitInfos_0[v107.outfitId].assets);
    end;
    return {
        outfitInfo = l_OutfitInfos_0[v107.outfitId], 
        outfitName = v109, 
        itemsList = v110, 
        screenSize = v106.ScreenSize, 
        assetInfos = v106.AvatarExperience.Common.AssetInfos
    };
end, function(v111) --[[ Line: 463 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: l_NavigateDown_0 (copy), v25 (copy)
    return {
        navigateDown = function(v112) --[[ Line: 465 ]] --[[ Name: navigateDown ]]
            -- upvalues: v111 (copy), l_NavigateDown_0 (ref)
            v111(l_NavigateDown_0(v112));
        end, 
        setCurrentToastMessage = function(v113) --[[ Line: 468 ]] --[[ Name: setCurrentToastMessage ]]
            -- upvalues: v111 (copy), v25 (ref)
            v111(v25(v113));
        end
    };
end)(v45);