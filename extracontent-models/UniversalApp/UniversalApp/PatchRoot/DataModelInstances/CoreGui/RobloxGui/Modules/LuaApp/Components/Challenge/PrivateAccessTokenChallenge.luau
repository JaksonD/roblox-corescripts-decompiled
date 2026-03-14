local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppLogging_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLogging;
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_Modules_0.LuaApp.Analytics.RobloxTelemetryConfigs.PrivateAccessTokenChallengeEvent);
local v9 = require(l_Modules_0.LuaApp.Components.Challenge.ChallengeEventConstants);
local v10 = v3.PureComponent:extend(script.Name);
v10.validateProps = v7.intersection(v7.interface({
    challengeId = v7.string, 
    challengeMetadata = v7.string, 
    onChallengeCompleted = v7.callback, 
    onChallengeFailed = v7.callback, 
    accountService = v7.interface({
        DeviceIntegrityAvailable = v7.callback, 
        GetDeviceIntegrityToken = v7.optional(v7.callback)
    }), 
    loggingProtocol = v7.interface({
        logRobloxTelemetryEvent = v7.callback
    })
}));
v10.init = function(v11) --[[ Line: 41 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy), v9 (copy), l_HttpService_0 (copy)
    v11.props.loggingProtocol:logRobloxTelemetryEvent(v8, {}, {
        context = v9.ChallengeLifecycleEventConstants.ChallengeInitialized, 
        challengeId = v11.props.challengeId
    });
    local l_accountService_0 = v11.props.accountService;
    if l_accountService_0 and l_accountService_0:DeviceIntegrityAvailable() then
        local l_l_accountService_0_DeviceIntegrityTokenYield_0 = l_accountService_0:GetDeviceIntegrityTokenYield((l_HttpService_0:JSONEncode({
            challengeId = v11.props.challengeId
        })));
        if l_l_accountService_0_DeviceIntegrityTokenYield_0 == nil or l_l_accountService_0_DeviceIntegrityTokenYield_0 == "" then
            v11:onRetrieveTokenFailure();
            return;
        else
            local v14 = l_HttpService_0:JSONDecode(l_l_accountService_0_DeviceIntegrityTokenYield_0);
            if v14.errorCode ~= nil then
                v11:onRetrieveTokenFailure();
                return;
            else
                v11.props.onChallengeCompleted(l_HttpService_0:JSONEncode({
                    redemptionToken = v14.redemptionToken
                }));
                v11.props.loggingProtocol:logRobloxTelemetryEvent(v8, {}, {
                    context = v9.ChallengeLifecycleEventConstants.ChallengeCompleted, 
                    challengeId = v11.props.challengeId
                });
                return;
            end;
        end;
    else
        v11:onRetrieveTokenFailure();
        return;
    end;
end;
v10.onRetrieveTokenFailure = function(v15) --[[ Line: 75 ]] --[[ Name: onRetrieveTokenFailure ]]
    -- upvalues: v8 (copy), v9 (copy), l_HttpService_0 (copy)
    v15.props.loggingProtocol:logRobloxTelemetryEvent(v8, {}, {
        context = v9.ChallengeLifecycleEventConstants.ChallengeInvalidated, 
        challengeId = v15.props.challengeId
    });
    v15.props.onChallengeCompleted(l_HttpService_0:JSONEncode({
        redemptionToken = ""
    }));
end;
v10.render = function(v16) --[[ Line: 86 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy)
    local v17 = UDim2.fromOffset(v16.props.screenSize.X, v16.props.screenSize.Y);
    return v3.createElement("Frame", {
        Size = v17, 
        BackgroundTransparency = 1, 
        Active = true
    });
end;
v10 = v4.connect(function(v18, _) --[[ Line: 95 ]]
    return {
        screenSize = v18.ScreenSize
    };
end, nil)(v10);
return (l_RoactServices_0.connect({
    loggingProtocol = l_AppLogging_0
})(v10));