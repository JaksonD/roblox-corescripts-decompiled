local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.ES7Types);
return function(v2, v3) --[[ Line: 22 ]]
    for v4 = 1, #v2 do
        if v3(v2[v4], v4, v2) then
            return v4;
        end;
    end;
    return -1;
end;