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
game:DefineFastInt("PresenceEventReceiverErrorEventThrottleHundrethsPercent", 10000);
local v25 = {
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
local v26 = {
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
local v27 = {
    Offline = 0, 
    Online = 1, 
    InGame = 2, 
    InStudio = 3
};
local v28 = v3.PureComponent:extend("PresenceEventReceiver");
v28.defaultProps = {
    networkImpl = v14.networkImpl
};
v28.onPresencesUpdated = function(v29, v30) --[[ Line: 91 ]] --[[ Name: onPresencesUpdated ]]
    v29.props.handlePresenceEvent(v30);
    v29.props.updateActivePresenceGamesDetails(v29.props.networkImpl, v30);
end;
v28.init = function(v31) --[[ Line: 96 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagCeaseUAPresenceRealtimeNotificationUpdatesInGame_0 (copy), v13 (copy), v23 (copy), l_llama_0 (copy), l_FFlagHandleSortScoreUpdatesFromRtn_0 (copy), v19 (copy), v8 (copy), v17 (copy), v20 (copy), v21 (copy)
    local l_RobloxEventReceiver_0 = v31.props.RobloxEventReceiver;
    local l_analytics_0 = v31.props.analytics;
    local l_eventIngestService_0 = v31.props.eventIngestService;
    if l_FFlagCeaseUAPresenceRealtimeNotificationUpdatesInGame_0 then
        v31.state = {
            inExperience = false, 
            staleUsers = {}
        };
        v31._experienceEventReceiver = v13.new();
    end;
    if v23 then
        v31.state = v31.state or {};
        v31.state = l_llama_0.Dictionary.join(v31.state, {
            lastUpdatedTimesByUserId = {}
        });
    end;
    local v35 = v31.props.dateTimeOverride and v31.props.dateTimeOverride.now or DateTime.now;
    v31.tokens = {
        l_RobloxEventReceiver_0:observeEvent("PresenceBulkNotifications", function(v36) --[[ Line: 125 ]]
            -- upvalues: l_llama_0 (ref), l_FFlagCeaseUAPresenceRealtimeNotificationUpdatesInGame_0 (ref), v31 (copy), v23 (ref), l_FFlagHandleSortScoreUpdatesFromRtn_0 (ref), v19 (ref), v8 (ref), v17 (ref), v20 (ref), v35 (copy), l_analytics_0 (copy), v21 (ref), l_eventIngestService_0 (copy)
            local v38 = l_llama_0.List.map(v36, function(v37) --[[ Line: 126 ]]
                return (tostring(v37.UserId));
            end);
            if l_FFlagCeaseUAPresenceRealtimeNotificationUpdatesInGame_0 and v31.state.inExperience then
                local v39 = {};
                for _, v41 in pairs(v38) do
                    v39[v41] = true;
                end;
                v31:setState({
                    staleUsers = l_llama_0.Dictionary.join(v31.state.staleUsers, v39)
                });
                return;
            else
                if v23 then
                    local v42 = {};
                    local v43 = if l_FFlagHandleSortScoreUpdatesFromRtn_0 then {} else nil;
                    local v44 = {};
                    local v45 = {};
                    for _, v47 in pairs(v36) do
                        local v48 = if v47.SessionStarted ~= nil then DateTime.fromIsoDate(v47.SessionStarted) else nil;
                        local v49 = v31.state.lastUpdatedTimesByUserId[tostring(v47.UserId)];
                        if v47.PresenceReport and v48 and (not l_FFlagHandleSortScoreUpdatesFromRtn_0 or v47.SortScore) and (v49 == nil or v49 < v48.UnixTimestampMillis) then
                            table.insert(v42, v47.PresenceReport);
                            v45[tostring(v47.UserId)] = v48.UnixTimestampMillis;
                            if l_FFlagHandleSortScoreUpdatesFromRtn_0 then
                                v43[tostring(v47.UserId)] = v47.SortScore;
                            end;
                        else
                            table.insert(v44, (tostring(v47.UserId)));
                        end;
                    end;
                    if #v44 > 0 then
                        v31.props.updateUserPresences(v44):andThen(function(v50) --[[ Line: 179 ]]
                            -- upvalues: l_llama_0 (ref), v42 (copy), l_FFlagHandleSortScoreUpdatesFromRtn_0 (ref), v31 (ref)
                            local v51 = l_llama_0.List.join(v50, v42);
                            if l_FFlagHandleSortScoreUpdatesFromRtn_0 then
                                v31.props.refetchOnlineFriends();
                                v31.props.updateActivePresenceGamesDetails(v31.props.networkImpl, v50);
                                return;
                            else
                                v31:onPresencesUpdated(v51);
                                return;
                            end;
                        end);
                    else
                        v31.props.setUserPresences(v42);
                        if l_FFlagHandleSortScoreUpdatesFromRtn_0 then
                            v31.props.handlePresenceEvent(v42, v43);
                            v31.props.updateActivePresenceGamesDetails(v31.props.networkImpl, v42);
                        else
                            v31:onPresencesUpdated(v42);
                        end;
                    end;
                    v31:setState({
                        lastUpdatedTimesByUserId = l_llama_0.Dictionary.join(v31.state.lastUpdatedTimesByUserId, v45)
                    });
                else
                    v31.props.updateUserPresences(v38):andThen(function(v52) --[[ Line: 205 ]]
                        -- upvalues: v31 (ref)
                        v31.props.handlePresenceEvent(v52);
                        v31.props.updateActivePresenceGamesDetails(v31.props.networkImpl, v52);
                    end);
                end;
                for _, v54 in v36 do
                    local l_Type_0 = v54.Type;
                    if v19() then
                        local v56 = tostring(v54.UserId);
                        if l_Type_0 == v8.PresenceSignal.EventType and v56 ~= v31.props.localUserId then
                            v17:Fire();
                            return;
                        end;
                    elseif l_Type_0 == v8.PresenceSignal.EventType then
                        v17:Fire();
                        return;
                    end;
                    if v20 and v54.SessionStarted ~= nil then
                        local v57 = DateTime.fromIsoDate(v54.SessionStarted);
                        if v57 ~= nil then
                            local l_UnixTimestampMillis_0 = v35().UnixTimestampMillis;
                            local l_UnixTimestampMillis_1 = v57.UnixTimestampMillis;
                            local v60 = l_UnixTimestampMillis_0 - l_UnixTimestampMillis_1;
                            l_analytics_0.Diag:reportStats(v21, v60);
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
        table.insert(v31.tokens, v31._experienceEventReceiver:onLaunched(function() --[[ Line: 257 ]]
            -- upvalues: v31 (copy)
            v31:onExperienceJoin();
        end));
        table.insert(v31.tokens, v31._experienceEventReceiver:onLeft(function() --[[ Line: 263 ]]
            -- upvalues: v31 (copy)
            v31:onExperienceLeave();
        end));
    end;
end;
v28.render = function(_) --[[ Line: 270 ]] --[[ Name: render ]]
    return nil;
end;
v28.willUnmount = function(v62) --[[ Line: 274 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_FFlagCeaseUAPresenceRealtimeNotificationUpdatesInGame_0 (copy)
    for _, v64 in pairs(v62.tokens) do
        v64:disconnect();
    end;
    if l_FFlagCeaseUAPresenceRealtimeNotificationUpdatesInGame_0 then
        v62._experienceEventReceiver:UnsubscribeFromAllMessages();
    end;
end;
v28.onExperienceJoin = function(v65) --[[ Line: 284 ]] --[[ Name: onExperienceJoin ]]
    v65:setState({
        inExperience = true
    });
end;
local function v74(v66, v67) --[[ Line: 290 ]]
    -- upvalues: v27 (copy), l_llama_0 (copy)
    local v68 = v66 and v66.data and v66.data.onlineFriendsByUserId or {};
    local v69 = {};
    for v70, _ in pairs(v67) do
        v69[v70] = {
            userId = tonumber(v70), 
            userPresenceType = v27.Offline, 
            lastLocation = "Website"
        };
    end;
    for _, v73 in pairs(v68) do
        if v73.presence then
            v69[v73.id] = {
                userId = tonumber(v73.id), 
                userPresenceType = v27[v73.presence.userPresenceType] or 0, 
                lastLocation = v73.presence.lastLocation or "", 
                gameId = v73.presence.gameId, 
                placeId = tonumber(v73.presence.placeId), 
                rootPlaceId = tonumber(v73.presence.rootPlaceId), 
                universeId = tonumber(v73.presence.universeId), 
                lastOnline = v73.presence.lastOnline
            };
        end;
    end;
    return l_llama_0.Dictionary.values(v69);
end;
v28.onExperienceLeave = function(v75) --[[ Line: 323 ]] --[[ Name: onExperienceLeave ]]
    -- upvalues: v74 (copy), l_TelemetryService_0 (copy), v26 (copy), v25 (copy)
    v75:setState({
        inExperience = false
    });
    v75.props.refetchOnlineFriends():andThen(function(v76) --[[ Line: 330 ]]
        -- upvalues: v74 (ref), v75 (copy)
        local v77 = v74(v76, v75.state.staleUsers);
        v75.props.setUserPresences(v77);
        v75.props.updateActivePresenceGamesDetails(v75.props.networkImpl, v77);
        v75:setState({
            staleUsers = {}
        });
    end):catch(function(v78) --[[ Line: 339 ]]
        -- upvalues: l_TelemetryService_0 (ref), v26 (ref), v25 (ref)
        warn("Failed to refetch online friends after leaving experience:", v78.error);
        l_TelemetryService_0:LogCounter(v26);
        l_TelemetryService_0:LogEvent(v25, {
            errorMessage = v78.error
        });
    end);
end;
local function _(v79, v80) --[[ Line: 348 ]]
    -- upvalues: l_llama_0 (copy), l_NetworkingPresence_0 (copy), l_NetworkStatus_0 (copy)
    return l_llama_0.List.filter(v80, function(v81) --[[ Line: 349 ]]
        -- upvalues: l_NetworkingPresence_0 (ref), v79 (copy), l_NetworkStatus_0 (ref)
        return l_NetworkingPresence_0.GetPresencesFromUserIds.getStatus(v79, v81) ~= l_NetworkStatus_0.Fetching;
    end);
end;
local function _(v83) --[[ Line: 354 ]]
    -- upvalues: l_llama_0 (copy), l_NetworkingPresence_0 (copy), l_NetworkStatus_0 (copy)
    return function(v84) --[[ Line: 355 ]]
        -- upvalues: v83 (copy), l_llama_0 (ref), l_NetworkingPresence_0 (ref), l_NetworkStatus_0 (ref)
        local v85 = v84:getState();
        local l_v83_0 = v83;
        local v88 = l_llama_0.List.filter(l_v83_0, function(v87) --[[ Line: 349 ]]
            -- upvalues: l_NetworkingPresence_0 (ref), v85 (copy), l_NetworkStatus_0 (ref)
            return l_NetworkingPresence_0.GetPresencesFromUserIds.getStatus(v85, v87) ~= l_NetworkStatus_0.Fetching;
        end);
        return v84:dispatch(l_NetworkingPresence_0.GetPresencesFromUserIds.API(v88)):andThen(function(v89) --[[ Line: 359 ]]
            return v89.responseBody.userPresences or {};
        end);
    end;
end;
v28 = l_RoactServices_0.connect({
    analytics = v11, 
    eventIngestService = v12
})(v28);
v28 = v5.connect(function(v91, _) --[[ Line: 370 ]]
    -- upvalues: v19 (copy)
    return {
        localUserId = if v19() then v91.LocalUserId else nil
    };
end, function(v93) --[[ Line: 374 ]]
    -- upvalues: l_llama_0 (copy), l_NetworkingPresence_0 (copy), l_NetworkStatus_0 (copy), l_SetUserPresences_0 (copy), l_FFlagCeaseUAPresenceRealtimeNotificationUpdatesInGame_0 (copy), l_FFlagHandleSortScoreUpdatesFromRtn_0 (copy), v23 (copy), v9 (copy)
    return {
        updateUserPresences = function(v94) --[[ Line: 376 ]] --[[ Name: updateUserPresences ]]
            -- upvalues: v93 (copy), l_llama_0 (ref), l_NetworkingPresence_0 (ref), l_NetworkStatus_0 (ref), l_SetUserPresences_0 (ref)
            return v93(function(v95) --[[ Line: 355 ]]
                -- upvalues: v94 (copy), l_llama_0 (ref), l_NetworkingPresence_0 (ref), l_NetworkStatus_0 (ref)
                local v96 = v95:getState();
                local l_v94_0 = v94;
                local v99 = l_llama_0.List.filter(l_v94_0, function(v98) --[[ Line: 349 ]]
                    -- upvalues: l_NetworkingPresence_0 (ref), v96 (copy), l_NetworkStatus_0 (ref)
                    return l_NetworkingPresence_0.GetPresencesFromUserIds.getStatus(v96, v98) ~= l_NetworkStatus_0.Fetching;
                end);
                return v95:dispatch(l_NetworkingPresence_0.GetPresencesFromUserIds.API(v99)):andThen(function(v100) --[[ Line: 359 ]]
                    return v100.responseBody.userPresences or {};
                end);
            end):andThen(function(v101) --[[ Line: 377 ]]
                -- upvalues: v93 (ref), l_SetUserPresences_0 (ref)
                v93(l_SetUserPresences_0(v101));
                return v101;
            end);
        end, 
        setUserPresences = (not not l_FFlagCeaseUAPresenceRealtimeNotificationUpdatesInGame_0 or l_FFlagHandleSortScoreUpdatesFromRtn_0 or v23) and function(v102) --[[ Line: 385 ]]
            -- upvalues: v93 (copy), l_SetUserPresences_0 (ref)
            v93(l_SetUserPresences_0(v102));
        end or nil, 
        updateActivePresenceGamesDetails = function(v103, v104) --[[ Line: 389 ]] --[[ Name: updateActivePresenceGamesDetails ]]
            -- upvalues: v93 (copy), v9 (ref)
            v93(v9(v103, v104));
        end
    };
end)(v28);
return function(v105) --[[ Line: 395 ]]
    -- upvalues: l_useHandlePresenceEvent_0 (copy), v3 (copy), v28 (ref), l_llama_0 (copy), l_FFlagCeaseUAPresenceRealtimeNotificationUpdatesInGame_0 (copy), l_FFlagHandleSortScoreUpdatesFromRtn_0 (copy)
    local v106 = l_useHandlePresenceEvent_0();
    return v3.createElement(v28, l_llama_0.Dictionary.join(v105, if not not l_FFlagCeaseUAPresenceRealtimeNotificationUpdatesInGame_0 or l_FFlagHandleSortScoreUpdatesFromRtn_0 then {
        handlePresenceEvent = v106.handleNewEvent, 
        refetchOnlineFriends = v106.refetchOnlineFriends
    } else {
        handlePresenceEvent = v106
    }));
end;