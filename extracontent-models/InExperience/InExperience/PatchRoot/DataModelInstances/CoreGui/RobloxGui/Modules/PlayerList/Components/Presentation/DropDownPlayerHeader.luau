local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local l_withStyle_0 = v3.Style.withStyle;
local l_Connection_0 = script.Parent.Parent.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local l_useVerifiedBadge_0 = require(l_CorePackages_0.Workspace.Packages.UserProfiles).Hooks.useVerifiedBadge;
local l_FFlagEnableVerifiedBadgeStore_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableVerifiedBadgeStore;
local l_EmojiTextLabel_0 = v3.Core.Text.EmojiTextLabel;
local l_Emoji_0 = v3.App.Emoji.Enum.Emoji;
local v13 = v1.PureComponent:extend("DropDownPlayerHeader");
v13.validateProps = v2.strictInterface({
    player = v2.instanceIsA("Player"), 
    showVerifiedBadge = v2.optional(v2.boolean)
});
v13.render = function(v14) --[[ Line: 37 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_withStyle_0 (copy), l_FFlagEnableVerifiedBadgeStore_0 (copy), v4 (copy), v1 (copy), l_EmojiTextLabel_0 (copy), l_Emoji_0 (copy)
    return l_WithLayoutValues_0(function(v15) --[[ Line: 38 ]]
        -- upvalues: l_withStyle_0 (ref), v14 (copy), l_FFlagEnableVerifiedBadgeStore_0 (ref), v4 (ref), v1 (ref), l_EmojiTextLabel_0 (ref), l_Emoji_0 (ref)
        return l_withStyle_0(function(v16) --[[ Line: 39 ]]
            -- upvalues: v14 (ref), l_FFlagEnableVerifiedBadgeStore_0 (ref), v4 (ref), v1 (ref), v15 (copy), l_EmojiTextLabel_0 (ref), l_Emoji_0 (ref)
            local l_player_0 = v14.props.player;
            local v18 = if l_FFlagEnableVerifiedBadgeStore_0 then v14.props.showVerifiedBadge else v4.Utils.isPlayerVerified(l_player_0);
            return v1.createElement("TextButton", {
                BackgroundTransparency = 1, 
                Text = "", 
                Size = UDim2.new(1, 0, 0, v15.DropDownHeaderSizeY), 
                LayoutOrder = 0, 
                Selectable = false
            }, {
                Background = v1.createElement("ImageLabel", {
                    BackgroundTransparency = 1, 
                    Image = "rbxasset://textures/ui/PlayerList/NewAvatarBackground.png", 
                    ImageTransparency = 0, 
                    Size = UDim2.new(1, 0, 0, v15.DropDownHeaderBackgroundSize), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 1)
                }, {
                    TextContainerFrame = v1.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, -124, 1, 0), 
                        Position = UDim2.new(0, 107, 0, 0)
                    }, {
                        Layout = v1.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Vertical, 
                            Padding = UDim.new(0, 0), 
                            VerticalAlignment = Enum.VerticalAlignment.Center
                        }), 
                        DisplayName = v18 and v1.createElement(l_EmojiTextLabel_0, {
                            fontStyle = v16.Font.Header2, 
                            colorStyle = v16.Theme.TextEmphasis, 
                            fluidSizing = false, 
                            emoji = l_Emoji_0.Verified, 
                            maxSize = Vector2.new(v15.PlayerDropDownSizeX - 124, 22), 
                            LayoutOrder = 1, 
                            Text = l_player_0.DisplayName, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextTruncate = Enum.TextTruncate.AtEnd, 
                            BackgroundTransparency = 1, 
                            TextScaled = true
                        }) or v1.createElement("TextLabel", {
                            LayoutOrder = 1, 
                            Size = UDim2.new(1, 0, 0, 22), 
                            Text = l_player_0.DisplayName, 
                            Font = v16.Font.Header2.Font, 
                            TextSize = v16.Font.BaseSize * v16.Font.Header2.RelativeSize, 
                            TextColor3 = v16.Theme.TextEmphasis.Color, 
                            TextTransparency = v16.Theme.TextEmphasis.Transparency, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextTruncate = Enum.TextTruncate.AtEnd, 
                            BackgroundTransparency = 1, 
                            TextScaled = true
                        }, {
                            SizeConstraint = v1.createElement("UITextSizeConstraint", {
                                MaxTextSize = v16.Font.BaseSize * v16.Font.Header2.RelativeSize, 
                                MinTextSize = v16.Font.BaseSize * v16.Font.Footer.RelativeSize
                            })
                        }), 
                        PlayerName = v1.createElement("TextLabel", {
                            LayoutOrder = 2, 
                            Size = UDim2.new(1, 0, 0, 22), 
                            Text = "@" .. l_player_0.Name, 
                            Font = v16.Font.CaptionHeader.Font, 
                            TextSize = v16.Font.BaseSize * v16.Font.CaptionHeader.RelativeSize, 
                            TextColor3 = v16.Theme.TextMuted.Color, 
                            TextTransparency = v16.Theme.TextMuted.Transparency, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextTruncate = Enum.TextTruncate.AtEnd, 
                            BackgroundTransparency = 1, 
                            TextScaled = true
                        }, {
                            SizeConstraint = v1.createElement("UITextSizeConstraint", {
                                MaxTextSize = v16.Font.BaseSize * v16.Font.CaptionHeader.RelativeSize, 
                                MinTextSize = v16.Font.BaseSize * v16.Font.Footer.RelativeSize
                            })
                        })
                    })
                }), 
                AvatarImage = v1.createElement("ImageLabel", {
                    Position = UDim2.new(0, 56, 0, 0), 
                    Size = UDim2.new(0, v15.DropDownHeaderSizeY, 0, v15.DropDownHeaderSizeY), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    BackgroundTransparency = 1, 
                    Image = "rbxthumb://type=AvatarHeadShot&id=" .. l_player_0.UserId .. "&w=150&h=150", 
                    ZIndex = 2
                }), 
                Divider = not v14.props.lastButton and v1.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 1), 
                    BackgroundTransparency = v16.Theme.Divider.Transparency, 
                    BackgroundColor3 = v16.Theme.Divider.Color, 
                    BorderSizePixel = 0, 
                    ZIndex = 3
                })
            });
        end);
    end);
end;
local function v21(v19) --[[ Line: 147 ]]
    -- upvalues: l_useVerifiedBadge_0 (copy), v1 (copy), v13 (copy), v5 (copy)
    local v20 = l_useVerifiedBadge_0(v19.player);
    return v1.createElement(v13, v5.Dictionary.join(v19, {
        showVerifiedBadge = v20
    }));
end;
if l_FFlagEnableVerifiedBadgeStore_0 then
    return v21;
else
    return v13;
end;