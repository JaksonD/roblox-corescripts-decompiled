local l_Parent_0 = script:FindFirstAncestor("ReactUtils").Parent;
local _ = require(l_Parent_0.React);
local v2 = require(script.Parent.usePropertiesBase);
return function(v3, v4, ...) --[[ Line: 33 ]] --[[ Name: useProperties ]]
    -- upvalues: v2 (copy)
    return v2(v3, v4, false, ...);
end;