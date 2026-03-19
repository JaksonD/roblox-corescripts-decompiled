local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
return {
    filterInPlace = function(v2, v3, v4) --[[ Line: 23 ]] --[[ Name: filterInPlace ]]
        -- upvalues: l_Array_0 (copy)
        local v5 = 1;
        l_Array_0.forEach(v2, function(v6, v7) --[[ Line: 25 ]]
            -- upvalues: v3 (copy), v2 (copy), v5 (ref)
            if v3(v6, v7, v2) then
                v2[v5] = v6;
                v5 = v5 + 1;
            end;
        end, v4);
        v2[v5] = nil;
        return v2;
    end
};