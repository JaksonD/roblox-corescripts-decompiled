local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.None);
local v2 = require(l_Parent_0.forEachArgs);
local v3 = require(l_Parent_0.forEach);
local l_insert_0 = table.insert;
return function(v5, ...) --[[ Line: 16 ]] --[[ Name: append ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy), l_insert_0 (copy)
    v2(function(v6) --[[ Line: 17 ]]
        -- upvalues: v1 (ref), v3 (ref), v5 (copy), l_insert_0 (ref)
        if v6 == v1 or v6 == nil then
            return;
        else
            v3(v6, function(v7) --[[ Line: 21 ]]
                -- upvalues: v5 (ref), l_insert_0 (ref)
                l_insert_0(v5, v7);
            end);
            return;
        end;
    end, ...);
    return v5;
end;