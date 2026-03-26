local l_Parent_0 = script:FindFirstAncestor("AccountLockModal").Parent;
local l_useCallback_0 = require(l_Parent_0.React).useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_AppGuiService_0 = require(l_Parent_0.RoactServiceTags).AppGuiService;
local v6 = require(l_Parent_0.Responsive);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_usePreferredInput_0 = v6.usePreferredInput;
local l_LogoutReasonNames_0 = require(l_Parent_0.AuthCommon).Enums.LogoutReasonNames;
local l_ConsoleDisconnect_0 = require(l_Parent_0.AuthCommon).Thunks.ConsoleDisconnect;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
return function(v12) --[[ Line: 27 ]] --[[ Name: useLogout ]]
    -- upvalues: l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_AppGuiService_0 (copy), l_usePreferredInput_0 (copy), v6 (copy), l_useCallback_0 (copy), l_ConsoleDisconnect_0 (copy), l_LogoutReasonNames_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
    local v13 = l_useDispatch_0();
    local v14 = l_useRoactService_0(l_RoactNetworking_0);
    local v15 = l_useRoactService_0(l_AppGuiService_0);
    local v16 = l_usePreferredInput_0() == v6.Input.Directional;
    return (l_useCallback_0(function() --[[ Line: 34 ]]
        -- upvalues: v16 (copy), v13 (copy), l_ConsoleDisconnect_0 (ref), v14 (copy), v15 (copy), v12 (copy), l_LogoutReasonNames_0 (ref)
        if v16 then
            v13(l_ConsoleDisconnect_0(v14, v15, v12));
            return;
        else
            v13(v12(v14, v15, l_LogoutReasonNames_0.AccountLock));
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v13, 
        v14, 
        v15, 
        v12, 
        v16
    } else l_dependencyArray_0(v13, v14, v15, v12, v16)));
end;