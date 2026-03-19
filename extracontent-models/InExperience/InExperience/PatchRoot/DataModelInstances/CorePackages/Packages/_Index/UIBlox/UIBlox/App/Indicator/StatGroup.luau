local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Core_0 = l_Parent_1.Core;
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_2.React);
local v5 = require(l_Parent_0.ImageSet.Images);
local v6 = require(l_Core_0.ImageSet.ImageSetComponent);
local v7 = require(l_Core_0.Style.useStyle);
local _ = require(l_Parent_0.Style.Fonts);
local function v21(v9, v10, v11, v12) --[[ Line: 26 ]] --[[ Name: renderStatItem ]]
    -- upvalues: v4 (copy), v6 (copy), v5 (copy)
    local l_Tokens_0 = v12.Tokens;
    local l_Font_0 = v12.Font;
    local v15 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local v16 = v15 + l_Tokens_0.Global.Size_100;
    local l_Space_25_0 = l_Tokens_0.Global.Space_25;
    local l_Small_0 = l_Tokens_0.Semantic.Icon.Size.Small;
    local l_Default_0 = l_Tokens_0.Semantic.Color.Text.Default;
    local l_Default_1 = l_Tokens_0.Semantic.Color.Text.Default;
    return v4.createElement("Frame", v9, {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, l_Space_25_0)
        }), 
        Icon = v4.createElement(v6.Label, {
            Size = UDim2.fromOffset(l_Small_0, l_Small_0), 
            Image = v5[v10], 
            BackgroundTransparency = 1, 
            ImageTransparency = l_Default_0.Transparency, 
            ImageColor3 = l_Default_0.Color3, 
            LayoutOrder = 1, 
            AnchorPoint = Vector2.new(0, 0.5)
        }), 
        Label = v4.createElement("TextLabel", {
            Size = UDim2.fromScale(0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            Text = v11, 
            Font = l_Font_0.Body.Font, 
            TextSize = v15, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextWrapped = false, 
            TextColor3 = l_Default_1.Color3, 
            TextTransparency = l_Default_1.Transparency, 
            LayoutOrder = 2
        }, {
            UISizeConstraint = v4.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(l_Tokens_0.Global.Size_700, 1e999)
            }), 
            UiTextSizeConstraint = v4.createElement("UITextSizeConstraint", {
                MaxTextSize = v16
            })
        })
    });
end;
return function(v22) --[[ Line: 78 ]] --[[ Name: StatGroup ]]
    -- upvalues: v7 (copy), v4 (copy), v21 (copy)
    local v23 = v7();
    local l_Space_100_0 = v23.Tokens.Global.Space_100;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.X
    }, {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, l_Space_100_0)
        }), 
        RatingStats = v21({
            Size = UDim2.fromScale(0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, "icons/status/games/rating_small", v22.ratingText, v23), 
        PlayingStats = if v22.playingText ~= nil then v21({
            Size = UDim2.fromScale(0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, "icons/status/games/people-playing_small", v22.playingText, v23) else nil
    });
end;