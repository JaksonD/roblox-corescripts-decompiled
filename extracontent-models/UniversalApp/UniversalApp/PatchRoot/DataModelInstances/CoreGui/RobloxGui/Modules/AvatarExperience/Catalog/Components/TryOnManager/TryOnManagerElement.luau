local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_Skeleton_0 = require(l_CorePackages_0.Packages.Foundation).Skeleton;
local l_withNavigation_0 = require(l_CorePackages_0.Packages.RoactNavigation).withNavigation;
local v8 = require(l_CorePackages_0.Packages.t);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local l_withStyle_0 = v5.Core.Style.withStyle;
local l_ItemTile_0 = v5.Tile.ItemTile;
local l_ItemTileEnums_0 = v5.Tile.ItemTileEnums;
local l_Images_0 = v5.App.ImageSet.Images;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v19 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v20 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v21 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v22 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v23 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v24 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v25 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local v26 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetEquippedInTryOnManagerThunk);
local v27 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v29 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v33 = l_Images_0["icons/common/robux"];
local v34 = v2.PureComponent:extend("TryOnManagerElement");
v34.validateProps = v8.strictInterface({
    tryOnItem = v8.optional(v8.table), 
    layoutOrder = v8.optional(v8.number), 
    elementRef = v8.optional(v8.table), 
    updatePeekViewState = v8.optional(v8.callback), 
    allowAutomaticPeekViewStateChanges = v8.optional(v8.boolean), 
    NextSelectionDown = v8.optional(v8.table), 
    NextSelectionUp = v8.optional(v8.table), 
    NextSelectionLeft = v8.optional(v8.table), 
    NextSelectionRight = v8.optional(v8.table), 
    itemData = v8.optional(v8.table), 
    playerMembership = v8.optional(v8.enum(Enum.MembershipType)), 
    fetchItemData = v8.callback, 
    setEquippedInTryOnManager = v8.callback, 
    setTryOnManagerPeekViewState = v8.optional(v8.callback), 
    networking = v8.callback, 
    appAnalytics = v8.table, 
    catalogAnalytics = v8.table, 
    localization = v8.table, 
    navigation = v8.table
});
v34.init = function(v35) --[[ Line: 94 ]] --[[ Name: init ]]
    -- upvalues: l_PeekViewState_0 (copy)
    v35.onTileActivated = function() --[[ Line: 95 ]]
        -- upvalues: v35 (copy), l_PeekViewState_0 (ref)
        local l_tryOnItem_0 = v35.props.tryOnItem;
        if not l_tryOnItem_0 then
            return;
        else
            local l_itemId_0 = l_tryOnItem_0.itemId;
            local v38 = not l_tryOnItem_0.selectedInTryOnManager;
            v35.props.setEquippedInTryOnManager(l_itemId_0, v38, v35.props.catalogAnalytics, l_tryOnItem_0.itemType);
            if v35.props.allowAutomaticPeekViewStateChanges then
                v35.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Brief);
            end;
            return;
        end;
    end;
end;
v34.getItemIconType = function(v39) --[[ Line: 119 ]] --[[ Name: getItemIconType ]]
    -- upvalues: v22 (copy), l_ItemTileEnums_0 (copy)
    local l_tryOnItem_1 = v39.props.tryOnItem;
    if l_tryOnItem_1.itemType == v22.ItemType.Bundle then
        if l_tryOnItem_1.itemSubType == v22.BundleTypeIdStrings.DynamicHead then
            return l_ItemTileEnums_0.ItemIconType.DynamicHead;
        else
            return nil;
        end;
    else
        return l_tryOnItem_1.itemType == v22.ItemType.Bundle and l_ItemTileEnums_0.ItemIconType.Bundle or nil;
    end;
end;
v34.getElementTextAndIcon = function(v41, v42, v43) --[[ Line: 136 ]] --[[ Name: getElementTextAndIcon ]]
    -- upvalues: l_NumberLocalization_0 (copy)
    local v44 = v42 and (v42.lowestPrice or v42.priceInRobux) or nil;
    local v45 = v42 and v42.isOwned;
    local v46 = false;
    local v47 = "";
    if v45 then
        v47 = v43.ownedText;
    elseif v44 == 0 then
        v47 = v43.freeText;
    elseif v44 ~= nil then
        v47 = l_NumberLocalization_0.localize(string.format("%.0f", v44), v41.props.localization:GetLocale());
        v46 = true;
    elseif v42 ~= nil then
        v47 = v43.offSaleText;
    end;
    return v47, v46;
end;
v34.renderElement = function(v48, v49, v50) --[[ Line: 157 ]] --[[ Name: renderElement ]]
    -- upvalues: v23 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v2 (copy), l_ItemTile_0 (copy), l_Skeleton_0 (copy), l_ImageSetLabel_0 (copy), v33 (copy)
    local l_tryOnItem_2 = v48.props.tryOnItem;
    local l_Theme_0 = v49.Theme;
    local l_Font_0 = v49.Font;
    local l_RelativeSize_0 = l_Font_0.Header2.RelativeSize;
    local v55 = l_Font_0.BaseSize * l_RelativeSize_0;
    local l_itemData_0 = v48.props.itemData;
    local v57 = if l_itemData_0 then l_itemData_0.name else nil;
    local v58 = false;
    if l_itemData_0 ~= nil then
        v58 = l_itemData_0.receivedCatalogData;
    end;
    local v59, v60 = v48:getElementTextAndIcon(l_itemData_0, v50);
    local v61 = l_itemData_0 and l_itemData_0.tileRestrictionsMap;
    local v62 = l_tryOnItem_2.itemType and v23.GetRbxThumbType(l_tryOnItem_2.itemType) or nil;
    local v63 = nil;
    if l_tryOnItem_2.itemId and v62 then
        v63 = l_getRbxthumbWithTypeSizeAndOptions_0(l_tryOnItem_2.itemId, v62, 150);
    end;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = 1
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, 15)
        }), 
        TryOnManagerTileFrame = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(95, 95), 
            LayoutOrder = 1
        }, {
            TryOnManagerTile = v2.createElement(l_ItemTile_0, {
                itemIconType = v48:getItemIconType(), 
                restrictionTypes = v61, 
                isSelected = l_tryOnItem_2.selectedInTryOnManager, 
                onActivated = v48.onTileActivated, 
                thumbnail = v63, 
                titleTextLineCount = 0
            })
        }), 
        TryOnInfoFrame = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, -120, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 2
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, 3)
            }), 
            ItemName = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 46), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                TextSize = v55, 
                Font = l_Font_0.Header1.Font, 
                TextColor3 = l_Theme_0.IconEmphasis.Color, 
                TextTransparency = l_Theme_0.IconEmphasis.Transparency, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextWrapped = true, 
                Text = v57
            }), 
            ItemPriceFrame = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 29), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                    Padding = UDim.new(0, 0)
                }), 
                Shimmer = not v58 and v2.createElement(l_Skeleton_0, {
                    Size = UDim2.new(0.8, 0, 0, 22)
                }) or nil, 
                Icon = v58 and v60 and v2.createElement(l_ImageSetLabel_0, {
                    Image = v33, 
                    ImageTransparency = 0, 
                    ImageColor3 = l_Theme_0.SecondaryContent.Color, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromOffset(22, 22), 
                    LayoutOrder = 1
                }) or nil, 
                Price = v58 and v2.createElement("TextLabel", {
                    Size = UDim2.new(1, -32, 0, 22), 
                    Text = v59, 
                    TextSize = v55, 
                    Font = l_Font_0.Header1.Font, 
                    TextColor3 = l_Theme_0.SecondaryContent.Color, 
                    TextTransparency = l_Theme_0.SecondaryContent.Transparency, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }) or nil
            })
        })
    });
end;
v34.renderWithProviders = function(v64, v65, v66) --[[ Line: 280 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v2 (copy), l_Focusable_0 (copy)
    return v2.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = v64.props.layoutOrder, 
        ref = v64.props.elementRef, 
        NextSelectionDown = v64.props.NextSelectionDown, 
        NextSelectionUp = v64.props.NextSelectionUp
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, 12)
        }), 
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 10)
        }), 
        TryOnManagerElement = v64:renderElement(v65, v66)
    });
end;
v34.render = function(v67) --[[ Line: 307 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withLocalization_0 (copy)
    return l_withStyle_0(function(v68) --[[ Line: 308 ]]
        -- upvalues: l_withLocalization_0 (ref), v67 (copy)
        return l_withLocalization_0({
            ownedText = "Feature.Catalog.Label.Owned", 
            freeText = "Feature.Catalog.Label.FreeUpperCase", 
            getPremiumText = "Feature.PremiumUpsell.Title.GetPremium", 
            offSaleText = "Feature.Catalog.LabelOffSale"
        })(function(v69) --[[ Line: 314 ]]
            -- upvalues: v67 (ref), v68 (copy)
            return v67:renderWithProviders(v68, v69);
        end);
    end);
end;
v34.didMount = function(v70) --[[ Line: 320 ]] --[[ Name: didMount ]]
    if not v70.props.itemData or not v70.props.itemData.receivedCatalogData then
        local l_tryOnItem_3 = v70.props.tryOnItem;
        v70.props.fetchItemData(v70.props.networking, v70.props.appAnalytics, l_tryOnItem_3.itemId, l_tryOnItem_3.itemType);
    end;
end;
local function v76(v72, v73) --[[ Line: 330 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v24 (copy)
    local v74 = v24(v72.AvatarExperience.Common, v73.tryOnItem.itemId, v73.tryOnItem.itemType);
    local l_LocalUserId_0 = v72.LocalUserId;
    return {
        itemData = v74, 
        playerMembership = v72.Users[l_LocalUserId_0] and v72.Users[l_LocalUserId_0].membership or Enum.MembershipType.None
    };
end;
local function v88(v77) --[[ Line: 341 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v25 (copy), l_AvatarScreen_0 (copy), v26 (copy), v27 (copy)
    return {
        fetchItemData = function(v78, v79, v80, v81) --[[ Line: 343 ]] --[[ Name: fetchItemData ]]
            -- upvalues: v77 (copy), v25 (ref)
            return v77(v25(v78, v79, v80, v81));
        end, 
        setEquippedInTryOnManager = function(v82, v83, v84, v85) --[[ Line: 347 ]] --[[ Name: setEquippedInTryOnManager ]]
            -- upvalues: l_AvatarScreen_0 (ref), v77 (copy), v26 (ref)
            local l_TryOnManager_0 = l_AvatarScreen_0.TryOnManager;
            return v77(v26(v82, v83, v84, v85, l_TryOnManager_0));
        end, 
        setTryOnManagerPeekViewState = function(v87) --[[ Line: 354 ]] --[[ Name: setTryOnManagerPeekViewState ]]
            -- upvalues: v77 (copy), v27 (ref)
            v77(v27(v87));
        end
    };
end;
v34 = l_withNavigation_0((l_RoactServices_0.connect({
    appAnalytics = v21, 
    catalogAnalytics = v29, 
    networking = v19, 
    localization = v20
})(v34)));
return (v3.connect(v76, v88)(v34));