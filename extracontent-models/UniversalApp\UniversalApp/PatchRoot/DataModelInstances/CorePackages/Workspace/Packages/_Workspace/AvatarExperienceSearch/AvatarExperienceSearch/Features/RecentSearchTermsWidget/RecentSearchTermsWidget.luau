local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v5 = require(l_Parent_0.AvatarExperienceUIKit);
local l_WidgetHeader_0 = v5.WidgetComponents.WidgetHeader;
local l_WidgetLayout_0 = v5.WidgetComponents.WidgetLayout;
local v8 = require(l_script_FirstAncestor_0.Components.SuggestedItemList);
local v9 = {
    widgetTitle = "Feature.Avatar.Label.SearchLandingPage.Title.RecentSearches"
};
return function(v10) --[[ Line: 26 ]] --[[ Name: RecentSearchTermsWidget ]]
    -- upvalues: l_useTokens_0 (copy), l_useLocalization_0 (copy), v9 (copy), v2 (copy), l_WidgetLayout_0 (copy), l_WidgetHeader_0 (copy), v8 (copy)
    local v11 = l_useTokens_0();
    local v12 = l_useLocalization_0(v9);
    return v2.createElement(l_WidgetLayout_0, {
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.fromScale(1, 1), 
        LayoutOrder = v10.LayoutOrder, 
        padding = {
            left = UDim.new(0, v11.Size.Size_400), 
            right = UDim.new(0, v11.Size.Size_400)
        }, 
        headerSlot = if v10.hasQuery then nil else v2.createElement(l_WidgetHeader_0, {
            titleText = v12.widgetTitle
        }), 
        contentSlot = v2.createElement(v8, {
            items = v10.items, 
            firstSuggestedItemRef = v10.firstSuggestedItemRef, 
            disableScroll = true
        })
    });
end;