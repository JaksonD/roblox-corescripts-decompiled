local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.append);
local v2 = require(l_Parent_0.forEach);
return function(v3) --[[ Line: 14 ]] --[[ Name: flat ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v4 = {};
    v2(v3, function(v5) --[[ Line: 16 ]]
        -- upvalues: v1 (ref), v4 (copy)
        v1(v4, v5);
    end);
    return v4;
end;