local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppLogging_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLogging;
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_Modules_0.LuaApp.Analytics.RobloxTelemetryConfigs.DeviceIntegrityChallengeEvent);
local v9 = require(l_Modules_0.LuaApp.Components.Challenge.ChallengeEventConstants);
local v10 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableDualNativeCallAppleIntegrity);
game:DefineFastInt("DeviceIntegrityNativeTimeoutMilliseconds", 450);
local v11 = v3.PureComponent:extend(script.Name);
v11.validateProps = v7.intersection(v7.interface({
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
v11.onRetrieveTokenFailure = function(v12, v13) --[[ Line: 44 ]] --[[ Name: onRetrieveTokenFailure ]]
    -- upvalues: v8 (copy), v9 (copy), l_HttpService_0 (copy)
    v12.props.loggingProtocol:logRobloxTelemetryEvent(v8, {}, {
        context = v9.ChallengeLifecycleEventConstants.ChallengeInvalidated, 
        challengeId = v12.props.challengeId, 
        integrityType = v13.integrityType
    });
    v12.props.onChallengeCompleted(l_HttpService_0:JSONEncode({
        redemptionToken = "", 
        integrityType = v13.integrityType
    }));
end;
v11.init = function(v14) --[[ Line: 57 ]] --[[ Name: init ]]
    -- upvalues: l_HttpService_0 (copy), v8 (copy), v9 (copy), v10 (copy)
    local v15 = l_HttpService_0:JSONDecode(v14.props.challengeMetadata);
    v14.props.loggingProtocol:logRobloxTelemetryEvent(v8, {}, {
        context = v9.ChallengeLifecycleEventConstants.ChallengeInitialized, 
        challengeId = v14.props.challengeId, 
        integrityType = v15.integrityType
    });
    local l_accountService_0 = v14.props.accountService;
    if l_accountService_0 and l_accountService_0:DeviceIntegrityAvailable() then
        local v17 = nil;
        if v10() and v15.integrityType == "appleintegrity" then
            v17 = l_accountService_0:GetDeviceIntegrityTokenYield((l_HttpService_0:JSONEncode({
                challengeId = v14.props.challengeId
            })));
        end;
        local l_l_accountService_0_DeviceIntegrityTokenYield_0 = l_accountService_0:GetDeviceIntegrityTokenYield((l_HttpService_0:JSONEncode({
            requestHash = v15.requestHash, 
            tokenType = v15.integrityType, 
            timeoutMillis = game:GetFastInt("DeviceIntegrityNativeTimeoutMilliseconds")
        })));
        if v10() and v15.integrityType == "appleintegrity" then
            if (l_l_accountService_0_DeviceIntegrityTokenYield_0 == nil or l_l_accountService_0_DeviceIntegrityTokenYield_0 == "") and (v17 == nil or v17 == "") then
                v14:onRetrieveTokenFailure(v15);
                return;
            end;
        elseif l_l_accountService_0_DeviceIntegrityTokenYield_0 == nil or l_l_accountService_0_DeviceIntegrityTokenYield_0 == "" then
            v14:onRetrieveTokenFailure(v15);
            return;
        end;
        local v19 = {
            token = "", 
            result = ""
        };
        if l_l_accountService_0_DeviceIntegrityTokenYield_0 ~= nil and l_l_accountService_0_DeviceIntegrityTokenYield_0 ~= "" then
            v19 = l_HttpService_0:JSONDecode(l_l_accountService_0_DeviceIntegrityTokenYield_0);
        end;
        if v10() and v15.integrityType == "appleintegrity" then
            local v20 = {
                redemptionToken = ""
            };
            if v17 ~= nil and v17 ~= "" then
                v20 = l_HttpService_0:JSONDecode(v17);
            end;
            v14.props.onChallengeCompleted(l_HttpService_0:JSONEncode({
                redemptionToken = v19.token, 
                integrityType = v15.integrityType, 
                attestationToken = v20.redemptionToken
            }), function() --[[ Line: 121 ]]
                -- upvalues: v15 (copy), l_accountService_0 (copy), l_HttpService_0 (ref)
                if v15.refreshProvider then
                    l_accountService_0:GetDeviceIntegrityTokenYield(l_HttpService_0:JSONEncode({
                        refreshTokenProvider = true
                    }));
                end;
            end);
        else
            v14.props.onChallengeCompleted(l_HttpService_0:JSONEncode({
                redemptionToken = v19.token, 
                integrityType = v15.integrityType
            }), function() --[[ Line: 136 ]]
                -- upvalues: v15 (copy), l_accountService_0 (copy), l_HttpService_0 (ref)
                if v15.refreshProvider then
                    l_accountService_0:GetDeviceIntegrityTokenYield(l_HttpService_0:JSONEncode({
                        refreshTokenProvider = true
                    }));
                end;
            end);
        end;
        v14.props.loggingProtocol:logRobloxTelemetryEvent(v8, {}, {
            context = v9.ChallengeLifecycleEventConstants.ChallengeCompleted, 
            challengeId = v14.props.challengeId, 
            integrityType = v15.integrityType, 
            result = v19.result
        });
        return;
    else
        v14:onRetrieveTokenFailure(v15);
        return;
    end;
end;
v11.render = function(v21) --[[ Line: 158 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy)
    local v22 = UDim2.fromOffset(v21.props.screenSize.X, v21.props.screenSize.Y);
    return v3.createElement("Frame", {
        Size = v22, 
        BackgroundTransparency = 1, 
        Active = true
    });
end;
v11 = v4.connect(function(v23, _) --[[ Line: 167 ]]
    return {
        screenSize = v23.ScreenSize
    };
end, nil)(v11);
return (l_RoactServices_0.connect({
    loggingProtocol = l_AppLogging_0
})(v11));