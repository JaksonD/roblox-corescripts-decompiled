local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactIs);
local _ = require(l_script_FirstAncestor_0.Components.Types);
return function(v5, v6) --[[ Line: 10 ]] --[[ Name: mapBindable ]]
    -- upvalues: v3 (copy)
    if v3.isBinding(v5) then
        return v5:map(v6);
    else
        return v6(v5);
    end;
end;