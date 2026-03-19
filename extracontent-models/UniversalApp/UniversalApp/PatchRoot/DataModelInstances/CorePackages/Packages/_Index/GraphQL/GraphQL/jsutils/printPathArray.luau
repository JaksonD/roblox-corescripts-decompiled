local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
return {
    printPathArray = function(v2) --[[ Line: 15 ]] --[[ Name: printPathArray ]]
        local v3 = {};
        for v4 = 1, #v2 do
            local v5 = v2[v4];
            v3[v4] = typeof(v5) == "number" and "[" .. tostring(v5) .. "]" or "." .. v5;
        end;
        return table.concat(v3, "");
    end
};