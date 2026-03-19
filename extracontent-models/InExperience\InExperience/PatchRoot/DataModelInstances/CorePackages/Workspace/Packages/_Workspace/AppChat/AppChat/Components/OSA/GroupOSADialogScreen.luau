local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_API_0 = require(l_Parent_0.AppChatNetworking).rodux.GetConversationDetails.API;
local v6 = require(l_script_FirstAncestor_0.Conversations.Actions.RemovedConversation);
local v7 = require(l_script_FirstAncestor_0.EnumScreens);
local v8 = require(script.Parent.GroupOSADialog);
local v9 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatGroupOsaAnalytics);
local v10 = game:DefineFastFlag("AppChatGroupOsaDisablePortal", false);
local l_FFlagAppChatLiftPostAPICallActionsUp_0 = require(l_Parent_0.SharedFlags).FFlagAppChatLiftPostAPICallActionsUp;
return function() --[[ Line: 19 ]] --[[ Name: GroupOSADialogScreen ]]
    -- upvalues: l_useNavigation_0 (copy), l_FFlagAppChatLiftPostAPICallActionsUp_0 (copy), l_useDispatch_0 (copy), v9 (copy), v2 (copy), l_API_0 (copy), v7 (copy), v6 (copy), v8 (copy), v10 (copy)
    local v12 = l_useNavigation_0();
    local v13 = if l_FFlagAppChatLiftPostAPICallActionsUp_0 then l_useDispatch_0() else nil;
    local v14 = v12.getParam("conversationId", nil);
    local v15 = if v9 then v12.getParam("impressionId", nil) else nil;
    local v16 = v12.getParam("modalVariant", nil);
    local v17 = v2.useCallback(function() --[[ Line: 26 ]]
        -- upvalues: v12 (copy)
        if v12.isFocused() then
            v12.goBack();
        end;
    end, {
        v12
    });
    local v18 = v2.useCallback(function() --[[ Line: 32 ]]
        -- upvalues: l_FFlagAppChatLiftPostAPICallActionsUp_0 (ref), v14 (copy), v13 (copy), l_API_0 (ref), v12 (copy), v7 (ref)
        if l_FFlagAppChatLiftPostAPICallActionsUp_0 and v14 then
            v13(l_API_0(v14));
        end;
        v12.navigate(v7.ChatConversation, {
            conversationId = v14, 
            isNavigatedFromGroupOSAJoin = true
        });
    end, {
        v12, 
        v14, 
        if l_FFlagAppChatLiftPostAPICallActionsUp_0 then v13 else nil
    });
    local v19 = v2.useCallback(function() --[[ Line: 43 ]]
        -- upvalues: l_FFlagAppChatLiftPostAPICallActionsUp_0 (ref), v14 (copy), v13 (copy), v6 (ref), v12 (copy)
        if l_FFlagAppChatLiftPostAPICallActionsUp_0 and v14 then
            v13(v6(v14));
        end;
        if v12.isFocused() then
            v12.goBack();
        end;
    end, {
        v12, 
        if l_FFlagAppChatLiftPostAPICallActionsUp_0 then v13 else nil, 
        if l_FFlagAppChatLiftPostAPICallActionsUp_0 then v14 else nil
    });
    return v2.createElement(v8, {
        conversationId = v14, 
        onClose = v17, 
        onJoin = v18, 
        onDecline = v19, 
        disablePortal = v10, 
        impressionId = v15, 
        modalVariant = v16
    });
end;