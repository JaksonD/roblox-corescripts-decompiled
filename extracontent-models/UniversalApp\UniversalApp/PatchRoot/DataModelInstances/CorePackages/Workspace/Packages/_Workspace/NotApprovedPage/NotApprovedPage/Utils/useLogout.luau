local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utils.sendNotApprovedPageEvent);
local l_EVENT_TYPES_0 = require(l_Parent_0.NotApprovedPageState).Constants.EVENT_TYPES;
local l_useCallback_0 = require(l_Parent_0.React).useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_AppGuiService_0 = require(l_Parent_0.RoactServiceTags).AppGuiService;
local v9 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v9.usePreferredInput;
local l_LogoutReasonNames_0 = require(l_Parent_0.AuthCommon).Enums.LogoutReasonNames;
local l_ConsoleDisconnect_0 = require(l_Parent_0.AuthCommon).Thunks.ConsoleDisconnect;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
return function(v14, v15) --[[ Line: 32 ]] --[[ Name: useLogout ]]
    -- upvalues: l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_AppGuiService_0 (copy), l_usePreferredInput_0 (copy), v9 (copy), l_useCallback_0 (copy), v2 (copy), l_EVENT_TYPES_0 (copy), l_ConsoleDisconnect_0 (copy), l_LogoutReasonNames_0 (copy), l_dependencyArray_0 (copy)
    local v16 = l_useDispatch_0();
    local v17 = l_useRoactService_0(l_RoactNetworking_0);
    local v18 = l_useRoactService_0(l_AppGuiService_0);
    local v19 = l_usePreferredInput_0() == v9.Input.Directional;
    return (l_useCallback_0(function() --[[ Line: 38 ]]
        -- upvalues: v14 (copy), v2 (ref), l_EVENT_TYPES_0 (ref), v19 (copy), v16 (copy), l_ConsoleDisconnect_0 (ref), v17 (copy), v18 (copy), v15 (copy), l_LogoutReasonNames_0 (ref)
        v14(true);
        v2({
            eventType = l_EVENT_TYPES_0.LogoutClicked
        });
        if v19 then
            v16(l_ConsoleDisconnect_0(v17, v18, v15));
            return;
        else
            v16(v15(v17, v18, l_LogoutReasonNames_0.Moderation));
            return;
        end;
    end, l_dependencyArray_0(v16, v17, v18, v15, v19, v14)));
end;