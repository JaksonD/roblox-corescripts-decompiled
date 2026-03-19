local l_Parent_0 = script.Parent.Parent;
local v1 = require(script.Parent);
local v2 = require(l_Parent_0.instanceof);
local v3 = require(l_Parent_0.Array.reduce);
local _ = require(l_Parent_0.types);
return function(v5) --[[ Line: 9 ]] --[[ Name: coerceToTable ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy)
    if not v2(v5, v1) then
        return v5;
    else
        return v3(v5:entries(), function(v6, v7) --[[ Line: 15 ]]
            v6[v7[1]] = v7[2];
            return v6;
        end, {});
    end;
end;