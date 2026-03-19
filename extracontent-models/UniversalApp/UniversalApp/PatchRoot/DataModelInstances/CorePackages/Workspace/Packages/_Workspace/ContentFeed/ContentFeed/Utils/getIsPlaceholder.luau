local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.PlaceholderType);
return function(v2) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    if v1[v2] then
        return true;
    else
        return false;
    end;
end;