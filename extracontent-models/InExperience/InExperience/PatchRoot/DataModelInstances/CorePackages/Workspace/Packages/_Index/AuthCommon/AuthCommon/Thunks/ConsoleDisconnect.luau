local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_script_FirstAncestor_0.Http.Requests.AuthPlatformDisconnect);
local v4 = game:DefineFastFlag("EnableConsoleDisconnectNetworkingErrorToast", false);
local l_SetNetworkingErrorToast_0 = require(l_Parent_0.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast;
return function(v6, v7, v8) --[[ Line: 12 ]] --[[ Name: ConsoleDisconnect ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy), l_SetNetworkingErrorToast_0 (copy)
    return function(v9) --[[ Line: 13 ]]
        -- upvalues: v3 (ref), v6 (copy), v8 (copy), v7 (copy), v2 (ref), v4 (ref), l_SetNetworkingErrorToast_0 (ref)
        return v3(v6):andThen(function() --[[ Line: 14 ]]
            -- upvalues: v9 (copy), v8 (ref), v6 (ref), v7 (ref), v2 (ref)
            v9:dispatch(v8(v6, v7));
            return v2.resolve();
        end, function(v10) --[[ Line: 19 ]]
            -- upvalues: v4 (ref), v9 (copy), l_SetNetworkingErrorToast_0 (ref), v2 (ref)
            if v4 then
                v9:dispatch(l_SetNetworkingErrorToast_0(v10));
            end;
            return v2.reject(v10);
        end);
    end;
end;