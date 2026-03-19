local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.t);
return function(v2) --[[ Line: 8 ]]
    -- upvalues: v1 (copy)
    assert(v1.number(v2));
    if v2 < 360 then
        return 12;
    elseif v2 < 600 then
        return 24;
    else
        return 48;
    end;
end;