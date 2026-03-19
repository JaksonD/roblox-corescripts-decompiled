local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local v3 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local l_game_EngineFeature_0 = game:GetEngineFeature("TelemetryServicePlaySessionInfoEnabled");
local v5 = game:DefineFastInt("OpenReactPageThrottleHundredthsPercent", 0);
local v6 = game:DefineFastInt("CloseReactPageThrottleHundredthsPercent", 0);
local v7 = {};
v7.__index = v7;
v7.configs = {
    openPage = {
        eventName = "ingame_menu_action", 
        backends = {
            v3.TelemetryBackends.EventIngest
        }, 
        throttlingPercentage = v5, 
        lastUpdated = {
            2025, 
            9, 
            23
        }, 
        description = "Fires when a React menu page is opened"
    }, 
    closePage = {
        eventName = "ingame_menu_action", 
        backends = {
            v3.TelemetryBackends.EventIngest
        }, 
        throttlingPercentage = v6, 
        lastUpdated = {
            2025, 
            9, 
            23
        }, 
        description = "Fires when a React menu page is closed"
    }
};
v7.new = function() --[[ Line: 52 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    return (setmetatable({}, v7));
end;
v7._logEventWithStandardizedFields = function(_, v9, v10, v11) --[[ Line: 57 ]] --[[ Name: _logEventWithStandardizedFields ]]
    -- upvalues: l_game_EngineFeature_0 (copy), l_RbxAnalyticsService_0 (copy), l_TelemetryService_0 (copy)
    local v12 = {
        "addPlaceId", 
        "addUniverseId", 
        "addSessionInfo"
    };
    local v13 = v11 or {};
    if l_game_EngineFeature_0 then
        table.insert(v12, "addPlaySessionId");
    else
        v13.playsessionid = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    l_TelemetryService_0:LogEvent(v9, {
        eventContext = v10, 
        standardizedFields = v12, 
        customFields = v13
    });
end;
v7.openPage = function(v14, v15) --[[ Line: 74 ]] --[[ Name: openPage ]]
    local v16 = ("open_%*_page"):format(v15);
    v14:_logEventWithStandardizedFields(v14.configs.openPage, v16);
end;
v7.closePage = function(v17, v18) --[[ Line: 79 ]] --[[ Name: closePage ]]
    local v19 = ("close_%*_page"):format(v18);
    v17:_logEventWithStandardizedFields(v17.configs.closePage, v19);
end;
return v7;