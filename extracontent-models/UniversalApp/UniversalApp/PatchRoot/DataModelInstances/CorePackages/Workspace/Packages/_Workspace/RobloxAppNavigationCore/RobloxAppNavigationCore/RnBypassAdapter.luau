local l_Parent_0 = script:FindFirstAncestor("RobloxAppNavigationCore").Parent;
local _ = require(l_Parent_0.AppCommonLib);
local v2 = require(l_Parent_0.React);
local l_useLazyRef_0 = require(l_Parent_0.ReactUtils).useLazyRef;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v5 = require(script.Parent.useProcessNavigationStateChange);
return function(v6) --[[ Line: 23 ]] --[[ Name: RnBypassAdapter ]]
    -- upvalues: l_useNavigation_0 (copy), l_useLazyRef_0 (copy), v2 (copy), v5 (copy)
    local l_rnBypassActionSignal_0 = v6.rnBypassActionSignal;
    local v8 = l_useNavigation_0();
    local v10 = l_useLazyRef_0(function() --[[ Line: 27 ]]
        -- upvalues: l_rnBypassActionSignal_0 (copy), v8 (copy)
        return l_rnBypassActionSignal_0:connect(function(v9) --[[ Line: 28 ]]
            -- upvalues: v8 (ref)
            v8.dispatch(v9);
        end);
    end);
    v2.useEffect(function() --[[ Line: 33 ]]
        -- upvalues: v10 (copy)
        v10.current:disconnect();
    end, {});
    v2.useEffect(function() --[[ Line: 37 ]]
        -- upvalues: l_rnBypassActionSignal_0 (copy), v8 (copy)
        local v12 = l_rnBypassActionSignal_0:connect(function(v11) --[[ Line: 39 ]]
            -- upvalues: v8 (ref)
            v8.dispatch(v11);
        end);
        return function() --[[ Line: 43 ]]
            -- upvalues: v12 (copy)
            v12:disconnect();
        end;
    end, {
        v8, 
        l_rnBypassActionSignal_0
    });
    local v13 = v5(v6.ApplyRoactNavigationHistory, v6.updateRoute);
    v2.useEffect(function() --[[ Line: 51 ]]
        -- upvalues: v13 (copy), v8 (copy)
        v13(nil, v8.state, nil);
    end, {
        v8.state
    });
    return nil;
end;