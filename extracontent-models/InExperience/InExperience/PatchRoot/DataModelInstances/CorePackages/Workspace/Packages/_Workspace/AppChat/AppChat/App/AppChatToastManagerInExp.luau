local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Components.EventReceivers.AppChatToastEventReceiver);
local v3 = require(l_script_FirstAncestor_0.Actions.EnteredChatFromEntryPoint);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.RoactUtils);
local v7 = require(l_Parent_0.SocialCommon);
local l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatInExpToastSnoozeMenuDismissFix;
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
local v10 = {
    hideAllChatToasts = false, 
    isAppChatVisible = false
};
AppChatToastManagerInExp = function(v11) --[[ Line: 28 ]] --[[ Name: AppChatToastManagerInExp ]]
    -- upvalues: v4 (copy), v10 (copy), l_useDispatch_0 (copy), v5 (copy), v3 (copy), v7 (copy), v2 (copy), l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0 (copy)
    local v12 = v4.Dictionary.join(v10, v11);
    local v13 = l_useDispatch_0();
    local v15 = v5.useCallback(function(v14) --[[ Line: 33 ]]
        -- upvalues: v12 (copy), v13 (copy), v3 (ref), v7 (ref)
        v12.navigateToChat(v14);
        v13(v3(v7.Enums.ChatEntryPointNames.ToastInExp));
    end, {
        v13, 
        v12.navigateToChat
    });
    return v5.createElement(v2, {
        navigateToChat = v15, 
        hideAllChatToasts = if l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0() then nil else v12.hideAllChatToasts, 
        isAppChatVisible = if l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0() then v12.isAppChatVisible else nil, 
        isInExperience = true
    });
end;
return AppChatToastManagerInExp;