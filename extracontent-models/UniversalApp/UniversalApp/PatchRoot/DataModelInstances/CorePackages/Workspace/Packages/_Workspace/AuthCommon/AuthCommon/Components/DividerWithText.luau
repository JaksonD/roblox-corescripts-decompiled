local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local v1 = require(l_Parent_0.React);
local l_TextService_0 = game:GetService("TextService");
return function(v3) --[[ Line: 20 ]]
    -- upvalues: l_TextService_0 (copy), v1 (copy)
    local l_X_0 = l_TextService_0:GetTextSize(v3.text, v3.fontSize, v3.font, Vector2.new(1e999, v3.fontSize)).X;
    return v1.createElement("Frame", {
        LayoutOrder = v3.layoutOrder, 
        Size = if v3.size then v3.size else UDim2.new(0, v3.width, 0, v3.height), 
        BackgroundTransparency = 1
    }, v1.createElement("Frame", {
        Position = UDim2.new(0, 0, 0.5, 0), 
        Size = UDim2.new(0.5, -l_X_0 / 2 - v3.padding, 0, 1), 
        BackgroundTransparency = v3.transparency, 
        BackgroundColor3 = v3.color3
    }), v1.createElement("Frame", {
        Position = UDim2.new(0.5, l_X_0 / 2 + v3.padding, 0.5, 0), 
        Size = UDim2.new(0.5, -l_X_0 / 2 - v3.padding, 0, 1), 
        BackgroundTransparency = v3.transparency, 
        BackgroundColor3 = v3.color3
    }), v1.createElement("TextLabel", {
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        Text = v3.text, 
        TextSize = v3.fontSize, 
        Font = v3.font, 
        TextXAlignment = Enum.TextXAlignment.Center, 
        TextYAlignment = Enum.TextYAlignment.Center, 
        TextTransparency = v3.transparency, 
        TextColor3 = v3.color3, 
        BackgroundTransparency = 1
    }));
end;