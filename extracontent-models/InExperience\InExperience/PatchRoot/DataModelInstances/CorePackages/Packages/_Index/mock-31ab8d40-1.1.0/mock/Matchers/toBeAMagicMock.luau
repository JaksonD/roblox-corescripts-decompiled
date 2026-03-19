local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.MagicMock);
return function(v2) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    local v3 = v1.is(v2);
    return {
        pass = v3, 
        message = v3 and "Expected object to be anything but a MagicMock." or string.format("Expected object to be a MagicMock. Got %q instead.", (tostring(v2)))
    };
end;