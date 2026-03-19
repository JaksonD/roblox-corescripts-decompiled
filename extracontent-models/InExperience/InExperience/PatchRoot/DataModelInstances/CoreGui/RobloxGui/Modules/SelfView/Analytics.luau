debugPrint = function(_) --[[ Line: 4 ]] --[[ Name: debugPrint ]]

end;
debugPrint("Self View Analytics 10-19-2022__1");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local v4 = {};
v4.__index = v4;
v4.INFO = "info";
v4.WARNING = "warning";
v4.ERROR = "error";
local v5 = "SelfView";
v4.new = function(v6) --[[ Line: 76 ]] --[[ Name: new ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), v4 (copy)
    if not v6 then
        v6 = l_RbxAnalyticsService_0;
    end;
    assert(v6, "Analytics impl must not be nil.");
    return (setmetatable({
        _impl = v6
    }, v4));
end;
local function v7() --[[ Line: 91 ]] --[[ Name: stub ]]

end;
v4.stubService = function() --[[ Line: 93 ]] --[[ Name: stubService ]]
    -- upvalues: v7 (copy)
    return {
        SetRBXEvent = v7, 
        SetRBXEventStream = v7, 
        SendEventDeferred = v7, 
        ReportCounter = v7, 
        ReportStats = v7, 
        ReportInfluxSeries = v7, 
        GetSessionId = v7
    };
end;
v4.setImpl = function(v8, v9) --[[ Line: 105 ]] --[[ Name: setImpl ]]
    v8._impl = v9;
end;
v4._report = function(v10, v11, v12, _, v14) --[[ Line: 109 ]] --[[ Name: _report ]]
    -- upvalues: l_RunService_0 (copy)
    local v15 = "client";
    if l_RunService_0:IsStudio() then
        v15 = "studio";
    end;
    v10._impl:SendEventDeferred(v15, v11, v12, v14);
end;
v4.reportMicState = function(v16, v17) --[[ Line: 119 ]] --[[ Name: reportMicState ]]
    -- upvalues: l_Players_0 (copy), v5 (ref)
    debugPrint("Self View: Analytics:reportMicState, newState: " .. tostring(v17) .. ",universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",uid: " .. tostring(l_Players_0.LocalPlayer.UserId) .. ",sessionid: " .. tostring(v16._impl:GetSessionId()));
    v16:_report(v5, "inExperienceMicState", tostring(v17), {
        state = v17, 
        universeid = tostring(game.GameId), 
        pid = tostring(game.PlaceId), 
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        sessionid = tostring(v16._impl:GetPlaySessionId())
    });
end;
v4.reportCamState = function(v18, v19) --[[ Line: 130 ]] --[[ Name: reportCamState ]]
    -- upvalues: l_Players_0 (copy), v5 (ref)
    debugPrint("Self View: Analytics:reporCamState, newState: " .. tostring(v19) .. ",universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",uid: " .. tostring(l_Players_0.LocalPlayer.UserId) .. ",sessionid: " .. tostring(v18._impl:GetSessionId()));
    v18:_report(v5, "inExperienceCamState", tostring(v19), {
        state = v19, 
        universeid = tostring(game.GameId), 
        pid = tostring(game.PlaceId), 
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        sessionid = tostring(v18._impl:GetPlaySessionId())
    });
end;
v4.reportSelfViewEnabledInCoreGuiState = function(v20, v21) --[[ Line: 141 ]] --[[ Name: reportSelfViewEnabledInCoreGuiState ]]
    debugPrint("Self View: Analytics:reportSelfViewEnabledInCoreGuiState, newState: " .. tostring(v21) .. ",universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",sessionid: " .. tostring(v20._impl:GetSessionId()));
    v20:_report("SelfView", "enabledinCoreGuiState", tostring(v21), {
        state = v21, 
        universeid = tostring(game.GameId), 
        pid = tostring(game.PlaceId), 
        sessionid = tostring(v20._impl:GetPlaySessionId())
    });
end;
v4.reportSelfViewSessionStarted = function(v22, v23, v24, v25, v26, v27, v28, v29, v30) --[[ Line: 151 ]] --[[ Name: reportSelfViewSessionStarted ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy)
    debugPrint("Self View: Analytics:reportSelfViewSessionStarted,universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",sessionid: " .. tostring(v22._impl:GetSessionId()) .. ",x: " .. tostring(v23) .. ",y: " .. tostring(v24) .. ",width: " .. tostring(v25) .. ",height: " .. tostring(v26) .. ",x_relative: " .. tostring(v27) .. ",y_relative: " .. tostring(v28) .. ",width_relative: " .. tostring(v29) .. ",height_relative: " .. tostring(v30));
    v22:_report("SelfView", "sessionStarted", "true", {
        universeid = tostring(game.GameId), 
        pid = tostring(game.PlaceId), 
        sessionid = tostring(v22._impl:GetPlaySessionId()), 
        x = tostring(v23), 
        y = tostring(v24), 
        width = tostring(v25), 
        height = tostring(v26), 
        x_relative = tostring(v27), 
        y_relative = tostring(v28), 
        width_relative = tostring(v29), 
        height_relative = tostring(v30)
    });
    l_RbxAnalyticsService_0:AddGlobalPointsField("feature/avatarChat/selfViewOn", 1);
end;
v4.reportSelfViewSessionStopped = function(v31) --[[ Line: 170 ]] --[[ Name: reportSelfViewSessionStopped ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy)
    debugPrint("Self View: Analytics:reportSelfViewSessionStopped,universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",sessionid: " .. tostring(v31._impl:GetSessionId()));
    v31:_report("SelfView", "sessionStopped", "true", {
        universeid = tostring(game.GameId), 
        pid = tostring(game.PlaceId), 
        sessionid = tostring(v31._impl:GetPlaySessionId())
    });
    l_RbxAnalyticsService_0:AddGlobalPointsField("feature/avatarChat/selfViewOn", 0);
end;
v4.reportUserAccountSettings = function(v32, v33, v34) --[[ Line: 181 ]] --[[ Name: reportUserAccountSettings ]]
    debugPrint("Self View: Analytics:reportUserAccountSettings,universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",sessionid: " .. tostring(v32._impl:GetSessionId()) .. ",userAccount_videoEnabled: " .. tostring(v33) .. ",userAccount_audioEnabled: " .. tostring(v34));
    v32:_report("SelfView", "userAccountSettings", "true", {
        universeid = tostring(game.GameId), 
        pid = tostring(game.PlaceId), 
        sessionid = tostring(v32._impl:GetPlaySessionId()), 
        videoenabled = tostring(v33), 
        audioenabled = tostring(v34)
    });
end;
v4.reportExperienceSettings = function(v35, v36, v37, v38) --[[ Line: 192 ]] --[[ Name: reportExperienceSettings ]]
    debugPrint("Self View: Analytics:reportExperienceSettings,universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",sessionid: " .. tostring(v35._impl:GetSessionId()) .. ",experienceSettings_placeEnabled: " .. tostring(v36) .. ",experienceSettings_videoEnabled: " .. tostring(v37) .. ",experienceSettings_audioEnabled: " .. tostring(v38));
    v35:_report("SelfView", "experienceSettings", "true", {
        universeid = tostring(game.GameId), 
        pid = tostring(game.PlaceId), 
        sessionid = tostring(v35._impl:GetPlaySessionId()), 
        placeenabled = tostring(v36), 
        videoenabled = tostring(v37), 
        audioenabled = tostring(v38)
    });
end;
v4.setLastCtx = function(_, v40) --[[ Line: 204 ]] --[[ Name: setLastCtx ]]
    -- upvalues: v5 (ref)
    v5 = v40;
end;
return v4;