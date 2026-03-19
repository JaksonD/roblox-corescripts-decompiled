local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactIs);
local _ = require(l_script_FirstAncestor_0.Components.Types);
return function(v5) --[[ Line: 10 ]] --[[ Name: useBindable ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v6, v7 = v2.useBinding(nil);
    if v3.isBinding(v5) then
        return v5;
    else
        v7(v5);
        return v6;
    end;
end;