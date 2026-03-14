local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.React);
local _ = require(l_Parent_0.Otter);
local v3 = require(script.Parent.useMotor);
return function(v4, v5) --[[ Line: 12 ]] --[[ Name: useAnimatedBinding ]]
    -- upvalues: v1 (copy), v3 (copy)
    local v6, v7 = v1.useBinding(v4);
    return v6, (v3(v4, v7, v5));
end;