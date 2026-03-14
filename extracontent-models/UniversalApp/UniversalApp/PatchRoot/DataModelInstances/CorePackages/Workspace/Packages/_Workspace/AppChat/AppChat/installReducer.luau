local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_getFFlagAppChatEnableIntervention_0 = require(l_Parent_0.InterventionShared).Flags.getFFlagAppChatEnableIntervention;
return function() --[[ Line: 7 ]]
    -- upvalues: v2 (copy), l_Parent_0 (copy), l_script_FirstAncestor_0 (copy), l_getFFlagAppChatEnableIntervention_0 (copy)
    return v2.combineReducers({
        PlaceInfos = require(l_Parent_0.PlaceInfoRodux).Reducers.PlaceInfosReducer, 
        PlaceInfosAsync = require(l_Parent_0.PlaceInfoRodux).Reducers.PlaceInfosAsyncReducer, 
        Aliases = require(script.Aliases), 
        AppLoaded = require(l_script_FirstAncestor_0.installReducer.AppLoaded), 
        ChatSettings = require(l_script_FirstAncestor_0.installReducer.ChatSettings), 
        ChatTimeouts = if l_getFFlagAppChatEnableIntervention_0() then require(l_script_FirstAncestor_0.installReducer.ChatTimeouts) else nil, 
        Conversations = require(l_script_FirstAncestor_0.installReducer.Conversations), 
        ConversationsAsync = require(l_script_FirstAncestor_0.installReducer.ConversationsAsync), 
        Friends = require(script.Friends), 
        ExternalNavigationRequest = require(l_script_FirstAncestor_0.installReducer.ExternalNavigationRequest), 
        LastEntryPoint = require(script.LastEntryPoint), 
        Modals = require(script.Modals), 
        ParticipantMetadata = require(script.ParticipantMetadata), 
        Presence = require(script.Presence), 
        ToggleChatPaused = require(l_script_FirstAncestor_0.installReducer.ToggleChatPaused), 
        networkStatus = require(l_script_FirstAncestor_0.Http.RoduxNetworking).installReducer(), 
        unreadMessageCount = require(script.UnreadMessageCount)
    });
end;