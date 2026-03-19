local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
return function(v2) --[[ Line: 12 ]] --[[ Name: UIListLayout ]]
    -- upvalues: v1 (copy)
    return v1.createElement("UIListLayout", {
        FillDirection = v2.FillDirection, 
        HorizontalAlignment = v2.HorizontalAlignment, 
        Padding = v2.Padding, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        VerticalAlignment = v2.VerticalAlignment, 
        ref = v2.Ref
    });
end;