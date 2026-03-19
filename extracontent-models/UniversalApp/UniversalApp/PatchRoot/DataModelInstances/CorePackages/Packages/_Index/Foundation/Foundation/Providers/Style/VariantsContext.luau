local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local v1 = require(l_Parent_0.React);
getOrSet = function(v2, v3, v4, ...) --[[ Line: 7 ]] --[[ Name: getOrSet ]]
    local v5 = v2[v3];
    if not v5 then
        v5 = v4(...);
        v2[v3] = v5;
    end;
    return v5;
end;
useVariantsState = function() --[[ Line: 22 ]] --[[ Name: useVariantsState ]]
    -- upvalues: v1 (copy)
    local v6 = v1.useRef({});
    local v7 = v1.useRef(nil);
    return v1.useCallback(function(v8, v9, v10) --[[ Line: 26 ]]
        -- upvalues: v7 (copy), v6 (copy)
        if v7.current ~= v10 then
            table.clear(v6.current);
            v7.current = v10;
        end;
        return getOrSet(v6.current, v8, v9, v10);
    end, {});
end;
local v11 = v1.createContext(nil);
useVariants = function(v12, v13, v14) --[[ Line: 39 ]] --[[ Name: useVariants ]]
    -- upvalues: v1 (copy), v11 (copy)
    local v15 = v1.useContext(v11);
    if v15 == nil then
        error("VariantsContext hasn't been instantiated");
    end;
    return v15(v12, v13, v14);
end;
return {
    useVariants = useVariants, 
    useVariantsState = useVariantsState, 
    Provider = v11.Provider
};