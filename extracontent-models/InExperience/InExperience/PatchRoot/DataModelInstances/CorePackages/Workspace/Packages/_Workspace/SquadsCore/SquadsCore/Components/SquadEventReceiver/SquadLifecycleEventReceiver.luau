local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_MessageBusService_0 = game:GetService("MessageBusService");
local v3 = require(l_script_FirstAncestor_0.Common.Constants);
local v4 = require(l_script_FirstAncestor_0.Logger);
local v5 = require(l_script_FirstAncestor_0.RoduxSquads);
local v6 = require(l_script_FirstAncestor_0.Components.SquadExternalContractProvider.SquadExternalContractContext);
local v7 = require(l_script_FirstAncestor_0.Enums.SquadState);
local v8 = require(l_script_FirstAncestor_0.Components.SquadExternalContractProvider.SquadViewFlags);
local v9 = require(l_script_FirstAncestor_0.Thunks.fetchActiveSquad);
local v10 = require(l_script_FirstAncestor_0.Utils.serializeTable);
local v11 = require(l_script_FirstAncestor_0.Hooks.useSquadState);
local v12 = require(l_Parent_0.React);
local v13 = require(l_Parent_0.RealtimeDelivery);
local v14 = require(l_Parent_0.LuauPolyfill);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_clearInterval_0 = v14.clearInterval;
local l_clearTimeout_0 = v14.clearTimeout;
local l_setInterval_0 = v14.setInterval;
local l_setTimeout_0 = v14.setTimeout;
local v21 = game:DefineFastInt("ActiveSquadPollingCardIntervalSeconds", 30);
local v22 = game:DefineFastInt("ActiveSquadPollingLobbyIntervalSeconds", 60);
local v23 = game:DefineFastInt("ActiveSquadPollingIdleIntervalSeconds", 120);
local v24 = game:DefineFastInt("ActiveSquadInitPollingDelaySeconds", 3);
local l_l_MessageBusService_0_MessageId_0 = l_MessageBusService_0:GetMessageId("Realtime", "appResume");
return function(v26) --[[ Line: 41 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), v12 (copy), v6 (copy), v11 (copy), l_setTimeout_0 (copy), v9 (copy), v24 (copy), l_clearTimeout_0 (copy), v8 (copy), v21 (copy), v22 (copy), v23 (copy), l_setInterval_0 (copy), l_clearInterval_0 (copy), v13 (copy), v3 (copy), v4 (copy), v10 (copy), v5 (copy), v7 (copy), l_MessageBusService_0 (copy), l_l_MessageBusService_0_MessageId_0 (copy)
    local v27 = l_useDispatch_0();
    local v28 = tonumber(l_useLocalUserId_0()) or 0;
    local v29, v30 = v12.useState(false);
    local v31 = v12.useContext(v6).useSquadViewFlags();
    local v32 = v11();
    local v33, v34 = v12.useState(-1);
    v12.useEffect(function() --[[ Line: 54 ]]
        -- upvalues: v30 (copy), v26 (copy), l_setTimeout_0 (ref), v27 (copy), v9 (ref), v24 (ref), l_clearTimeout_0 (ref)
        v30(false);
        local v35 = if v26.currentSquadId ~= "" then l_setTimeout_0(function() --[[ Line: 57 ]]
            -- upvalues: v27 (ref), v9 (ref), v30 (ref)
            v27(v9());
            v30(true);
        end, v24 * 1000) else nil;
        return function() --[[ Line: 63 ]]
            -- upvalues: v35 (copy), l_clearTimeout_0 (ref)
            if v35 then
                l_clearTimeout_0(v35);
            end;
        end;
    end, {
        v26.currentSquadId
    });
    v12.useEffect(function() --[[ Line: 73 ]]
        -- upvalues: v31 (copy), v8 (ref), v21 (ref), v22 (ref), v23 (ref), v29 (copy), v26 (copy), l_setInterval_0 (ref), v27 (copy), v9 (ref), l_clearInterval_0 (ref)
        local v36 = nil;
        v36 = if bit32.band(v31, v8.SquadSystemMessage) ~= 0 then v21 else if bit32.band(v31, v8.SquadLobby) ~= 0 then v22 else v23;
        local v37 = nil;
        v37 = if v29 and v26.currentSquadId ~= "" then l_setInterval_0(function() --[[ Line: 85 ]]
            -- upvalues: v27 (ref), v9 (ref)
            v27(v9());
        end, v36 * 1000) else nil;
        return function() --[[ Line: 90 ]]
            -- upvalues: v37 (ref), l_clearInterval_0 (ref)
            if v37 then
                l_clearInterval_0(v37);
            end;
        end;
    end, {
        v26.currentSquadId, 
        v31, 
        v33, 
        v29
    });
    local v39 = v12.useCallback(function(v38) --[[ Line: 101 ]]
        -- upvalues: v33 (copy), v27 (copy), v9 (ref), v34 (copy)
        if v33 < v38 then
            v27(v9()):andThen(function() --[[ Line: 103 ]]
                -- upvalues: v34 (ref), v38 (copy)
                v34(v38);
            end);
        end;
    end, {
        v27, 
        v9, 
        v34, 
        v33
    });
    v13.useRealtimeNamespace(v3.COMMUNICATION_CHANNEL_RTN_NAMESPACE, function(v40) --[[ Line: 110 ]]
        -- upvalues: v3 (ref), v4 (ref), v10 (ref), v26 (copy), v28 (copy), v27 (copy), v5 (ref), v39 (copy), v32 (copy), v7 (ref)
        if v40.ChannelType == v3.SQUAD_CHANNEL_TYPE then
            v4:debug("Squad RTN received. Detail: {}, CurrentSquadId: {}, LocalUserId: {}", v10(v40), v26.currentSquadId, v28);
            if v26.currentSquadId == v40.ChannelId then
                if v40.Type == v3.CHANNEL_LOCAL_USER_REMOVED_DETAIL_TYPE or v40.Type == v3.CHANNEL_DELETED_DETAIL_TYPE then
                    v27(v5.Actions.CurrentSquadUpdated(nil));
                    return;
                elseif v40.Type == v3.CHANNEL_PARTICIPANT_ADDED_DETAIL_TYPE or v40.Type == v3.CHANNEL_PARTICIPANT_REMOVED_DETAIL_TYPE or v40.Type == v3.CHANNEL_UPDATED_DETAIL_TYPE or v40.Type == v3.CHANNEL_PARTICIPANT_INVITED_DETAIL_TYPE then
                    v39(v40.SequenceNumber);
                    return;
                end;
            elseif v32 ~= v7.Initializing then
                local v41 = v40.Actor and v40.Actor.Type == "User" and v40.Actor.Id == tostring(v28);
                if v40.Type == v3.CHANNEL_CREATED_DETAIL_TYPE and v41 then
                    v39(v40.SequenceNumber);
                    return;
                elseif v40.Type == v3.CHANNEL_LOCAL_USER_ADDED_DETAIL_TYPE then
                    v39(v40.SequenceNumber);
                end;
            end;
        end;
    end, {
        v26.currentSquadId, 
        v27, 
        v28, 
        v39, 
        v32
    });
    v12.useEffect(function() --[[ Line: 166 ]]
        -- upvalues: l_MessageBusService_0 (ref), l_l_MessageBusService_0_MessageId_0 (ref), v26 (copy), v27 (copy), v9 (ref)
        local v42 = l_MessageBusService_0:Subscribe(l_l_MessageBusService_0_MessageId_0, function() --[[ Line: 167 ]]
            -- upvalues: v26 (ref), v27 (ref), v9 (ref)
            if v26.currentSquadId ~= "" then
                v27(v9());
            end;
        end, false, true);
        return function() --[[ Line: 172 ]]
            -- upvalues: v42 (copy)
            if v42 then
                v42:Disconnect();
            end;
        end;
    end, {
        v26.currentSquadId, 
        v27
    });
    return nil;
end;