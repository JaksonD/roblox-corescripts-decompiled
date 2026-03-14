local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RealtimeDelivery);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v5 = require(l_Parent_0.React);
local v6 = require(l_script_FirstAncestor_0.Hooks.useGetConversationFromId);
local v7 = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v8 = require(l_script_FirstAncestor_0.Conversations.Thunks.refreshConversationUnfilteredThreadsDetails);
local v9 = require(l_script_FirstAncestor_0.Conversations.Thunks.reloadMessagesForConversations);
local v10 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local l_TrustedConnections_0 = require(script.Parent.Constants).TrustedConnections;
local _ = require(script.Parent.TrustedConnectionsNotificationTypes);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v14 = require(l_script_FirstAncestor_0.Conversations.Actions.ConversationModerationTypeChanged);
local v15 = require(l_Parent_0.Cryo);
local v16 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v17 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatReloadMessagesOnTrustedConnectionRTN);
local v18 = game:DefineFastFlag("AppChatTrustedConnectionRTNEventTypeNameFix", false);
return function(v19) --[[ Line: 30 ]] --[[ Name: useChatTrustedConnectionsEvents ]]
    -- upvalues: l_useDispatch_0 (copy), l_useSelector_0 (copy), v6 (copy), v10 (copy), l_useLocalUserId_0 (copy), v5 (copy), v7 (copy), v8 (copy), v15 (copy), v14 (copy), v9 (copy), v2 (copy), l_TrustedConnections_0 (copy), v18 (copy), v16 (copy), v17 (copy)
    local v20 = l_useDispatch_0();
    local v22 = l_useSelector_0(function(v21) --[[ Line: 32 ]]
        return v21.ChatAppReducer.Conversations;
    end);
    local v23 = v6(v19.activeConversationId);
    local v24 = v10();
    local v25 = l_useLocalUserId_0();
    local v29 = v5.useCallback(function(v26) --[[ Line: 40 ]]
        -- upvalues: v23 (copy), v7 (ref), v20 (copy), v8 (ref), v24 (copy)
        if v23 and v23.participants and v23.type == v7.Type.OneToOne and v26 then
            for _, v28 in v23.participants do
                if v28 == v26 then
                    v20(v8(v23.id, v24));
                    return;
                end;
            end;
        end;
    end, {
        v20, 
        v23, 
        v24
    });
    local v34 = v5.useCallback(function(v30, v31) --[[ Line: 58 ]]
        -- upvalues: v22 (copy), v7 (ref), v15 (ref), v20 (copy), v14 (ref)
        for _, v33 in v22 do
            if v33.type == v7.Type.OneToOne and v33.participants and v33.source == v7.Source.Friends and v15.List.find(v33.participants, v30) then
                v20(v14(v33.id, v31));
                return;
            end;
        end;
    end, {
        v20, 
        v22
    });
    local v39 = v5.useCallback(function(v35) --[[ Line: 73 ]]
        -- upvalues: v22 (copy), v15 (ref), v20 (copy), v9 (ref)
        local v36 = {};
        for _, v38 in v22 do
            if v38.participants and v15.List.find(v38.participants, v35) then
                table.insert(v36, v38.id);
            end;
        end;
        if #v36 == 0 then
            return;
        else
            v20(v9(v36));
            return;
        end;
    end, {
        v20, 
        v22
    });
    v2.useRealtimeNamespace(l_TrustedConnections_0.Namespace, function(v40) --[[ Line: 89 ]]
        -- upvalues: v18 (ref), v16 (ref), l_TrustedConnections_0 (ref), v25 (copy), v29 (copy), v34 (copy), v7 (ref), v17 (ref), v39 (copy)
        if v18 then
            v16:debug("Received Realtime Event " .. l_TrustedConnections_0.Namespace .. " -> Actor: " .. tostring(v40.Actor) .. ", Target: " .. tostring(v40.Target) .. ", EventType: " .. tostring(v40.EventType));
        end;
        local v41 = tostring(v40.Actor);
        local v42 = tostring(v40.Target);
        local v43 = if v18 then v40.EventType else v40.eventType;
        if v43 == l_TrustedConnections_0.EventTypes.TrustedConnectionCreated or v43 == l_TrustedConnections_0.EventTypes.TrustedConnectionDeleted then
            local v44 = nil;
            v44 = if v41 == v25 then v42 else v41;
            if v43 == l_TrustedConnections_0.EventTypes.TrustedConnectionCreated then
                v29(v44);
                v34(v44, v7.ModerationType.TrustedComms);
            else
                v34(v44, v7.ModerationType.Moderated);
            end;
            if v17 then
                v39(v44);
                return;
            end;
        elseif v43 == l_TrustedConnections_0.EventTypes.TrustedConnectionRequestSent then
            if v41 ~= v25 then
                v29(v41);
                return;
            end;
        elseif v18 then
            v16:debug("EventType: " .. tostring(v43) .. " is not suppoprted.");
        end;
    end, {
        v25, 
        v29, 
        v34, 
        v39
    });
end;