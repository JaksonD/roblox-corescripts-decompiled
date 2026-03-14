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
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v23 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v24 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v25 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v26 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v27 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v28 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetEquippedInTryOnManagerThunk);
local v29 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
local v30 = require(l_Modules_0.AvatarExperience.Common.Actions.SetSelectedTimedOption);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v32 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v36 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v38 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_WearTimeSelectedOptionInList_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Components.WearTimeSelectedOptionInList;
local l_FlexLayout_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Components.FlexLayout;
local l_FFlagAXDurablesSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupport;
local v42 = l_Images_0["icons/common/robux"];
local v43 = l_Images_0["icons/status/error_large"];
local v44 = v2.PureComponent:extend("LookDetailsTryOnElement");
v44.validateProps = v7.strictInterface({
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
    setSelectedTimedOption = if l_FFlagAXDurablesSupport_0 then v7.callback else nil, 
    networking = v7.callback, 
    appAnalytics = v7.table, 
    catalogAnalytics = v7.table, 
    localization = v7.table, 
    navigation = v7.table
});
v44.init = function(v45) --[[ Line: 105 ]] --[[ Name: init ]]
    -- upvalues: v38 (copy), l_PeekViewState_0 (copy)
    v45.onTileActivated = function() --[[ Line: 106 ]]
        -- upvalues: v45 (copy), v38 (ref), l_PeekViewState_0 (ref)
        local l_tryOnItem_0 = v45.props.tryOnItem;
        if not l_tryOnItem_0 then
            return;
        else
            local l_itemInfo_0 = v45.props.itemInfo;
            if not v38.isItemSelectable(l_itemInfo_0) or v45.props.disableInteractions then
                return;
            else
                local l_itemId_0 = l_tryOnItem_0.itemId;
                local v49 = not l_tryOnItem_0.selectedInTryOnManager;
                v45.props.setEquippedInTryOnManager(l_itemId_0, v49, v45.props.catalogAnalytics, l_tryOnItem_0.itemType);
                if v45.props.allowAutomaticPeekViewStateChanges then
                    v45.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Brief);
                end;
                return;
            end;
        end;
    end;
end;
v44.getItemIconType = function(v50) --[[ Line: 137 ]] --[[ Name: getItemIconType ]]
    -- upvalues: v26 (copy), l_ItemTileEnums_0 (copy)
    local l_tryOnItem_1 = v50.props.tryOnItem;
    if l_tryOnItem_1.itemType == v26.ItemType.Bundle then
        if l_tryOnItem_1.itemSubType == v26.BundleTypeIdStrings.DynamicHead then
            return l_ItemTileEnums_0.ItemIconType.DynamicHead;
        else
            return nil;
        end;
    else
        return l_tryOnItem_1.itemType == v26.ItemType.Bundle and l_ItemTileEnums_0.ItemIconType.Bundle or nil;
    end;
end;
v44.getItemInfo = function(v52, v53, v54) --[[ Line: 154 ]] --[[ Name: getItemInfo ]]
    -- upvalues: l_FFlagAXDurablesSupport_0 (copy), l_NumberLocalization_0 (copy)
    local v55 = v53.priceInRobux or nil;
    if l_FFlagAXDurablesSupport_0 and v52.props.tryOnItem.selectedTimedOptionIndex and v53.timedOptions then
        local v56 = v53.timedOptions[v52.props.tryOnItem.selectedTimedOptionIndex];
        if v56 then
            v55 = v56.price;
        end;
    end;
    local v57 = v53.quantityOwned > 0;
    local l_noPriceStatus_0 = v53.noPriceStatus;
    local v59 = false;
    local v60 = "";
    local v61 = true;
    local v62 = nil;
    if v57 and not v52.props.forceShowPrice then
        v60 = v54.ownedText;
    elseif v55 == 0 then
        v60 = v54.freeText;
    elseif v55 ~= nil then
        v60 = l_NumberLocalization_0.localize(string.format("%.0f", v55), v52.props.localization:GetLocale());
        v59 = true;
    else
        v62 = v54.offSaleText;
        v61 = false;
    end;
    if l_noPriceStatus_0 then
        if l_noPriceStatus_0 == "OffSale" then
            v62 = v54.offSaleText;
            v61 = false;
        elseif l_noPriceStatus_0 == "NoResellers" then
            v62 = v54.noResellersText;
            v61 = false;
        elseif l_noPriceStatus_0 == "InExperience" then
            v62 = v54.inExperienceText;
        elseif l_noPriceStatus_0 == "Unavailable" then
            v62 = v54.contentDeletedText;
            v61 = false;
        end;
    end;
    if v57 and l_noPriceStatus_0 ~= "Unavailable" then
        v61 = true;
    end;
    return v60, v59, v62, v61, v57;
end;
v44.renderElement = function(v63, v64, v65, v66) --[[ Line: 205 ]] --[[ Name: renderElement ]]
    -- upvalues: v26 (copy), v27 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v38 (copy), v2 (copy), l_ItemTile_0 (copy), l_ImageSetLabel_0 (copy), v43 (copy), l_Colors_0 (copy), l_FlexLayout_0 (copy), v36 (copy), l_FFlagAXDurablesSupport_0 (copy), l_View_0 (copy), l_WearTimeSelectedOptionInList_0 (copy), v42 (copy)
    local l_tryOnItem_2 = v63.props.tryOnItem;
    local l_Theme_0 = v64.Theme;
    local l_Font_0 = v64.Font;
    local l_FontSize_350_0 = v63.props.tokens.FontSize.FontSize_350;
    local l_FontSize_300_0 = v63.props.tokens.FontSize.FontSize_300;
    local v72 = l_tryOnItem_2.itemType == v26.ItemType.Bundle;
    local l_itemInfo_1 = v63.props.itemInfo;
    local v74, v75, v76, v77 = v63:getItemInfo(l_itemInfo_1, v65);
    local l_name_0 = l_itemInfo_1.name;
    local l_creator_0 = l_itemInfo_1.creator;
    local l_itemRestrictionsMap_0 = l_itemInfo_1.itemRestrictionsMap;
    local v81 = 0;
    if v72 then
        for _, _ in l_tryOnItem_2.bundleInfo do
            v81 = v81 + 1;
        end;
    end;
    local v84 = l_tryOnItem_2.itemType and v27.GetRbxThumbType(l_tryOnItem_2.itemType) or nil;
    local v85 = nil;
    if l_tryOnItem_2.itemId and v84 then
        v85 = l_getRbxthumbWithTypeSizeAndOptions_0(l_tryOnItem_2.itemId, v84, 150);
    end;
    local v86 = v38.isItemSelectable(l_itemInfo_1);
    local v87 = v63.props.localization:Format("Feature.Catalog.Label.UsingBundleParts", {
        count = v81
    });
    local l_Size_1800_0 = v63.props.tokens.Size.Size_1800;
    local l_XLarge_0 = v63.props.tokens.Padding.XLarge;
    local l_Size_500_0 = v63.props.tokens.Size.Size_500;
    local l_Size_800_0 = v63.props.tokens.Size.Size_800;
    local v92 = 0 - l_Size_1800_0 - l_XLarge_0 - l_XLarge_0 + v66;
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
                itemIconType = v63:getItemIconType(), 
                restrictionTypes = l_itemRestrictionsMap_0, 
                Selectable = v86, 
                isSelected = if v86 then l_tryOnItem_2.selectedInTryOnManager else nil, 
                onActivated = v63.onTileActivated, 
                thumbnail = v85, 
                titleTextLineCount = 0
            }), 
            TryOnManagerTileAlertFrame = if not v86 then v2.createElement("Frame", {
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
                    Image = v43, 
                    ImageColor3 = l_Colors_0.White, 
                    ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                    Size = UDim2.fromOffset(l_Size_800_0, l_Size_800_0), 
                    Position = UDim2.new(0.5, 0, 0.5, 0)
                })
            }) else nil
        }), 
        TryOnInfoFrame = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, v92, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 2
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, v64.Tokens.Global.Space_50)
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
                        Padding = UDim.new(0, v64.Tokens.Global.Space_125)
                    }), 
                    ItemName = v2.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1, 
                        TextSize = l_FontSize_350_0, 
                        Font = l_Font_0.Header1.Font, 
                        TextColor3 = v63.props.tokens.Color.Content.Emphasis.Color3, 
                        TextTransparency = v63.props.tokens.Color.Content.Emphasis.Transparency, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        TextWrapped = true, 
                        Text = l_name_0
                    }), 
                    VerifiedCreatorName = if l_creator_0 and l_creator_0.hasVerifiedBadge == true and l_creator_0.name then v2.createElement(v36.EmojiWrapper, {
                        layoutOrder = 2, 
                        emoji = v36.emoji.verified, 
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
                            TextColor3 = v63.props.tokens.Color.Content.Emphasis.Color3, 
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
                        TextColor3 = v63.props.tokens.Color.Content.Emphasis.Color3, 
                        TextTransparency = v63.props.tokens.Color.Content.Emphasis.Transparency, 
                        TextSize = l_FontSize_300_0, 
                        Text = l_creator_0.name, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextWrapped = true
                    }) else nil, 
                    BundleParts = if not l_FFlagAXDurablesSupport_0 and v81 > 0 then v2.createElement("Frame", {
                        LayoutOrder = 3, 
                        AnchorPoint = Vector2.new(1, 0), 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        Transparency = v63.props.tokens.Color.Shift.Shift_100.Transparency, 
                        BackgroundColor3 = v63.props.tokens.Color.Shift.Shift_100.Color3, 
                        Position = UDim2.new(1, 0, 0, 0), 
                        Size = UDim2.new(0, 0, 0, 0), 
                        BorderSizePixel = 0
                    }, {
                        UICorner = v2.createElement("UICorner", {
                            CornerRadius = UDim.new(0, v64.Tokens.Global.Size_125)
                        }), 
                        UIPadding = v2.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, v63.props.tokens.Padding.Small), 
                            PaddingLeft = UDim.new(0, v63.props.tokens.Padding.Medium), 
                            PaddingRight = UDim.new(0, v63.props.tokens.Padding.Medium), 
                            PaddingBottom = UDim.new(0, v63.props.tokens.Padding.Small)
                        }), 
                        BundlePartsText2 = v2.createElement("TextLabel", {
                            AnchorPoint = Vector2.new(0, 0), 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            BackgroundTransparency = 1, 
                            Position = UDim2.new(0, 0, 0, 0), 
                            Size = UDim2.new(0, 0, 0, 0), 
                            Font = l_Font_0.SubHeader1.Font, 
                            TextColor3 = v63.props.tokens.Color.Content.Emphasis.Color3, 
                            TextTransparency = v63.props.tokens.Color.Content.Emphasis.Transparency, 
                            TextSize = l_FontSize_300_0, 
                            Text = v87, 
                            TextTruncate = Enum.TextTruncate.AtEnd, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = Enum.TextYAlignment.Center, 
                            TextWrapped = true
                        })
                    }) else nil, 
                    HorizontalContainer = if l_FFlagAXDurablesSupport_0 then v2.createElement("Frame", {
                        LayoutOrder = 3, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, 0, 0, 0)
                    }, {
                        UIListLayout = v2.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            Padding = UDim.new(0, v63.props.tokens.Padding.Small), 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            VerticalAlignment = Enum.VerticalAlignment.Center
                        }), 
                        WearTimeOptions = if v63.props.itemInfo.timedOptions then v2.createElement(l_View_0, {
                            tag = "auto-xy", 
                            LayoutOrder = 1
                        }, {
                            WearTimeSelectedOptionInList = v2.createElement(l_WearTimeSelectedOptionInList_0, {
                                options = v63.props.itemInfo.timedOptions, 
                                onOptionActivated = function(v93) --[[ Line: 469 ]] --[[ Name: onOptionActivated ]]
                                    -- upvalues: v63 (copy)
                                    for v94, v95 in ipairs(v63.props.itemInfo.timedOptions) do
                                        v95.selected = v94 == v93;
                                    end;
                                    v63.props.setSelectedTimedOption(v63.props.tryOnItem.itemId, v93, v63.props.tryOnItem.itemType);
                                end
                            })
                        }) else nil, 
                        BundleParts = if v81 > 0 then v2.createElement("Frame", {
                            LayoutOrder = 2, 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            Transparency = v63.props.tokens.Color.Shift.Shift_100.Transparency, 
                            BackgroundColor3 = v63.props.tokens.Color.Shift.Shift_100.Color3, 
                            Size = UDim2.new(0, 0, 0, 0), 
                            BorderSizePixel = 0
                        }, {
                            UICorner = v2.createElement("UICorner", {
                                CornerRadius = UDim.new(0, v64.Tokens.Global.Size_125)
                            }), 
                            UIPadding = v2.createElement("UIPadding", {
                                PaddingTop = UDim.new(0, v63.props.tokens.Padding.Small), 
                                PaddingLeft = UDim.new(0, v63.props.tokens.Padding.Medium), 
                                PaddingRight = UDim.new(0, v63.props.tokens.Padding.Medium), 
                                PaddingBottom = UDim.new(0, v63.props.tokens.Padding.Small)
                            }), 
                            BundlePartsText2 = v2.createElement("TextLabel", {
                                AnchorPoint = Vector2.new(0, 0), 
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                BackgroundTransparency = 1, 
                                Position = UDim2.new(0, 0, 0, 0), 
                                Size = UDim2.new(0, 0, 0, 0), 
                                Font = l_Font_0.SubHeader1.Font, 
                                TextColor3 = v63.props.tokens.Color.Content.Emphasis.Color3, 
                                TextTransparency = v63.props.tokens.Color.Content.Emphasis.Transparency, 
                                TextSize = l_FontSize_300_0, 
                                Text = v87, 
                                TextTruncate = Enum.TextTruncate.AtEnd, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                TextYAlignment = Enum.TextYAlignment.Center, 
                                TextWrapped = true
                            })
                        }) else nil
                    }) else nil, 
                    PriceStatusText = if v76 then v2.createElement("TextLabel", {
                        LayoutOrder = 4, 
                        AnchorPoint = Vector2.new(1, 0), 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(1, 0, 0, 0), 
                        Size = UDim2.new(1, 0, 0, 0), 
                        Font = l_Font_0.SubHeader1.Font, 
                        TextColor3 = v63.props.tokens.Color.Content.Muted.Color3, 
                        TextTransparency = v63.props.tokens.Color.Content.Muted.Transparency, 
                        TextSize = l_FontSize_350_0, 
                        Text = v76, 
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
                    Icon = v75 and v77 and v2.createElement(l_ImageSetLabel_0, {
                        Image = v42, 
                        ImageTransparency = v63.props.tokens.Color.Content.Muted.Transparency, 
                        ImageColor3 = v63.props.tokens.Color.Content.Muted.Color3, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.fromOffset(l_Size_500_0, l_Size_500_0), 
                        LayoutOrder = 1
                    }) or nil, 
                    Price = v77 and v2.createElement("TextLabel", {
                        Size = UDim2.new(0, -l_Size_500_0 - v66, 0, l_Size_500_0), 
                        Text = v74, 
                        TextSize = l_FontSize_350_0, 
                        Font = l_Font_0.Header1.Font, 
                        TextColor3 = v63.props.tokens.Color.Content.Muted.Color3, 
                        TextTransparency = v63.props.tokens.Color.Content.Muted.Transparency, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 2, 
                        AutomaticSize = Enum.AutomaticSize.X
                    }) or nil
                })
            })
        })
    });
end;
v44.renderWithProviders = function(v96, v97, v98) --[[ Line: 588 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v2 (copy), l_Focusable_0 (copy)
    local v99 = v96.props.horizontalPadding or 0;
    return v2.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = v96.props.layoutOrder, 
        ref = v96.props.elementRef, 
        NextSelectionDown = v96.props.NextSelectionDown, 
        NextSelectionUp = v96.props.NextSelectionUp
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, v96.props.tokens.Padding.Medium)
        }), 
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v99), 
            PaddingRight = UDim.new(0, v99)
        }), 
        LookDetailsTryOnElement = v96:renderElement(v97, v98, v99)
    });
end;
v44.render = function(v100) --[[ Line: 618 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withLocalization_0 (copy)
    return l_withStyle_0(function(v101) --[[ Line: 619 ]]
        -- upvalues: l_withLocalization_0 (ref), v100 (copy)
        return l_withLocalization_0({
            noResellersText = "Feature.Catalog.LabelNoResellers", 
            inExperienceTest = "Feature.Catalog.Label.InSingleExperience", 
            inExperienceText = "Feature.Catalog.Label.InSingleExperience", 
            offSaleText = "Feature.Catalog.LabelOffSale", 
            freeText = "Feature.Catalog.LabelFree", 
            ownedText = "Feature.Catalog.Label.Owned", 
            contentDeletedText = "Feature.Catalog.LabelContentDeleted"
        })(function(v102) --[[ Line: 628 ]]
            -- upvalues: v100 (ref), v101 (copy)
            return v100:renderWithProviders(v101, v102);
        end);
    end);
end;
local function v106(v103, _) --[[ Line: 634 ]] --[[ Name: mapStateToProps ]]
    local l_LocalUserId_0 = v103.LocalUserId;
    return {
        playerMembership = v103.Users[l_LocalUserId_0] and v103.Users[l_LocalUserId_0].membership or Enum.MembershipType.None
    };
end;
local function v116(v107) --[[ Line: 642 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v28 (copy), l_AvatarScreen_0 (copy), v29 (copy), l_FFlagAXDurablesSupport_0 (copy), v30 (copy)
    return {
        setEquippedInTryOnManager = function(v108, v109, v110, v111) --[[ Line: 644 ]] --[[ Name: setEquippedInTryOnManager ]]
            -- upvalues: v107 (copy), v28 (ref), l_AvatarScreen_0 (ref)
            return v107(v28(v108, v109, v110, v111, l_AvatarScreen_0.LookDetails));
        end, 
        setTryOnManagerPeekViewState = function(v112) --[[ Line: 656 ]] --[[ Name: setTryOnManagerPeekViewState ]]
            -- upvalues: v107 (copy), v29 (ref)
            v107(v29(v112));
        end, 
        setSelectedTimedOption = l_FFlagAXDurablesSupport_0 and function(v113, v114, v115) --[[ Line: 661 ]]
            -- upvalues: v107 (copy), v30 (ref)
            v107(v30(v113, v114, v115));
        end or nil
    };
end;
v44 = l_withNavigation_0((l_RoactServices_0.connect({
    appAnalytics = v25, 
    catalogAnalytics = v32, 
    networking = v23, 
    localization = v24
})(v44)));
v44 = v3.connect(v106, v116)(v44);
return function(v117) --[[ Line: 679 ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), v44 (ref), v10 (copy)
    local v118 = l_useTokens_0();
    return v2.createElement(v44, v10.Dictionary.join({
        tokens = v118
    }, v117));
end;