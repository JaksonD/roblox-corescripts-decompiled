local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.AvatarExperienceDeps);
local v6 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v6.Focusable;
local l_withNavigation_0 = require(l_CorePackages_0.Packages.RoactNavigation).withNavigation;
local l_RoactFitComponents_0 = v5.RoactFitComponents;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local v12 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.SellPage.AvailableToSellRow);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.SellPage.AvailableToSellLimitedUniqueRow);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v18 = v3.PureComponent:extend("AvailableToSellList");
v18.init = function(v19) --[[ Line: 38 ]] --[[ Name: init ]]
    -- upvalues: l_AvatarScreen_0 (copy), v6 (copy)
    v19.sellLimitedUniqueItem = function(v20) --[[ Line: 39 ]]
        -- upvalues: v19 (copy), l_AvatarScreen_0 (ref)
        local l_itemId_0 = v19.props.itemId;
        local l_itemType_0 = v19.props.itemType;
        local l_onOverlayClosed_0 = v19.props.onOverlayClosed;
        v19.props.navigation.navigate(l_AvatarScreen_0.SellItemPrompt, {
            itemId = l_itemId_0, 
            itemType = l_itemType_0, 
            userAssetId = v20, 
            onOverlayClosed = l_onOverlayClosed_0
        });
    end;
    v19.sellLimitedItem = function() --[[ Line: 52 ]]
        -- upvalues: v19 (copy), l_AvatarScreen_0 (ref)
        local v24 = v19.props.availableItemsToSell[1];
        local l_itemId_1 = v19.props.itemId;
        local l_itemType_1 = v19.props.itemType;
        local l_onOverlayClosed_1 = v19.props.onOverlayClosed;
        v19.props.navigation.navigate(l_AvatarScreen_0.SellItemPrompt, {
            itemId = l_itemId_1, 
            itemType = l_itemType_1, 
            userAssetId = v24, 
            onOverlayClosed = l_onOverlayClosed_1
        });
    end;
    v19.focusableRefs = v6.createRefCache();
end;
v18.createAvailableToSellLimitedUniqueList = function(v28, v29) --[[ Line: 70 ]] --[[ Name: createAvailableToSellLimitedUniqueList ]]
    -- upvalues: v3 (copy), l_FitFrameVertical_0 (copy), v14 (copy)
    local l_availableItemsToSell_0 = v28.props.availableItemsToSell;
    local function _(v31) --[[ Line: 73 ]] --[[ Name: getItemIndexRef ]]
        -- upvalues: l_availableItemsToSell_0 (copy), v28 (copy)
        local v32 = false;
        if v31 >= 1 then
            v32 = v31 <= #l_availableItemsToSell_0;
        end;
        return v32 and v28.focusableRefs[v31] or nil;
    end;
    local v34 = {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    local v35 = 0;
    if l_availableItemsToSell_0 then
        for v36, v37 in l_availableItemsToSell_0 do
            local v38 = v36 < #l_availableItemsToSell_0;
            v35 = v35 + 1;
            local v39 = "AvailableToSellLimitedUniqueRow" .. v36;
            local l_createElement_0 = v3.createElement;
            local l_l_FitFrameVertical_0_0 = l_FitFrameVertical_0;
            local v42 = {
                width = UDim.new(1, 0), 
                contentPadding = UDim.new(0, 8), 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                BackgroundTransparency = 1, 
                LayoutOrder = v36
            };
            local v43 = {};
            local l_createElement_1 = v3.createElement;
            local l_v14_0 = v14;
            local v46 = {
                horizontalPadding = 24, 
                LayoutOrder = 1, 
                onActivated = function() --[[ Line: 104 ]] --[[ Name: onActivated ]]
                    -- upvalues: v28 (copy), v37 (copy)
                    v28.sellLimitedUniqueItem(v37);
                end, 
                userAssetId = v37
            };
            local v47 = v36 - 1;
            local v48 = false;
            if v47 >= 1 then
                v48 = v47 <= #l_availableItemsToSell_0;
            end;
            v46.NextSelectionUp = v48 and v28.focusableRefs[v47] or nil;
            v47 = v36 + 1;
            v48 = false;
            if v47 >= 1 then
                v48 = v47 <= #l_availableItemsToSell_0;
            end;
            v46.NextSelectionDown = v48 and v28.focusableRefs[v47] or nil;
            local l_Ref_0 = v3.Ref;
            v48 = false;
            if v36 >= 1 then
                v48 = v36 <= #l_availableItemsToSell_0;
            end;
            v46[l_Ref_0] = v48 and v28.focusableRefs[v36] or nil;
            v43.AvailableToSellLimitedUniqueRow = l_createElement_1(l_v14_0, v46);
            v43.Divider = v38 and v3.createElement("Frame", {
                BackgroundColor3 = v29.Divider.Color, 
                BackgroundTransparency = v29.Divider.Transparency, 
                BorderSizePixel = 0, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, -24, 0, 1)
            });
            v34[v39] = l_createElement_0(l_l_FitFrameVertical_0_0, v42, v43);
        end;
    end;
    return v34;
end;
v18.renderLocalized = function(v50, v51) --[[ Line: 126 ]] --[[ Name: renderLocalized ]]
    -- upvalues: v12 (copy), l_withStyle_0 (copy), v3 (copy), l_Focusable_0 (copy), l_FitFrameVertical_0 (copy), l_RoactFitComponents_0 (copy), l_FitTextLabel_0 (copy), v13 (copy)
    local l_availableItemsToSell_1 = v50.props.availableItemsToSell;
    local l_LayoutOrder_0 = v50.props.LayoutOrder;
    local l_itemRestrictions_0 = v50.props.itemRestrictions;
    local v55 = l_itemRestrictions_0 and l_itemRestrictions_0[v12.ItemRestrictions.LimitedUnique];
    local v56 = l_itemRestrictions_0 and l_itemRestrictions_0[v12.ItemRestrictions.Limited];
    local v57 = l_availableItemsToSell_1 and #l_availableItemsToSell_1 or 0;
    local _ = nil;
    local v59 = (if v57 == 1 then v51.itemCountSingularLabel else v51.itemCountPluralLabel):gsub("({itemCount})", v57);
    return l_withStyle_0(function(v60) --[[ Line: 143 ]]
        -- upvalues: v55 (copy), v50 (copy), v3 (ref), l_Focusable_0 (ref), l_FitFrameVertical_0 (ref), l_LayoutOrder_0 (copy), l_availableItemsToSell_1 (copy), l_RoactFitComponents_0 (ref), l_FitTextLabel_0 (ref), v51 (copy), v56 (copy), v13 (ref), v59 (copy)
        local l_Font_0 = v60.Font;
        local l_Theme_0 = v60.Theme;
        local v63 = l_Font_0.BaseSize * l_Font_0.CaptionSubHeader.RelativeSize;
        local v64 = v55 and v50:createAvailableToSellLimitedUniqueList(l_Theme_0);
        local l_forwardRef_0 = v50.props.forwardRef;
        return v3.createElement(l_Focusable_0[l_FitFrameVertical_0], {
            width = UDim.new(1, 0), 
            contentPadding = UDim.new(0, 6), 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_LayoutOrder_0, 
            NextSelectionLeft = v50.props.NextSelectionLeft, 
            NextSelectionRight = v50.props.NextSelectionRight, 
            NextSelectionUp = v50.props.NextSelectionUp, 
            NextSelectionDown = v50.props.NextSelectionDown, 
            [v3.Ref] = l_forwardRef_0, 
            defaultChild = l_availableItemsToSell_1 and #l_availableItemsToSell_1 > 0 and v50.focusableRefs[1] or nil
        }, {
            AvailableForSaleLabelContainer = v3.createElement(l_FitFrameVertical_0, {
                width = UDim.new(1, 0), 
                margin = l_RoactFitComponents_0.Rect.quad(0, 0, 0, 24), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                AvailableForSaleLabel = v3.createElement(l_FitTextLabel_0, {
                    width = l_FitTextLabel_0.Width.FitToText, 
                    Font = l_Font_0.CaptionSubHeader.Font, 
                    BackgroundTransparency = 1, 
                    Text = v51.headerText, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextSize = v63, 
                    TextColor3 = l_Theme_0.TextEmphasis.Color
                })
            }), 
            LimitedCountRow = v56 and v3.createElement(v13, {
                horizontalPadding = 24, 
                LayoutOrder = 2, 
                onActivated = v50.sellLimitedItem, 
                Text = v59, 
                [v3.Ref] = v50.focusableRefs[1]
            }), 
            LimitedUniqueRowConatiner = v55 and v3.createElement(l_FitFrameVertical_0, {
                width = UDim.new(1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, v64)
        });
    end);
end;
v18.render = function(v66) --[[ Line: 204 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy)
    local l_availableItemsToSell_2 = v66.props.availableItemsToSell;
    if not l_availableItemsToSell_2 or #l_availableItemsToSell_2 == 0 then
        return;
    else
        return l_withLocalization_0({
            headerText = "Feature.Catalog.Label.AvailableForSale", 
            itemCountPluralLabel = "Feature.Catalog.Label.ItemsCount", 
            itemCountSingularLabel = "Feature.Catalog.Label.ItemCount"
        })(function(v68) --[[ Line: 213 ]]
            -- upvalues: v66 (copy)
            return v66:renderLocalized(v68);
        end);
    end;
end;
v18 = l_withNavigation_0((v4.connect(function(v69, v70) --[[ Line: 219 ]]
    local v71 = v69.AvatarExperience.Common.AssetInfos[v70.itemId];
    return {
        itemRestrictions = v71 and v71.itemRestrictions, 
        availableItemsToSell = v69.AvatarExperience.Catalog.Sell.AvailableToSellAssets[v70.itemId]
    };
end, nil)(v18)));
return v3.forwardRef(function(v72, v73) --[[ Line: 229 ]]
    -- upvalues: v3 (copy), v18 (ref), v2 (copy)
    return v3.createElement(v18, v2.Dictionary.join(v72, {
        forwardRef = v73
    }));
end);