local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
return (v1.forwardRef(function(v2, v3) --[[ Line: 15 ]]
    -- upvalues: v1 (copy)
    return v1.createElement("Frame", {
        AutomaticSize = v2.AutomaticSize or Enum.AutomaticSize.XY, 
        BackgroundColor3 = v2.BackgroundColor3, 
        BackgroundTransparency = v2.BackgroundTransparency or 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v2.LayoutOrder, 
        Position = v2.Position, 
        Size = v2.Size or UDim2.fromScale(1, 1), 
        ZIndex = v2.ZIndex, 
        children = v2.children, 
        ref = v3
    });
end));