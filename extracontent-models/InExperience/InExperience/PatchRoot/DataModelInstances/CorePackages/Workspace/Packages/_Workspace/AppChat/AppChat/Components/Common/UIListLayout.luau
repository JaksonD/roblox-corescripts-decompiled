local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
return function(v2) --[[ Line: 10 ]] --[[ Name: UIListLayout ]]
    -- upvalues: v1 (copy)
    return v1.createElement("UIListLayout", {
        HorizontalAlignment = v2.HorizontalAlignment, 
        FillDirection = v2.FillDirection, 
        VerticalAlignment = v2.VerticalAlignment, 
        SortOrder = Enum.SortOrder.LayoutOrder
    });
end;