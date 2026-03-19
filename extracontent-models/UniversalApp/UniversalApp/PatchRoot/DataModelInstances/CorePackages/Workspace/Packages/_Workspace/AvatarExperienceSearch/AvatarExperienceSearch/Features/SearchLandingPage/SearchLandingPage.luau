local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v4 = require(l_Parent_0.AXCommon);
local l_useNavigationFocus_0 = require(l_Parent_0.Navigation).useNavigationFocus;
local v6 = require(l_script_FirstAncestor_0.Components.FlexLayout);
local v7 = require(l_script_FirstAncestor_0.Components.SearchBar);
local v8 = require(l_script_FirstAncestor_0.Components.SuggestedItemList);
local v9 = require(l_script_FirstAncestor_0.Components.SearchEmptyState);
local v10 = require(l_script_FirstAncestor_0.Features.SearchLandingPageWidgets.SearchLandingPageWidgets);
local v11 = require(l_script_FirstAncestor_0.Flags.GetFFlagAXRefactorSuggestedItemList);
local l_AXRecentlyViewedSearchItemsIXPTest_0 = v4.Experiments.AXRecentlyViewedSearchItemsIXPTest;
local function v14(v13) --[[ Line: 19 ]] --[[ Name: mapTokens ]]
    -- upvalues: l_AXRecentlyViewedSearchItemsIXPTest_0 (copy)
    return {
        backgroundColor = v13.Semantic.Color.Background.Default.Color3, 
        backgroundTransparency = v13.Semantic.Color.Background.Default.Transparency, 
        itemListPadding = v13.Global.Space_200, 
        searchBarPadding = if l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() then v13.Global.Space_200 else v13.Global.Space_150, 
        emptyStatePadding = v13.Global.Space_500, 
        spaceBetweenSearchAndList = v13.Global.Space_100
    };
end;
return function(v15) --[[ Line: 47 ]] --[[ Name: SearchLandingPage ]]
    -- upvalues: l_useDesignTokens_0 (copy), v14 (copy), l_AXRecentlyViewedSearchItemsIXPTest_0 (copy), l_useNavigationFocus_0 (copy), v2 (copy), v6 (copy), v7 (copy), v11 (copy), v8 (copy), v9 (copy), v10 (copy)
    local v16 = l_useDesignTokens_0(v14);
    if l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() then
        local v17 = l_useNavigationFocus_0();
        local l_v17_0 = v17 --[[ copy: 2 -> 3 ]];
        v2.useEffect(function() --[[ Line: 56 ]]
            -- upvalues: l_v17_0 (copy), v15 (copy)
            if l_v17_0 and v15.searchBarRef and v15.searchBarRef.current then
                v15.searchBarRef.current:CaptureFocus();
            end;
        end, {
            v17
        });
    end;
    local v19 = #v15.suggestedSearchTerms > 0;
    return v2.createElement(v6, {
        BorderSizePixel = 0, 
        BackgroundColor3 = v16.backgroundColor, 
        BackgroundTransparency = v16.backgroundTransparency, 
        Size = UDim2.fromScale(1, 1), 
        AutomaticSize = Enum.AutomaticSize.XY, 
        margin = 0, 
        padding = v15.padding, 
        flexDirection = Enum.FillDirection.Vertical, 
        reverse = true, 
        rigidSlot = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 0
        }, {
            SearchBarFramePadding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v16.searchBarPadding), 
                PaddingBottom = UDim.new(0, v16.searchBarPadding), 
                PaddingLeft = UDim.new(0, v16.searchBarPadding), 
                PaddingRight = UDim.new(0, v16.searchBarPadding)
            }), 
            SearchBar = v2.createElement(v7, {
                showCancelButton = true, 
                autofocus = true, 
                onCancel = v15.onCancelSearch, 
                onClear = v15.onClearSearch, 
                onChange = v15.onChangeSearchQuery, 
                onSubmit = v15.onSubmitSearch, 
                ref = v15.searchBarRef, 
                nextSelectionDown = v15.firstSuggestedItemRef
            })
        }), 
        flexSlot = if not l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() and v19 then v2.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Size = UDim2.fromScale(1, 1), 
            LayoutOrder = 1
        }, {
            Padding = if not v11() then v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v16.itemListPadding), 
                PaddingRight = UDim.new(0, v16.itemListPadding)
            }) else nil, 
            SuggestedItemList = v2.createElement(v8, {
                items = v15.suggestedSearchTerms, 
                firstSuggestedItemRef = v15.firstSuggestedItemRef, 
                nextSelectionUp = v15.searchBarRef, 
                padding = if v11() then {
                    left = v16.itemListPadding, 
                    right = v16.itemListPadding
                } else nil
            })
        }) else if v15.shouldShowEmptyState then v2.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Size = UDim2.fromScale(1, 0)
        }, {
            EmptyStatePadding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v16.emptyStatePadding), 
                PaddingLeft = UDim.new(0, v16.emptyStatePadding), 
                PaddingRight = UDim.new(0, v16.emptyStatePadding)
            }), 
            SearchEmptyState = v2.createElement(v9)
        }) else if l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() then v2.createElement(v10, {
            hasQuery = v15.hasQuery, 
            suggestedSearchTerms = v15.suggestedSearchTerms, 
            recentlyViewedItems = v15.recentlyViewedItems, 
            searchBarRef = v15.searchBarRef, 
            firstSuggestedItemRef = v15.firstSuggestedItemRef
        }) else nil
    });
end;