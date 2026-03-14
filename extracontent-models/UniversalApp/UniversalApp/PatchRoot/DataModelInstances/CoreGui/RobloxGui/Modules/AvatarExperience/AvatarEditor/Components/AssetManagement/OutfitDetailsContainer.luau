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
local l_ShimmerPanel_0 = v6.App.Loading.ShimmerPanel;
local l_LoadableImage_0 = v6.App.Loading.LoadableImage;
local l_GridMetrics_0 = v6.App.Grid.GridMetrics;
local l_ItemTile_0 = v6.Tile.ItemTile;
local l_CatalogItemCard_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Components.CatalogItemCard.CatalogItemCard;
local v35 = require(l_CorePackages_0.Packages.Foundation);
local l_FitFrameVertical_0 = v7.FitFrameVertical;
local l_FitTextLabel_0 = v7.FitTextLabel;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXModeratedItemsFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
local v40 = {
    toastMessage = "CommonUI.Messages.Label.ActionNotAvailableOnCurrentDevice", 
    isLocalized = false, 
    toastType = l_ToastType_0.InformationMessage
};
local v41 = {
    minimumItemsPerRow = 3, 
    minimumItemWidth = 110
};
local v42 = l_GridMetrics_0.makeCustomMetricsGetter(v41);
local v43 = v2.PureComponent:extend("OutfitDetailsContainer");
v43.validateProps = v5.strictInterface({
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
    setCurrentToastMessage = v5.callback
});
v43.init = function(v44) --[[ Line: 119 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_getPageMargin_0 (copy), l_AppPage_0 (copy), v40 (copy)
    v44.attributionRef = v2.createRef();
    v44.itemsGridRef = v44.props.itemsGridRef or v2.createRef();
    v44:setState({
        margin = l_getPageMargin_0(v44.props.screenSize.X)
    });
    v44.containerSizeChanged = function(v45) --[[ Line: 126 ]]
        -- upvalues: l_getPageMargin_0 (ref), v44 (copy)
        local v46 = l_getPageMargin_0(v45.AbsoluteSize.X);
        if v46 ~= v44.state.margin then
            v44:setState({
                margin = v46
            });
        end;
    end;
    v44.goToAppealsPortal = function() --[[ Line: 135 ]]
        -- upvalues: v44 (copy), l_AppPage_0 (ref), v40 (ref)
        if v44.props.isWebViewSupported then
            v44.props.navigateDown({
                name = l_AppPage_0.GenericWebPage, 
                detail = "https://www.roblox.com/report-appeals#/", 
                extraProps = {
                    title = ""
                }
            });
            return;
        else
            v44.props.setCurrentToastMessage(v40);
            return;
        end;
    end;
end;
v43.renderOutfitName = function(v47, v48) --[[ Line: 150 ]] --[[ Name: renderOutfitName ]]
    -- upvalues: v2 (copy), l_FitTextLabel_0 (copy), l_ShimmerPanel_0 (copy)
    local l_Theme_0 = v48.Theme;
    local l_Font_0 = v48.Font;
    if v47.props.outfitName then
        return v2.createElement(l_FitTextLabel_0, {
            width = UDim.new(1, 0), 
            BackgroundTransparency = 1, 
            Text = v47.props.outfitName, 
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
        return v2.createElement(l_ShimmerPanel_0, {
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, l_Font_0.Header1.RelativeSize * l_Font_0.BaseSize)
        });
    end;
end;
v43.renderOutfitThumbnail = function(v51) --[[ Line: 177 ]] --[[ Name: renderOutfitThumbnail ]]
    -- upvalues: l_Constants_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v18 (copy), v17 (copy), v2 (copy), l_LoadableImage_0 (copy)
    local l_Outfit_0 = l_Constants_0.RbxthumbTypes.Outfit;
    local v53 = l_getRbxthumbWithTypeSizeAndOptions_0(v51.props.outfitId, l_Outfit_0, 420);
    local v54 = nil;
    if v18.isModerationPendingOrRejected(v51:getModerationStatus()) then
        v53 = v17.BrokenAvatarThumbnail;
        v54 = 0.25;
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
            ImageTransparency = v54, 
            Image = v53, 
            Size = UDim2.fromScale(1, 1), 
            useShimmerAnimationWhileLoading = true, 
            ZIndex = 1
        })
    });
end;
v43.renderItemWithAvailabilityStatus = function(v55, v56) --[[ Line: 214 ]] --[[ Name: renderItemWithAvailabilityStatus ]]
    -- upvalues: l_Constants_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v2 (copy), l_CatalogItemCard_0 (copy), v35 (copy), l_InventoryItemAvailability_0 (copy)
    local v57 = v56[1];
    local v58 = v56[2];
    local v59 = nil;
    local v60 = nil;
    if typeof(v57) ~= "table" then
        local l_Asset_0 = l_Constants_0.RbxthumbTypes.Asset;
        v60 = l_getRbxthumbWithTypeSizeAndOptions_0(v57, l_Asset_0, 150);
        local v62 = v55.props.assetInfos[v57];
        v59 = v62 and v62.name;
        if v62 and v62.outfitModerationStatus then
            v60 = v60 .. ("&filters=__%*__"):format(v62.outfitModerationStatus);
        end;
    end;
    return v2.createElement(l_CatalogItemCard_0, {
        title = v59, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        presentationSlot = v2.createElement(v35.Image, {
            tag = "size-full clip radius-medium", 
            Image = v60, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            ScaleType = Enum.ScaleType.Crop
        }), 
        itemStatus = if not (v58 ~= l_InventoryItemAvailability_0.Unavailable) or v58 == l_InventoryItemAvailability_0.Revoked then {
            type = "placeholder", 
            iconType = "Error"
        } else nil
    });
end;
v43.renderItem = function(v63, v64) --[[ Line: 255 ]] --[[ Name: renderItem ]]
    -- upvalues: l_Constants_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v2 (copy), l_ItemTile_0 (copy), v19 (copy)
    local v65 = nil;
    local v66 = nil;
    if typeof(v64) ~= "table" then
        local l_Asset_1 = l_Constants_0.RbxthumbTypes.Asset;
        v66 = l_getRbxthumbWithTypeSizeAndOptions_0(v64, l_Asset_1, 150);
        local v68 = v63.props.assetInfos[v64];
        v65 = v68 and v68.name;
        if v68 and v68.outfitModerationStatus then
            v66 = v66 .. ("&filters=__%*__"):format(v68.outfitModerationStatus);
        end;
    end;
    return v2.createElement(l_ItemTile_0, {
        name = v65, 
        titleTextLineCount = v19.ItemTileTitleMaxLines, 
        thumbnail = v66
    });
end;
v43.renderItemsGrid = function(v69, v70) --[[ Line: 280 ]] --[[ Name: renderItemsGrid ]]
    -- upvalues: v19 (copy), v18 (copy), v2 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FitFrameVertical_0 (copy), l_Focusable_0 (copy), v14 (copy), v42 (copy), l_FFlagAXModeratedItemsFlow_0 (copy)
    local l_itemsList_0 = v69.props.itemsList;
    local l_ShimmerCardsToDisplay_0 = v19.ShimmerCardsToDisplay;
    local v73 = l_itemsList_0 and #l_itemsList_0 or l_ShimmerCardsToDisplay_0;
    local l_Font_1 = v70.Font;
    local v75 = l_Font_1.BaseSize * l_Font_1.Header2.RelativeSize;
    local l_BundleItemTile_0 = v19.ItemTileType.BundleItemTile;
    local v77 = v18.GridItemHeightGetter(l_BundleItemTile_0, v75);
    return v2.createElement(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_FitFrameVertical_0 else l_Focusable_0[l_FitFrameVertical_0], {
        width = UDim.new(1, 0), 
        LayoutOrder = 4, 
        BackgroundTransparency = 1, 
        [v2.Ref] = v69.itemsGridRef, 
        NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v69.attributionRef, 
        NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v69.props.NextSelectionUp
    }, {
        LoadableGridView = v2.createElement(v14, {
            getItemMetrics = v42, 
            items = l_itemsList_0, 
            totalNumItems = v73, 
            renderItem = l_FFlagAXModeratedItemsFlow_0 and function(v78) --[[ Line: 310 ]]
                -- upvalues: v69 (copy)
                return v69:renderItemWithAvailabilityStatus(v78);
            end or function(v79) --[[ Line: 313 ]]
                -- upvalues: v69 (copy)
                return v69:renderItem(v79);
            end, 
            getItemHeight = v77, 
            windowHeight = v69.props.screenSize.Y
        })
    });
end;
v43.getModerationStatus = function(v80) --[[ Line: 323 ]] --[[ Name: getModerationStatus ]]
    local l_outfitInfo_0 = v80.props.outfitInfo;
    if l_outfitInfo_0 then
        return l_outfitInfo_0.moderationStatus;
    else
        return nil;
    end;
end;
v43.renderWithProviders = function(v82, v83, v84) --[[ Line: 332 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v7 (copy), v18 (copy), v2 (copy), l_FitFrameVertical_0 (copy), v10 (copy), v12 (copy), v11 (copy), v16 (copy)
    local l_outfitInfo_1 = v82.props.outfitInfo;
    local v86 = l_outfitInfo_1 and l_outfitInfo_1.creatingUniverseId or nil;
    local l_Theme_1 = v83.Theme;
    local v88 = v7.Rect.square(v82.state.margin);
    local v89 = v82:getModerationStatus();
    local v90 = v18.isModerationPendingOrRejected(v89);
    local v91 = v89 == Enum.ModerationStatus.ReviewedRejected;
    return v2.createElement(l_FitFrameVertical_0, {
        BackgroundColor3 = l_Theme_1.BackgroundDefault.Color, 
        BackgroundTransparency = l_Theme_1.BackgroundDefault.Transparency, 
        BorderSizePixel = 0, 
        width = UDim.new(1, 0), 
        contentPadding = UDim.new(0, 24), 
        margin = v88, 
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        [v2.Change.AbsoluteSize] = v82.containerSizeChanged
    }, {
        ItemName = v82.props.showCustomOutfitNames and v82:renderOutfitName(v83), 
        FullBleedFrame = v90 and v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, v88.left + v88.right, 0, 0), 
            Position = UDim2.fromOffset(-v88.left, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 2
        }, {
            ModerationStatusBanner = if v91 then v2.createElement(v10, {
                contentText = v84.moderated, 
                variant = v12.Alert, 
                placement = v11.Bleed, 
                actionText = v84.details, 
                onActivated = v82.goToAppealsPortal
            }) else v2.createElement(v10, {
                contentText = v84.pending, 
                variant = v12.Default, 
                placement = v11.Bleed
            })
        }), 
        ItemThumbnail = v82:renderOutfitThumbnail(v84), 
        ItemsGrid = v82:renderItemsGrid(v83), 
        ItemInfoList = if v86 then v2.createElement(v16, {
            itemId = v82.props.outfitId, 
            outfitInfo = v82.props.outfitInfo, 
            itemType = v82.props.itemType, 
            LayoutOrder = 5, 
            attributionRef = v82.attributionRef, 
            NextSelectionUp = v82.itemsGridRef
        }) else nil
    });
end;
v43.render = function(v92) --[[ Line: 401 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withLocalization_0 (copy)
    return l_withStyle_0(function(v93) --[[ Line: 402 ]]
        -- upvalues: l_withLocalization_0 (ref), v92 (copy)
        return l_withLocalization_0({
            details = "Feature.Avatar.Label.DetailsButton", 
            moderated = "Feature.Catalog.Message.AvatarModerationModerated", 
            pending = "Feature.Catalog.Message.AvatarModerationPending"
        })(function(v94) --[[ Line: 407 ]]
            -- upvalues: v92 (ref), v93 (copy)
            return v92:renderWithProviders(v93, v94);
        end);
    end);
end;
v43 = l_RoactAppPolicy_0.connect(function(v95, _) --[[ Line: 413 ]]
    return {
        showCustomOutfitNames = v95.getCustomOutfitNames(), 
        isWebViewSupported = v95.getWebViewSupport()
    };
end)(v43);
local v103 = l_memoize_0(function(v97) --[[ Line: 420 ]]
    -- upvalues: l_FFlagAXModeratedItemsFlow_0 (copy)
    local v98 = {};
    for _, v100 in v97 do
        for v101, v102 in v100 do
            table.insert(v98, if l_FFlagAXModeratedItemsFlow_0 then {
                v101, 
                v102.availabilityStatus
            } else v101);
        end;
    end;
    return v98;
end);
return v3.connect(function(v104, v105) --[[ Line: 434 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v103 (copy)
    local l_OutfitInfos_0 = v104.AvatarExperience.AvatarEditor.OutfitInfos;
    local v107 = nil;
    local v108 = nil;
    if l_OutfitInfos_0[v105.outfitId] then
        v107 = l_OutfitInfos_0[v105.outfitId].name;
        v108 = v103(l_OutfitInfos_0[v105.outfitId].assets);
    end;
    return {
        outfitInfo = l_OutfitInfos_0[v105.outfitId], 
        outfitName = v107, 
        itemsList = v108, 
        screenSize = v104.ScreenSize, 
        assetInfos = v104.AvatarExperience.Common.AssetInfos
    };
end, function(v109) --[[ Line: 453 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: l_NavigateDown_0 (copy), v25 (copy)
    return {
        navigateDown = function(v110) --[[ Line: 455 ]] --[[ Name: navigateDown ]]
            -- upvalues: v109 (copy), l_NavigateDown_0 (ref)
            v109(l_NavigateDown_0(v110));
        end, 
        setCurrentToastMessage = function(v111) --[[ Line: 458 ]] --[[ Name: setCurrentToastMessage ]]
            -- upvalues: v109 (copy), v25 (ref)
            v109(v25(v111));
        end
    };
end)(v43);