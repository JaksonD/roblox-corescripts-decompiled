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
local l_FFlagLuaAppEnableChartsPageProfileLink_0 = v17.FFlagLuaAppEnableChartsPageProfileLink;
local l_FFlagLuaAppEnableMorePageProfileLink_0 = v17.FFlagLuaAppEnableMorePageProfileLink;
local l_FFlagEnableBlackbirdCheckDev_0 = v17.FFlagEnableBlackbirdCheckDev;
local v21 = l_getIconSize_0(l_IconSize_1.Small);
local v22 = l_Images_0["icons/status/premium_small"];
local function _(v23, v24) --[[ Line: 41 ]] --[[ Name: applyTokenScaling ]]
    return v23 * v24.Config.UI.Scale;
end;
return function(v26) --[[ Line: 46 ]]
    -- upvalues: l_FFlagEnableBlackbirdCheckDev_0 (copy), l_FFlagLuaAppEnableChartsPageProfileLink_0 (copy), l_FFlagLuaAppEnableMorePageProfileLink_0 (copy), l_useTokens_0 (copy), v21 (copy), l_withStyle_0 (copy), l_GetTextSize_0 (copy), v1 (copy), l_LoadableImage_0 (copy), l_EmojiTextLabel_0 (copy), l_Emoji_0 (copy), l_ImageSetLabel_0 (copy), v22 (copy), l_Icon_0 (copy), l_IconName_0 (copy), l_IconSize_0 (copy)
    local v27 = v26.displayName or "...";
    local l_thumbnail_0 = v26.thumbnail;
    local l_isPremium_0 = v26.isPremium;
    local l_isVerified_0 = v26.isVerified;
    local v31 = if l_FFlagEnableBlackbirdCheckDev_0 then v26.isRobloxSubscriber else nil;
    local l_localUserId_0 = v26.localUserId;
    local function v33() --[[ Line: 53 ]]
        -- upvalues: v26 (copy), l_localUserId_0 (copy), l_FFlagLuaAppEnableChartsPageProfileLink_0 (ref), l_FFlagLuaAppEnableMorePageProfileLink_0 (ref)
        v26.openLuaProfile(l_localUserId_0, {
            profilePeekViewProps = {
                resetPeekView = true, 
                source = if not not l_FFlagLuaAppEnableChartsPageProfileLink_0 or l_FFlagLuaAppEnableMorePageProfileLink_0 then v26.source else nil
            }
        });
    end;
    local v34 = l_useTokens_0();
    local v35 = 36 * v34.Config.UI.Scale;
    local v36 = 8 * v34.Config.UI.Scale;
    local v37 = v21 * v34.Config.UI.Scale;
    local v38 = 4 * v34.Config.UI.Scale;
    local l_Scale_0 = v34.Config.UI.Scale;
    local v40 = math.max(240, 288 / (l_Scale_0 == 0 and 1 or l_Scale_0));
    local v41 = l_isPremium_0 and not l_FFlagEnableBlackbirdCheckDev_0;
    local v42 = l_FFlagEnableBlackbirdCheckDev_0 and v31;
    local v43 = v35 + v36;
    local v44 = if not not v41 or v42 then v37 + v38 else 0;
    return l_withStyle_0(function(v45) --[[ Line: 81 ]]
        -- upvalues: v40 (copy), v43 (copy), v44 (copy), l_GetTextSize_0 (ref), v27 (copy), v35 (copy), l_isVerified_0 (copy), v1 (ref), v33 (copy), l_LoadableImage_0 (ref), l_thumbnail_0 (copy), l_EmojiTextLabel_0 (ref), v43 (copy), l_Emoji_0 (ref), v41 (copy), l_ImageSetLabel_0 (ref), v22 (ref), v37 (copy), v42 (copy), l_Icon_0 (ref), l_IconName_0 (ref), l_IconSize_0 (ref), v34 (copy)
        local l_Font_0 = v45.Font.Header2.Font;
        local v47 = v45.Font.BaseSize * v45.Font.Header2.RelativeSize;
        local l_Color_0 = v45.Theme.TextEmphasis.Color;
        local l_Transparency_0 = v45.Theme.TextEmphasis.Transparency;
        local l_Color_1 = v45.Theme.PlaceHolder.Color;
        local l_Transparency_1 = v45.Theme.PlaceHolder.Transparency;
        local v52 = v40 - v43 - v44;
        local v53 = l_GetTextSize_0(v27, v47, l_Font_0, Vector2.new(v52, v35));
        local v54 = v43 + v53.X + v44 + if l_isVerified_0 then v47 else 0;
        return v1.createElement("TextButton", {
            BackgroundTransparency = 1, 
            Text = "", 
            Size = UDim2.new(0, v54, 0, v35), 
            [v1.Event.Activated] = v33
        }, {
            Thumbnail = v1.createElement(l_LoadableImage_0, {
                BackgroundColor3 = l_Color_1, 
                BackgroundTransparency = l_Transparency_1, 
                Image = l_thumbnail_0, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.fromScale(0, 0.5), 
                Size = UDim2.fromOffset(v35, v35), 
                cornerRadius = UDim.new(0.5, 0), 
                showFailedStateWhenLoadingFailed = true, 
                useShimmerAnimationWhileLoading = true
            }), 
            DisplayName = l_isVerified_0 and v1.createElement(l_EmojiTextLabel_0, {
                Text = v27, 
                TextTransparency = l_Transparency_0, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, v43, 0.5, 0), 
                BackgroundTransparency = 1, 
                fontStyle = v45.Font.Header2, 
                colorStyle = v45.Theme.TextEmphasis, 
                fluidSizing = false, 
                emoji = l_Emoji_0.Verified, 
                maxSize = Vector2.new(v53.X + v47, v53.Y)
            }) or v1.createElement("TextLabel", {
                Text = v27, 
                Font = l_Font_0, 
                TextSize = v47, 
                TextColor3 = l_Color_0, 
                TextTransparency = l_Transparency_0, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, v43, 0.5, 0), 
                Size = UDim2.fromOffset(v53.X, v53.Y), 
                BackgroundTransparency = 1
            }), 
            MembershipIcon = if v41 then v1.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = v22, 
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.fromScale(1, 0.5), 
                Size = UDim2.fromOffset(v37, v37), 
                ImageColor3 = l_Color_0, 
                ImageTransparency = l_Transparency_0
            }) else if v42 then v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.fromScale(1, 0.5), 
                Size = UDim2.fromOffset(v37, v37)
            }, {
                Icon = v1.createElement(l_Icon_0, {
                    name = l_IconName_0.PaperAirplane, 
                    size = l_IconSize_0.Small, 
                    style = v34.Color.Content.Emphasis
                })
            }) else nil
        });
    end);
end;