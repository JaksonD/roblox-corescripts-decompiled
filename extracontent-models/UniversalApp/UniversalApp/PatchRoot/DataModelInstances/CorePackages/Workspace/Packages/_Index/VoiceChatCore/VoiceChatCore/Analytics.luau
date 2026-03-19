local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_SessionService_0 = game:GetService("SessionService");
local l_TelemetryService_0 = game:GetService("TelemetryService");
game:DefineFastInt("LuaVoiceChatThrottleHundrethsPercent", 10000);
game:DefineFastInt("LuaVoiceChatAnalyticsPointsThrottle", 0);
game:DefineFastFlag("LuaVoiceChatAnalyticsUsePointsV2", false);
game:DefineFastFlag("LuaVoiceChatAnalyticsUseCounterV2", false);
game:DefineFastFlag("LuaVoiceChatAnalyticsUseEventsV2", false);
game:DefineFastFlag("LuaVoiceChatAnalyticsBanMessage", true);
game:DefineFastFlag("LuaVoiceChatReconnectMissedSequence", false);
local v3 = {};
v3.__index = v3;
v3.INFO = "info";
v3.WARNING = "warning";
v3.ERROR = "error";
v3.new = function(v4) --[[ Line: 128 ]] --[[ Name: new ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), v3 (copy)
    if not v4 then
        v4 = l_RbxAnalyticsService_0;
    end;
    assert(v4, "Analytics impl must not be nil.");
    return (setmetatable({
        _impl = v4
    }, v3));
end;
local function v5() --[[ Line: 141 ]] --[[ Name: stub ]]

end;
v3.stubService = function() --[[ Line: 143 ]] --[[ Name: stubService ]]
    -- upvalues: v5 (copy)
    return {
        SetRBXEvent = v5, 
        SetRBXEventStream = v5, 
        SendEventDeferred = v5, 
        ReportCounter = v5, 
        ReportStats = v5, 
        ReportInfluxSeries = v5
    };
end;
v3.setImpl = function(v6, v7) --[[ Line: 154 ]] --[[ Name: setImpl ]]
    v6._impl = v7;
end;
v3._report = function(v8, v9, v10, v11, v12) --[[ Line: 158 ]] --[[ Name: _report ]]
    local v13 = v9 .. "-" .. v10;
    if game:GetFastFlag("LuaVoiceChatAnalyticsUsePointsV2") then
        v8._impl:ReportInfluxSeries(v13, v12, game:GetFastInt("LuaVoiceChatAnalyticsPointsThrottle"));
    end;
    if game:GetFastFlag("LuaVoiceChatAnalyticsUseCounterV2") then
        local l_v13_0 = v13;
        if v11 then
            l_v13_0 = l_v13_0 .. "-" .. v11;
        end;
        local l_l_v13_0_0 = l_v13_0;
        if v12 and v12.result then
            l_l_v13_0_0 = l_l_v13_0_0 .. "-" .. v12.result;
        end;
        v8._impl:ReportCounter(l_l_v13_0_0, 1);
    end;
    if game:GetFastFlag("LuaVoiceChatAnalyticsUseEventsV2") then
        v8._impl:SendEventDeferred("client", v9, v10, v12);
    end;
end;
v3.reportVoiceChatJoinResult = function(v16, v17, v18, v19) --[[ Line: 180 ]] --[[ Name: reportVoiceChatJoinResult ]]
    -- upvalues: v3 (copy)
    v16:_report("voiceChat", "defaultChannelJoinResults", v18, {
        success = v17, 
        result = v18, 
        logLevel = v19 or v3.INFO
    });
end;
v3.reportBanMessageEvent = function(v20, v21) --[[ Line: 188 ]] --[[ Name: reportBanMessageEvent ]]
    if game:GetFastFlag("LuaVoiceChatAnalyticsBanMessage") then
        v20._impl:ReportCounter("voiceChat-reportBanMessage" .. v21, 1);
    end;
end;
v3.reportBanMessageEventV2 = function(v22, v23, v24, v25, v26) --[[ Line: 194 ]] --[[ Name: reportBanMessageEventV2 ]]
    v22:_report("voiceChat", "reportBanEvent", nil, {
        eventType = v23, 
        banReason = v24, 
        userId = v25, 
        voiceSessionId = v26
    });
end;
v3.reportReconnectDueToMissedSequence = function(v27) --[[ Line: 203 ]] --[[ Name: reportReconnectDueToMissedSequence ]]
    if game:GetFastFlag("LuaVoiceChatReconnectMissedSequence") then
        v27._impl:ReportCounter("voiceChat-reconnectMissedSequence", 1);
    end;
end;
v3.reportOutOfOrderSequence = function(v28) --[[ Line: 209 ]] --[[ Name: reportOutOfOrderSequence ]]
    v28._impl:ReportCounter("voiceChat-outOfOrderSequence", 1);
end;
v3.reportReceivedNudge = function(v29, v30, v31, v32) --[[ Line: 213 ]] --[[ Name: reportReceivedNudge ]]
    local l_UnixTimestampMillis_0 = DateTime.fromIsoDate(v30.deliveryTime).UnixTimestampMillis;
    local v34 = DateTime.now().UnixTimestampMillis - l_UnixTimestampMillis_0;
    v29._impl:ReportCounter("voicechat-receivednudge", 1);
    v29._impl:ReportCounter("voicechat-receivednudgeduration", v34);
    v29._impl:SendEventDeferred("client", "voiceChat", "receivedNudge", {
        type = v30.type, 
        durationInMs = v34, 
        userId = v31, 
        voiceSessionId = v32
    });
end;
v3.reportClosedNudge = function(v35, v36, v37) --[[ Line: 230 ]] --[[ Name: reportClosedNudge ]]
    v35._impl:ReportCounter("voicechat-closednudge", 1);
    v35._impl:SendEventDeferred("client", "voiceChat", "closedNudge", {
        userId = v36, 
        voiceSessionId = v37, 
        closeType = "CLOSED"
    });
end;
v3.reportAcknowledgedNudge = function(v38, v39, v40) --[[ Line: 239 ]] --[[ Name: reportAcknowledgedNudge ]]
    v38._impl:ReportCounter("voicechat-acknowledgednudge", 1);
    v38._impl:SendEventDeferred("client", "voiceChat", "closedNudge", {
        userId = v39, 
        voiceSessionId = v40, 
        closeType = "ACKNOWLEDGED"
    });
end;
v3.reportDeniedNudge = function(v41, v42, v43) --[[ Line: 248 ]] --[[ Name: reportDeniedNudge ]]
    v41._impl:ReportCounter("voicechat-deniednudge", 1);
    v41._impl:SendEventDeferred("client", "voiceChat", "closedNudge", {
        userId = v42, 
        voiceSessionId = v43, 
        closeType = "DENIED"
    });
end;
v3.reportVoiceMuteIndividual = function(v44, v45) --[[ Line: 257 ]] --[[ Name: reportVoiceMuteIndividual ]]
    v44._impl:SendEventDeferred("client", "voice", "voiceUIMuteUnmuteIndividual", {
        user_id = v45.userId, 
        client_session_id = v45.clientSessionId, 
        target_user_id = v45.targetUserId, 
        channel_id = v45.channelId, 
        context = v45.context, 
        muted = v45.muted
    });
end;
v3.reportVoiceMuteGroup = function(v46, v47) --[[ Line: 268 ]] --[[ Name: reportVoiceMuteGroup ]]
    v46._impl:SendEventDeferred("client", "voice", "voiceUIMuteUnmuteGroup", {
        user_id = v47.userId, 
        client_session_id = v47.clientSessionId, 
        channel_id = v47.channelId, 
        context = v47.context, 
        group_type = v47.groupType, 
        muted = v47.muted
    });
end;
v3.reportVoiceMuteSelf = function(v48, v49) --[[ Line: 279 ]] --[[ Name: reportVoiceMuteSelf ]]
    v48._impl:SendEventDeferred("client", "voice", "voiceUIMuteUnmuteSelf", {
        user_id = v49.userId, 
        client_session_id = v49.clientSessionId, 
        channel_id = v49.channelId, 
        context = v49.context, 
        muted = v49.muted
    });
end;
v3.reportJoinVoiceButtonEvent = function(v50, v51, v52, v53, v54) --[[ Line: 289 ]] --[[ Name: reportJoinVoiceButtonEvent ]]
    v50._impl:SendEventDeferred("client", "voice", "joinVoiceButtonEvent", {
        eventType = v51, 
        universeId = v52, 
        placeId = v53, 
        playSessionId = v54
    });
end;
v3.reportJoinVoiceButtonEventWithVoiceSessionId = function(v55, v56, v57, v58, v59, v60) --[[ Line: 303 ]] --[[ Name: reportJoinVoiceButtonEventWithVoiceSessionId ]]
    v55._impl:SendEventDeferred("client", "voice", "joinVoiceButtonEvent", {
        eventType = v56, 
        universeId = v57, 
        placeId = v58, 
        playSessionId = v59, 
        voiceSessionId = v60
    });
end;
v3.reportJoinVoiceUpsellEvent = function(_, v62, v63, v64) --[[ Line: 319 ]] --[[ Name: reportJoinVoiceUpsellEvent ]]
    -- upvalues: l_SessionService_0 (copy), l_TelemetryService_0 (copy)
    local v65 = {
        eventName = "joinVoiceUpsell" .. v62, 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = game:GetFastInt("LuaVoiceChatThrottleHundrethsPercent"), 
        lastUpdated = {
            2025, 
            10, 
            30
        }, 
        description = "Event fired when user sees or interacts with Join Voice button", 
        links = "https://github.rbx.com/Roblox/proto-schemas/pull/8530"
    };
    local v66 = {
        "addPlaceId", 
        "addUniverseId", 
        "addSessionInfo"
    };
    local v67 = {
        user_is_age_verified = v64, 
        clientTimeStamp = DateTime.now().UnixTimestampMillis, 
        playSessionId = v63, 
        sd_platform_id = l_SessionService_0:GetSessionID("level0"), 
        sd_logged_in_id = l_SessionService_0:GetSessionID("level1")
    };
    l_TelemetryService_0:LogEvent(v65, {
        customFields = v67, 
        standardizedFields = v66
    });
end;
v3.reportLeaveVoiceButtonEvent = function(v68, v69, v70, v71, v72, v73) --[[ Line: 348 ]] --[[ Name: reportLeaveVoiceButtonEvent ]]
    v68._impl:SendEventDeferred("client", "voice", "leaveVoiceButtonEvent", {
        eventType = v69, 
        universeId = v70, 
        placeId = v71, 
        playSessionId = v72, 
        voiceSessionId = v73
    });
end;
v3.reportInExpConsent = function(v74, v75, v76, v77, v78, v79) --[[ Line: 364 ]] --[[ Name: reportInExpConsent ]]
    v74._impl:SendEventDeferred("client", "voiceChat", "inExpConsentModalEvent", {
        eventType = v75, 
        entry = v76, 
        universeId = v77, 
        placeId = v78, 
        playSessionId = v79
    });
end;
v3.reportDevicePermissionsModalEvent = function(v80, v81, v82, v83, v84, v85) --[[ Line: 380 ]] --[[ Name: reportDevicePermissionsModalEvent ]]
    local v86 = string.sub(v85, 2, #v85 - 1);
    v80._impl:SendEventDeferred("client", "voiceChat", "devicePermissionsModalEvent", {
        eventType = v81, 
        universeId = v83, 
        placeId = v84, 
        playSessionId = v86, 
        voiceSessionId = v82
    });
end;
v3.reportConnectDisconnectEvents = function(v87, v88, v89) --[[ Line: 399 ]] --[[ Name: reportConnectDisconnectEvents ]]
    v87._impl:SendEventDeferred("client", "voiceChat", v88, v89);
end;
v3.reportVoiceEvents = function(v90, v91, v92) --[[ Line: 403 ]] --[[ Name: reportVoiceEvents ]]
    v90._impl:SendEventDeferred("client", "voice", v91, v92);
end;
return v3;