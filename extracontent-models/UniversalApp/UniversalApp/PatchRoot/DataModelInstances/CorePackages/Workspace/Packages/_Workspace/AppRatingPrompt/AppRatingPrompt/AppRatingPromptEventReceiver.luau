local l_MessageBusService_0 = game:GetService("MessageBusService");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Parent_0 = script.Parent;
local v3 = require(l_Parent_0.dependencies);
local v4 = require(l_Parent_0.AppRatingPromptFeature);
local l_RoactRodux_0 = v3.RoactRodux;
local l_React_0 = v3.React;
local v7 = v3.LuaSocialLibrariesDeps.SocialLibraries.config({});
local l_LoggingProtocol_0 = v3.LoggingProtocol;
local l_callOnce_0 = v3.AppCommonLib.callOnce;
local v10 = nil;
pcall(function() --[[ Line: 17 ]]
    -- upvalues: v10 (ref)
    v10 = game:GetService("AppLifecycleObserverService");
end);
local v11 = v4.GetAppRatingPromptService();
local l_l_MessageBusService_0_MessageId_0 = l_MessageBusService_0:GetMessageId("AppRatingPrompt", "leftGame");
local v13 = game:DefineFastInt("RatingPromptEventThrottleHundredthsPercent", 10000);
local v14 = game:DefineFastFlag("ShowRatingPromptOnGameLeave2", false);
local v15 = game:DefineFastFlag("UseGameEngineEventForGameLeave", false);
local v16 = game:DefineFastFlag("ShowPromptOnAppStart", false);
local v17 = game:DefineFastFlag("EnableStickyParamForGameEndMessage", false);
local _ = game:DefineFastFlag("EnableAppRatingPromptLua2", false);
local v19 = {
    recentPlayTimeSeconds = 0, 
    friendCount = 0, 
    numberOfLaunches = 0, 
    daysSinceLastAttempt = 0, 
    launchesSinceAttempt = 0, 
    timeSinceFirstUseSecs = 0, 
    eventTriggeredBy = "unknown"
};
local function v37(v20) --[[ Line: 48 ]] --[[ Name: AppRatingPromptLauncher ]]
    -- upvalues: v11 (copy), v4 (copy), l_React_0 (copy), v19 (copy), l_LoggingProtocol_0 (copy), v13 (copy), l_TelemetryService_0 (copy), v16 (copy), l_callOnce_0 (copy), v14 (copy), v15 (copy), l_MessageBusService_0 (copy), l_l_MessageBusService_0_MessageId_0 (copy), v17 (copy), v10 (ref)
    local l_v11_0 = v11;
    local l_v4_0 = v4;
    local l_friendCount_0 = v20.friendCount;
    local v24 = l_React_0.useRef(l_friendCount_0);
    local v25 = l_React_0.useRef(v19);
    l_React_0.useEffect(function() --[[ Line: 56 ]]
        -- upvalues: l_friendCount_0 (copy), v24 (copy), l_v4_0 (copy)
        if l_friendCount_0 == nil then
            return;
        else
            v24.current = l_friendCount_0;
            if l_friendCount_0 >= l_v4_0.GetMinimumNumFriends() and not l_v4_0.GetAppRatingPromptStats()[l_v4_0.kPassedFriendsCheck] then
                l_v4_0.SetAppRatingPromptStat({
                    [l_v4_0.kPassedFriendsCheck] = true
                });
            end;
            return;
        end;
    end, {
        l_friendCount_0
    });
    l_React_0.useEffect(function() --[[ Line: 70 ]]
        -- upvalues: l_v11_0 (copy), l_LoggingProtocol_0 (ref), v13 (ref), l_v4_0 (copy), l_TelemetryService_0 (ref), v25 (copy), v24 (copy), v16 (ref), l_callOnce_0 (ref), v14 (ref), v15 (ref), l_MessageBusService_0 (ref), l_l_MessageBusService_0_MessageId_0 (ref), v17 (ref), v10 (ref)
        local function v27() --[[ Line: 71 ]] --[[ Name: launchPrompt ]]
            -- upvalues: l_v11_0 (ref), l_LoggingProtocol_0 (ref), v13 (ref), l_v4_0 (ref), l_TelemetryService_0 (ref), v25 (ref)
            if l_v11_0 ~= nil then
                local v26 = {
                    eventName = "ShowNativeRatingPromptAttempted", 
                    backends = {
                        l_LoggingProtocol_0.TelemetryBackends.EventIngest
                    }, 
                    throttlingPercentage = v13, 
                    lastUpdated = {
                        2025, 
                        8, 
                        6
                    }, 
                    description = "Event sent when attemping to show a native rating prompt", 
                    links = ""
                };
                l_v11_0:showAppRatingPrompt();
                l_v4_0.PromptTriggered();
                l_TelemetryService_0:LogEvent(v26, {
                    customFields = v25.current
                });
            end;
        end;
        local function v30() --[[ Line: 89 ]] --[[ Name: considerRatingPrompt ]]
            -- upvalues: l_v4_0 (ref), v25 (ref), v24 (ref), v27 (copy)
            local v28 = l_v4_0.GetAppRatingPromptStats();
            local l_UnixTimestamp_0 = DateTime.now().UnixTimestamp;
            if not v28[l_v4_0.kFirstUseDay] or type(v28[l_v4_0.kFirstUseDay]) ~= "number" or l_UnixTimestamp_0 - v28[l_v4_0.kFirstUseDay] < l_v4_0.GetMinDaysSinceFirstUse() * 86400 then
                return;
            elseif not v28[l_v4_0.kLastTriggerTimestamp] or type(v28[l_v4_0.kLastTriggerTimestamp]) ~= "number" or v28[l_v4_0.kLastTriggerTimestamp] ~= -1 and l_UnixTimestamp_0 - v28[l_v4_0.kLastTriggerTimestamp] < l_v4_0.GetMinNumDaysSinceLastPrompt() * 86400 then
                return;
            elseif not v28[l_v4_0.kLaunchesSinceLastPrompt] or type(v28[l_v4_0.kLaunchesSinceLastPrompt]) ~= "number" or v28[l_v4_0.kLastTriggerTimestamp] ~= -1 and v28[l_v4_0.kLaunchesSinceLastPrompt] < l_v4_0.GetMinNumLaunchesSinceLastPrompt() then
                return;
            elseif not v28[l_v4_0.kNumGamesPlayed] or type(v28[l_v4_0.kNumGamesPlayed]) ~= "number" or v28[l_v4_0.kNumGamesPlayed] < l_v4_0.GetMinNumGamesPlayed() then
                return;
            elseif not v28[l_v4_0.kNumLaunches] or type(v28[l_v4_0.kNumLaunches]) ~= "number" or v28[l_v4_0.kNumLaunches] < l_v4_0.GetMinNumLaunches() then
                return;
            elseif v28[l_v4_0.kVersionAlreadyRated] == nil or v28[l_v4_0.kVersionAlreadyRated] and l_v4_0.GetCheckVersionRated() then
                return;
            elseif not v28[l_v4_0.kPassedFriendsCheck] then
                return;
            else
                v25.current.daysSinceLastAttempt = v28[l_v4_0.kLastTriggerTimestamp] == -1 and -1 or math.floor((l_UnixTimestamp_0 - v28[l_v4_0.kLastTriggerTimestamp]) / 86400);
                v25.current.launchesSinceAttempt = v28[l_v4_0.kLaunchesSinceLastPrompt];
                v25.current.numberOfLaunches = v28[l_v4_0.kNumLaunches];
                v25.current.friendCount = v24.current;
                v25.current.timeSinceFirstUseSecs = l_UnixTimestamp_0 - v28[l_v4_0.kFirstUseDay];
                v25.current.eventTriggeredBy = "gameLeave";
                v27();
                return;
            end;
        end;
        l_v4_0.onLaunch();
        if v16 then
            l_callOnce_0("AppRatingPromptOnAppStart", function() --[[ Line: 174 ]]
                -- upvalues: v30 (copy)
                v30();
            end);
        end;
        local function v32(v31) --[[ Line: 179 ]] --[[ Name: onGameLeft ]]
            -- upvalues: l_v4_0 (ref), v14 (ref), v25 (ref), v30 (copy)
            if v31 < l_v4_0.GetMinGameDurationSec() then
                return;
            else
                l_v4_0.IncrementValues({
                    l_v4_0.kNumGamesPlayed
                });
                if v14 then
                    v25.current.recentPlayTimeSeconds = v31;
                    v30();
                end;
                return;
            end;
        end;
        local v33 = {};
        if v15 and l_v11_0 ~= nil then
            v33.gameEngineEvent = l_v11_0.OnGameLeft:Connect(v32);
        else
            v33.messageBusEvent = l_MessageBusService_0:Subscribe(l_l_MessageBusService_0_MessageId_0, function(v34) --[[ Line: 197 ]]
                -- upvalues: v32 (copy)
                v32(v34.gameTime);
            end, false, v17);
        end;
        if v10 then
            v33.enteredForegroundEvent = v10.OnUnhide:Connect(function() --[[ Line: 203 ]]
                -- upvalues: l_v4_0 (ref), v16 (ref), v30 (copy)
                l_v4_0.IncrementValues({
                    l_v4_0.kNumLaunches, 
                    l_v4_0.kLaunchesSinceLastPrompt
                });
                if v16 then
                    v30();
                end;
            end);
        end;
        return function() --[[ Line: 214 ]]
            -- upvalues: v33 (copy)
            for _, v36 in pairs(v33) do
                v36:disconnect();
            end;
        end;
    end, {});
    return nil;
end;
local v40 = l_RoactRodux_0.connect(function(v38) --[[ Line: 224 ]]
    -- upvalues: v7 (copy)
    local l_LocalUserId_0 = v38.LocalUserId;
    return {
        friendCount = v7.Dictionary.getDeepValue(v38, string.format("FriendsCarousel.Friends.countsByUserId.%s", l_LocalUserId_0)) or 0
    };
end)(v37);
return function(v41) --[[ Line: 234 ]] --[[ Name: AppRatingPromptEventReceiver ]]
    -- upvalues: v4 (copy), l_React_0 (copy), v40 (copy)
    if v4.GetAppRatingPromptEnabled() then
        return l_React_0.createElement(v40, v41);
    else
        return l_React_0.createElement(l_React_0.Fragment);
    end;
end;