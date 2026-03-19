local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v4 = require(l_Modules_0.Common.Roact);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.Packages.RoactNavigation);
local v7 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v8 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppLogging_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLogging;
local v11 = require(l_Modules_0.LuaApp.Enum.Challenge.GenericType);
local v12 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v13 = require(l_Modules_0.LuaApp.Http.UrlBase);
local v14 = require(l_Modules_0.LuaApp.Promise);
local v15 = require(l_Modules_0.LuaApp.Analytics.RobloxTelemetryConfigs.ChallengeNativeWrapperEvent);
local v16 = require(l_Modules_0.LuaApp.Components.Challenge.DeviceIntegrityTokenChallenge);
local v17 = require(l_Modules_0.LuaApp.Components.Challenge.DeviceAccessTokenChallenge);
local v18 = require(l_Modules_0.LuaApp.Components.Challenge.PrivateAccessTokenChallenge);
local v19 = require(l_Modules_0.LuaApp.Components.Challenge.BiometricChallenge);
local v20 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppChallengeMoreTelemetryEnabled);
local v21 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableNativeToWebviewMiddleware);
local v22 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppSupportOnChallengeContinued);
local v23 = nil;
pcall(function() --[[ Line: 29 ]]
    -- upvalues: v23 (ref)
    v23 = game:GetService("AccountService");
end);
local v24 = v4.PureComponent:extend(script.Name);
v24.defaultProps = {
    accountService = v23
};
local v25 = v12.new({
    base = v13.APIS, 
    path = "challenge/v1/continue"
});
canRenderNativeChallenge = function(v26, _) --[[ Line: 47 ]] --[[ Name: canRenderNativeChallenge ]]
    -- upvalues: v11 (copy)
    local v28 = true;
    if v26 ~= v11.DeviceIntegrity then
        v28 = true;
        if v26 ~= v11.DeviceAccessToken then
            v28 = true;
            if v26 ~= v11.PrivateAccessToken then
                v28 = v26 == v11.Biometric;
            end;
        end;
    end;
    return v28;
end;
v24.init = function(v29) --[[ Line: 72 ]] --[[ Name: init ]]
    v29:validateChallengeAndSetState(v29.props.challengeType, v29.props.challengeMetadata);
end;
v24.render = function(v30) --[[ Line: 76 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), v4 (copy), v16 (copy), v17 (copy), v18 (copy), v19 (copy)
    local l_challengeType_0 = v30.state.challengeType;
    local l_challengeMetadata_0 = v30.state.challengeMetadata;
    if l_challengeType_0 == v11.DeviceIntegrity then
        return v4.createElement(v16, {
            challengeId = v30.props.challengeId, 
            challengeMetadata = l_challengeMetadata_0, 
            onChallengeCompleted = function(v33, v34) --[[ Line: 84 ]] --[[ Name: onChallengeCompleted ]]
                -- upvalues: v30 (copy)
                v30:challengeContinue(v33, v34);
            end, 
            onChallengeFailed = function(v35) --[[ Line: 87 ]] --[[ Name: onChallengeFailed ]]
                -- upvalues: v30 (copy)
                v30:failSession(v35);
            end, 
            accountService = v30.props.accountService
        });
    elseif l_challengeType_0 == v11.DeviceAccessToken then
        return v4.createElement(v17, {
            challengeId = v30.props.challengeId, 
            challengeMetadata = l_challengeMetadata_0, 
            onChallengeCompleted = function(v36) --[[ Line: 96 ]] --[[ Name: onChallengeCompleted ]]
                -- upvalues: v30 (copy)
                v30:challengeContinue(v36);
            end, 
            onChallengeFailed = function(v37) --[[ Line: 99 ]] --[[ Name: onChallengeFailed ]]
                -- upvalues: v30 (copy)
                v30:failSession(v37);
            end, 
            accountService = v30.props.accountService
        });
    elseif l_challengeType_0 == v11.PrivateAccessToken then
        return v4.createElement(v18, {
            challengeId = v30.props.challengeId, 
            challengeMetadata = l_challengeMetadata_0, 
            onChallengeCompleted = function(v38) --[[ Line: 108 ]] --[[ Name: onChallengeCompleted ]]
                -- upvalues: v30 (copy)
                v30:challengeContinue(v38);
            end, 
            onChallengeFailed = function(v39) --[[ Line: 111 ]] --[[ Name: onChallengeFailed ]]
                -- upvalues: v30 (copy)
                v30:failSession(v39);
            end, 
            accountService = v30.props.accountService
        });
    elseif l_challengeType_0 == v11.Biometric then
        return v4.createElement(v19, {
            challengeId = v30.props.challengeId, 
            challengeMetadata = l_challengeMetadata_0, 
            onChallengeCompleted = function(v40, v41) --[[ Line: 120 ]] --[[ Name: onChallengeCompleted ]]
                -- upvalues: v30 (copy)
                v30:challengeContinue(v40, v41);
            end, 
            onChallengeAbandoned = function(v42) --[[ Line: 123 ]] --[[ Name: onChallengeAbandoned ]]
                -- upvalues: v30 (copy)
                v30:abandonSession(v42);
            end, 
            onChallengeFailed = function(v43) --[[ Line: 126 ]] --[[ Name: onChallengeFailed ]]
                -- upvalues: v30 (copy)
                v30:failSession(v43);
            end
        });
    else
        return nil;
    end;
end;
v24.clearState = function(v44) --[[ Line: 135 ]] --[[ Name: clearState ]]
    v44.props.navigation.goBack();
end;
v24.failSession = function(v45, v46) --[[ Line: 139 ]] --[[ Name: failSession ]]
    v45.props.onSessionFailed(v46);
    v45:clearState();
end;
v24.abandonSession = function(v47, v48) --[[ Line: 144 ]] --[[ Name: abandonSession ]]
    v47.props.onSessionAbandoned(v48);
    v47:clearState();
end;
v24.validateChallengeAndSetState = function(v49, v50, v51) --[[ Line: 149 ]] --[[ Name: validateChallengeAndSetState ]]
    -- upvalues: v11 (copy), v20 (copy), v15 (copy), v21 (copy)
    local v52 = v11.toRawValue(v50);
    if v50 == nil or v50 == v11.Denied or v51 == nil or v51 == "" then
        if v20() then
            v49.props.loggingProtocol:logRobloxTelemetryEvent(v15, {}, {
                context = "renderFailure", 
                challengeId = v49.props.challengeId, 
                challengeType = v52, 
                challengeMetadata = v51
            });
        end;
        v49:failSession();
        return;
    elseif canRenderNativeChallenge(v50, v51) then
        if v20() then
            v49.props.loggingProtocol:logRobloxTelemetryEvent(v15, {}, {
                context = "challengeTriggered", 
                challengeId = v49.props.challengeId, 
                challengeType = v52, 
                challengeMetadata = v51
            });
        end;
        v49:setState({
            challengeType = v50, 
            challengeMetadata = v51
        });
        return;
    elseif v21() then
        if v20() then
            v49.props.loggingProtocol:logRobloxTelemetryEvent(v15, {}, {
                context = "webviewChallengeTriggered", 
                challengeId = v49.props.challengeId, 
                challengeType = v52, 
                challengeMetadata = v51
            });
        end;
        v49:clearState();
        v49.props.onWebViewChallengeIssued(v52, v51);
        return;
    else
        if v20() then
            v49.props.loggingProtocol:logRobloxTelemetryEvent(v15, {}, {
                context = "renderFailure", 
                challengeId = v49.props.challengeId, 
                challengeType = v52, 
                challengeMetadata = v51
            });
        end;
        v49:failSession();
        return;
    end;
end;
v24.challengeContinue = function(v53, v54, v55) --[[ Line: 215 ]] --[[ Name: challengeContinue ]]
    -- upvalues: v11 (copy), v14 (copy), l_HttpService_0 (copy), v25 (copy), v22 (copy), v20 (copy), v15 (copy)
    local v56 = v11.toRawValue(v53.state.challengeType);
    return v14.new(function(v57, _) --[[ Line: 217 ]]
        -- upvalues: l_HttpService_0 (ref), v53 (copy), v56 (copy), v54 (copy), v25 (ref), v22 (ref), v55 (copy), v11 (ref), v20 (ref), v15 (ref)
        local v59 = {
            postBody = l_HttpService_0:JSONEncode({
                challengeId = v53.props.challengeId, 
                challengeType = v56, 
                challengeMetadata = v54
            })
        };
        local v60, _ = v53.props.networkImpl(v25(), "POST", v59);
        return v60:andThen(function(v62) --[[ Line: 226 ]]
            -- upvalues: v22 (ref), v55 (ref), v11 (ref), v53 (ref), v57 (copy)
            if v22() and v55 ~= nil then
                v55();
            end;
            local l_responseBody_0 = v62.responseBody;
            if l_responseBody_0.challengeType ~= nil and l_responseBody_0.challengeType ~= "" then
                local v64 = v11.fromRawValue(l_responseBody_0.challengeType);
                v53:validateChallengeAndSetState(v64, l_responseBody_0.challengeMetadata);
                v57();
                return;
            else
                v53.props.onSessionCompleted();
                v53:clearState();
                v57();
                return;
            end;
        end, function(v65) --[[ Line: 240 ]]
            -- upvalues: v20 (ref), v53 (ref), v15 (ref), v56 (ref), v54 (ref), v57 (copy)
            if v20() then
                v53.props.loggingProtocol:logRobloxTelemetryEvent(v15, {}, {
                    context = "continueFailure", 
                    challengeId = v53.props.challengeId, 
                    challengeType = v56, 
                    challengeMetadata = v54, 
                    error = tostring(v65.StatusCode)
                });
            end;
            v53:failSession(v65);
            v57();
        end);
    end);
end;
local l_v24_0 = v24;
v24 = v6.withNavigation(function(v67) --[[ Line: 258 ]]
    -- upvalues: v4 (copy), l_v24_0 (copy), v5 (copy)
    return v4.createElement(l_v24_0, v5.Dictionary.join(v67, v67.navigation.getParam("extraProps", {})));
end);
v24 = v8.connect(nil, nil)(v24);
return (l_RoactServices_0.connect({
    networkImpl = v3, 
    analytics = v7, 
    loggingProtocol = l_AppLogging_0
})(v24));