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
local l_Connection_0 = script.Parent.Parent.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local l_useVerifiedBadge_0 = require(l_CorePackages_0.Workspace.Packages.UserProfiles).Hooks.useVerifiedBadge;
local l_EmojiTextLabel_0 = v4.Core.Text.EmojiTextLabel;
local l_Emoji_0 = v4.App.Emoji.Enum.Emoji;
local l_FFlagUseNewPlayerList_0 = v7.Flags.FFlagUseNewPlayerList;
local l_FFlagEnableMobilePlayerListOnConsole_0 = v7.Flags.FFlagEnableMobilePlayerListOnConsole;
local l_FFlagEnableVerifiedBadgeStore_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableVerifiedBadgeStore;
local v19 = v2.PureComponent:extend("DropDownPlayerHeader");
v19.validateProps = v3.strictInterface({
    player = v3.instanceIsA("Player"), 
    transparency = v3.any, 
    contentVisible = v3.boolean, 
    layoutValues = v3.optional(v3.table), 
    tokens = v3.optional(v3.table), 
    showVerifiedBadge = v3.optional(v3.boolean)
});
v19.render = function(v20) --[[ Line: 48 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_withStyle_0 (copy), l_FFlagUseNewPlayerList_0 (copy), l_FFlagEnableVerifiedBadgeStore_0 (copy), v6 (copy), v2 (copy), l_EmojiTextLabel_0 (copy), l_Emoji_0 (copy), l_FFlagEnableMobilePlayerListOnConsole_0 (copy)
    return l_WithLayoutValues_0(function(v21) --[[ Line: 49 ]]
        -- upvalues: l_withStyle_0 (ref), l_FFlagUseNewPlayerList_0 (ref), v20 (copy), l_FFlagEnableVerifiedBadgeStore_0 (ref), v6 (ref), v2 (ref), l_EmojiTextLabel_0 (ref), l_Emoji_0 (ref), l_FFlagEnableMobilePlayerListOnConsole_0 (ref)
        return l_withStyle_0(function(v22) --[[ Line: 50 ]]
            -- upvalues: v21 (ref), l_FFlagUseNewPlayerList_0 (ref), v20 (ref), l_FFlagEnableVerifiedBadgeStore_0 (ref), v6 (ref), v2 (ref), l_EmojiTextLabel_0 (ref), l_Emoji_0 (ref), l_FFlagEnableMobilePlayerListOnConsole_0 (ref)
            v21 = if l_FFlagUseNewPlayerList_0 then v20.props.layoutValues else v21;
            local v23 = if l_FFlagUseNewPlayerList_0 then v20.props.tokens else nil;
            local v24 = if l_FFlagUseNewPlayerList_0 then v23.Size.Size_3000 else 124;
            local v25 = if l_FFlagUseNewPlayerList_0 then v23.Size.Size_500 else 22;
            local l_player_0 = v20.props.player;
            local v27 = if l_FFlagEnableVerifiedBadgeStore_0 then v20.props.showVerifiedBadge else v6.Utils.isPlayerVerified(l_player_0);
            return v2.createElement("TextButton", {
                BackgroundTransparency = 1, 
                Text = "", 
                Size = UDim2.new(1, 0, 0, v21.DropDownHeaderSizeY), 
                LayoutOrder = 0, 
                Selectable = false
            }, {
                Background = v2.createElement("ImageLabel", {
                    BackgroundTransparency = 1, 
                    Image = "rbxasset://textures/ui/PlayerList/NewAvatarBackground.png", 
                    ImageTransparency = v20.props.transparency, 
                    Size = UDim2.new(1, 0, 0, v21.DropDownHeaderBackgroundSize), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 1)
                }, {
                    TextContainerFrame = v2.createElement("Frame", {
                        Visible = v20.props.contentVisible, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, -v24, 1, 0), 
                        Position = UDim2.new(0, if l_FFlagUseNewPlayerList_0 then v23.Size.Size_2700 else 107, 0, 0)
                    }, {
                        Layout = v2.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Vertical, 
                            Padding = UDim.new(0, 0), 
                            VerticalAlignment = Enum.VerticalAlignment.Center
                        }), 
                        DisplayName = v27 and v2.createElement(l_EmojiTextLabel_0, {
                            fontStyle = v22.Font.Header2, 
                            colorStyle = v22.Theme.TextEmphasis, 
                            fluidSizing = false, 
                            emoji = l_Emoji_0.Verified, 
                            maxSize = Vector2.new(v21.PlayerDropDownSizeXMobile - v24, v25), 
                            TextSize = if l_FFlagEnableMobilePlayerListOnConsole_0 then v21.DropDownHeaderDisplayNameTextSize else v22.Font.BaseSize * v22.Font.Header2.RelativeSize, 
                            AutomaticSize = if l_FFlagEnableMobilePlayerListOnConsole_0 then Enum.AutomaticSize.X else nil, 
                            LayoutOrder = 1, 
                            Text = l_player_0.DisplayName, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextTruncate = Enum.TextTruncate.AtEnd, 
                            BackgroundTransparency = 1, 
                            TextScaled = not l_FFlagEnableMobilePlayerListOnConsole_0 or nil
                        }) or v2.createElement("TextLabel", {
                            LayoutOrder = 1, 
                            Size = UDim2.new(1, 0, 0, v25), 
                            Text = l_player_0.DisplayName, 
                            Font = v22.Font.Header2.Font, 
                            TextSize = if l_FFlagEnableMobilePlayerListOnConsole_0 then v21.DropDownHeaderDisplayNameTextSize else v22.Font.BaseSize * v22.Font.Header2.RelativeSize, 
                            TextColor3 = v22.Theme.TextEmphasis.Color, 
                            TextTransparency = v22.Theme.TextEmphasis.Transparency, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextTruncate = Enum.TextTruncate.AtEnd, 
                            BackgroundTransparency = 1, 
                            TextScaled = not l_FFlagEnableMobilePlayerListOnConsole_0 or nil
                        }, {
                            SizeConstraint = if l_FFlagEnableMobilePlayerListOnConsole_0 then nil else v2.createElement("UITextSizeConstraint", {
                                MaxTextSize = v22.Font.BaseSize * v22.Font.Header2.RelativeSize, 
                                MinTextSize = v22.Font.BaseSize * v22.Font.Footer.RelativeSize
                            })
                        }), 
                        PlayerName = v2.createElement("TextLabel", {
                            LayoutOrder = 2, 
                            Size = UDim2.new(1, 0, 0, v25), 
                            Text = "@" .. l_player_0.Name, 
                            Font = v22.Font.CaptionHeader.Font, 
                            TextSize = if l_FFlagEnableMobilePlayerListOnConsole_0 then v21.DropDownHeaderPlayerNameTextSize else v22.Font.BaseSize * v22.Font.CaptionHeader.RelativeSize, 
                            TextColor3 = v22.Theme.TextMuted.Color, 
                            TextTransparency = v22.Theme.TextMuted.Transparency, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextTruncate = Enum.TextTruncate.AtEnd, 
                            BackgroundTransparency = 1, 
                            TextScaled = not l_FFlagEnableMobilePlayerListOnConsole_0 or nil
                        }, {
                            SizeConstraint = if l_FFlagEnableMobilePlayerListOnConsole_0 then nil else v2.createElement("UITextSizeConstraint", {
                                MaxTextSize = v22.Font.BaseSize * v22.Font.CaptionHeader.RelativeSize, 
                                MinTextSize = v22.Font.BaseSize * v22.Font.Footer.RelativeSize
                            })
                        })
                    })
                }), 
                AvatarImage = v2.createElement("ImageLabel", {
                    Position = UDim2.new(0, if l_FFlagUseNewPlayerList_0 then v23.Size.Size_1400 else 56, 0, 0), 
                    Size = UDim2.new(0, v21.DropDownHeaderSizeY, 0, v21.DropDownHeaderSizeY), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    BackgroundTransparency = 1, 
                    ImageTransparency = v20.props.transparency, 
                    Image = ("rbxthumb://type=AvatarHeadShot&id=%d&w=150&h=150"):format(l_player_0.UserId), 
                    ZIndex = 2
                }), 
                Divider = not v20.props.lastButton and v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 1), 
                    Visible = v20.props.contentVisible, 
                    BackgroundTransparency = v22.Theme.Divider.Transparency, 
                    BackgroundColor3 = v22.Theme.Divider.Color, 
                    BorderSizePixel = 0, 
                    ZIndex = 3
                })
            });
        end);
    end);
end;
local function v32(v28) --[[ Line: 172 ]]
    -- upvalues: l_FFlagUseNewPlayerList_0 (copy), l_useLayoutValues_0 (copy), l_useTokens_0 (copy), l_FFlagEnableVerifiedBadgeStore_0 (copy), l_useVerifiedBadge_0 (copy), v2 (copy), v19 (copy), v1 (copy)
    local v29 = if l_FFlagUseNewPlayerList_0 then l_useLayoutValues_0() else nil;
    local v30 = if l_FFlagUseNewPlayerList_0 then l_useTokens_0() else nil;
    local v31 = if l_FFlagEnableVerifiedBadgeStore_0 then l_useVerifiedBadge_0(v28.player) else nil;
    return v2.createElement(v19, v1.Dictionary.join(v28, {
        layoutValues = v29, 
        tokens = v30, 
        showVerifiedBadge = if l_FFlagEnableVerifiedBadgeStore_0 then v31 else nil
    }));
end;
if l_FFlagUseNewPlayerList_0 then
    return v32;
else
    return v19;
end;