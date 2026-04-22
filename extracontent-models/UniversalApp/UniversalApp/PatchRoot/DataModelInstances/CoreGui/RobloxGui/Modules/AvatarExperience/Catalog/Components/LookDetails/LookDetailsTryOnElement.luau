local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_withNavigation_0 = require(l_CorePackages_0.Packages.RoactNavigation).withNavigation;
local v7 = require(l_CorePackages_0.Packages.t);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local v10 = require(l_CorePackages_0.Packages.Cryo);
local l_withStyle_0 = v5.Core.Style.withStyle;
local l_ItemTile_0 = v5.Tile.ItemTile;
local l_ItemTileEnums_0 = v5.Tile.ItemTileEnums;
local l_Images_0 = v5.App.ImageSet.Images;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_Colors_0 = v5.App.Style.Colors;
local v17 = require(l_CorePackages_0.Packages.Foundation);
local l_useTokens_0 = v17.Hooks.useTokens;
local l_View_0 = v17.View;
local l_getIconRichText_0 = v17.Utility.getIconRichText;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v24 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v25 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v26 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v27 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v28 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v29 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetEquippedInTryOnManagerThunk);
local l_SetTryOnManagerPeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux).Actions.SetTryOnManagerPeekViewState;
local v31 = require(l_Modules_0.AvatarExperience.Common.Actions.SetSelectedTimedOption);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v33 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v37 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v39 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_WearTimeSelectedOptionInList_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceTimedOptions).WearTimeSelectedOptionInList;
local l_FlexLayout_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Components.FlexLayout;
local l_FFlagAXBlackbirdRoot_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXBlackbirdRoot;
local v43 = l_Images_0["icons/common/robux"];
local v44 = l_Images_0["icons/status/error_large"];
local v45 = v2.PureComponent:extend("LookDetailsTryOnElement");
v45.validateProps = v7.strictInterface({
    tryOnItem = v7.optional(v7.table), 
    itemInfo = v7.table, 
    layoutOrder = v7.optional(v7.number), 
    allowAutomaticPeekViewStateChanges = v7.optional(v7.boolean), 
    elementRef = v7.optional(v7.table), 
    horizontalPadding = v7.optional(v7.number), 
    disableInteractions = v7.optional(v7.boolean), 
    forceShowPrice = v7.optional(v7.boolean), 
    tokens = v7.any, 
    NextSelectionDown = v7.optional(v7.table), 
    NextSelectionUp = v7.optional(v7.table), 
    NextSelectionLeft = v7.optional(v7.table), 
    NextSelectionRight = v7.optional(v7.table), 
    playerMembership = v7.optional(v7.enum(Enum.MembershipType)), 
    setEquippedInTryOnManager = v7.callback, 
    setTryOnManagerPeekViewState = v7.optional(v7.callback), 
    setSelectedTimedOption = v7.callback, 
    networking = v7.callback, 
    appAnalytics = v7.table, 
    catalogAnalytics = v7.table, 
    localization = v7.table, 
    navigation = v7.table
});
v45.init = function(v46) --[[ Line: 107 ]] --[[ Name: init ]]
    -- upvalues: v39 (copy), l_PeekViewState_0 (copy)
    v46.onTileActivated = function() --[[ Line: 108 ]]
        -- upvalues: v46 (copy), v39 (ref), l_PeekViewState_0 (ref)
        local l_tryOnItem_0 = v46.props.tryOnItem;
        if not l_tryOnItem_0 then
            return;
        else
            local l_itemInfo_0 = v46.props.itemInfo;
            if not v39.isItemSelectable(l_itemInfo_0) or v46.props.disableInteractions then
                return;
            else
                local l_itemId_0 = l_tryOnItem_0.itemId;
                local v50 = not l_tryOnItem_0.selectedInTryOnManager;
                v46.props.setEquippedInTryOnManager(l_itemId_0, v50, v46.props.catalogAnalytics, l_tryOnItem_0.itemType);
                if v46.props.allowAutomaticPeekViewStateChanges then
                    v46.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Brief);
                end;
                return;
            end;
        end;
    end;
end;
v45.getItemIconType = function(v51) --[[ Line: 139 ]] --[[ Name: getItemIconType ]]
    -- upvalues: v27 (copy), l_ItemTileEnums_0 (copy)
    local l_tryOnItem_1 = v51.props.tryOnItem;
    if l_tryOnItem_1.itemType == v27.ItemType.Bundle then
        if l_tryOnItem_1.itemSubType == v27.BundleTypeIdStrings.DynamicHead then
            return l_ItemTileEnums_0.ItemIconType.DynamicHead;
        else
            return nil;
        end;
    else
        return l_tryOnItem_1.itemType == v27.ItemType.Bundle and l_ItemTileEnums_0.ItemIconType.Bundle or nil;
    end;
end;
v45.getItemInfo = function(v53, v54, v55) --[[ Line: 156 ]] --[[ Name: getItemInfo ]]
    -- upvalues: l_NumberLocalization_0 (copy), l_FFlagAXBlackbirdRoot_0 (copy)
    local v56 = v54.priceInRobux or nil;
    if v53.props.tryOnItem.selectedTimedOptionIndex and v54.timedOptions then
        local v57 = v54.timedOptions[v53.props.tryOnItem.selectedTimedOptionIndex];
        if v57 then
            v56 = v57.price;
        end;
    end;
    local v58 = v54.quantityOwned > 0;
    local l_noPriceStatus_0 = v54.noPriceStatus;
    local v60 = false;
    local v61 = "";
    local v62 = true;
    local v63 = nil;
    local v64 = nil;
    if v58 and not v53.props.forceShowPrice then
        v61 = v55.ownedText;
    elseif v56 == 0 then
        v61 = v55.freeText;
    elseif v56 ~= nil then
        v61 = l_NumberLocalization_0.localize(string.format("%.0f", v56), v53.props.localization:GetLocale());
        v60 = true;
    else
        v63 = v55.offSaleText;
        v62 = false;
    end;
    if l_noPriceStatus_0 then
        if l_noPriceStatus_0 == "OffSale" then
            v63 = v55.offSaleText;
            v62 = false;
        elseif l_noPriceStatus_0 == "NoResellers" then
            v63 = v55.noResellersText;
            v62 = false;
        elseif l_noPriceStatus_0 == "InExperience" then
            v63 = v55.inExperienceText;
        elseif l_noPriceStatus_0 == "Unavailable" then
            v63 = v55.contentDeletedText;
            v62 = false;
        end;
    end;
    if v58 and l_noPriceStatus_0 ~= "Unavailable" then
        v62 = true;
    end;
    if l_FFlagAXBlackbirdRoot_0 and v54.discountInformation and not v58 then
        local l_originalPrice_0 = v54.discountInformation.originalPrice;
        if v53.props.tryOnItem.selectedTimedOptionIndex and v54.timedOptions then
            local v66 = v54.timedOptions[v53.props.tryOnItem.selectedTimedOptionIndex];
            if v66 and v66.discountInformation then
                l_originalPrice_0 = v66.discountInformation.originalPrice;
            elseif v66 and not v66.discountInformation and v66.days ~= 0 then
                l_originalPrice_0 = nil;
            end;
        end;
        v64 = if l_originalPrice_0 then l_NumberLocalization_0.localize(string.format("%.0f", l_originalPrice_0), v53.props.localization:GetLocale()) else nil;
    end;
    local l_v61_0 = v61;
    local l_v60_0 = v60;
    local l_v63_0 = v63;
    local l_v62_0 = v62;
    if l_FFlagAXBlackbirdRoot_0 then
        return l_v61_0, l_v60_0, l_v63_0, l_v62_0, v64;
    else
        return l_v61_0, l_v60_0, l_v63_0, l_v62_0, nil;
    end;
end;
v45.renderElement = function(v71, v72, v73, v74) --[[ Line: 228 ]] --[[ Name: renderElement ]]
    -- upvalues: v27 (copy), l_FFlagAXBlackbirdRoot_0 (copy), l_getIconRichText_0 (copy), v17 (copy), v28 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v39 (copy), v2 (copy), l_ItemTile_0 (copy), l_ImageSetLabel_0 (copy), v44 (copy), l_Colors_0 (copy), l_FlexLayout_0 (copy), v37 (copy), l_View_0 (copy), l_WearTimeSelectedOptionInList_0 (copy), v43 (copy)
    local l_tryOnItem_2 = v71.props.tryOnItem;
    local l_Theme_0 = v72.Theme;
    local l_Font_0 = v72.Font;
    local l_FontSize_350_0 = v71.props.tokens.FontSize.FontSize_350;
    local l_FontSize_300_0 = v71.props.tokens.FontSize.FontSize_300;
    local v80 = l_tryOnItem_2.itemType == v27.ItemType.Bundle;
    local l_itemInfo_1 = v71.props.itemInfo;
    local v82, v83, v84, v85, v86 = v71:getItemInfo(l_itemInfo_1, v73);
    local l_name_0 = l_itemInfo_1.name;
    local l_creator_0 = l_itemInfo_1.creator;
    local l_itemRestrictionsMap_0 = l_itemInfo_1.itemRestrictionsMap;
    local v90 = if l_FFlagAXBlackbirdRoot_0 and v86 then ("%* %*"):format(l_getIconRichText_0(v17.Enums.IconName.Robux), v86) else nil;
    local v91 = 0;
    if v80 then
        for _, _ in l_tryOnItem_2.bundleInfo do
            v91 = v91 + 1;
        end;
    end;
    local v94 = l_tryOnItem_2.itemType and v28.GetRbxThumbType(l_tryOnItem_2.itemType) or nil;
    local v95 = nil;
    if l_tryOnItem_2.itemId and v94 then
        v95 = l_getRbxthumbWithTypeSizeAndOptions_0(l_tryOnItem_2.itemId, v94, 150);
    end;
    local v96 = v39.isItemSelectable(l_itemInfo_1);
    local v97 = v71.props.localization:Format("Feature.Catalog.Label.UsingBundleParts", {
        count = v91
    });
    local l_Size_1800_0 = v71.props.tokens.Size.Size_1800;
    local l_XLarge_0 = v71.props.tokens.Padding.XLarge;
    local l_Size_500_0 = v71.props.tokens.Size.Size_500;
    local l_Size_800_0 = v71.props.tokens.Size.Size_800;
    local v102 = 0 - l_Size_1800_0 - l_XLarge_0 - l_XLarge_0 + v74;
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
            Padding = UDim.new(0, l_XLarge_0)
        }), 
        TryOnManagerTileFrame = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(l_Size_1800_0, l_Size_1800_0), 
            LayoutOrder = 1
        }, {
            TryOnManagerTile = v2.createElement(l_ItemTile_0, {
                itemIconType = v71:getItemIconType(), 
                restrictionTypes = l_itemRestrictionsMap_0, 
                Selectable = v96, 
                isSelected = if v96 then l_tryOnItem_2.selectedInTryOnManager else nil, 
                onActivated = v71.onTileActivated, 
                thumbnail = v95, 
                titleTextLineCount = 0
            }), 
            TryOnManagerTileAlertFrame = if not v96 then v2.createElement("Frame", {
                BackgroundColor3 = l_Theme_0.Overlay.Color, 
                BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                UICorner = v2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 10)
                }), 
                TryOnManagerTileAlert = v2.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = v44, 
                    ImageColor3 = l_Colors_0.White, 
                    ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                    Size = UDim2.fromOffset(l_Size_800_0, l_Size_800_0), 
                    Position = UDim2.new(0.5, 0, 0.5, 0)
                })
            }) else nil
        }), 
        TryOnInfoFrame = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, v102, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 2
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, v72.Tokens.Global.Space_50)
            }), 
            TopTextRow = v2.createElement(l_FlexLayout_0, {
                flexSlot = v2.createElement("Frame", {
                    BorderSizePixel = 0, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 0)
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Top, 
                        Padding = UDim.new(0, v72.Tokens.Global.Space_125)
                    }), 
                    ItemName = v2.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1, 
                        TextSize = l_FontSize_350_0, 
                        Font = l_Font_0.Header1.Font, 
                        TextColor3 = v71.props.tokens.Color.Content.Emphasis.Color3, 
                        TextTransparency = v71.props.tokens.Color.Content.Emphasis.Transparency, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        TextWrapped = true, 
                        Text = l_name_0
                    }), 
                    VerifiedCreatorName = if l_creator_0 and l_creator_0.hasVerifiedBadge == true and l_creator_0.name then v2.createElement(v37.EmojiWrapper, {
                        layoutOrder = 2, 
                        emoji = v37.emoji.verified, 
                        font = l_Font_0.SubHeader1.Font, 
                        anchorPoint = Vector2.new(1, 0), 
                        position = UDim2.new(1, 0, 0, 0), 
                        size = UDim2.new(1, 0, 0, 0), 
                        automaticSize = Enum.AutomaticSize.Y, 
                        verticalAlignment = Enum.VerticalAlignment.Center
                    }, {
                        TextLabel = v2.createElement("TextLabel", {
                            BackgroundTransparency = 1, 
                            Font = l_Font_0.SubHeader1.Font, 
                            Size = UDim2.new(0, 0, 1, 0), 
                            Text = l_creator_0.name, 
                            TextColor3 = v71.props.tokens.Color.Content.Emphasis.Color3, 
                            TextSize = l_FontSize_300_0, 
                            TextTruncate = Enum.TextTruncate.AtEnd, 
                            AutomaticSize = Enum.AutomaticSize.XY
                        })
                    }) else nil, 
                    UnverifiedCreatorName = if l_creator_0 and l_creator_0.hasVerifiedBadge ~= true and l_creator_0.name then v2.createElement("TextLabel", {
                        LayoutOrder = 2, 
                        AnchorPoint = Vector2.new(1, 0), 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(1, 0, 0, 0), 
                        Size = UDim2.new(1, 0, 0, 0), 
                        Font = l_Font_0.SubHeader1.Font, 
                        TextColor3 = v71.props.tokens.Color.Content.Emphasis.Color3, 
                        TextTransparency = v71.props.tokens.Color.Content.Emphasis.Transparency, 
                        TextSize = l_FontSize_300_0, 
                        Text = l_creator_0.name, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextWrapped = true
                    }) else nil, 
                    HorizontalContainer = v2.createElement("Frame", {
                        LayoutOrder = 3, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, 0, 0, 0)
                    }, {
                        UIListLayout = v2.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            Padding = UDim.new(0, v71.props.tokens.Padding.Small), 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            VerticalAlignment = Enum.VerticalAlignment.Center
                        }), 
                        WearTimeOptions = if v71.props.itemInfo.timedOptions then v2.createElement(l_View_0, {
                            tag = "auto-xy", 
                            LayoutOrder = 1
                        }, {
                            WearTimeSelectedOptionInList = v2.createElement(l_WearTimeSelectedOptionInList_0, {
                                options = v71.props.itemInfo.timedOptions, 
                                onOptionActivated = function(v103) --[[ Line: 457 ]] --[[ Name: onOptionActivated ]]
                                    -- upvalues: v71 (copy)
                                    for v104, v105 in ipairs(v71.props.itemInfo.timedOptions) do
                                        v105.selected = v104 == v103;
                                    end;
                                    v71.props.setSelectedTimedOption(v71.props.tryOnItem.itemId, v103, v71.props.tryOnItem.itemType);
                                end
                            })
                        }) else nil, 
                        BundleParts = if v91 > 0 then v2.createElement("Frame", {
                            LayoutOrder = 2, 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            Transparency = v71.props.tokens.Color.Shift.Shift_200.Transparency, 
                            BackgroundColor3 = v71.props.tokens.Color.Shift.Shift_200.Color3, 
                            Size = UDim2.new(0, 0, 0, 0), 
                            BorderSizePixel = 0
                        }, {
                            UICorner = v2.createElement("UICorner", {
                                CornerRadius = UDim.new(0, v72.Tokens.Global.Size_125)
                            }), 
                            UIPadding = v2.createElement("UIPadding", {
                                PaddingTop = UDim.new(0, v71.props.tokens.Padding.Small), 
                                PaddingLeft = UDim.new(0, v71.props.tokens.Padding.Medium), 
                                PaddingRight = UDim.new(0, v71.props.tokens.Padding.Medium), 
                                PaddingBottom = UDim.new(0, v71.props.tokens.Padding.Small)
                            }), 
                            BundlePartsText2 = v2.createElement("TextLabel", {
                                AnchorPoint = Vector2.new(0, 0), 
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                BackgroundTransparency = 1, 
                                Position = UDim2.new(0, 0, 0, 0), 
                                Size = UDim2.new(0, 0, 0, 0), 
                                Font = l_Font_0.SubHeader1.Font, 
                                TextColor3 = v71.props.tokens.Color.Content.Emphasis.Color3, 
                                TextTransparency = v71.props.tokens.Color.Content.Emphasis.Transparency, 
                                TextSize = l_FontSize_300_0, 
                                Text = v97, 
                                TextTruncate = Enum.TextTruncate.AtEnd, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                TextYAlignment = Enum.TextYAlignment.Center, 
                                TextWrapped = true
                            })
                        }) else nil
                    }), 
                    PriceStatusText = if v84 then v2.createElement("TextLabel", {
                        LayoutOrder = 4, 
                        AnchorPoint = Vector2.new(1, 0), 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(1, 0, 0, 0), 
                        Size = UDim2.new(1, 0, 0, 0), 
                        Font = l_Font_0.SubHeader1.Font, 
                        TextColor3 = v71.props.tokens.Color.Content.Muted.Color3, 
                        TextTransparency = v71.props.tokens.Color.Content.Muted.Transparency, 
                        TextSize = l_FontSize_350_0, 
                        Text = v84, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextWrapped = true
                    }) else nil
                }), 
                rigidSlot = v2.createElement("Frame", {
                    Size = UDim2.new(0, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2, 
                    AutomaticSize = Enum.AutomaticSize.XY
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                        Padding = UDim.new(0, 6)
                    }), 
                    Icon = v83 and v85 and v2.createElement(l_ImageSetLabel_0, {
                        Image = v43, 
                        ImageTransparency = v71.props.tokens.Color.Content.Muted.Transparency, 
                        ImageColor3 = v71.props.tokens.Color.Content.Muted.Color3, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.fromOffset(l_Size_500_0, l_Size_500_0), 
                        LayoutOrder = 1
                    }) or nil, 
                    Price = v85 and v2.createElement("TextLabel", {
                        Size = UDim2.new(0, -l_Size_500_0 - v74, 0, l_Size_500_0), 
                        Text = v82, 
                        TextSize = l_FontSize_350_0, 
                        Font = l_Font_0.Header1.Font, 
                        TextColor3 = v71.props.tokens.Color.Content.Muted.Color3, 
                        TextTransparency = v71.props.tokens.Color.Content.Muted.Transparency, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 2, 
                        AutomaticSize = Enum.AutomaticSize.X
                    }) or nil, 
                    OriginalPrice = l_FFlagAXBlackbirdRoot_0 and v85 and v90 and v2.createElement("TextLabel", {
                        Size = UDim2.new(0, -l_Size_500_0 - v74, 0, l_Size_500_0), 
                        RichText = true, 
                        Text = "<s>" .. v90 .. "</s>", 
                        TextSize = l_FontSize_300_0, 
                        Font = l_Font_0.SubHeader1.Font, 
                        TextColor3 = v71.props.tokens.Color.Content.Muted.Color3, 
                        TextTransparency = v71.props.tokens.Color.Content.Muted.Transparency, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 3, 
                        AutomaticSize = Enum.AutomaticSize.X
                    }) or nil
                })
            })
        })
    });
end;
v45.renderWithProviders = function(v106, v107, v108) --[[ Line: 595 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v2 (copy), l_Focusable_0 (copy)
    local v109 = v106.props.horizontalPadding or 0;
    return v2.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = v106.props.layoutOrder, 
        ref = v106.props.elementRef, 
        NextSelectionDown = v106.props.NextSelectionDown, 
        NextSelectionUp = v106.props.NextSelectionUp
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, v106.props.tokens.Padding.Medium)
        }), 
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v109), 
            PaddingRight = UDim.new(0, v109)
        }), 
        LookDetailsTryOnElement = v106:renderElement(v107, v108, v109)
    });
end;
v45.render = function(v110) --[[ Line: 625 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withLocalization_0 (copy)
    return l_withStyle_0(function(v111) --[[ Line: 626 ]]
        -- upvalues: l_withLocalization_0 (ref), v110 (copy)
        return l_withLocalization_0({
            noResellersText = "Feature.Catalog.LabelNoResellers", 
            inExperienceTest = "Feature.Catalog.Label.InSingleExperience", 
            inExperienceText = "Feature.Catalog.Label.InSingleExperience", 
            offSaleText = "Feature.Catalog.LabelOffSale", 
            freeText = "Feature.Catalog.LabelFree", 
            ownedText = "Feature.Catalog.Label.Owned", 
            contentDeletedText = "Feature.Catalog.LabelContentDeleted"
        })(function(v112) --[[ Line: 635 ]]
            -- upvalues: v110 (ref), v111 (copy)
            return v110:renderWithProviders(v111, v112);
        end);
    end);
end;
local function v116(v113, _) --[[ Line: 641 ]] --[[ Name: mapStateToProps ]]
    local l_LocalUserId_0 = v113.LocalUserId;
    return {
        playerMembership = v113.Users[l_LocalUserId_0] and v113.Users[l_LocalUserId_0].membership or Enum.MembershipType.None
    };
end;
local function v126(v117) --[[ Line: 649 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v29 (copy), l_AvatarScreen_0 (copy), l_SetTryOnManagerPeekViewState_0 (copy), v31 (copy)
    return {
        setEquippedInTryOnManager = function(v118, v119, v120, v121) --[[ Line: 651 ]] --[[ Name: setEquippedInTryOnManager ]]
            -- upvalues: v117 (copy), v29 (ref), l_AvatarScreen_0 (ref)
            return v117(v29(v118, v119, v120, v121, l_AvatarScreen_0.LookDetails));
        end, 
        setTryOnManagerPeekViewState = function(v122) --[[ Line: 663 ]] --[[ Name: setTryOnManagerPeekViewState ]]
            -- upvalues: v117 (copy), l_SetTryOnManagerPeekViewState_0 (ref)
            v117(l_SetTryOnManagerPeekViewState_0(v122));
        end, 
        setSelectedTimedOption = function(v123, v124, v125) --[[ Line: 667 ]] --[[ Name: setSelectedTimedOption ]]
            -- upvalues: v117 (copy), v31 (ref)
            v117(v31(v123, v124, v125));
        end
    };
end;
v45 = l_withNavigation_0((l_RoactServices_0.connect({
    appAnalytics = v26, 
    catalogAnalytics = v33, 
    networking = v24, 
    localization = v25
})(v45)));
v45 = v3.connect(v116, v126)(v45);
return function(v127) --[[ Line: 684 ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), v45 (ref), v10 (copy)
    local v128 = l_useTokens_0();
    return v2.createElement(v45, v10.Dictionary.join({
        tokens = v128
    }, v127));
end;