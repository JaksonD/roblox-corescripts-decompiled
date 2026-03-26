local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.UIBlox);
local v5 = require(l_script_FirstAncestor_0.SocialLibraries);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v7 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableDomLocators);
local v8 = require(script.Parent.PresenceBubbleCell);
local l_TestStyle_0 = v5.Components.TestStyle;
local v10 = {
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
return v2.memo(function(v11) --[[ Line: 73 ]] --[[ Name: StyledCell ]]
    -- upvalues: l_useTokens_0 (copy), v3 (copy), v10 (copy), v2 (copy), v8 (copy), v7 (copy)
    local v12 = l_useTokens_0();
    local v13 = v3.Dictionary.join(v10, v11);
    local l_style_0 = v13.style;
    local l_Theme_0 = l_style_0.Theme;
    local l_Font_0 = l_style_0.Font;
    local v17 = type(v13.avatarCirclePresenceImage) == "table";
    return v2.createElement(v8, {
        childWidth = v13.childWidth, 
        titleText = v13.titleText, 
        secondaryTitleText = v13.secondaryTitleText, 
        subTitleText = v13.subTitleText, 
        subTitleIcon = v13.subTitleIcon, 
        testId = if v7 then v13.testId else nil, 
        avatarCirclePresenceImage = v13.avatarCirclePresenceImage, 
        thumbnails = v13.thumbnails, 
        onActivated = v13.onActivated, 
        onCircleActivated = v13.onCircleActivated, 
        Size = v13.Size, 
        isLoading = v13.isLoading, 
        showNewPresenceImage = v17, 
        conversationId = v13.conversationId, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = l_style_0.Tokens.Global.Color.None.Transparency, 
        onPressedBackgroundColor3 = l_Theme_0.BackgroundOnPress.Color, 
        onPressedBackgroundTransparency = l_Theme_0.BackgroundOnPress.Transparency, 
        avatarCircleBackgroundColor3 = l_Theme_0.PlaceHolder.Color, 
        avatarCircleDividerColor3 = l_Theme_0.PlaceHolder.Color, 
        avatarCirclePresenceImageColor3 = if v17 then l_Theme_0.OnlineStatus.Color else nil, 
        avatarCirclePresenceImageTransparency = if v17 then l_Theme_0.OnlineStatus.Transparency else nil, 
        subTitleTextFont = l_Font_0.CaptionBody.Font, 
        subTitleTextTransparency = l_Theme_0.TextDefault.Transparency, 
        subTitleTextColor3 = l_Theme_0.TextDefault.Color, 
        subTitleTextSize = l_Font_0.CaptionBody.RelativeSize * l_Font_0.BaseSize, 
        subTitleIconColor3 = l_style_0.Theme.IconDefault.Color, 
        subTitleIconTransparency = l_style_0.Theme.IconDefault.Transparency, 
        titleFont = l_Font_0.Header2.Font, 
        titleTextTransparency = if not v13.boldTitle then l_Theme_0.TextDefault.Transparency else l_Theme_0.TextEmphasis.Transparency, 
        titleTextColor3 = if not v13.boldTitle then l_Theme_0.TextDefault.Color else l_Theme_0.TextEmphasis.Color, 
        titleTextSize = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize, 
        secondaryTitleFont = l_Font_0.Header2.Font, 
        secondaryTitleTextTransparency = l_Theme_0.TextMuted.Transparency, 
        secondaryTitleTextColor3 = l_Theme_0.TextMuted.Color, 
        secondaryTitleTextSize = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize, 
        showDivider = v13.showDivider, 
        dividerTransparency = l_Theme_0.Divider.Transparency, 
        dividerColor3 = l_Theme_0.Divider.Color, 
        avatarCircleSize = v12.Size.Size_1000, 
        avatarCircleCellWidth = v12.Size.Size_1200, 
        hideLeftAvatarPadding = v13.hideLeftAvatarPadding, 
        paddingLeft = v13.paddingLeft, 
        paddingRight = v13.paddingRight, 
        isRobloxSubscriber = v13.isRobloxSubscriber
    }, v13.children or {});
end);