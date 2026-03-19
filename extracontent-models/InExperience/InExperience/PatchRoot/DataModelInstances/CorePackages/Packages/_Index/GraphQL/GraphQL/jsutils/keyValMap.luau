local l_Parent_0 = script.Parent.Parent.Parent;
local l_Map_0 = require(l_Parent_0.LuauPolyfill).Map;
return {
    keyValMap = function(v2, v3, v4) --[[ Line: 32 ]] --[[ Name: keyValMap ]]
        -- upvalues: l_Map_0 (copy)
        local v5 = l_Map_0.new();
        for _, v7 in ipairs(v2) do
            v5:set(v3(v7), v4(v7));
        end;
        return v5;
    end
};