local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
return function(v2, v3) --[[ Line: 26 ]] --[[ Name: memoize ]]
    local v4 = {};
    return function(...) --[[ Line: 29 ]]
        -- upvalues: v3 (copy), v4 (copy), v2 (copy)
        local v5 = {
            ...
        };
        local v6 = nil;
        v6 = if v3 then v3(...) else table.concat(v5, "|");
        if v4[v6] == nil then
            v4[v6] = v2(...);
        end;
        return v4[v6];
    end;
end;