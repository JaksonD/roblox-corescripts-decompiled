local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_CorePackages_0.Packages.React);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_AppLogging_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLogging;
local v6 = require(l_Modules_0.LuaApp.Analytics.RobloxTelemetryConfigs.BiometricChallengeEvent);
local v7 = require(l_Modules_0.LuaApp.Components.Challenge.ChallengeEventConstants);
local v8 = require(l_CorePackages_0.Workspace.Packages.GenericChallenges);
local l_PersonaLivenessContainer_0 = v8.Middleware.Challenges.PersonaLivenessContainer;
local l_BiometricTypeEnum_0 = v8.Middleware.Challenges.PersonaLivenessEnums.BiometricTypeEnum;
local l_dependencyArray_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.dependencyArray;
return function(v12) --[[ Line: 22 ]] --[[ Name: BiometricChallenge ]]
    -- upvalues: l_useRoactService_0 (copy), l_AppLogging_0 (copy), l_HttpService_0 (copy), v2 (copy), v6 (copy), v7 (copy), l_BiometricTypeEnum_0 (copy), l_dependencyArray_0 (copy), l_PersonaLivenessContainer_0 (copy)
    local v13 = l_useRoactService_0(l_AppLogging_0);
    local l_biometricType_0 = l_HttpService_0:JSONDecode(v12.challengeMetadata).biometricType;
    v2.useEffect(function() --[[ Line: 28 ]]
        -- upvalues: v13 (copy), v6 (ref), v7 (ref), v12 (copy), l_biometricType_0 (copy), l_BiometricTypeEnum_0 (ref)
        v13:logRobloxTelemetryEvent(v6, {}, {
            context = v7.ChallengeLifecycleEventConstants.ChallengeInitialized, 
            challengeId = v12.challengeId, 
            biometricType = l_biometricType_0
        });
        if l_biometricType_0 ~= l_BiometricTypeEnum_0.PersonaLiveness then
            v13:logRobloxTelemetryEvent(v6, {}, {
                context = v7.ChallengeLifecycleEventConstants.ChallengeInvalidated, 
                challengeId = v12.challengeId, 
                biometricType = l_biometricType_0
            });
            v12.onChallengeFailed(l_biometricType_0);
        end;
    end, l_dependencyArray_0());
    if l_biometricType_0 == l_BiometricTypeEnum_0.PersonaLiveness then
        return l_PersonaLivenessContainer_0({
            challengeId = v12.challengeId, 
            onChallengeCompleted = v12.onChallengeCompleted, 
            onChallengeAbandoned = v12.onChallengeAbandoned, 
            onChallengeFailed = v12.onChallengeFailed
        });
    else
        return v2.createElement(v2.Fragment, nil, {});
    end;
end;