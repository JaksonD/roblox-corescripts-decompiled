local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local _ = require(script.Parent.ObjMap);
return {
    keyMap = function(v3, v4) --[[ Line: 38 ]] --[[ Name: keyMap ]]
        local v5 = {};
        for _, v7 in ipairs(v3) do
            v5[v4(v7)] = v7;
        end;
        return v5;
    end
};