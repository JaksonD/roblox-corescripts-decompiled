local v0 = {
    SEARCH_MARGIN = 24, 
    SEARCH_BAR_HEIGHT = 28, 
    SEARCH_BAR_PADDING = 12, 
    SEARCH_BAR_TEXT_SIZE = 20, 
    SEARCH_BAR_ICON_PADDING = 9, 
    SEARCH_BAR_TEXT_PADDING_WITH_ICON = 36, 
    SEARCH_BAR_TEXT_PADDING_WITHOUT_ICON = 12, 
    CLEAR_IMAGE_SIZE = 16, 
    CLEAR_IMAGE_PADDING = 6, 
    CANCEL_BUTTON_WIDTH = 88, 
    CANCEL_BUTTON_PADDING = 7, 
    TABLET_LIST_PICKER_HEIGHT = 540, 
    SHADOW_BOLDNESS = 14, 
    SHADOW_TOP_OFFSET = 5, 
    SHADOW_BOTTOM_OFFSET = 12, 
    OverlayContentPageType = {
        LandingPage = "LandingPage", 
        AutocompleteSuggestions = "AutocompleteSuggestions", 
        NoResults = "NoResults"
    }, 
    SearchBarAnimationStyle = {
        ExpandFromRight = "ExpandFromRight", 
        ExpandFromCenter = "ExpandFromCenter"
    }, 
    NON_COMPACT_SEARCH_BAR_SIZE = 400
};
local function _(v1, v2) --[[ Line: 37 ]] --[[ Name: scaleSizeForPlatform ]]
    return v1 * v2.Global.Stroke_100;
end;
v0.getSearchTokens = function(v4) --[[ Line: 41 ]]
    return {
        searchMargin = v4.Global.Size_300, 
        backgroundContainer = {
            screenWidthScale = 0.625, 
            minimumWidth = 712 * v4.Global.Stroke_100, 
            maximumWidth = 1500 * v4.Global.Stroke_100, 
            padding = v4.Global.Size_600, 
            backgroundColor3 = v4.Semantic.Color.Background.Default.Color3, 
            backgroundTransparency = v4.Semantic.Color.Background.Default.Transparency, 
            shadowBoldness = v4.Global.Size_175, 
            shadowTopOffset = 5 * v4.Global.Stroke_100, 
            shadowBottomOffset = v4.Global.Size_150
        }, 
        searchLandingPage = {
            topPadding = v4.Global.Size_300, 
            bottomPadding = 38 * v4.Global.Stroke_100, 
            itemPadding = v4.Global.Size_600, 
            trendingSearches = {
                pillTextSize = v4.Global.Size_250, 
                pillVerticalPadding = v4.Global.Size_100, 
                pillHorizontalPadding = v4.Global.Size_200, 
                pillFont = v4.Semantic.Typography.Body.Font, 
                pillTextColor = v4.Semantic.Color.Text.Emphasis.Color3, 
                pillBackgroundColor = v4.Semantic.Color.Background.OnHover.Color3, 
                pillBackgroundTransparency = v4.Semantic.Color.Background.OnHover.Transparency, 
                columnGap = v4.Global.Size_125
            }
        }, 
        searchBarListPicker = {
            height = 540
        }
    };
end;
return v0;