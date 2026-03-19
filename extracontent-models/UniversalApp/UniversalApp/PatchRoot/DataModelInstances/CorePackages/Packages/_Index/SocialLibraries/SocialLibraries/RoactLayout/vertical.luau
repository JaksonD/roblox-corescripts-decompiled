local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local l_Roact_0 = require(l_script_FirstAncestor_0.dependencies).Roact;
local v2 = require(script.Parent.new);
return function(v3) --[[ Line: 7 ]] --[[ Name: vertical ]]
    -- upvalues: l_Roact_0 (copy), v2 (copy)
    local v4 = l_Roact_0.createElement("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder
    });
    return v2(v4, v3);
end;