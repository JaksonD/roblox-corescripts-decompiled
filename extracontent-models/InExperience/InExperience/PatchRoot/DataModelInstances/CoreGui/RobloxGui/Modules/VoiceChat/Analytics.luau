local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
game:DefineFastInt("LuaVoiceChatAnalyticsPointsThrottle", 0);
game:DefineFastFlag("LuaVoiceChatAnalyticsUsePointsV2", false);
game:DefineFastFlag("LuaVoiceChatAnalyticsUseCounterV2", false);
game:DefineFastFlag("LuaVoiceChatAnalyticsUseEventsV2", false);
game:DefineFastFlag("LuaVoiceChatAnalyticsBanMessage", true);
game:DefineFastFlag("LuaVoiceChatReconnectMissedSequence", false);
local v1 = {};
v1.__index = v1;
v1.INFO = "info";
v1.WARNING = "warning";
v1.ERROR = "error";
v1.new = function(v2) --[[ Line: 114 ]] --[[ Name: new ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), v1 (copy)
    if not v2 then
        v2 = l_RbxAnalyticsService_0;
    end;
    assert(v2, "Analytics impl must not be nil.");
    return (setmetatable({
        _impl = v2
    }, v1));
end;
local function v3() --[[ Line: 127 ]] --[[ Name: stub ]]

end;
v1.stubService = function() --[[ Line: 129 ]] --[[ Name: stubService ]]
    -- upvalues: v3 (copy)
    return {
        SetRBXEvent = v3, 
        SetRBXEventStream = v3, 
        SendEventDeferred = v3, 
        ReportCounter = v3, 
        ReportStats = v3, 
        ReportInfluxSeries = v3
    };
end;
v1.setImpl = function(v4, v5) --[[ Line: 140 ]] --[[ Name: setImpl ]]
    v4._impl = v5;
end;
v1._report = function(v6, v7, v8, v9, v10) --[[ Line: 144 ]] --[[ Name: _report ]]
    local v11 = v7 .. "-" .. v8;
    if game:GetFastFlag("LuaVoiceChatAnalyticsUsePointsV2") then
        v6._impl:ReportInfluxSeries(v11, v10, game:GetFastInt("LuaVoiceChatAnalyticsPointsThrottle"));
    end;
    if game:GetFastFlag("LuaVoiceChatAnalyticsUseCounterV2") then
        local l_v11_0 = v11;
        if v9 then
            l_v11_0 = l_v11_0 .. "-" .. v9;
        end;
        local l_l_v11_0_0 = l_v11_0;
        if v10 and v10.result then
            l_l_v11_0_0 = l_l_v11_0_0 .. "-" .. v10.result;
        end;
        v6._impl:ReportCounter(l_l_v11_0_0, 1);
    end;
    if game:GetFastFlag("LuaVoiceChatAnalyticsUseEventsV2") then
        v6._impl:SendEventDeferred("client", v7, v8, v10);
    end;
end;
v1.reportVoiceChatJoinResult = function(v14, v15, v16, v17) --[[ Line: 166 ]] --[[ Name: reportVoiceChatJoinResult ]]
    -- upvalues: v1 (copy)
    v14:_report("voiceChat", "defaultChannelJoinResults", v16, {
        success = v15, 
        result = v16, 
        logLevel = v17 or v1.INFO
    });
end;
v1.reportBanMessageEvent = function(v18, v19) --[[ Line: 174 ]] --[[ Name: reportBanMessageEvent ]]
    if game:GetFastFlag("LuaVoiceChatAnalyticsBanMessage") then
        v18._impl:ReportCounter("voiceChat-reportBanMessage" .. v19, 1);
    end;
end;
v1.reportBanMessageEventV2 = function(v20, v21, v22, v23, v24) --[[ Line: 180 ]] --[[ Name: reportBanMessageEventV2 ]]
    v20:_report("voiceChat", "reportBanEvent", nil, {
        eventType = v21, 
        banReason = v22, 
        userId = v23, 
        voiceSessionId = v24
    });
end;
v1.reportReconnectDueToMissedSequence = function(v25) --[[ Line: 189 ]] --[[ Name: reportReconnectDueToMissedSequence ]]
    if game:GetFastFlag("LuaVoiceChatReconnectMissedSequence") then
        v25._impl:ReportCounter("voiceChat-reconnectMissedSequence", 1);
    end;
end;
v1.reportOutOfOrderSequence = function(v26) --[[ Line: 195 ]] --[[ Name: reportOutOfOrderSequence ]]
    v26._impl:ReportCounter("voiceChat-outOfOrderSequence", 1);
end;
v1.reportClosedNudge = function(v27, v28, v29) --[[ Line: 199 ]] --[[ Name: reportClosedNudge ]]
    v27._impl:ReportCounter("voicechat-closednudge", 1);
    v27._impl:SendEventDeferred("client", "voiceChat", "closedNudge", {
        userId = v28, 
        voiceSessionId = v29, 
        closeType = "CLOSED"
    });
end;
v1.reportAcknowledgedNudge = function(v30, v31, v32) --[[ Line: 208 ]] --[[ Name: reportAcknowledgedNudge ]]
    v30._impl:ReportCounter("voicechat-acknowledgednudge", 1);
    v30._impl:SendEventDeferred("client", "voiceChat", "closedNudge", {
        userId = v31, 
        voiceSessionId = v32, 
        closeType = "ACKNOWLEDGED"
    });
end;
v1.reportDeniedNudge = function(v33, v34, v35) --[[ Line: 217 ]] --[[ Name: reportDeniedNudge ]]
    v33._impl:ReportCounter("voicechat-deniednudge", 1);
    v33._impl:SendEventDeferred("client", "voiceChat", "closedNudge", {
        userId = v34, 
        voiceSessionId = v35, 
        closeType = "DENIED"
    });
end;
v1.reportVoiceMuteIndividual = function(v36, v37) --[[ Line: 226 ]] --[[ Name: reportVoiceMuteIndividual ]]
    v36._impl:SendEventDeferred("client", "voice", "voiceUIMuteUnmuteIndividual", {
        user_id = v37.userId, 
        client_session_id = v37.clientSessionId, 
        target_user_id = v37.targetUserId, 
        channel_id = v37.channelId, 
        context = v37.context, 
        muted = v37.muted
    });
end;
v1.reportVoiceMuteGroup = function(v38, v39) --[[ Line: 237 ]] --[[ Name: reportVoiceMuteGroup ]]
    v38._impl:SendEventDeferred("client", "voice", "voiceUIMuteUnmuteGroup", {
        user_id = v39.userId, 
        client_session_id = v39.clientSessionId, 
        channel_id = v39.channelId, 
        context = v39.context, 
        group_type = v39.groupType, 
        muted = v39.muted
    });
end;
v1.reportVoiceMuteSelf = function(v40, v41) --[[ Line: 248 ]] --[[ Name: reportVoiceMuteSelf ]]
    v40._impl:SendEventDeferred("client", "voice", "voiceUIMuteUnmuteSelf", {
        user_id = v41.userId, 
        client_session_id = v41.clientSessionId, 
        channel_id = v41.channelId, 
        context = v41.context, 
        muted = v41.muted
    });
end;
v1.reportJoinVoiceButtonEvent = function(v42, v43, v44, v45, v46) --[[ Line: 258 ]] --[[ Name: reportJoinVoiceButtonEvent ]]
    v42._impl:SendEventDeferred("client", "voice", "joinVoiceButtonEvent", {
        eventType = v43, 
        universeId = v44, 
        placeId = v45, 
        playSessionId = v46
    });
end;
v1.reportJoinVoiceButtonEventWithVoiceSessionId = function(v47, v48, v49, v50, v51, v52) --[[ Line: 272 ]] --[[ Name: reportJoinVoiceButtonEventWithVoiceSessionId ]]
    v47._impl:SendEventDeferred("client", "voice", "joinVoiceButtonEvent", {
        eventType = v48, 
        universeId = v49, 
        placeId = v50, 
        playSessionId = v51, 
        voiceSessionId = v52
    });
end;
v1.reportLeaveVoiceButtonEvent = function(v53, v54, v55, v56, v57, v58) --[[ Line: 288 ]] --[[ Name: reportLeaveVoiceButtonEvent ]]
    v53._impl:SendEventDeferred("client", "voice", "leaveVoiceButtonEvent", {
        eventType = v54, 
        universeId = v55, 
        placeId = v56, 
        playSessionId = v57, 
        voiceSessionId = v58
    });
end;
v1.reportInExpConsent = function(v59, v60, v61, v62, v63, v64) --[[ Line: 304 ]] --[[ Name: reportInExpConsent ]]
    v59._impl:SendEventDeferred("client", "voiceChat", "inExpConsentModalEvent", {
        eventType = v60, 
        entry = v61, 
        universeId = v62, 
        placeId = v63, 
        playSessionId = v64
    });
end;
v1.reportDevicePermissionsModalEvent = function(v65, v66, v67, v68, v69, v70) --[[ Line: 320 ]] --[[ Name: reportDevicePermissionsModalEvent ]]
    local v71 = string.sub(v70, 2, #v70 - 1);
    v65._impl:SendEventDeferred("client", "voiceChat", "devicePermissionsModalEvent", {
        eventType = v66, 
        universeId = v68, 
        placeId = v69, 
        playSessionId = v71, 
        voiceSessionId = v67
    });
end;
v1.reportConnectDisconnectEvents = function(v72, v73, v74) --[[ Line: 339 ]] --[[ Name: reportConnectDisconnectEvents ]]
    v72._impl:SendEventDeferred("client", "voiceChat", v73, v74);
end;
return v1;