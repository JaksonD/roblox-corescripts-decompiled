local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local v1 = require(l_Parent_0.Roact);
return function(v2) --[[ Line: 6 ]] --[[ Name: validateWithRefForwarding ]]
    -- upvalues: v1 (copy)
    v2.forwardRef = v2[v1.Ref];
    v2[v1.Ref] = nil;
    return v2;
end;