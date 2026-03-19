local l_Parent_0 = script:FindFirstAncestor("ReactUtils").Parent;
local _ = require(l_Parent_0.React);
local v2 = require(script.Parent.usePropertiesBase);
return function(v3, v4, ...) --[[ Line: 19 ]] --[[ Name: usePropertiesDeferred ]]
    -- upvalues: v2 (copy)
    return v2(v3, v4, true, ...);
end;