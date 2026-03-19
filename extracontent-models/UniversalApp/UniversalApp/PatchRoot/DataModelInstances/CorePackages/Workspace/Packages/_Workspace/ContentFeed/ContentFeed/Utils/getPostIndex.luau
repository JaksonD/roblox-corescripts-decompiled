local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
return function(v2, v3) --[[ Line: 5 ]]
    local v4 = 1;
    for _, v6 in pairs(v2) do
        if v6.postId == v3 then
            return v4;
        else
            v4 = v4 + 1;
        end;
    end;
    return nil;
end;