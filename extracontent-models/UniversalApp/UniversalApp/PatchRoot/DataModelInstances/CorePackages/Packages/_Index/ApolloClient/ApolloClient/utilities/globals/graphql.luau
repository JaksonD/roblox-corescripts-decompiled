local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_isType_0 = require(l_Parent_0.GraphQL).isType;
v0.removeTemporaryGlobals = function() --[[ Line: 26 ]] --[[ Name: removeTemporaryGlobals ]]
    -- upvalues: l_isType_0 (copy)
    l_isType_0(nil);
    return (function() --[[ Line: 33 ]] --[[ Name: remove ]]

    end)();
end;
return v0;