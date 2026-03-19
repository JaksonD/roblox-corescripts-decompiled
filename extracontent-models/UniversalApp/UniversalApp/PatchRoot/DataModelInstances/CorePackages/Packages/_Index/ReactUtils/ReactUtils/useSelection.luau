local l_script_FirstAncestor_0 = script:FindFirstAncestor("ReactUtils");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.useEventConnection);
return function(v4) --[[ Line: 9 ]] --[[ Name: useSelection ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v5 = v4 or game:GetService("Selection");
    local v6, v7 = v2.useState(function() --[[ Line: 12 ]]
        -- upvalues: v5 (copy)
        return v5:Get();
    end);
    v3(v5.SelectionChanged, function() --[[ Line: 16 ]]
        -- upvalues: v7 (copy), v5 (copy)
        v7(v5:Get());
    end, {});
    return v6;
end;