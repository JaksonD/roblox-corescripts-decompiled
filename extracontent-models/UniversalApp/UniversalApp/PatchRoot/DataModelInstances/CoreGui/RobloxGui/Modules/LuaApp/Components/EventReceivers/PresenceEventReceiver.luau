local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local v3 = require(l_CorePackages_0.Packages.Roact);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local l_llama_0 = require(l_CorePackages_0.Packages.LuaSocialLibrariesDeps).llama;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v8 = require(l_Modules_0.LuaApp.Constants);
local v9 = require(l_Modules_0.LuaApp.Thunks.Games.UpdateActivePresenceGamesDetails);
local l_SetUserPresences_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Thunks.SetUserPresences;
local v11 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v12 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v13 = require(l_Modules_0.LuaApp.ExperienceEventReceiver);
local v14 = require(script.Parent.EventNetworking);
local l_NetworkStatus_0 = v14.RoduxNetworking.Enum.NetworkStatus;
local l_NetworkingPresence_0 = v14.NetworkingPresence;
local v17 = require(l_Modules_0.LuaApp.Components.EventReceivers.JoinYourFriendsRefreshEvent);
local l_useHandlePresenceEvent_0 = require(l_CorePackages_0.Workspace.Packages.FriendsCommon).Hooks.useHandlePresenceEvent;
local v19 = require(l_Modules_0.Personalization.Flags.getFFlagLuaAppHomeJoinYourFriendsPresenceFix);
local v20 = require(l_Modules_0.LuaApp.Flags.FFlagPresencePropagationDelayMonitoringEnabledV2);
local v21 = game:DefineFastString("PresencePropagationDelayMetricName", "PresencePropagationDelay");
local l_FFlagCeaseUAPresenceRealtimeNotificationUpdatesInGame_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagCeaseUAPresenceRealtimeNotificationUpdatesInGame;
local v23 = game:DefineFastFlag("UsePresenceDataFromRtn", false);
local l_FFlagHandleSortScoreUpdatesFromRtn_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagHandleSortScoreUpdatesFromRtn;
local l_FFlagHandleMessageIdFromRtn_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagHandleMessageIdFromRtn;
game:DefineFastInt("PresenceEventReceiverErrorEventThrottleHundrethsPercent", 10000);
local v26 = {
    eventName = "PresenceEventReceiverErrorEvent", 
    backends = {
        "EventIngest"
    }, 
    throttlingPercentage = game:GetFastInt("PresenceEventReceiverErrorEventThrottleHundrethsPercent"), 
    lastUpdated = {
        25, 
        9, 
        5
    }, 
    description = "Report errors in presence event receiver"
};
local v27 = {
    eventName = "PresenceEventReceiverErrorEvent", 
    description = "Counter to track errors in PresenceEventReceiver", 
    lastUpdated = {
        2025, 
        9, 
        4
    }, 
    backends = {
        "RobloxTelemetryCounter"
    }
};
local v28 = {
    Offline = 0, 
    Online = 1, 
    InGame = 2, 
    InStudio = 3
};
local v29 = v3.PureComponent:extend("PresenceEventReceiver");
v29.defaultProps = {
    networkImpl = v14.networkImpl
};
v29.onPresencesUpdated = function(v30, v31) --[[ Line: 93 ]] --[[ Name: onPresencesUpdated ]]
    v30.props.handlePresenceEvent(v31);
    v30.props.updateActivePresenceGamesDetails(v30.props.networkImpl, v31);
end;
v29.init = function(v32) --[[ Line: 98 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagCeaseUAPresenceRealtimeNotificationUpdatesInGame_0 (copy), v13 (copy), v23 (copy), l_llama_0 (copy), l_FFlagHandleSortScoreUpdatesFromRtn_0 (copy), l_FFlagHandleMessageIdFromRtn_0 (copy), v19 (copy), v8 (copy), v17 (copy), v20 (copy), v21 (copy)
    local l_RobloxEventReceiver_0 = v32.props.RobloxEventReceiver;
    local l_analytics_0 = v32.props.analytics;
    local l_eventIngestService_0 = v32.props.eventIngestService;
    if l_FFlagCeaseUAPresenceRealtimeNotificationUpdatesInGame_0 then
        v32.state = {
            inExperience = false, 
            staleUsers = {}
        };
        v32._experienceEventReceiver = v13.new();
    end;
    if v23 then
        v32.state = v32.state or {};
        v32.state = l_llama_0.Dictionary.join(v32.state, {
            lastUpdatedTimesByUserId = {}
        });
    end;
    local v36 = v32.props.dateTimeOverride and v32.props.dateTimeOverride.now or DateTime.now;
    v32.tokens = {
        l_RobloxEventReceiver_0:observeEvent("PresenceBulkNotifications", function(v37) --[[ Line: 127 ]]
            -- upvalues: l_llama_0 (ref), l_FFlagCeaseUAPresenceRealtimeNotificationUpdatesInGame_0 (ref), v32 (copy), v23 (ref), l_FFlagHandleSortScoreUpdatesFromRtn_0 (ref), l_FFlagHandleMessageIdFromRtn_0 (ref), v19 (ref), v8 (ref), v17 (ref), v20 (ref), v36 (copy), l_analytics_0 (copy), v21 (ref), l_eventIngestService_0 (copy)
            local v39 = l_llama_0.List.map(v37, function(v38) --[[ Line: 128 ]]
                return (tostring(v38.UserId));
            end);
            if l_FFlagCeaseUAPresenceRealtimeNotificationUpdatesInGame_0 and v32.state.inExperience then
                local v40 = {};
                for _, v42 in pairs(v39) do
                    v40[v42] = true;
                end;
                v32:setState({
                    staleUsers = l_llama_0.Dictionary.join(v32.state.staleUsers, v40)
                });
                return;
            else
                if v23 then
                    local v43 = {};
                    local v44 = if l_FFlagHandleSortScoreUpdatesFromRtn_0 then {} else nil;
                    local v45 = {};
                    local v46 = {};
                    local v47 = nil;
                    for _, v49 in pairs(v37) do
                        local v50 = if v49.SessionStarted ~= nil then DateTime.fromIsoDate(v49.SessionStarted) else nil;
                        local v51 = v32.state.lastUpdatedTimesByUserId[tostring(v49.UserId)];
                        if v49.PresenceReport and v50 and (not l_FFlagHandleSortScoreUpdatesFromRtn_0 or v49.SortScore) and (v51 == nil or v51 < v50.UnixTimestampMillis) then
                            table.insert(v43, v49.PresenceReport);
                            v46[tostring(v49.UserId)] = v50.UnixTimestampMillis;
                            if l_FFlagHandleSortScoreUpdatesFromRtn_0 then
                                v44[tostring(v49.UserId)] = v49.SortScore;
                                if l_FFlagHandleMessageIdFromRtn_0 and v49.RtnMessageId then
                                    v47 = v49.RtnMessageId;
                                end;
                            end;
                        else
                            table.insert(v45, (tostring(v49.UserId)));
                        end;
                    end;
                    if #v45 > 0 then
                        v32.props.updateUserPresences(v45):andThen(function(v52) --[[ Line: 187 ]]
                            -- upvalues: l_llama_0 (ref), v43 (copy), l_FFlagHandleSortScoreUpdatesFromRtn_0 (ref), v32 (ref)
                            local v53 = l_llama_0.List.join(v52, v43);
                            if l_FFlagHandleSortScoreUpdatesFromRtn_0 then
                                v32.props.refetchOnlineFriends();
                                v32.props.updateActivePresenceGamesDetails(v32.props.networkImpl, v52);
                                return;
                            else
                                v32:onPresencesUpdated(v53);
                                return;
                            end;
                        end);
                    else
                        v32.props.setUserPresences(v43);
                        if l_FFlagHandleSortScoreUpdatesFromRtn_0 then
                            if l_FFlagHandleMessageIdFromRtn_0 then
                                v32.props.handlePresenceEvent(v43, v44, v47);
                            else
                                v32.props.handlePresenceEvent(v43, v44);
                            end;
                            v32.props.updateActivePresenceGamesDetails(v32.props.networkImpl, v43);
                        else
                            v32:onPresencesUpdated(v43);
                        end;
                    end;
                    v32:setState({
                        lastUpdatedTimesByUserId = l_llama_0.Dictionary.join(v32.state.lastUpdatedTimesByUserId, v46)
                    });
                else
                    v32.props.updateUserPresences(v39):andThen(function(v54) --[[ Line: 217 ]]
                        -- upvalues: v32 (ref)
                        v32.props.handlePresenceEvent(v54);
                        v32.props.updateActivePresenceGamesDetails(v32.props.networkImpl, v54);
                    end);
                end;
                for _, v56 in v37 do
                    local l_Type_0 = v56.Type;
                    if v19() then
                        local v58 = tostring(v56.UserId);
                        if l_Type_0 == v8.PresenceSignal.EventType and v58 ~= v32.props.localUserId then
                            v17:Fire();
                            return;
                        end;
                    elseif l_Type_0 == v8.PresenceSignal.EventType then
                        v17:Fire();
                        return;
                    end;
                    if v20 and v56.SessionStarted ~= nil then
                        local v59 = DateTime.fromIsoDate(v56.SessionStarted);
                        if v59 ~= nil then
                            local l_UnixTimestampMillis_0 = v36().UnixTimestampMillis;
                            local l_UnixTimestampMillis_1 = v59.UnixTimestampMillis;
                            local v62 = l_UnixTimestampMillis_0 - l_UnixTimestampMillis_1;
                            l_analytics_0.Diag:reportStats(v21, v62);
                            l_eventIngestService_0:sendEventDeferred("PresenceEventReceiver", "PresencePropagationDelay", {
                                deviceCurrentTimestampEpochMs = l_UnixTimestampMillis_0, 
                                sessionChangedTimestampEpochMs = l_UnixTimestampMillis_1
                            });
                        end;
                    end;
                end;
                return;
            end;
        end)
    };
    if l_FFlagCeaseUAPresenceRealtimeNotificationUpdatesInGame_0 then
        table.insert(v32.tokens, v32._experienceEventReceiver:onLaunched(function() --[[ Line: 269 ]]
            -- upvalues: v32 (copy)
            v32:onExperienceJoin();
        end));
        table.insert(v32.tokens, v32._experienceEventReceiver:onLeft(function() --[[ Line: 275 ]]
            -- upvalues: v32 (copy)
            v32:onExperienceLeave();
        end));
    end;
end;
v29.render = function(_) --[[ Line: 282 ]] --[[ Name: render ]]
    return nil;
end;
v29.willUnmount = function(v64) --[[ Line: 286 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_FFlagCeaseUAPresenceRealtimeNotificationUpdatesInGame_0 (copy)
    for _, v66 in pairs(v64.tokens) do
        v66:disconnect();
    end;
    if l_FFlagCeaseUAPresenceRealtimeNotificationUpdatesInGame_0 then
        v64._experienceEventReceiver:UnsubscribeFromAllMessages();
    end;
end;
v29.onExperienceJoin = function(v67) --[[ Line: 296 ]] --[[ Name: onExperienceJoin ]]
    v67:setState({
        inExperience = true
    });
end;
local function v76(v68, v69) --[[ Line: 302 ]]
    -- upvalues: v28 (copy), l_llama_0 (copy)
    local v70 = v68 and v68.data and v68.data.onlineFriendsByUserId or {};
    local v71 = {};
    for v72, _ in pairs(v69) do
        v71[v72] = {
            userId = tonumber(v72), 
            userPresenceType = v28.Offline, 
            lastLocation = "Website"
        };
    end;
    for _, v75 in pairs(v70) do
        if v75.presence then
            v71[v75.id] = {
                userId = tonumber(v75.id), 
                userPresenceType = v28[v75.presence.userPresenceType] or 0, 
                lastLocation = v75.presence.lastLocation or "", 
                gameId = v75.presence.gameId, 
                placeId = tonumber(v75.presence.placeId), 
                rootPlaceId = tonumber(v75.presence.rootPlaceId), 
                universeId = tonumber(v75.presence.universeId), 
                lastOnline = v75.presence.lastOnline
            };
        end;
    end;
    return l_llama_0.Dictionary.values(v71);
end;
v29.onExperienceLeave = function(v77) --[[ Line: 335 ]] --[[ Name: onExperienceLeave ]]
    -- upvalues: v76 (copy), l_TelemetryService_0 (copy), v27 (copy), v26 (copy)
    v77:setState({
        inExperience = false
    });
    v77.props.refetchOnlineFriends():andThen(function(v78) --[[ Line: 342 ]]
        -- upvalues: v76 (ref), v77 (copy)
        local v79 = v76(v78, v77.state.staleUsers);
        v77.props.setUserPresences(v79);
        v77.props.updateActivePresenceGamesDetails(v77.props.networkImpl, v79);
        v77:setState({
            staleUsers = {}
        });
    end):catch(function(v80) --[[ Line: 351 ]]
        -- upvalues: l_TelemetryService_0 (ref), v27 (ref), v26 (ref)
        warn("Failed to refetch online friends after leaving experience:", v80.error);
        l_TelemetryService_0:LogCounter(v27);
        l_TelemetryService_0:LogEvent(v26, {
            errorMessage = v80.error
        });
    end);
end;
local function _(v81, v82) --[[ Line: 360 ]]
    -- upvalues: l_llama_0 (copy), l_NetworkingPresence_0 (copy), l_NetworkStatus_0 (copy)
    return l_llama_0.List.filter(v82, function(v83) --[[ Line: 361 ]]
        -- upvalues: l_NetworkingPresence_0 (ref), v81 (copy), l_NetworkStatus_0 (ref)
        return l_NetworkingPresence_0.GetPresencesFromUserIds.getStatus(v81, v83) ~= l_NetworkStatus_0.Fetching;
    end);
end;
local function _(v85) --[[ Line: 366 ]]
    -- upvalues: l_llama_0 (copy), l_NetworkingPresence_0 (copy), l_NetworkStatus_0 (copy)
    return function(v86) --[[ Line: 367 ]]
        -- upvalues: v85 (copy), l_llama_0 (ref), l_NetworkingPresence_0 (ref), l_NetworkStatus_0 (ref)
        local v87 = v86:getState();
        local l_v85_0 = v85;
        local v90 = l_llama_0.List.filter(l_v85_0, function(v89) --[[ Line: 361 ]]
            -- upvalues: l_NetworkingPresence_0 (ref), v87 (copy), l_NetworkStatus_0 (ref)
            return l_NetworkingPresence_0.GetPresencesFromUserIds.getStatus(v87, v89) ~= l_NetworkStatus_0.Fetching;
        end);
        return v86:dispatch(l_NetworkingPresence_0.GetPresencesFromUserIds.API(v90)):andThen(function(v91) --[[ Line: 371 ]]
            return v91.responseBody.userPresences or {};
        end);
    end;
end;
v29 = l_RoactServices_0.connect({
    analytics = v11, 
    eventIngestService = v12
})(v29);
v29 = v5.connect(function(v93, _) --[[ Line: 382 ]]
    -- upvalues: v19 (copy)
    return {
        localUserId = if v19() then v93.LocalUserId else nil
    };
end, function(v95) --[[ Line: 386 ]]
    -- upvalues: l_llama_0 (copy), l_NetworkingPresence_0 (copy), l_NetworkStatus_0 (copy), l_SetUserPresences_0 (copy), l_FFlagCeaseUAPresenceRealtimeNotificationUpdatesInGame_0 (copy), l_FFlagHandleSortScoreUpdatesFromRtn_0 (copy), v23 (copy), v9 (copy)
    return {
        updateUserPresences = function(v96) --[[ Line: 388 ]] --[[ Name: updateUserPresences ]]
            -- upvalues: v95 (copy), l_llama_0 (ref), l_NetworkingPresence_0 (ref), l_NetworkStatus_0 (ref), l_SetUserPresences_0 (ref)
            return v95(function(v97) --[[ Line: 367 ]]
                -- upvalues: v96 (copy), l_llama_0 (ref), l_NetworkingPresence_0 (ref), l_NetworkStatus_0 (ref)
                local v98 = v97:getState();
                local l_v96_0 = v96;
                local v101 = l_llama_0.List.filter(l_v96_0, function(v100) --[[ Line: 361 ]]
                    -- upvalues: l_NetworkingPresence_0 (ref), v98 (copy), l_NetworkStatus_0 (ref)
                    return l_NetworkingPresence_0.GetPresencesFromUserIds.getStatus(v98, v100) ~= l_NetworkStatus_0.Fetching;
                end);
                return v97:dispatch(l_NetworkingPresence_0.GetPresencesFromUserIds.API(v101)):andThen(function(v102) --[[ Line: 371 ]]
                    return v102.responseBody.userPresences or {};
                end);
            end):andThen(function(v103) --[[ Line: 389 ]]
                -- upvalues: v95 (ref), l_SetUserPresences_0 (ref)
                v95(l_SetUserPresences_0(v103));
                return v103;
            end);
        end, 
        setUserPresences = (not not l_FFlagCeaseUAPresenceRealtimeNotificationUpdatesInGame_0 or l_FFlagHandleSortScoreUpdatesFromRtn_0 or v23) and function(v104) --[[ Line: 397 ]]
            -- upvalues: v95 (copy), l_SetUserPresences_0 (ref)
            v95(l_SetUserPresences_0(v104));
        end or nil, 
        updateActivePresenceGamesDetails = function(v105, v106) --[[ Line: 401 ]] --[[ Name: updateActivePresenceGamesDetails ]]
            -- upvalues: v95 (copy), v9 (ref)
            v95(v9(v105, v106));
        end
    };
end)(v29);
return function(v107) --[[ Line: 407 ]]
    -- upvalues: l_useHandlePresenceEvent_0 (copy), v3 (copy), v29 (ref), l_llama_0 (copy), l_FFlagCeaseUAPresenceRealtimeNotificationUpdatesInGame_0 (copy), l_FFlagHandleSortScoreUpdatesFromRtn_0 (copy)
    local v108 = l_useHandlePresenceEvent_0();
    return v3.createElement(v29, l_llama_0.Dictionary.join(v107, if not not l_FFlagCeaseUAPresenceRealtimeNotificationUpdatesInGame_0 or l_FFlagHandleSortScoreUpdatesFromRtn_0 then {
        handlePresenceEvent = v108.handleNewEvent, 
        refetchOnlineFriends = v108.refetchOnlineFriends
    } else {
        handlePresenceEvent = v108
    }));
end;