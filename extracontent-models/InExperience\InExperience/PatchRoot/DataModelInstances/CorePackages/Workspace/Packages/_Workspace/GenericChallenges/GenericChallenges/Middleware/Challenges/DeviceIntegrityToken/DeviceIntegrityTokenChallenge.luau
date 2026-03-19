local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericChallenges");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppLogging_0 = require(l_Parent_0.RoactServiceTags).AppLogging;
local l_LoadingSpinner_0 = require(l_Parent_0.UIBlox).App.Loading.LoadingSpinner;
local v7 = require(script.Parent.DeviceIntegrityChallengeEvent);
local v8 = require(l_script_FirstAncestor_0.Middleware.Flags.GetFFlagEnableTransparentDeviceIntegrityChallengeSpinner);
local v9 = require(l_script_FirstAncestor_0.Middleware.Flags.GetFFlagEnableNewDeviceIntegrityFailureHandling);
local l_useEffect_0 = v3.useEffect;
local v11 = require(l_script_FirstAncestor_0.Utils.ChallengeEventConstants);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
game:DefineFastInt("DeviceIntegrityNativeTimeoutMilliseconds", 450);
constructAccountServiceParams = function(v13) --[[ Line: 19 ]] --[[ Name: constructAccountServiceParams ]]
    -- upvalues: l_HttpService_0 (copy)
    return l_HttpService_0:JSONEncode({
        requestHash = v13
    });
end;
return function(v14) --[[ Line: 52 ]] --[[ Name: DeviceIntegrityTokenChallenge ]]
    -- upvalues: l_useRoactService_0 (copy), l_AppLogging_0 (copy), l_useEffect_0 (copy), l_HttpService_0 (copy), v7 (copy), v11 (copy), v9 (copy), l_useSelector_0 (copy), v8 (copy), v3 (copy), l_LoadingSpinner_0 (copy)
    local v15 = l_useRoactService_0(l_AppLogging_0);
    l_useEffect_0(function() --[[ Line: 55 ]]
        -- upvalues: l_HttpService_0 (ref), v14 (copy), v15 (copy), v7 (ref), v11 (ref), v9 (ref)
        local v16 = l_HttpService_0:JSONDecode(v14.challengeMetadata);
        v15:logRobloxTelemetryEvent(v7, {}, {
            context = v11.ChallengeLifecycleEventConstants.ChallengeInitialized, 
            challengeId = v14.challengeId, 
            integrityType = v16.integrityType
        });
        local l_accountService_0 = v14.accountService;
        if l_accountService_0 and l_accountService_0:DeviceIntegrityAvailable() then
            local v18 = nil;
            if v9() then
                local l_l_accountService_0_DeviceIntegrityTokenYield_0 = l_accountService_0:GetDeviceIntegrityTokenYield((l_HttpService_0:JSONEncode({
                    requestHash = v16.requestHash, 
                    timeoutMillis = game:GetFastInt("DeviceIntegrityNativeTimeoutMilliseconds")
                })));
                if l_l_accountService_0_DeviceIntegrityTokenYield_0 == nil or l_l_accountService_0_DeviceIntegrityTokenYield_0 == "" then
                    v15:logRobloxTelemetryEvent(v7, {}, {
                        context = v11.ChallengeLifecycleEventConstants.ChallengeInvalidated, 
                        challengeId = v14.challengeId, 
                        integrityType = v16.integrityType
                    });
                    v14.onChallengeCompleted(l_HttpService_0:JSONEncode({
                        redemptionToken = "", 
                        integrityType = v16.integrityType
                    }));
                    return;
                else
                    v18 = l_HttpService_0:JSONDecode(l_l_accountService_0_DeviceIntegrityTokenYield_0);
                end;
            else
                v18 = l_HttpService_0:JSONDecode(l_accountService_0:GetDeviceIntegrityTokenYield(constructAccountServiceParams(v16.requestHash)));
            end;
            v14.onChallengeCompleted(l_HttpService_0:JSONEncode({
                redemptionToken = v18.token, 
                integrityType = v16.integrityType
            }));
            v15:logRobloxTelemetryEvent(v7, {}, {
                context = v11.ChallengeLifecycleEventConstants.ChallengeCompleted, 
                challengeId = v14.challengeId, 
                integrityType = v16.integrityType, 
                result = v18.result
            });
            return;
        elseif v9() then
            v15:logRobloxTelemetryEvent(v7, {}, {
                context = v11.ChallengeLifecycleEventConstants.ChallengeInvalidated, 
                challengeId = v14.challengeId, 
                integrityType = v16.integrityType
            });
            v14.onChallengeCompleted(l_HttpService_0:JSONEncode({
                redemptionToken = "", 
                integrityType = v16.integrityType
            }));
            return;
        else
            v14.onChallengeFailed();
            v15:logRobloxTelemetryEvent(v7, {}, {
                context = v11.ChallengeLifecycleEventConstants.ChallengeInvalidated, 
                challengeId = v14.challengeId, 
                integrityType = v16.integrityType
            });
            return;
        end;
    end, {});
    local v21 = l_useSelector_0(function(v20) --[[ Line: 129 ]]
        return {
            screenSize = v20.ScreenSize
        };
    end);
    local v22 = UDim2.fromOffset(v21.screenSize.X, v21.screenSize.Y);
    if v8() then
        return v3.createElement("Frame", {
            Size = v22, 
            BackgroundTransparency = 1, 
            Active = true
        }, {
            Spinner = v3.createElement(l_LoadingSpinner_0, {
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = UDim2.fromScale(0.5, 0.5), 
                size = UDim2.fromOffset(48, 48)
            })
        });
    else
        return v3.createElement("Frame", {
            Size = v22, 
            BackgroundTransparency = 0.2, 
            Active = true
        }, {
            Spinner = v3.createElement(l_LoadingSpinner_0, {
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = UDim2.fromScale(0.5, 0.5), 
                size = UDim2.fromOffset(48, 48)
            })
        });
    end;
end;