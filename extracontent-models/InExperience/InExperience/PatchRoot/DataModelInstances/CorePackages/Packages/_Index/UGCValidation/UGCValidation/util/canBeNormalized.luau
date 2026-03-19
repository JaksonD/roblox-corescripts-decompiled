local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.util.floatEquals);
return function(v2) --[[ Line: 9 ]] --[[ Name: canBeNormalized ]]
    -- upvalues: v1 (copy)
    return not v1(v2.X, 0) or not v1(v2.Y, 0) or not v1(v2.Z, 0);
end;