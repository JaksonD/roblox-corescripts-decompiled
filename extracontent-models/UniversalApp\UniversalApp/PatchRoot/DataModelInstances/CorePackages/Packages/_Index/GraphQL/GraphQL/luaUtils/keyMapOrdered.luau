local l_Parent_0 = script.Parent.Parent.Parent;
local l_Map_0 = require(l_Parent_0.LuauPolyfill).Map;
return {
    keyMapOrdered = function(v2, v3) --[[ Line: 37 ]] --[[ Name: keyMapOrdered ]]
        -- upvalues: l_Map_0 (copy)
        local v4 = l_Map_0.new();
        for v5 = 1, #v2 do
            local v6 = v2[v5];
            v4:set(v3(v6), v6);
        end;
        return v4;
    end
};