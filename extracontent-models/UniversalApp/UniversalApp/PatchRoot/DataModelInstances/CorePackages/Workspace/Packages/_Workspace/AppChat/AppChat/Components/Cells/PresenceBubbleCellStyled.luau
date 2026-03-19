local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.UIBlox);
local v5 = require(l_script_FirstAncestor_0.SocialLibraries);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local l_FFlagAppChatEnableHandheldScalingFixes_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableHandheldScalingFixes;
local v8 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableDomLocators);
local v9 = require(script.Parent.PresenceBubbleCell);
local l_TestStyle_0 = v5.Components.TestStyle;
local v11 = {
    Size = UDim2.new(1, 0, 1, 0), 
    avatarCirclePresenceImage = nil, 
    subTitleText = nil, 
    subTitleIcon = nil, 
    titleText = "TestUser", 
    secondaryTitleText = nil, 
    thumbnails = {}, 
    conversationId = nil, 
    childWidth = 0, 
    style = v3.Dictionary.join(l_TestStyle_0, {
        Tokens = {
            Global = {
                Color = {
                    None = {}
                }
            }
        }
    }), 
    showDivider = true, 
    boldTitle = true, 
    isLoading = false, 
    hideLeftAvatarPadding = false, 
    paddingLeft = 0, 
    paddingRight = 0
};
return v2.memo(function(v12) --[[ Line: 73 ]] --[[ Name: StyledCell ]]
    -- upvalues: l_useTokens_0 (copy), v3 (copy), v11 (copy), v2 (copy), v9 (copy), v8 (copy), l_FFlagAppChatEnableHandheldScalingFixes_0 (copy)
    local v13 = l_useTokens_0();
    local v14 = v3.Dictionary.join(v11, v12);
    local l_style_0 = v14.style;
    local l_Theme_0 = l_style_0.Theme;
    local l_Font_0 = l_style_0.Font;
    local v18 = type(v14.avatarCirclePresenceImage) == "table";
    return v2.createElement(v9, {
        childWidth = v14.childWidth, 
        titleText = v14.titleText, 
        secondaryTitleText = v14.secondaryTitleText, 
        subTitleText = v14.subTitleText, 
        subTitleIcon = v14.subTitleIcon, 
        testId = if v8 then v14.testId else nil, 
        avatarCirclePresenceImage = v14.avatarCirclePresenceImage, 
        thumbnails = v14.thumbnails, 
        onActivated = v14.onActivated, 
        onCircleActivated = v14.onCircleActivated, 
        Size = v14.Size, 
        isLoading = v14.isLoading, 
        showNewPresenceImage = v18, 
        conversationId = v14.conversationId, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = l_style_0.Tokens.Global.Color.None.Transparency, 
        onPressedBackgroundColor3 = l_Theme_0.BackgroundOnPress.Color, 
        onPressedBackgroundTransparency = l_Theme_0.BackgroundOnPress.Transparency, 
        avatarCircleBackgroundColor3 = l_Theme_0.PlaceHolder.Color, 
        avatarCircleDividerColor3 = l_Theme_0.PlaceHolder.Color, 
        avatarCirclePresenceImageColor3 = if v18 then l_Theme_0.OnlineStatus.Color else nil, 
        avatarCirclePresenceImageTransparency = if v18 then l_Theme_0.OnlineStatus.Transparency else nil, 
        subTitleTextFont = l_Font_0.CaptionBody.Font, 
        subTitleTextTransparency = l_Theme_0.TextDefault.Transparency, 
        subTitleTextColor3 = l_Theme_0.TextDefault.Color, 
        subTitleTextSize = l_Font_0.CaptionBody.RelativeSize * l_Font_0.BaseSize, 
        subTitleIconColor3 = l_style_0.Theme.IconDefault.Color, 
        subTitleIconTransparency = l_style_0.Theme.IconDefault.Transparency, 
        titleFont = l_Font_0.Header2.Font, 
        titleTextTransparency = if not v14.boldTitle then l_Theme_0.TextDefault.Transparency else l_Theme_0.TextEmphasis.Transparency, 
        titleTextColor3 = if not v14.boldTitle then l_Theme_0.TextDefault.Color else l_Theme_0.TextEmphasis.Color, 
        titleTextSize = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize, 
        secondaryTitleFont = l_Font_0.Header2.Font, 
        secondaryTitleTextTransparency = l_Theme_0.TextMuted.Transparency, 
        secondaryTitleTextColor3 = l_Theme_0.TextMuted.Color, 
        secondaryTitleTextSize = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize, 
        showDivider = v14.showDivider, 
        dividerTransparency = l_Theme_0.Divider.Transparency, 
        dividerColor3 = l_Theme_0.Divider.Color, 
        avatarCircleSize = if l_FFlagAppChatEnableHandheldScalingFixes_0 then v13.Size.Size_1000 else nil, 
        avatarCircleCellWidth = if l_FFlagAppChatEnableHandheldScalingFixes_0 then v13.Size.Size_1200 else v14.hideLeftAvatarPadding and 48 or nil, 
        hideLeftAvatarPadding = v14.hideLeftAvatarPadding, 
        paddingLeft = v14.paddingLeft, 
        paddingRight = v14.paddingRight
    }, v14.children or {});
end);