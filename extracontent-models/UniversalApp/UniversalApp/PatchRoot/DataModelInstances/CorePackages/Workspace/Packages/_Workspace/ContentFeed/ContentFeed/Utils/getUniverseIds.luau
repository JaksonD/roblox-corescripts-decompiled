local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
return function(v2) --[[ Line: 5 ]]
    local v3 = {};
    local v4 = {};
    for _, v6 in pairs(v2) do
        local v7 = tostring(v6.experienceContext.experienceId);
        if not v4[v7] then
            table.insert(v3, v7);
            v4[v7] = true;
        end;
    end;
    return v3;
end;