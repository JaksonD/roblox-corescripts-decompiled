local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceUIKit").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Text_0 = v2.Text;
local l_useTokens_0 = v2.Hooks.useTokens;
return function(v5) --[[ Line: 13 ]] --[[ Name: ItemCardStatus ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_Text_0 (copy)
    local v6 = l_useTokens_0();
    return v1.createElement(l_Text_0, {
        textStyle = v6.Inverse.Content.Emphasis, 
        fontStyle = v6.Typography.LabelSmall, 
        LayoutOrder = v5.LayoutOrder, 
        Text = v5.text, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        Size = UDim2.fromScale(0, 0), 
        AutomaticSize = Enum.AutomaticSize.XY, 
        backgroundStyle = v6.Color.System.Contrast, 
        padding = v6.Padding.Small, 
        cornerRadius = UDim.new(0.5, 0)
    });
end;