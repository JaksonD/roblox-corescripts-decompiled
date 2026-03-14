local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(script.Parent.AppliedDescriptionCallbackContext);
local v3 = require(script.Parent.AppliedDescriptionValueContext);
return function(v4) --[[ Line: 11 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    local v5, v6 = v1.useBinding(nil);
    local v7, v8 = v1.useState({
        appliedDescriptionBinding = v5
    });
    local v10 = v1.useCallback(function(v9) --[[ Line: 15 ]]
        -- upvalues: v6 (copy)
        v6(v9);
    end, {
        v6
    });
    v1.useEffect(function() --[[ Line: 18 ]]
        -- upvalues: v8 (copy), v5 (copy)
        v8({
            appliedDescriptionBinding = v5
        });
    end, {
        v5
    });
    local v11 = v1.useMemo(function() --[[ Line: 22 ]]
        -- upvalues: v10 (copy)
        return {
            setAppliedDescription = v10
        };
    end, {
        v10
    });
    return v1.createElement(v2.Provider, {
        value = v11
    }, {
        AppliedDescriptionValueContextProvider = v1.createElement(v3.Provider, {
            value = v7
        }, v4.children)
    });
end;