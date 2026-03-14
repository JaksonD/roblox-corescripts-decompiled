local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericChallenges");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v5 = require(l_Parent_0.React);
local l_useState_0 = v5.useState;
local l_useEffect_0 = v5.useEffect;
local v8 = require(l_Parent_0.Roact);
local v9 = require(l_Parent_0.RoactNavigation);
local l_AppLogging_0 = require(l_Parent_0.RoactServiceTags).AppLogging;
local l_LoadingSpinner_0 = require(l_Parent_0.UIBlox).App.Loading.LoadingSpinner;
local v12 = require(script.Parent.DeviceAccessChallengeEvent);
local v13 = require(l_script_FirstAncestor_0.Utils.ChallengeEventConstants);
local v14 = require(l_script_FirstAncestor_0.Middleware.Flags.GetFFlagLuaAppChallengeMoreTelemetryEnabled);
return function(v15) --[[ Line: 32 ]] --[[ Name: DeviceAccessTokenChallenge ]]
    -- upvalues: l_useRoactService_0 (copy), l_AppLogging_0 (copy), l_HttpService_0 (copy), v14 (copy), l_useState_0 (copy), l_useEffect_0 (copy), v12 (copy), v13 (copy), l_useSelector_0 (copy), v8 (copy), l_LoadingSpinner_0 (copy), v9 (copy)
    local v16 = l_useRoactService_0(l_AppLogging_0);
    local v17 = nil;
    local v18 = nil;
    local v19 = nil;
    local v20 = nil;
    local v21 = l_HttpService_0:JSONDecode(v15.challengeMetadata);
    if v14() then
        local v22, v23 = l_useState_0(false);
        v17 = v22;
        v18 = v23;
        v22, v23 = l_useState_0(false);
        v19 = v22;
        v20 = v23;
    end;
    l_useEffect_0(function() --[[ Line: 44 ]]
        -- upvalues: v16 (copy), v12 (ref), v13 (ref), v15 (copy), v21 (copy), l_HttpService_0 (ref), v14 (ref), v18 (ref), v20 (ref)
        v16:logRobloxTelemetryEvent(v12, {}, {
            context = v13.ChallengeLifecycleEventConstants.ChallengeInitialized, 
            challengeId = v15.challengeId, 
            tokenType = v21.tokenType
        });
        local l_accountService_0 = v15.accountService;
        local v25 = nil;
        if l_accountService_0 and l_accountService_0:DeviceAccessTokenAvailable() then
            local v26 = l_HttpService_0:JSONDecode(l_accountService_0:GetDeviceAccessToken());
            v25 = v26.errorCode;
            if v25 == nil or v25 == "" then
                v26.accessToken.tokenType = v21.tokenType;
                if v14() then
                    v18(true);
                end;
                v15.onChallengeCompleted(l_HttpService_0:JSONEncode(v26.accessToken));
                v16:logRobloxTelemetryEvent(v12, {}, {
                    context = v13.ChallengeLifecycleEventConstants.ChallengeCompleted, 
                    challengeId = v15.challengeId, 
                    tokenType = v21.tokenType
                });
                return;
            end;
        end;
        if v14() then
            v20(true);
        end;
        v15.onChallengeFailed(v25);
        v16:logRobloxTelemetryEvent(v12, {}, {
            context = v13.ChallengeLifecycleEventConstants.ChallengeInvalidated, 
            challengeId = v15.challengeId, 
            tokenType = v21.tokenType, 
            errorCode = v25
        });
    end, {});
    local v28 = l_useSelector_0(function(v27) --[[ Line: 84 ]]
        return {
            screenSize = v27.ScreenSize
        };
    end);
    local v29 = UDim2.fromOffset(v28.screenSize.X, v28.screenSize.Y);
    return v8.createElement("Frame", {
        Size = v29, 
        BackgroundTransparency = 0.2, 
        Active = true
    }, {
        Spinner = v8.createElement(l_LoadingSpinner_0, {
            anchorPoint = Vector2.new(0.5, 0.5), 
            position = UDim2.fromScale(0.5, 0.5), 
            size = UDim2.fromOffset(48, 48)
        }), 
        NavigationEvents = if v14() then v8.createElement(v9.NavigationEvents, {
            onWillBlur = function() --[[ Line: 104 ]] --[[ Name: onWillBlur ]]
                -- upvalues: v17 (ref), v19 (ref), v16 (copy), v12 (ref), v13 (ref), v15 (copy), v21 (copy)
                if not v17 and not v19 then
                    v16:logRobloxTelemetryEvent(v12, {}, {
                        context = v13.ChallengeLifecycleEventConstants.ChallengeAbandoned, 
                        challengeId = v15.challengeId, 
                        tokenType = v21.tokenType
                    });
                end;
            end
        }) else nil
    });
end;