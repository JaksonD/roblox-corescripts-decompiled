local l_Parent_0 = script.Parent.Parent.Parent;
local l_Map_0 = require(l_Parent_0.LuauPolyfill).Map;
return {
    mapValueOrdered = function(v2, v3) --[[ Line: 17 ]] --[[ Name: mapValueOrdered ]]
        -- upvalues: l_Map_0 (copy)
        local v4 = l_Map_0.new();
        for _, v6 in v2 do
            local v7 = v6[1];
            v4:set(v7, v3(v6[2], v7));
        end;
        return v4;
    end
};