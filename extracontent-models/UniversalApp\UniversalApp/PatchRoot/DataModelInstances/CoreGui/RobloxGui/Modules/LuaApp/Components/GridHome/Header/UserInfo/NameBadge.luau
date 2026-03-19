local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local v3 = require(l_CorePackages_0.Packages.Foundation);
local l_useTokens_0 = v3.Hooks.useTokens;
local l_Icon_0 = v3.Icon;
local l_IconSize_0 = v3.Enums.IconSize;
local l_IconName_0 = v3.Enums.IconName;
local l_Emoji_0 = v2.App.Emoji.Enum.Emoji;
local l_EmojiTextLabel_0 = v2.Core.Text.EmojiTextLabel;
local l_getIconSize_0 = v2.App.ImageSet.getIconSize;
local l_IconSize_1 = v2.App.ImageSet.Enum.IconSize;
local l_Images_0 = v2.App.ImageSet.Images;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_LoadableImage_0 = v2.App.Loading.LoadableImage;
local l_withStyle_0 = v2.Core.Style.withStyle;
local l_GetTextSize_0 = require(l_CorePackages_0.Workspace.Packages.Style).GetTextSize;
local v17 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagLuaAppFixTopBarNameBadgeScaling_0 = v17.FFlagLuaAppFixTopBarNameBadgeScaling;
local l_FFlagLuaAppEnableChartsPageProfileLink_0 = v17.FFlagLuaAppEnableChartsPageProfileLink;
local l_FFlagLuaAppEnableMorePageProfileLink_0 = v17.FFlagLuaAppEnableMorePageProfileLink;
local l_FFlagEnableBlackbirdCheckDev_0 = v17.FFlagEnableBlackbirdCheckDev;
local v22 = l_getIconSize_0(l_IconSize_1.Small);
local v23 = l_Images_0["icons/status/premium_small"];
local function _(v24, v25) --[[ Line: 42 ]] --[[ Name: applyTokenScaling ]]
    return v24 * v25.Config.UI.Scale;
end;
return function(v27) --[[ Line: 47 ]]
    -- upvalues: l_FFlagEnableBlackbirdCheckDev_0 (copy), l_FFlagLuaAppEnableChartsPageProfileLink_0 (copy), l_FFlagLuaAppEnableMorePageProfileLink_0 (copy), l_FFlagLuaAppFixTopBarNameBadgeScaling_0 (copy), l_useTokens_0 (copy), v22 (copy), l_withStyle_0 (copy), l_GetTextSize_0 (copy), v1 (copy), l_LoadableImage_0 (copy), l_EmojiTextLabel_0 (copy), l_Emoji_0 (copy), l_ImageSetLabel_0 (copy), v23 (copy), l_Icon_0 (copy), l_IconName_0 (copy), l_IconSize_0 (copy)
    local v28 = v27.displayName or "...";
    local l_thumbnail_0 = v27.thumbnail;
    local l_isPremium_0 = v27.isPremium;
    local l_isVerified_0 = v27.isVerified;
    local v32 = if l_FFlagEnableBlackbirdCheckDev_0 then v27.isRobloxSubscriber else nil;
    local l_localUserId_0 = v27.localUserId;
    local function v34() --[[ Line: 54 ]]
        -- upvalues: v27 (copy), l_localUserId_0 (copy), l_FFlagLuaAppEnableChartsPageProfileLink_0 (ref), l_FFlagLuaAppEnableMorePageProfileLink_0 (ref)
        v27.openLuaProfile(l_localUserId_0, {
            profilePeekViewProps = {
                resetPeekView = true, 
                source = if not not l_FFlagLuaAppEnableChartsPageProfileLink_0 or l_FFlagLuaAppEnableMorePageProfileLink_0 then v27.source else nil
            }
        });
    end;
    local v35 = nil;
    local v36 = nil;
    local v37 = nil;
    local v38 = nil;
    local v39 = nil;
    local v40 = nil;
    if l_FFlagLuaAppFixTopBarNameBadgeScaling_0 or l_FFlagEnableBlackbirdCheckDev_0 then
        v35 = l_useTokens_0();
    end;
    if l_FFlagLuaAppFixTopBarNameBadgeScaling_0 then
        v36 = 36 * v35.Config.UI.Scale;
        v37 = 8 * v35.Config.UI.Scale;
        v38 = v22 * v35.Config.UI.Scale;
        v39 = 4 * v35.Config.UI.Scale;
        local l_Scale_0 = v35.Config.UI.Scale;
        v40 = math.max(240, 288 / (l_Scale_0 == 0 and 1 or l_Scale_0));
    else
        v36 = 36;
        v37 = 8;
        v38 = v22;
        v39 = 4;
        v40 = 288;
    end;
    local v42 = l_isPremium_0 and not l_FFlagEnableBlackbirdCheckDev_0;
    local v43 = l_FFlagEnableBlackbirdCheckDev_0 and v32;
    local v44 = v36 + v37;
    local v45 = if not not v42 or v43 then v38 + v39 else 0;
    return l_withStyle_0(function(v46) --[[ Line: 96 ]]
        -- upvalues: v40 (ref), v44 (copy), v45 (copy), l_GetTextSize_0 (ref), v28 (copy), v36 (ref), l_isVerified_0 (copy), v1 (ref), v34 (copy), l_LoadableImage_0 (ref), l_thumbnail_0 (copy), l_EmojiTextLabel_0 (ref), v44 (copy), l_Emoji_0 (ref), v42 (copy), l_ImageSetLabel_0 (ref), v23 (ref), v38 (ref), v43 (copy), l_Icon_0 (ref), l_IconName_0 (ref), l_IconSize_0 (ref), v35 (ref)
        local l_Font_0 = v46.Font.Header2.Font;
        local v48 = v46.Font.BaseSize * v46.Font.Header2.RelativeSize;
        local l_Color_0 = v46.Theme.TextEmphasis.Color;
        local l_Transparency_0 = v46.Theme.TextEmphasis.Transparency;
        local l_Color_1 = v46.Theme.PlaceHolder.Color;
        local l_Transparency_1 = v46.Theme.PlaceHolder.Transparency;
        local v53 = v40 - v44 - v45;
        local v54 = l_GetTextSize_0(v28, v48, l_Font_0, Vector2.new(v53, v36));
        local v55 = v44 + v54.X + v45 + if l_isVerified_0 then v48 else 0;
        return v1.createElement("TextButton", {
            BackgroundTransparency = 1, 
            Text = "", 
            Size = UDim2.new(0, v55, 0, v36), 
            [v1.Event.Activated] = v34
        }, {
            Thumbnail = v1.createElement(l_LoadableImage_0, {
                BackgroundColor3 = l_Color_1, 
                BackgroundTransparency = l_Transparency_1, 
                Image = l_thumbnail_0, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.fromScale(0, 0.5), 
                Size = UDim2.fromOffset(v36, v36), 
                cornerRadius = UDim.new(0.5, 0), 
                showFailedStateWhenLoadingFailed = true, 
                useShimmerAnimationWhileLoading = true
            }), 
            DisplayName = l_isVerified_0 and v1.createElement(l_EmojiTextLabel_0, {
                Text = v28, 
                TextTransparency = l_Transparency_0, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, v44, 0.5, 0), 
                BackgroundTransparency = 1, 
                fontStyle = v46.Font.Header2, 
                colorStyle = v46.Theme.TextEmphasis, 
                fluidSizing = false, 
                emoji = l_Emoji_0.Verified, 
                maxSize = Vector2.new(v54.X + v48, v54.Y)
            }) or v1.createElement("TextLabel", {
                Text = v28, 
                Font = l_Font_0, 
                TextSize = v48, 
                TextColor3 = l_Color_0, 
                TextTransparency = l_Transparency_0, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, v44, 0.5, 0), 
                Size = UDim2.fromOffset(v54.X, v54.Y), 
                BackgroundTransparency = 1
            }), 
            MembershipIcon = if v42 then v1.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = v23, 
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.fromScale(1, 0.5), 
                Size = UDim2.fromOffset(v38, v38), 
                ImageColor3 = l_Color_0, 
                ImageTransparency = l_Transparency_0
            }) else if v43 then v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.fromScale(1, 0.5), 
                Size = UDim2.fromOffset(v38, v38)
            }, {
                Icon = v1.createElement(l_Icon_0, {
                    name = l_IconName_0.PaperAirplane, 
                    size = l_IconSize_0.Small, 
                    style = v35.Color.Content.Emphasis
                })
            }) else nil
        });
    end);
end;