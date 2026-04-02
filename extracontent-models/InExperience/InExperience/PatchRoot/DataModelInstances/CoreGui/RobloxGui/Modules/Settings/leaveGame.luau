local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Players_0 = game:GetService("Players");
local l_FFlagEnableGameLeftMessage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableGameLeftMessage;
local l_game_EngineFeature_0 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
local v9 = require(l_RobloxGui_0.Modules.Common.PerfUtils);
local v10 = require(l_CorePackages_0.Packages.Cryo);
local l_MessageBus_0 = require(l_CorePackages_0.Workspace.Packages.MessageBus).MessageBus;
local v12 = require(script:FindFirstAncestor("Settings").Analytics.CoreGuiFinalStateAnalytics).new();
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local v13 = require(l_RobloxGui_0.Modules.Common.Flags.GetFFlagEnableInGameMenuDurationLogger);
local v14 = require(l_RobloxGui_0.Modules.Chrome.Flags.FFlagLeaveActionChromeShortcutTelemetry);
local l_GetDefaultQualityLevel_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel;
local l_Constants_0 = require(l_RobloxGui_0.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
local v17 = require(l_RobloxGui_0.Modules.Common.ReactSchedulingTracker);
return function(v18, v19) --[[ Line: 40 ]]
    -- upvalues: l_FFlagEnableGameLeftMessage_0 (copy), l_MessageBus_0 (copy), l_Constants_0 (copy), v13 (copy), v9 (copy), v17 (copy), l_CorePackages_0 (copy), l_GuiService_0 (copy), l_game_EngineFeature_0 (copy), l_RbxAnalyticsService_0 (copy), v14 (copy), v10 (copy), l_Players_0 (copy), v12 (copy), l_RunService_0 (copy), l_GetDefaultQualityLevel_0 (copy)
    if l_FFlagEnableGameLeftMessage_0 then
        l_MessageBus_0.publish(l_Constants_0.OnAppRatingPromptEventDescriptor, {
            gameTime = game:getGameTime()
        });
    end;
    if v13() then
        v9.leavingGame();
    end;
    v17:reportSession();
    local v20 = require(l_CorePackages_0.Workspace.Packages.Memory).MemoryTracker();
    if v20 then
        v20:destroy();
    end;
    l_GuiService_0.SelectedCoreObject = nil;
    local v21 = "";
    if l_game_EngineFeature_0 then
        v21 = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    local v22 = {
        confirmed = l_Constants_0.AnalyticsConfirmedName, 
        universeid = tostring(game.GameId), 
        source = l_Constants_0.AnalyticsLeaveGameSource, 
        playsessionid = v21
    };
    if v14 and v19 and v19.telemetryFields then
        v22 = v10.Dictionary.join(v22, v19.telemetryFields);
    end;
    l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsInGameMenuName, l_Constants_0.AnalyticsLeaveGameName, v22);
    if v18 then
        local v23 = {
            chromeSeenCount = tostring(0)
        };
        local v24 = tostring(l_Players_0.LocalPlayer.UserId);
        l_MessageBus_0.publish(l_Constants_0.OnSurveyEventDescriptor, {
            eventType = l_Constants_0.SurveyEventType, 
            userId = v24, 
            customProps = v23
        });
    end;
    v12:sendCoreGuiFinalAnalytic();
    l_RunService_0.RenderStepped:wait();
    l_RunService_0.RenderStepped:wait();
    game:Shutdown();
    settings().Rendering.QualityLevel = l_GetDefaultQualityLevel_0();
end;