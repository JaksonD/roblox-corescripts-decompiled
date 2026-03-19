local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.RequestType);
return function(v2) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    return v2.promptRequest.requestType ~= v1.None;
end;