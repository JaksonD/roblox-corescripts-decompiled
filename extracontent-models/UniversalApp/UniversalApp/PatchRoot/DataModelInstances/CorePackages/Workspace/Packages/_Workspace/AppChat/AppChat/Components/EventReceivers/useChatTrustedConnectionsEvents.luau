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
local v17 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableHiddenMessages);
return function(v18) --[[ Line: 27 ]] --[[ Name: useChatTrustedConnectionsEvents ]]
    -- upvalues: l_useDispatch_0 (copy), l_useSelector_0 (copy), v6 (copy), v10 (copy), l_useLocalUserId_0 (copy), v5 (copy), v7 (copy), v8 (copy), v15 (copy), v14 (copy), v9 (copy), v2 (copy), l_TrustedConnections_0 (copy), v16 (copy), v17 (copy)
    local v19 = l_useDispatch_0();
    local v21 = l_useSelector_0(function(v20) --[[ Line: 29 ]]
        return v20.ChatAppReducer.Conversations;
    end);
    local v22 = v6(v18.activeConversationId);
    local v23 = v10();
    local v24 = l_useLocalUserId_0();
    local v28 = v5.useCallback(function(v25) --[[ Line: 37 ]]
        -- upvalues: v22 (copy), v7 (ref), v19 (copy), v8 (ref), v23 (copy)
        if v22 and v22.participants and v22.type == v7.Type.OneToOne and v25 then
            for _, v27 in v22.participants do
                if v27 == v25 then
                    v19(v8(v22.id, v23));
                    return;
                end;
            end;
        end;
    end, {
        v19, 
        v22, 
        v23
    });
    local v33 = v5.useCallback(function(v29, v30) --[[ Line: 55 ]]
        -- upvalues: v21 (copy), v7 (ref), v15 (ref), v19 (copy), v14 (ref)
        for _, v32 in v21 do
            if v32.type == v7.Type.OneToOne and v32.participants and v32.source == v7.Source.Friends and v15.List.find(v32.participants, v29) then
                v19(v14(v32.id, v30));
                return;
            end;
        end;
    end, {
        v19, 
        v21
    });
    local v38 = v5.useCallback(function(v34) --[[ Line: 70 ]]
        -- upvalues: v21 (copy), v15 (ref), v19 (copy), v9 (ref)
        local v35 = {};
        for _, v37 in v21 do
            if v37.participants and v15.List.find(v37.participants, v34) then
                table.insert(v35, v37.id);
            end;
        end;
        if #v35 == 0 then
            return;
        else
            v19(v9(v35));
            return;
        end;
    end, {
        v19, 
        v21
    });
    v2.useRealtimeNamespace(l_TrustedConnections_0.Namespace, function(v39) --[[ Line: 86 ]]
        -- upvalues: v16 (ref), l_TrustedConnections_0 (ref), v24 (copy), v28 (copy), v33 (copy), v7 (ref), v17 (ref), v38 (copy)
        v16:debug("Received Realtime Event " .. l_TrustedConnections_0.Namespace .. " -> Actor: " .. tostring(v39.Actor) .. ", Target: " .. tostring(v39.Target) .. ", EventType: " .. tostring(v39.EventType));
        local v40 = tostring(v39.Actor);
        local v41 = tostring(v39.Target);
        local l_EventType_0 = v39.EventType;
        if l_EventType_0 == l_TrustedConnections_0.EventTypes.TrustedConnectionCreated or l_EventType_0 == l_TrustedConnections_0.EventTypes.TrustedConnectionDeleted then
            local v43 = nil;
            v43 = if v40 == v24 then v41 else v40;
            if l_EventType_0 == l_TrustedConnections_0.EventTypes.TrustedConnectionCreated then
                v28(v43);
                v33(v43, v7.ModerationType.TrustedComms);
            else
                v33(v43, v7.ModerationType.Moderated);
            end;
            if v17 then
                v38(v43);
                return;
            end;
        elseif l_EventType_0 == l_TrustedConnections_0.EventTypes.TrustedConnectionRequestSent then
            if v40 ~= v24 then
                v28(v40);
                return;
            end;
        else
            v16:debug("EventType: " .. tostring(l_EventType_0) .. " is not suppoprted.");
        end;
    end, {
        v24, 
        v28, 
        v33, 
        v38
    });
end;