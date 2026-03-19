local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.reduce);
return function(v3, v4) --[[ Line: 31 ]] --[[ Name: frequencies ]]
    -- upvalues: v2 (copy)
    return v2(v3, function(v5, v6, v7) --[[ Line: 32 ]]
        -- upvalues: v4 (copy)
        local v8 = if v4 then v4(v6, v7) else v6;
        if v5[v8] == nil then
            v5[v8] = 1;
            return v5;
        else
            v5[v8] = v5[v8] + 1;
            return v5;
        end;
    end, {});
end;