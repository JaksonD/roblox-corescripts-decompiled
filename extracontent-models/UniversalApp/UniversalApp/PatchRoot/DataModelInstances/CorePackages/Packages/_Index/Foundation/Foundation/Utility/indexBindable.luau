local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactIs);
local _ = require(l_script_FirstAncestor_0.Components.Types);
return function(v5, v6) --[[ Line: 10 ]] --[[ Name: indexBindable ]]
    -- upvalues: v3 (copy)
    if v3.isBinding(v5) then
        return v5:map(function(v7) --[[ Line: 13 ]]
            -- upvalues: v6 (copy)
            return v7[v6];
        end);
    else
        return v5[v6];
    end;
end;