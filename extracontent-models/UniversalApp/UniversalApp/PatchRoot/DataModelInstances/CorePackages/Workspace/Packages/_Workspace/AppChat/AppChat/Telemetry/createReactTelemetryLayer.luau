local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
return function(v3, v4) --[[ Line: 11 ]] --[[ Name: createReactTelemetryLayer ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v5 = v1.createContext(function() --[[ Line: 16 ]]
        -- upvalues: v2 (ref), v4 (copy)
        return v2.Dictionary.union({}, v4);
    end);
    local function v10(v6) --[[ Line: 23 ]] --[[ Name: Provider ]]
        -- upvalues: v1 (ref), v3 (copy), v2 (ref), v5 (copy)
        local v7 = v1.useContext(v3);
        local v9 = v1.useCallback(function() --[[ Line: 25 ]]
            -- upvalues: v6 (copy), v2 (ref), v7 (copy)
            local l_value_0 = v6.value;
            if typeof(l_value_0) == "function" then
                l_value_0 = l_value_0();
            end;
            return v2.Dictionary.union(v7(), l_value_0);
        end, {
            v7, 
            v6.value
        });
        return v1.createElement(v5.Provider, {
            value = v9
        }, v6.children);
    end;
    return {
        Context = v5, 
        Provider = v10
    };
end;