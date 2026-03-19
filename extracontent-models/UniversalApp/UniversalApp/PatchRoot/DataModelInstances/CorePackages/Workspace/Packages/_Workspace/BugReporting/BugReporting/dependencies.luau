local l_Parent_0 = script:FindFirstAncestor("BugReporting").Parent;
local l_FFlagLuaAppDefaultHttpRetry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppDefaultHttpRetry;
local v2 = if game:GetEngineFeature("BugReporterProtocol") then game:GetService("BugReporterService") else nil;
local l_GuiService_0 = game:GetService("GuiService");
local l_LogReporterService_0 = game:GetService("LogReporterService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_SafetyService_0 = game:GetService("SafetyService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_VoiceChatService_0 = game:GetService("VoiceChatService");
local v10 = require(l_Parent_0.LoggingProtocol);
local l_SystemInfoProtocol_0 = require(l_Parent_0.SystemInfoProtocol).SystemInfoProtocol;
local v12 = require(l_Parent_0.HttpRequest);
local v13 = require(script.Parent.analytics.makeBugReporterLogger);
local function v14() --[[ Line: 21 ]] --[[ Name: getPlaceId ]]
    return game.PlaceId;
end;
local v15 = v12.config({
    requestFunction = v12.requestFunctions.RequestInternal, 
    maxRetryCount = if l_FFlagLuaAppDefaultHttpRetry_0 then game:DefineFastInt("BugReportingHttpRetryCount", 4) else nil
});
return {
    bugReporterService = v2, 
    guiService = l_GuiService_0, 
    loggingProtocol = v10.default, 
    logReporterService = l_LogReporterService_0, 
    runService = l_RunService_0, 
    safetyService = l_SafetyService_0, 
    userInputService = l_UserInputService_0, 
    voiceChatService = l_VoiceChatService_0, 
    systemInfoProtocol = l_SystemInfoProtocol_0.default, 
    localPlayer = l_Players_0.LocalPlayer, 
    getPlaceId = v14, 
    networking = v15, 
    makeLogger = v13
};