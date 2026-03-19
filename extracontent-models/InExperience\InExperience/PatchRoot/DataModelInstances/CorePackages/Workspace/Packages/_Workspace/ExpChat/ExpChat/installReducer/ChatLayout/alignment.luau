local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v6 = require(l_Actions_0.ChatLayoutHorizontalAlignmentChanged);
local v7 = require(l_Actions_0.ChatLayoutVerticalAlignmentChanged);
local l_Y_0 = l_GuiService_0:GetGuiInset().Y;
local v9 = {
    Position = UDim2.new(0, 8, 0, 4), 
    AnchorPoint = Vector2.new(0, 0), 
    UIListLayoutVerticalAlignment = Enum.VerticalAlignment.Top
};
return v3.createReducer(v9, {
    [v6.name] = function(v10, v11) --[[ Line: 22 ]]
        -- upvalues: l_Dictionary_0 (copy)
        local l_Position_0 = v10.Position;
        local l_AnchorPoint_0 = v10.AnchorPoint;
        if v11.value == Enum.HorizontalAlignment.Left then
            l_Position_0 = UDim2.new(0, 8, l_Position_0.Y.Scale, l_Position_0.Y.Offset);
            l_AnchorPoint_0 = Vector2.new(0, l_AnchorPoint_0.Y);
        elseif v11.value == Enum.HorizontalAlignment.Center then
            l_Position_0 = UDim2.new(0.5, 0, l_Position_0.Y.Scale, l_Position_0.Y.Offset);
            l_AnchorPoint_0 = Vector2.new(0.5, l_AnchorPoint_0.Y);
        elseif v11.value == Enum.HorizontalAlignment.Right then
            l_Position_0 = UDim2.new(1, -8, l_Position_0.Y.Scale, l_Position_0.Y.Offset);
            l_AnchorPoint_0 = Vector2.new(1, l_AnchorPoint_0.Y);
        end;
        return l_Dictionary_0.join(v10, {
            Position = l_Position_0, 
            AnchorPoint = l_AnchorPoint_0
        });
    end, 
    [v7.name] = function(v14, v15) --[[ Line: 43 ]]
        -- upvalues: l_Y_0 (copy), l_Dictionary_0 (copy)
        local l_Position_1 = v14.Position;
        local l_AnchorPoint_1 = v14.AnchorPoint;
        if v15.value == Enum.VerticalAlignment.Top then
            l_Position_1 = UDim2.new(l_Position_1.X.Scale, l_Position_1.X.Offset, 0, 4);
            l_AnchorPoint_1 = Vector2.new(l_AnchorPoint_1.X, 0);
        elseif v15.value == Enum.VerticalAlignment.Center then
            l_Position_1 = UDim2.new(l_Position_1.X.Scale, l_Position_1.X.Offset, 0.5, -l_Y_0);
            l_AnchorPoint_1 = Vector2.new(l_AnchorPoint_1.X, 0.5);
        elseif v15.value == Enum.VerticalAlignment.Bottom then
            l_Position_1 = UDim2.new(l_Position_1.X.Scale, l_Position_1.X.Offset, 1, -4);
            l_AnchorPoint_1 = Vector2.new(l_AnchorPoint_1.X, 1);
        end;
        return l_Dictionary_0.join(v14, {
            Position = l_Position_1, 
            AnchorPoint = l_AnchorPoint_1, 
            UIListLayoutVerticalAlignment = v15.value
        });
    end
});