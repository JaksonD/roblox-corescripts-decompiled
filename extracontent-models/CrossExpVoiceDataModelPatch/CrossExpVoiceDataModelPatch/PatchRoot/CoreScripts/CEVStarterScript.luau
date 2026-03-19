print("[CEV] Loading CEVStarterScript");
local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.CrossExperience);
local l_getMemStorageKey_0 = v1.Utils.getMemStorageKey;
local l_logEvent_0 = v1.Analytics.CrossExperienceAnalytics.logEvent;
local l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FStringTimeoutLoadingLocalPlayerInBackgroundDM;
local l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0 = v1.Constants.LOCAL_PLAYER_LOADING_TIMEOUT_ENUM;
l_logEvent_0("partyVoiceCEVStarterScriptLoaded", {
    cevJoinAttemptId = l_getMemStorageKey_0("cevJoinAttemptId"), 
    clientTimeStamp = os.time()
});
local l_ScriptContext_0 = game:GetService("ScriptContext");
local l_Players_0 = game:GetService("Players");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
l_logEvent_0("cevStarterScriptRobloxGuiLoaded", {
    cevJoinAttemptId = l_getMemStorageKey_0("cevJoinAttemptId"), 
    clientTimeStamp = os.time()
});
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/CrossExperienceVoiceErrorReporter", l_RobloxGui_0);
l_logEvent_0("cevStarterScriptErrorReporterLoaded", {
    cevJoinAttemptId = l_getMemStorageKey_0("cevJoinAttemptId"), 
    clientTimeStamp = os.time()
});
if l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 == l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0.Disable then
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    while not l_LocalPlayer_0 do
        l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
        l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    end;
end;
if l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 == l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0.Disable then
    l_logEvent_0("cevStarterScriptLocalPlayerLoaded", {
        cevJoinAttemptId = l_getMemStorageKey_0("cevJoinAttemptId"), 
        clientTimeStamp = os.time()
    });
end;
if game:GetEngineFeature("VoiceChatSupported") then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/CrossExperienceVoiceDefaultChannel", l_RobloxGui_0);
end;
l_logEvent_0("cevStarterScriptCEVDefaultChannelLoaded", {
    cevJoinAttemptId = l_getMemStorageKey_0("cevJoinAttemptId"), 
    clientTimeStamp = os.time()
});
print("[CEV] CEVStarterScript Loaded");