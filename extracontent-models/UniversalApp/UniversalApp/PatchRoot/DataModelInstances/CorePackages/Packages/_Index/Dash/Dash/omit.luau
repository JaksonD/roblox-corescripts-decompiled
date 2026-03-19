local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.collectSet);
local v2 = require(l_Parent_0.forEach);
local _ = require(l_Parent_0.Types);
return function(v4, v5) --[[ Line: 16 ]] --[[ Name: omit ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v6 = {};
    local v7 = v1(v5);
    v2(v4, function(_, v9) --[[ Line: 19 ]]
        -- upvalues: v7 (copy), v6 (copy), v4 (copy)
        if not v7[v9] then
            v6[v9] = v4[v9];
        end;
    end);
    return v6;
end;