local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Text_0 = v2.Text;
local l_useTokens_0 = v2.Hooks.useTokens;
return function(v5) --[[ Line: 16 ]] --[[ Name: Footer ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_Text_0 (copy)
    local v6 = l_useTokens_0();
    return v1.createElement("Frame", {
        LayoutOrder = v5.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Position = v5.Position, 
        AnchorPoint = v5.AnchorPoint, 
        ClipsDescendants = false, 
        BackgroundTransparency = 1, 
        ZIndex = 3
    }, {
        Text = v1.createElement(l_Text_0, {
            Text = v5.text, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            textStyle = v6.Color.Content.Emphasis, 
            fontStyle = v6.Typography.TitleMedium, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextTruncate = Enum.TextTruncate.SplitWord
        })
    });
end;