local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.AXCommon);
local v4 = require(l_Parent_0.UIBlox);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v6 = require(l_Parent_0.IxpUtils);
local l_GridMetrics_0 = v4.App.Grid.GridMetrics;
local _ = require(l_script_FirstAncestor_0.Components.SuggestedItemList);
local v9 = require(l_script_FirstAncestor_0.Features.RecentSearchTermsWidget.RecentSearchTermsWidget);
local v10 = require(l_script_FirstAncestor_0.Features.RecentlyViewedSearchItemsWidget.RecentlyViewedSearchItemsWidget);
local _ = require(l_script_FirstAncestor_0.Features.RecentlyViewedSearchItemsWidget.useRecentlyViewedSearchItemsWidgetProps);
local l_AXRecentlyViewedSearchItemsIXPTest_0 = v3.Experiments.AXRecentlyViewedSearchItemsIXPTest;
return function(v13) --[[ Line: 31 ]] --[[ Name: SearchLandingPageWidgets ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), l_GridMetrics_0 (copy), v6 (copy), l_AXRecentlyViewedSearchItemsIXPTest_0 (copy), v9 (copy), v10 (copy)
    local v14 = l_useTokens_0();
    local v15, v16 = v2.useState(0);
    local v17 = v2.useRef(nil);
    local v18 = v2.useRef(nil);
    local v19 = v2.useMemo(function() --[[ Line: 40 ]]
        -- upvalues: l_GridMetrics_0 (ref), v15 (copy), v14 (copy)
        return l_GridMetrics_0.getSmallMetrics(math.max(v15 - v14.Size.Size_400 * 2, 0), v14.Size.Size_250);
    end, {
        v15
    });
    local function v21(v20) --[[ Line: 44 ]]
        -- upvalues: v16 (copy)
        v16(v20.AbsoluteSize.X);
    end;
    local v22 = 1;
    local v23 = 2;
    local v24 = v6.readTestVariable(l_AXRecentlyViewedSearchItemsIXPTest_0.EnabledForUser);
    if v24 and v6.readTestVariable(l_AXRecentlyViewedSearchItemsIXPTest_0.EnabledTopVariant) then
        v22 = 2;
        v23 = 1;
    end;
    return v2.createElement("ScrollingFrame", {
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        AutomaticCanvasSize = Enum.AutomaticSize.XY, 
        CanvasSize = UDim2.fromScale(1, 1), 
        Size = UDim2.fromScale(1, 1), 
        ScrollBarThickness = 0, 
        ScrollingDirection = Enum.ScrollingDirection.Y, 
        [v2.Change.AbsoluteSize] = v21
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v14.Size.Size_600)
        }), 
        UIPadding = v2.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, v14.Size.Size_1200)
        }), 
        RecentSearchTermsWidget = if #v13.suggestedSearchTerms > 0 then v2.createElement(v9, {
            hasQuery = v13.hasQuery, 
            items = v13.suggestedSearchTerms, 
            firstSuggestedItemRef = if v22 == 1 then v13.firstSuggestedItemRef else v17, 
            searchBarRef = v13.searchBarRef, 
            LayoutOrder = v22
        }) else nil, 
        RecentlyViewedSearchItemsWidget = if not (not v24 or v13.hasQuery) and v13.recentlyViewedItems and #v13.recentlyViewedItems > 0 then v2.createElement(v10, {
            items = v13.recentlyViewedItems, 
            firstSuggestedItemRef = if v23 == 1 then v13.firstSuggestedItemRef else v18, 
            nextSelectionDown = if v23 == 1 then v17 else v13.searchBarRef, 
            nextSelectionUp = if v23 == 1 then v13.searchBarRef else v17, 
            itemWidth = v19.itemWidth, 
            itemsPerRow = v19.itemsPerRow, 
            LayoutOrder = v23
        }) else nil
    });
end;