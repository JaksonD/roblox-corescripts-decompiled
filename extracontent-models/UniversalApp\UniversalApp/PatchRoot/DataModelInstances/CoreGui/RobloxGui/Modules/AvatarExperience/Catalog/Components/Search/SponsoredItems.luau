local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_useSelectedTheme_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useSelectedTheme;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v10 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local l_IconWithTooltip_0 = require(l_CorePackages_0.Workspace.Packages.AppBlox).IconWithTooltip;
local l_TooltipOrientation_0 = v6.App.Dialog.Enum.TooltipOrientation;
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local l_Grid_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceUIKit).GridComponents.Grid;
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local v16 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v17 = require(l_Modules_0.AvatarExperience.Catalog.Components.Search.SponsoredItemsImpressionsTracker);
local v18 = require(l_Modules_0.AvatarExperience.Catalog.Selectors.selectSponsoredItems);
local l_WidgetListHorizontalMargin_0 = v16.WidgetListHorizontalMargin;
return function(v20) --[[ Line: 67 ]] --[[ Name: SponsoredItems ]]
    -- upvalues: l_useStyle_0 (copy), l_useSelectedTheme_0 (copy), v10 (copy), l_useTokens_0 (copy), l_useSelector_0 (copy), v18 (copy), l_getUseSelectorDeepEquals_0 (copy), v16 (copy), v3 (copy), v5 (copy), v4 (copy), l_WidgetListHorizontalMargin_0 (copy), v17 (copy), l_IconWithTooltip_0 (copy), l_TooltipOrientation_0 (copy), l_Grid_0 (copy)
    local l_LayoutOrder_0 = v20.LayoutOrder;
    local l_numItemsPerRow_0 = v20.numItemsPerRow;
    local v23 = l_useStyle_0();
    local v24 = l_useSelectedTheme_0() == "dark";
    local v25 = v10({
        sponsored = "Feature.GamePage.Label.Sponsored", 
        sponsoredDisclosure = "Feature.GamePage.Label.SponsoredDisclosure"
    });
    local v26 = l_useTokens_0();
    local v27 = l_useSelector_0(v18, l_getUseSelectorDeepEquals_0());
    local v28 = l_numItemsPerRow_0 * (v16.SponsoredItemsRow - 1);
    local v29 = v3.useMemo(function() --[[ Line: 85 ]]
        -- upvalues: v27 (copy), l_numItemsPerRow_0 (copy), v5 (ref)
        if v27 and l_numItemsPerRow_0 > 0 then
            return v5.List.getRange(v27, 1, l_numItemsPerRow_0);
        else
            return nil;
        end;
    end, {
        v27, 
        l_numItemsPerRow_0
    });
    local l_Font_0 = v23.Font;
    local l_Font_1 = l_Font_0.Body.Font;
    local v32 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
    local l_Theme_0 = v23.Theme;
    local v34 = if v24 then l_Theme_0.BackgroundMuted else l_Theme_0.BackgroundContrast;
    return v3.createElement(v4.Focusable.Frame, {
        Size = UDim2.new(1, l_WidgetListHorizontalMargin_0 * 2, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = v34.Transparency, 
        BackgroundColor3 = v34.Color, 
        BorderSizePixel = 0, 
        LayoutOrder = l_LayoutOrder_0, 
        onFocusGained = v20.moveFocusToColumn
    }, {
        ImpressionsTracker = v3.createElement(v17, {
            visibleItems = v29 or {}, 
            scrollingFrameRef = v20.scrollingFrameRef, 
            sponsoredGridRef = v20.sponsoredGridRef, 
            requestImpressionsSignal = v20.requestImpressionsSignal, 
            indexOffset = v28
        }), 
        UIPadding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_WidgetListHorizontalMargin_0), 
            PaddingRight = UDim.new(0, l_WidgetListHorizontalMargin_0), 
            PaddingTop = UDim.new(0, 12), 
            PaddingBottom = UDim.new(0, 12)
        }), 
        UIListLayout = v3.createElement("UIListLayout", {
            Padding = UDim.new(0, 12), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }), 
        SponsoredLabel = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 1
        }, {
            SponsoredUIListLayout = v3.createElement("UIListLayout", {
                Padding = UDim.new(0, v23.Tokens.Global.Size_50), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            SponsoredTitle = v3.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = l_Font_1, 
                Text = v25.sponsored, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                TextWrapped = true, 
                TextSize = v32, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextColor3 = l_Theme_0.TextMuted.Color, 
                LayoutOrder = 1
            }), 
            SponsoredTooltip = v3.createElement(l_IconWithTooltip_0, {
                tooltipOrientation = l_TooltipOrientation_0.Right, 
                onActivateTooltip = v20.onActivateTooltipCallback, 
                anchorPoint = Vector2.new(1, 0), 
                layoutOrder = 2, 
                hoverText = v25.sponsoredDisclosure, 
                triggerPointName = "SponsoredTooltip", 
                supportTenFootUi = true, 
                supportVR = true
            })
        }), 
        GridView = v3.createElement(v4.Focusable.Frame, {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            NextSelectionRight = v20.NextSelectionRight, 
            NextSelectionUp = v20.NextSelectionUp, 
            NextSelectionDown = v20.NextSelectionDown, 
            ref = v20.sponsoredGridRef, 
            restorePreviousChildFocus = true, 
            onFocusGained = v20.onFocusGained, 
            LayoutOrder = 2
        }, v3.createElement(l_Grid_0, {
            itemsPerRow = l_numItemsPerRow_0, 
            getItemId = function(v35) --[[ Line: 186 ]] --[[ Name: getItemId ]]
                return v35.id;
            end, 
            gapHorizontal = v26.Gap.Small, 
            gapVertical = v26.Gap.Large, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            items = v29 or {}, 
            renderItem = v20.renderItem
        }))
    });
end;