local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.getDeepValue);
local v2 = require(l_Parent_0.EnumNetworkStatus);
return function(v3) --[[ Line: 5 ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_keyPath_0 = v3.keyPath;
    return function(v5, v6) --[[ Line: 8 ]]
        -- upvalues: v1 (ref), l_keyPath_0 (copy), v2 (ref)
        assert(typeof(v5) == "table");
        assert(typeof(v6) == "string");
        assert(#v6 > 0);
        local v7 = v1(v5, l_keyPath_0);
        assert(v7, string.format("Reducer not found for keyPath: %s. Did you forget to call `installReducer`?", l_keyPath_0));
        return v7[v6] or v2.NotStarted;
    end;
end;