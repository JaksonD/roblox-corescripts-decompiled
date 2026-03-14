local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_0.Core.Style.useStyle);
return function(v4) --[[ Line: 18 ]] --[[ Name: HelperText ]]
    -- upvalues: v3 (copy), v2 (copy)
    local l_HelperText_0 = v3().Tokens.Component.HelperText;
    local l_Typography_0 = l_HelperText_0.Base.Typography;
    local v7 = if v4.error then l_HelperText_0.Error.ContentColor else l_HelperText_0.Base.ContentColor;
    return v2.createElement("TextLabel", {
        Text = v4.text, 
        TextTransparency = v7.Transparency, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        TextWrapped = true, 
        BackgroundTransparency = 1, 
        TextColor3 = v7.Color3, 
        Font = l_Typography_0.Font, 
        TextSize = l_Typography_0.FontSize, 
        LineHeight = l_Typography_0.LineHeight, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = v4.LayoutOrder
    });
end;