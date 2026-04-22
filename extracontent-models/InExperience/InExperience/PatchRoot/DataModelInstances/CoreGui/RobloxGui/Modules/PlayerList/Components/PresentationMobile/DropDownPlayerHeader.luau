local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_CorePackages_0.Packages.Foundation);
local v6 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local v7 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local l_useLayoutValues_0 = v7.Common.useLayoutValues;
local l_withStyle_0 = v4.Style.withStyle;
local l_useTokens_0 = v5.Hooks.useTokens;
local l_View_0 = v5.View;
local l_Image_0 = v5.Image;
local l_Text_0 = v5.Text;
local l_Connection_0 = script.Parent.Parent.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local v16 = require(l_CorePackages_0.Workspace.Packages.UserProfiles);
local l_useVerifiedBadge_0 = v16.Hooks.useVerifiedBadge;
local l_EmojiTextLabel_0 = v4.Core.Text.EmojiTextLabel;
local l_Emoji_0 = v4.App.Emoji.Enum.Emoji;
local l_FFlagUseNewPlayerList_0 = v7.Flags.FFlagUseNewPlayerList;
local l_FFlagEnableMobilePlayerListOnConsole_0 = v7.Flags.FFlagEnableMobilePlayerListOnConsole;
local l_FFlagEnableVerifiedBadgeStore_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableVerifiedBadgeStore;
local l_FFlagPlayerListDropDownShowPlatformName_0 = v7.Flags.FFlagPlayerListDropDownShowPlatformName;
local _, l_result_0 = pcall(function() --[[ Line: 36 ]]
    return game:GetService("PlatformFriendsService");
end);
local v26 = v2.PureComponent:extend("DropDownPlayerHeader");
v26.validateProps = v3.strictInterface({
    player = v3.instanceIsA("Player"), 
    transparency = v3.any, 
    contentVisible = v3.boolean, 
    layoutValues = v3.optional(v3.table), 
    tokens = v3.optional(v3.table), 
    showVerifiedBadge = v3.optional(v3.boolean), 
    platformName = v3.optional(v3.string), 
    platformProfileId = v3.optional(v3.string), 
    canShowPlatformProfile = v3.optional(v3.boolean)
});
v26.render = function(v27) --[[ Line: 59 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_withStyle_0 (copy), l_FFlagUseNewPlayerList_0 (copy), l_FFlagEnableVerifiedBadgeStore_0 (copy), v6 (copy), l_FFlagPlayerListDropDownShowPlatformName_0 (copy), v2 (copy), l_EmojiTextLabel_0 (copy), l_Emoji_0 (copy), l_FFlagEnableMobilePlayerListOnConsole_0 (copy), l_View_0 (copy), l_result_0 (copy), l_Image_0 (copy), l_Text_0 (copy)
    return l_WithLayoutValues_0(function(v28) --[[ Line: 60 ]]
        -- upvalues: l_withStyle_0 (ref), l_FFlagUseNewPlayerList_0 (ref), v27 (copy), l_FFlagEnableVerifiedBadgeStore_0 (ref), v6 (ref), l_FFlagPlayerListDropDownShowPlatformName_0 (ref), v2 (ref), l_EmojiTextLabel_0 (ref), l_Emoji_0 (ref), l_FFlagEnableMobilePlayerListOnConsole_0 (ref), l_View_0 (ref), l_result_0 (ref), l_Image_0 (ref), l_Text_0 (ref)
        return l_withStyle_0(function(v29) --[[ Line: 61 ]]
            -- upvalues: v28 (ref), l_FFlagUseNewPlayerList_0 (ref), v27 (ref), l_FFlagEnableVerifiedBadgeStore_0 (ref), v6 (ref), l_FFlagPlayerListDropDownShowPlatformName_0 (ref), v2 (ref), l_EmojiTextLabel_0 (ref), l_Emoji_0 (ref), l_FFlagEnableMobilePlayerListOnConsole_0 (ref), l_View_0 (ref), l_result_0 (ref), l_Image_0 (ref), l_Text_0 (ref)
            v28 = if l_FFlagUseNewPlayerList_0 then v27.props.layoutValues else v28;
            local v30 = if l_FFlagUseNewPlayerList_0 then v27.props.tokens else nil;
            local v31 = if l_FFlagUseNewPlayerList_0 then v30.Size.Size_3000 else 124;
            local v32 = if l_FFlagUseNewPlayerList_0 then v30.Size.Size_500 else 22;
            local l_player_0 = v27.props.player;
            local v34 = if l_FFlagEnableVerifiedBadgeStore_0 then v27.props.showVerifiedBadge else v6.Utils.isPlayerVerified(l_player_0);
            local v35 = if l_FFlagPlayerListDropDownShowPlatformName_0 then v27.props.platformName and v27.props.platformName ~= "" else nil;
            local v36 = if l_FFlagPlayerListDropDownShowPlatformName_0 then v27.props.canShowPlatformProfile else nil;
            return v2.createElement("TextButton", {
                BackgroundTransparency = 1, 
                Text = "", 
                Size = UDim2.new(1, 0, 0, v28.DropDownHeaderSizeY), 
                LayoutOrder = 0, 
                Selectable = false
            }, {
                Background = v2.createElement("ImageLabel", {
                    BackgroundTransparency = 1, 
                    Image = "rbxasset://textures/ui/PlayerList/NewAvatarBackground.png", 
                    ImageTransparency = v27.props.transparency, 
                    Size = UDim2.new(1, 0, 0, v28.DropDownHeaderBackgroundSize), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 1)
                }, {
                    TextContainerFrame = v2.createElement("Frame", {
                        Visible = v27.props.contentVisible, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, -v31, 1, 0), 
                        Position = UDim2.new(0, if l_FFlagUseNewPlayerList_0 then v30.Size.Size_2700 else 107, 0, 0)
                    }, {
                        Layout = v2.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Vertical, 
                            Padding = UDim.new(0, 0), 
                            VerticalAlignment = Enum.VerticalAlignment.Center
                        }), 
                        DisplayName = v34 and v2.createElement(l_EmojiTextLabel_0, {
                            fontStyle = v29.Font.Header2, 
                            colorStyle = v29.Theme.TextEmphasis, 
                            fluidSizing = false, 
                            emoji = l_Emoji_0.Verified, 
                            maxSize = Vector2.new(v28.PlayerDropDownSizeXMobile - v31, v32), 
                            TextSize = if l_FFlagEnableMobilePlayerListOnConsole_0 then v28.DropDownHeaderDisplayNameTextSize else v29.Font.BaseSize * v29.Font.Header2.RelativeSize, 
                            AutomaticSize = if l_FFlagEnableMobilePlayerListOnConsole_0 then Enum.AutomaticSize.X else nil, 
                            LayoutOrder = 1, 
                            Text = l_player_0.DisplayName, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextTruncate = Enum.TextTruncate.AtEnd, 
                            BackgroundTransparency = 1, 
                            TextScaled = not l_FFlagEnableMobilePlayerListOnConsole_0 or nil
                        }) or v2.createElement("TextLabel", {
                            LayoutOrder = 1, 
                            Size = UDim2.new(1, 0, 0, v32), 
                            Text = l_player_0.DisplayName, 
                            Font = v29.Font.Header2.Font, 
                            TextSize = if l_FFlagEnableMobilePlayerListOnConsole_0 then v28.DropDownHeaderDisplayNameTextSize else v29.Font.BaseSize * v29.Font.Header2.RelativeSize, 
                            TextColor3 = v29.Theme.TextEmphasis.Color, 
                            TextTransparency = v29.Theme.TextEmphasis.Transparency, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextTruncate = Enum.TextTruncate.AtEnd, 
                            BackgroundTransparency = 1, 
                            TextScaled = not l_FFlagEnableMobilePlayerListOnConsole_0 or nil
                        }, {
                            SizeConstraint = if l_FFlagEnableMobilePlayerListOnConsole_0 then nil else v2.createElement("UITextSizeConstraint", {
                                MaxTextSize = v29.Font.BaseSize * v29.Font.Header2.RelativeSize, 
                                MinTextSize = v29.Font.BaseSize * v29.Font.Footer.RelativeSize
                            })
                        }), 
                        PlayerName = v2.createElement("TextLabel", {
                            LayoutOrder = 2, 
                            Size = UDim2.new(1, 0, 0, v32), 
                            Text = "@" .. l_player_0.Name, 
                            Font = v29.Font.CaptionHeader.Font, 
                            TextSize = if l_FFlagEnableMobilePlayerListOnConsole_0 then v28.DropDownHeaderPlayerNameTextSize else v29.Font.BaseSize * v29.Font.CaptionHeader.RelativeSize, 
                            TextColor3 = v29.Theme.TextMuted.Color, 
                            TextTransparency = v29.Theme.TextMuted.Transparency, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextTruncate = Enum.TextTruncate.AtEnd, 
                            BackgroundTransparency = 1, 
                            TextScaled = not l_FFlagEnableMobilePlayerListOnConsole_0 or nil
                        }, {
                            SizeConstraint = if l_FFlagEnableMobilePlayerListOnConsole_0 then nil else v2.createElement("UITextSizeConstraint", {
                                MaxTextSize = v29.Font.BaseSize * v29.Font.CaptionHeader.RelativeSize, 
                                MinTextSize = v29.Font.BaseSize * v29.Font.Footer.RelativeSize
                            })
                        }), 
                        PlatformName = l_FFlagPlayerListDropDownShowPlatformName_0 and v35 and v2.createElement(l_View_0, {
                            LayoutOrder = 3, 
                            tag = "row align-y-center gap-xsmall radius-small", 
                            Size = UDim2.new(1, 0, 0, v32), 
                            onActivated = v36 and function() --[[ Line: 168 ]]
                                -- upvalues: v27 (ref), l_result_0 (ref)
                                local l_platformProfileId_0 = v27.props.platformProfileId;
                                if l_result_0 and l_platformProfileId_0 and l_platformProfileId_0 ~= "" then
                                    l_result_0:ShowProfile(l_platformProfileId_0);
                                end;
                            end or nil
                        }, {
                            PlatformIcon = v2.createElement(l_Image_0, {
                                LayoutOrder = 1, 
                                Image = "rbxasset://textures/ui/Shell/Icons/PlatformLogo@3x.png", 
                                tag = "size-400", 
                                imageStyle = {
                                    Color3 = v29.Theme.TextMuted.Color, 
                                    Transparency = v36 and 0 or 0.4
                                }
                            }), 
                            PlatformNameButton = v2.createElement(l_Text_0, {
                                LayoutOrder = 2, 
                                tag = "auto-y fill text-align-x-left text-truncate-end", 
                                Text = v27.props.platformName, 
                                fontStyle = {
                                    Font = v29.Font.CaptionHeader.Font, 
                                    FontSize = v28.DropDownHeaderPlayerNameTextSize
                                }, 
                                textStyle = {
                                    Color3 = v29.Theme.TextMuted.Color, 
                                    Transparency = if v36 then v29.Theme.TextMuted.Transparency else math.clamp(v29.Theme.TextMuted.Transparency + 0.3, 0, 1)
                                }
                            })
                        })
                    })
                }), 
                AvatarImage = v2.createElement("ImageLabel", {
                    Position = UDim2.new(0, if l_FFlagUseNewPlayerList_0 then v30.Size.Size_1400 else 56, 0, 0), 
                    Size = UDim2.new(0, v28.DropDownHeaderSizeY, 0, v28.DropDownHeaderSizeY), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    BackgroundTransparency = 1, 
                    ImageTransparency = v27.props.transparency, 
                    Image = ("rbxthumb://type=AvatarHeadShot&id=%d&w=150&h=150"):format(l_player_0.UserId), 
                    ZIndex = 2
                }), 
                Divider = not v27.props.lastButton and v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 1), 
                    Visible = v27.props.contentVisible, 
                    BackgroundTransparency = v29.Theme.Divider.Transparency, 
                    BackgroundColor3 = v29.Theme.Divider.Color, 
                    BorderSizePixel = 0, 
                    ZIndex = 3
                })
            });
        end);
    end);
end;
local function v47(v38) --[[ Line: 231 ]]
    -- upvalues: l_FFlagUseNewPlayerList_0 (copy), l_useLayoutValues_0 (copy), l_useTokens_0 (copy), l_FFlagEnableVerifiedBadgeStore_0 (copy), l_useVerifiedBadge_0 (copy), l_FFlagPlayerListDropDownShowPlatformName_0 (copy), v16 (copy), l_result_0 (copy), v2 (copy), v26 (copy), v1 (copy)
    local v39 = if l_FFlagUseNewPlayerList_0 then l_useLayoutValues_0() else nil;
    local v40 = if l_FFlagUseNewPlayerList_0 then l_useTokens_0() else nil;
    local v41 = if l_FFlagEnableVerifiedBadgeStore_0 then l_useVerifiedBadge_0(v38.player) else nil;
    local v42 = nil;
    local v43 = nil;
    local v44 = nil;
    if l_FFlagPlayerListDropDownShowPlatformName_0 then
        local v45 = tostring(v38.player.UserId);
        local v46 = v16.Hooks.useUserProfilesFetch({
            userIds = {
                v45
            }, 
            query = v16.Queries.userProfilesDisplayUserPlatformNamesByUserIds
        });
        if v46.data then
            v42 = v16.Selectors.getPlatformNameFromId(v46.data, v45);
            v43 = v16.Selectors.getPlatformProfileIdFromId(v46.data, v45);
        end;
        v44 = game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") and l_result_0 and l_result_0:IsProfileEnabled() and v43 and v43 ~= "";
    end;
    return v2.createElement(v26, v1.Dictionary.join(v38, {
        layoutValues = v39, 
        tokens = v40, 
        showVerifiedBadge = if l_FFlagEnableVerifiedBadgeStore_0 then v41 else nil, 
        platformName = if l_FFlagPlayerListDropDownShowPlatformName_0 then v42 else nil, 
        platformProfileId = if l_FFlagPlayerListDropDownShowPlatformName_0 then v43 else nil, 
        canShowPlatformProfile = if l_FFlagPlayerListDropDownShowPlatformName_0 then v44 else nil
    }));
end;
if l_FFlagUseNewPlayerList_0 then
    return v47;
else
    return v26;
end;