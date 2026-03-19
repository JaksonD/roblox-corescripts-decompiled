local l_Parent_0 = script:FindFirstAncestor("TrustedContacts").Parent;
local v1 = require(l_Parent_0.React);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_SetCurrentToastMessage_0 = require(l_Parent_0.ToastRodux).Actions.SetCurrentToastMessage;
local l_Sources_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Sources;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
return function() --[[ Line: 17 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalization_0 (copy), v1 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_Sources_0 (copy), l_SetCurrentToastMessage_0 (copy)
    local v8 = l_useDispatch_0();
    local v9 = l_useLocalization_0({
        somethingIsWrongToast = "Feature.Toast.NetworkingError.SomethingIsWrong"
    });
    return (v1.useCallback(function(v10) --[[ Line: 25 ]]
        -- upvalues: v8 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_Sources_0 (ref), l_SetCurrentToastMessage_0 (ref), v9 (copy)
        local v11 = v10 and v10.callback;
        local v12 = v10 and v10.clientEventsPayload and v10.clientEventsPayload.sender_userid;
        if v12 then
            v8(l_NavigateDown_0({
                name = l_AppPage_0.TrustedContactsModal, 
                userId = v12, 
                source = l_Sources_0.StreamNotification, 
                onRequestAccepted = v11
            }, true));
            return;
        else
            v8(l_SetCurrentToastMessage_0({
                toastMessage = v9.somethingIsWrongToast, 
                isLocalized = true
            }));
            return;
        end;
    end, {
        v8, 
        v9
    }));
end;