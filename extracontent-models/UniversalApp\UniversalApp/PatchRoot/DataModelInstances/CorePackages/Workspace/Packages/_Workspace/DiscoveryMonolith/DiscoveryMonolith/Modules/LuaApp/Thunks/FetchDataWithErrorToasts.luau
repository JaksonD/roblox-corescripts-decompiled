local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local v1 = require(l_Parent_0.Promise);
local l_SetNetworkingErrorToast_0 = require(l_Parent_0.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast;
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v1 (copy), l_SetNetworkingErrorToast_0 (copy)
    return function(v4) --[[ Line: 7 ]]
        -- upvalues: v3 (copy), v1 (ref), l_SetNetworkingErrorToast_0 (ref)
        return v4:dispatch(v3):andThen(function(v5) --[[ Line: 8 ]]
            -- upvalues: v1 (ref)
            return v1.resolve(v5);
        end, function(v6) --[[ Line: 10 ]]
            -- upvalues: v4 (copy), l_SetNetworkingErrorToast_0 (ref), v1 (ref)
            v4:dispatch(l_SetNetworkingErrorToast_0(v6));
            return v1.reject(v6);
        end);
    end;
end;