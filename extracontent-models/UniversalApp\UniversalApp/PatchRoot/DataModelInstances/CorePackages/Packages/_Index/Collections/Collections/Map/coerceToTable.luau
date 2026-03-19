local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_0.Map);
local v4 = require(l_Parent_2.InstanceOf);
local v5 = require(l_Parent_1.Array.reduce);
local _ = require(l_Parent_2.ES7Types);
return function(v7) --[[ Line: 27 ]] --[[ Name: coerceToTable ]]
    -- upvalues: v4 (copy), v3 (copy), v5 (copy)
    if not v4(v7, v3) then
        return v7;
    else
        return v5(v7:entries(), function(v8, v9) --[[ Line: 33 ]]
            v8[v9[1]] = v9[2];
            return v8;
        end, {});
    end;
end;