local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local v2 = {};
local _ = require(script.Parent.Observable);
v2.iterateObserversSafely = function(v4, v5, v6) --[[ Line: 26 ]] --[[ Name: iterateObserversSafely ]]
    -- upvalues: l_Array_0 (copy)
    local v7 = {};
    v4:forEach(function(v8) --[[ Line: 37 ]]
        -- upvalues: v5 (copy), v7 (copy)
        if v8[v5] ~= nil then
            table.insert(v7, v8);
        end;
    end);
    l_Array_0.forEach(v7, function(v9) --[[ Line: 43 ]]
        -- upvalues: v5 (copy), v6 (copy)
        v9[v5](v9, v6);
    end);
end;
return v2;