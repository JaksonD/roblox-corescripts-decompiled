local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.AvatarExperienceDeps);
local l_withNavigation_0 = require(l_CorePackages_0.Packages.RoactNavigation).withNavigation;
local v7 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v7.Focusable;
local l_RoactFitComponents_0 = v5.RoactFitComponents;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v12 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.SellPage.CurrentlySellingRow);
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v17 = v3.PureComponent:extend("CurrentlySellingList");
v17.init = function(v18) --[[ Line: 37 ]] --[[ Name: init ]]
    -- upvalues: l_AvatarScreen_0 (copy), v7 (copy)
    v18.removeSoldItem = function(v19) --[[ Line: 38 ]]
        -- upvalues: v18 (copy), l_AvatarScreen_0 (ref)
        local l_itemId_0 = v18.props.itemId;
        local l_onOverlayClosed_0 = v18.props.onOverlayClosed;
        v18.props.navigation.navigate(l_AvatarScreen_0.RemoveCurrentlySellingItemPrompt, {
            itemId = l_itemId_0, 
            userAssetId = v19, 
            onOverlayClosed = l_onOverlayClosed_0
        });
        v18:setState({
            restorePreviousChildFocus = false
        });
    end;
    v18:setState({
        restorePreviousChildFocus = true
    });
    v18.onFocusGained = function() --[[ Line: 56 ]]
        -- upvalues: v18 (copy)
        if not v18.state.restorePreviousChildFocus then
            v18:setState({
                restorePreviousChildFocus = true
            });
        end;
    end;
    v18.focusableRefs = v7.createRefCache();
end;
v17.createRemovableList = function(v22, v23) --[[ Line: 67 ]] --[[ Name: createRemovableList ]]
    -- upvalues: v12 (copy), v3 (copy), l_FitFrameVertical_0 (copy), v13 (copy)
    local l_assetInfo_0 = v22.props.assetInfo;
    local l_currentlySellingList_0 = v22.props.currentlySellingList;
    local v26 = l_assetInfo_0 and l_assetInfo_0.itemRestrictions;
    local v27 = v26 and v26[v12.ItemRestrictions.LimitedUnique];
    local function _(v28) --[[ Line: 74 ]] --[[ Name: getItemIndexRef ]]
        -- upvalues: l_currentlySellingList_0 (copy), v22 (copy)
        local v29 = false;
        if v28 >= 1 then
            v29 = v28 <= #l_currentlySellingList_0;
        end;
        return v29 and v22.focusableRefs[v28] or nil;
    end;
    local v31 = {};
    if l_currentlySellingList_0 then
        for v32, v33 in l_currentlySellingList_0 do
            local v34 = "CurrentlySellingRow" .. v32;
            local l_createElement_0 = v3.createElement;
            local l_l_FitFrameVertical_0_0 = l_FitFrameVertical_0;
            local v37 = {
                width = UDim.new(1, 0), 
                contentPadding = UDim.new(0, 8), 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                BackgroundTransparency = 1, 
                LayoutOrder = v32
            };
            local v38 = {};
            local l_createElement_1 = v3.createElement;
            local l_v13_0 = v13;
            local v41 = {
                isLimitedUnique = v27, 
                horizontalPadding = 24, 
                LayoutOrder = 1, 
                onActivated = function() --[[ Line: 98 ]] --[[ Name: onActivated ]]
                    -- upvalues: v22 (copy), v33 (copy)
                    v22.removeSoldItem(v33);
                end, 
                userAssetId = v33
            };
            local v42 = v32 - 1;
            local v43 = false;
            if v42 >= 1 then
                v43 = v42 <= #l_currentlySellingList_0;
            end;
            v41.NextSelectionUp = v43 and v22.focusableRefs[v42] or nil;
            v42 = v32 + 1;
            v43 = false;
            if v42 >= 1 then
                v43 = v42 <= #l_currentlySellingList_0;
            end;
            v41.NextSelectionDown = v43 and v22.focusableRefs[v42] or nil;
            local l_Ref_0 = v3.Ref;
            v43 = false;
            if v32 >= 1 then
                v43 = v32 <= #l_currentlySellingList_0;
            end;
            v41[l_Ref_0] = v43 and v22.focusableRefs[v32] or nil;
            v41.onFocusGained = v22.onFocusGained;
            v38.CurrentlySellingRow = l_createElement_1(l_v13_0, v41);
            v38.Divider = v3.createElement("Frame", {
                BackgroundColor3 = v23.Divider.Color, 
                BackgroundTransparency = v23.Divider.Transparency, 
                BorderSizePixel = 0, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, -24, 0, 1)
            });
            v31[v34] = l_createElement_0(l_l_FitFrameVertical_0_0, v37, v38);
        end;
    end;
    return v31;
end;
v17.renderLocalized = function(v45, v46) --[[ Line: 122 ]] --[[ Name: renderLocalized ]]
    -- upvalues: l_withStyle_0 (copy), v3 (copy), l_Focusable_0 (copy), l_FitFrameVertical_0 (copy), l_RoactFitComponents_0 (copy), l_FitTextLabel_0 (copy)
    local l_LayoutOrder_0 = v45.props.LayoutOrder;
    local l_currentlySellingList_1 = v45.props.currentlySellingList;
    return l_withStyle_0(function(v49) --[[ Line: 126 ]]
        -- upvalues: v45 (copy), v3 (ref), l_Focusable_0 (ref), l_FitFrameVertical_0 (ref), l_LayoutOrder_0 (copy), l_currentlySellingList_1 (copy), l_RoactFitComponents_0 (ref), l_FitTextLabel_0 (ref), v46 (copy)
        local l_Font_0 = v49.Font;
        local l_Theme_0 = v49.Theme;
        local v52 = l_Font_0.BaseSize * l_Font_0.CaptionSubHeader.RelativeSize;
        local v53 = v45:createRemovableList(l_Theme_0);
        local l_forwardRef_0 = v45.props.forwardRef;
        return v3.createElement(l_Focusable_0[l_FitFrameVertical_0], {
            width = UDim.new(1, 0), 
            contentPadding = UDim.new(0, 6), 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_LayoutOrder_0, 
            NextSelectionLeft = v45.props.NextSelectionLeft, 
            NextSelectionRight = v45.props.NextSelectionRight, 
            NextSelectionUp = v45.props.NextSelectionUp, 
            NextSelectionDown = v45.props.NextSelectionDown, 
            [v3.Ref] = l_forwardRef_0, 
            defaultChild = l_currentlySellingList_1 and #l_currentlySellingList_1 > 0 and v45.focusableRefs[1] or nil, 
            restorePreviousChildFocus = v45.state.restorePreviousChildFocus
        }, {
            CurrentlySellingLabelContainer = v3.createElement(l_FitFrameVertical_0, {
                width = UDim.new(1, 0), 
                margin = l_RoactFitComponents_0.Rect.quad(0, 0, 0, 24), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                CurrentlySellingLabel = v3.createElement(l_FitTextLabel_0, {
                    width = UDim.new(1, 0), 
                    Font = l_Font_0.CaptionSubHeader.Font, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    Text = v46.headerText, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextSize = v52, 
                    TextColor3 = l_Theme_0.TextEmphasis.Color
                })
            }), 
            CurrentlySellingRowContainer = v3.createElement(l_FitFrameVertical_0, {
                width = UDim.new(1, 0), 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 2
            }, v53)
        });
    end);
end;
v17.render = function(v55) --[[ Line: 186 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy)
    local l_currentlySellingList_2 = v55.props.currentlySellingList;
    if not l_currentlySellingList_2 or #l_currentlySellingList_2 == 0 then
        return;
    else
        return l_withLocalization_0({
            headerText = "Feature.Catalog.Label.OnSale"
        })(function(v57) --[[ Line: 193 ]]
            -- upvalues: v55 (copy)
            return v55:renderLocalized(v57);
        end);
    end;
end;
v17 = l_withNavigation_0((v4.connect(function(v58, v59) --[[ Line: 199 ]]
    return {
        assetInfo = v58.AvatarExperience.Common.AssetInfos[v59.itemId], 
        currentlySellingList = v58.AvatarExperience.Catalog.Sell.CurrentlySellingAssets[v59.itemId]
    };
end, nil)(v17)));
return v3.forwardRef(function(v60, v61) --[[ Line: 208 ]]
    -- upvalues: v3 (copy), v17 (ref), v2 (copy)
    return v3.createElement(v17, v2.Dictionary.join(v60, {
        forwardRef = v61
    }));
end);