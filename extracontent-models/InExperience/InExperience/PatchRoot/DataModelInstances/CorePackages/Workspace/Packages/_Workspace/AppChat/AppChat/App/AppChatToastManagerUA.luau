local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Components.EventReceivers.AppChatToastEventReceiver);
local v3 = require(l_script_FirstAncestor_0.Actions.EnteredChatFromEntryPoint);
local v4 = require(l_script_FirstAncestor_0.Conversations.Thunks.NavigateIntoChat);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.RoactUtils);
local v7 = require(l_Parent_0.SocialCommon);
local v8 = require(l_script_FirstAncestor_0.Components.OSA.OverlayHost);
local l_FFlagAppChatGroupOsaDialogHost_0 = require(l_Parent_0.SharedFlags).FFlagAppChatGroupOsaDialogHost;
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
AppChatToastManagerUA = function() --[[ Line: 17 ]] --[[ Name: AppChatToastManagerUA ]]
    -- upvalues: l_useDispatch_0 (copy), v5 (copy), v4 (copy), v3 (copy), v7 (copy), v2 (copy), l_FFlagAppChatGroupOsaDialogHost_0 (copy), v8 (copy)
    local v11 = l_useDispatch_0();
    local v13 = v5.useCallback(function(v12) --[[ Line: 20 ]]
        -- upvalues: v11 (copy), v4 (ref), v3 (ref), v7 (ref)
        v11(v4({
            conversationId = v12
        }, true));
        v11(v3(v7.Enums.ChatEntryPointNames.ToastUniversalApp));
    end, {
        v11
    });
    return v5.createElement(v5.Fragment, nil, {
        ToastEventReceiver = v5.createElement(v2, {
            navigateToChat = v13
        }), 
        OverlayHost = if l_FFlagAppChatGroupOsaDialogHost_0 then v5.createElement(v8) else nil
    });
end;
return AppChatToastManagerUA;