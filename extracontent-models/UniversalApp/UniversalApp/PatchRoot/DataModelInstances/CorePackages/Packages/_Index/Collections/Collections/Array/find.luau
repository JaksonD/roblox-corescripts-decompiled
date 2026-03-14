local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.ES7Types);
return function(v2, v3) --[[ Line: 22 ]]
    for v4 = 1, #v2 do
        local v5 = v2[v4];
        if v3(v5, v4, v2) then
            return v5;
        end;
    end;
    return nil;
end;