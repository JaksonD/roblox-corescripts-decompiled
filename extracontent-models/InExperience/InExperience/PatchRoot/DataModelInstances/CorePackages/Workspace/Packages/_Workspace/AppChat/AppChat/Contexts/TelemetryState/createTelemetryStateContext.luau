local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
return function(v3) --[[ Line: 18 ]] --[[ Name: createStateContext ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v4 = v1.createContext({
        get = function() --[[ Line: 20 ]] --[[ Name: get ]]
            -- upvalues: v2 (ref), v3 (copy)
            return v2.Dictionary.union({}, v3);
        end, 
        set = function() --[[ Line: 23 ]] --[[ Name: set ]]

        end
    });
    return {
        Provider = v4.Provider, 
        useClearState = function() --[[ Line: 28 ]] --[[ Name: useClearState ]]
            -- upvalues: v1 (ref), v4 (copy), v3 (copy)
            local l_set_0 = v1.useContext(v4).set;
            return v1.useCallback(function() --[[ Line: 30 ]]
                -- upvalues: l_set_0 (copy), v3 (ref)
                l_set_0(v3);
            end, {
                l_set_0
            });
        end, 
        useGetState = function() --[[ Line: 34 ]] --[[ Name: useGetState ]]
            -- upvalues: v1 (ref), v4 (copy)
            return v1.useContext(v4).get;
        end, 
        useMergeState = function() --[[ Line: 37 ]] --[[ Name: useMergeState ]]
            -- upvalues: v1 (ref), v4 (copy), v2 (ref)
            local l_set_1 = v1.useContext(v4).set;
            return v1.useCallback(function(v7) --[[ Line: 39 ]]
                -- upvalues: l_set_1 (copy), v2 (ref)
                l_set_1(function(v8) --[[ Line: 40 ]]
                    -- upvalues: v2 (ref), v7 (copy)
                    return v2.Dictionary.join(v8, v7);
                end);
            end, {
                l_set_1
            });
        end, 
        useSetState = function() --[[ Line: 45 ]] --[[ Name: useSetState ]]
            -- upvalues: v1 (ref), v4 (copy)
            return v1.useContext(v4).set;
        end
    };
end;