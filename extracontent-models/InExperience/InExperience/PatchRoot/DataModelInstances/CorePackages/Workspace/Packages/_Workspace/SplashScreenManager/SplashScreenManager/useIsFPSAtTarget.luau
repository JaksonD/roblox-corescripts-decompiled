local l_Parent_0 = script:FindFirstAncestor("SplashScreenManager").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.SplashScreenManager);
return function() --[[ Line: 9 ]] --[[ Name: useIsFPSAtTarget ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v3, v4 = v1.useState(v2.isFPSAtTarget());
    local v6 = v1.useCallback(function(v5) --[[ Line: 11 ]]
        -- upvalues: v4 (copy)
        v4(v5);
    end, {
        v4
    });
    v1.useEffect(function() --[[ Line: 15 ]]
        -- upvalues: v2 (ref), v6 (copy)
        v2.addStatusChangeListener(v6);
        return function() --[[ Line: 17 ]]
            -- upvalues: v2 (ref), v6 (ref)
            v2.removeStatusChangeListener(v6);
        end;
    end, {});
    return v3;
end;