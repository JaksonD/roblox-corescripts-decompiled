local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_LocalizationHelper_0 = require(l_Parent_0.NotificationsCommon).LocalizationHelper;
local l_Debounce_0 = require(l_Parent_0.NotificationsCommon).Debounce;
local v6 = require(l_Parent_0.SharedFlags);
local v7 = require(l_Parent_0.Foundation);
local l_useCursor_0 = v7.Hooks.useCursor;
local l_useTokens_0 = v7.Hooks.useTokens;
local l_GetFFlagEnableFriendsListSearchNormalizationErrorFix_0 = v6.GetFFlagEnableFriendsListSearchNormalizationErrorFix;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_ImageSetButton_0 = v3.Core.ImageSet.ImageSetButton;
local l_Images_0 = v3.App.ImageSet.Images;
local l_getLocalizedStrings_0 = l_LocalizationHelper_0.getLocalizedStrings;
local v16 = require(l_script_FirstAncestor_0.Context.FriendsListContext);
local v17 = require(l_script_FirstAncestor_0.utils.getRenameFriendsToConnectionsEnabledFriendsMenu);
local l_FFlagEnableAppChatFocusableFixes_0 = v6.FFlagEnableAppChatFocusableFixes;
local v19 = l_Images_0["icons/menu/search"];
local v20 = l_Images_0["icons/actions/edit/clear"];
local v21 = 8;
local v22 = 6;
local v23 = 18;
local v24 = 4;
local v25 = 24;
local v26 = 16;
local v27 = v23 + v25 + v24;
local v28 = 4;
local v29 = {
    searchPlaceHolder = v17() and "Feature.FriendsMenu.Label.SearchForConnections" or "Feature.SettingsHub.Label.SearchForFriendsPlaceholder"
};
local function v44(v30, v31) --[[ Line: 52 ]]
    -- upvalues: l_useStyle_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_useTokens_0 (copy), v2 (copy), v16 (copy), l_getLocalizedStrings_0 (copy), v29 (copy), v21 (ref), v22 (ref), v23 (ref), v25 (ref), v24 (ref), v26 (ref), v28 (ref), v27 (ref), l_useCursor_0 (copy), v7 (copy), l_GetFFlagEnableFriendsListSearchNormalizationErrorFix_0 (copy), l_Debounce_0 (copy), l_ImageSetLabel_0 (copy), v19 (copy), l_ImageSetButton_0 (copy), v20 (copy)
    local v32 = l_useStyle_0();
    local v33 = if l_FFlagEnableAppChatFocusableFixes_0 then l_useTokens_0() else nil;
    local v34 = v2.useContext(v16);
    local v35 = l_getLocalizedStrings_0(v29);
    local v36 = v2.useRef(nil);
    if l_FFlagEnableAppChatFocusableFixes_0 and v33 then
        v21 = v33.Size.Size_200;
        v22 = v33.Size.Size_150;
        v23 = v33.Size.Size_400;
        v25 = v33.Size.Size_600;
        v24 = v33.Size.Size_100;
        v26 = v33.FontSize.FontSize_300;
        v28 = v33.Radius.Small;
        v27 = v23 + v25 + v24;
    end;
    local v37 = if l_FFlagEnableAppChatFocusableFixes_0 then l_useCursor_0(v7.Enums.CursorType.RoundedRect) else nil;
    if l_FFlagEnableAppChatFocusableFixes_0 and v31 then
        v36 = v31;
    end;
    local l_searchFriendsString_0 = v34.searchFriendsString;
    local l_searchFriends_0 = v34.searchFriends;
    local v40 = #l_searchFriendsString_0 > 0;
    local v41 = nil;
    v41 = if l_GetFFlagEnableFriendsListSearchNormalizationErrorFix_0() then v2.useCallback(l_Debounce_0(function(v42) --[[ Line: 85 ]]
        -- upvalues: l_searchFriends_0 (copy)
        l_searchFriends_0(v42.Text:lower());
    end, 0.5), {
        l_searchFriends_0
    }) else function(v43) --[[ Line: 93 ]]
        -- upvalues: l_searchFriends_0 (copy)
        l_searchFriends_0(v43.Text);
    end;
    v2.useEffect(function() --[[ Line: 100 ]]
        -- upvalues: v36 (ref), v30 (copy)
        if v36.current and v30.focusElement then
            v36.current:CaptureFocus();
        end;
    end, {
        v36.current
    });
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        AnchorPoint = Vector2.new(0, 0.5), 
        Size = v30.size, 
        LayoutOrder = v30.layoutOrder
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = UDim.new(0, v24)
        }), 
        UIStroke = v2.createElement("UIStroke", {
            Thickness = 1, 
            Color = v32.Theme.UIDefault.Color, 
            Transparency = v32.Theme.UIDefault.Transparency
        }), 
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, v28)
        }), 
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v21), 
            PaddingRight = UDim.new(0, v21), 
            PaddingTop = UDim.new(0, v22), 
            PaddingBottom = UDim.new(0, v22)
        }), 
        SearchIcon = v2.createElement(l_ImageSetLabel_0, {
            LayoutOrder = 0, 
            Size = UDim2.fromOffset(v23, v23), 
            BackgroundTransparency = 1, 
            Image = v19, 
            ImageColor3 = v32.Theme.IconEmphasis.Color, 
            ImageTransparency = v32.Theme.IconEmphasis.Transparency
        }), 
        SearchField = v2.createElement("TextBox", {
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, v27 * -1, 1, 0), 
            ClearTextOnFocus = false, 
            PlaceholderColor3 = v32.Theme.TextDefault.Color, 
            PlaceholderText = v35.searchPlaceHolder, 
            Text = l_searchFriendsString_0, 
            TextColor3 = v32.Theme.TextDefault.Color, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextSize = v26, 
            Font = v32.Font.Body.Font, 
            ref = v36, 
            [v2.Event.Focused] = v30.onFocus, 
            [v2.Change.Text] = v41, 
            SelectionImageObject = if l_FFlagEnableAppChatFocusableFixes_0 then v37 else nil
        }), 
        ClearButton = v40 and v2.createElement(l_ImageSetButton_0, {
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Size = UDim2.new(0, v25, 0, v25), 
            Image = v20, 
            ImageColor3 = v32.Theme.IconEmphasis.Color, 
            ImageTransparency = v32.Theme.IconEmphasis.Transparency, 
            [v2.Event.Activated] = function() --[[ Line: 166 ]]
                -- upvalues: l_searchFriends_0 (copy)
                l_searchFriends_0("");
            end, 
            SelectionImageObject = if l_FFlagEnableAppChatFocusableFixes_0 then v37 else nil
        }) or nil
    });
end;
if l_FFlagEnableAppChatFocusableFixes_0 then
    return (v2.memo(v2.forwardRef(v44)));
else
    return v44;
end;