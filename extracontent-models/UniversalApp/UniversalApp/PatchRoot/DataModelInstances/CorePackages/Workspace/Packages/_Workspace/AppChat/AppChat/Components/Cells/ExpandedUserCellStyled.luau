local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.UIBlox);
local v5 = require(l_script_FirstAncestor_0.SocialLibraries);
local v6 = require(script.Parent.PresenceBubbleCell);
local l_TestStyle_0 = v5.Components.TestStyle;
local v8 = {
    Size = UDim2.new(1, 0, 1, 0), 
    avatarCirclePresenceImage = nil, 
    subTitleText = nil, 
    subTitleIcon = nil, 
    titleText = "TestUser", 
    secondaryTitleText = nil, 
    thumbnails = {}, 
    childWidth = 0, 
    style = l_TestStyle_0, 
    showDivider = true, 
    boldTitle = true, 
    shouldMuteTitleColor = false, 
    isLoading = false, 
    hideLeftAvatarPadding = false
};
return v2.memo(function(v9) --[[ Line: 62 ]] --[[ Name: StyledCell ]]
    -- upvalues: v3 (copy), v8 (copy), v2 (copy), v6 (copy)
    local v10 = v3.Dictionary.join(v8, v9);
    local l_style_0 = v10.style;
    local l_Theme_0 = l_style_0.Theme;
    local l_Font_0 = l_style_0.Font;
    local l_FontSize_100_0 = l_style_0.Tokens.Global.FontSize_100;
    local l_FontSize_150_0 = l_style_0.Tokens.Global.FontSize_150;
    local v16 = type(v10.avatarCirclePresenceImage) == "table";
    return v2.createElement(v6, {
        childWidth = v10.childWidth, 
        titleText = v10.titleText, 
        secondaryTitleText = v10.secondaryTitleText, 
        subTitleText = v10.subTitleText, 
        subTitleIcon = v10.subTitleIcon, 
        avatarCirclePresenceImage = v10.avatarCirclePresenceImage, 
        thumbnails = v10.thumbnails, 
        onActivated = v10.onActivated, 
        onCircleActivated = v10.onCircleActivated, 
        Size = v10.Size, 
        isLoading = v10.isLoading, 
        showNewPresenceImage = v16, 
        pillText = v10.pillText, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
        onPressedBackgroundColor3 = l_Theme_0.BackgroundOnPress.Color, 
        onPressedBackgroundTransparency = l_Theme_0.BackgroundOnPress.Transparency, 
        avatarCircleBackgroundColor3 = l_Theme_0.PlaceHolder.Color, 
        avatarCircleDividerColor3 = l_Theme_0.PlaceHolder.Color, 
        avatarCircleCellWidth = 72, 
        avatarCircleSize = 48, 
        avatarCirclePresenceImageColor3 = if v16 then l_Theme_0.OnlineStatus.Color else nil, 
        avatarCirclePresenceImageTransparency = if v16 then l_Theme_0.OnlineStatus.Transparency else nil, 
        subTitleTextFont = l_Font_0.CaptionBody.Font, 
        subTitleTextTransparency = l_Theme_0.TextDefault.Transparency, 
        subTitleTextColor3 = l_Theme_0.TextDefault.Color, 
        subTitleTextSize = l_FontSize_150_0, 
        titleFont = l_Font_0.Header2.Font, 
        titleTextTransparency = if not v10.shouldMuteTitleColor and v10.boldTitle then l_Theme_0.TextEmphasis.Transparency else l_Theme_0.TextDefault.Transparency, 
        titleTextColor3 = if not v10.shouldMuteTitleColor and v10.boldTitle then l_Theme_0.TextEmphasis.Color else l_Theme_0.TextDefault.Color, 
        titleTextSize = l_FontSize_100_0, 
        secondaryTitleFont = l_Font_0.Header2.Font, 
        secondaryTitleTextTransparency = l_Theme_0.TextMuted.Transparency, 
        secondaryTitleTextColor3 = l_Theme_0.TextMuted.Color, 
        secondaryTitleTextSize = l_FontSize_100_0, 
        showDivider = v10.showDivider, 
        dividerTransparency = l_Theme_0.Divider.Transparency, 
        dividerColor3 = l_Theme_0.Divider.Color, 
        hideLeftAvatarPadding = v10.hideLeftAvatarPadding
    }, v10.children or {});
end);