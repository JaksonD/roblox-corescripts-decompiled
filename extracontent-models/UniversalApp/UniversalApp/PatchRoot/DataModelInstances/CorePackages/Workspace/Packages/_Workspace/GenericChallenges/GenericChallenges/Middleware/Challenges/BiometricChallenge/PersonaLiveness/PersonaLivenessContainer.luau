local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericChallenges");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Promise);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v9 = require(l_Parent_0.IdentityVerification);
local l_IDVApiProvider_0 = v9.IDVApiProvider;
local l_usePollIDVStatus_0 = v9.usePollIDVStatus;
local l_LoadingSpinner_0 = require(l_Parent_0.UIBlox).App.Loading.LoadingSpinner;
local v13 = require(script.Parent.PersonaLivenessServiceWrapper);
local v14 = require(script.Parent.PersonaLivenessHosted);
local l_BiometricTypeEnum_0 = require(script.Parent.Parent.Common.Enums).BiometricTypeEnum;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppLogging_0 = require(l_Parent_0.RoactServiceTags).AppLogging;
local v18 = require(script.Parent.Parent.Common.BiometricChallengeEvent);
local v19 = require(l_script_FirstAncestor_0.Utils.ChallengeEventConstants);
local v20 = game:DefineFastInt("LivenessWithCallbackPollDelay", 2);
local v21 = game:DefineFastInt("LivenessWithCallbackPollMaxRetries", 5);
local v22 = game:DefineFastInt("LivenessBackgroundOnlyPollDelay", 6);
local v23 = game:DefineFastInt("LivenessBackgroundOnlyPollMaxRetries", 30);
return function(v24) --[[ Line: 43 ]] --[[ Name: PersonaLivenessContainer ]]
    -- upvalues: l_useDispatch_0 (copy), l_useAppPolicy_0 (copy), l_useRoactService_0 (copy), l_AppLogging_0 (copy), v3 (copy), v18 (copy), v19 (copy), l_BiometricTypeEnum_0 (copy), l_HttpService_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v13 (copy), v20 (copy), v21 (copy), v22 (copy), v23 (copy), l_usePollIDVStatus_0 (copy), v4 (copy), l_IDVApiProvider_0 (copy), v14 (copy), l_LoadingSpinner_0 (copy)
    local v25 = l_useDispatch_0();
    local v27 = l_useAppPolicy_0(function(v26) --[[ Line: 47 ]]
        return v26.getHasWebViewSupportForFAE();
    end);
    local v28 = l_useRoactService_0(l_AppLogging_0);
    local v29, v30 = v3.useState(nil);
    local v32 = v3.useCallback(function(v31) --[[ Line: 55 ]]
        -- upvalues: v24 (copy), v28 (copy), v18 (ref), v19 (ref), l_BiometricTypeEnum_0 (ref)
        v24.onChallengeFailed(v31);
        v28:logRobloxTelemetryEvent(v18, {}, {
            context = v19.ChallengeLifecycleEventConstants.ChallengeInvalidated, 
            challengeId = v24.challengeId, 
            biometricType = l_BiometricTypeEnum_0.PersonaLiveness
        });
    end, {});
    local v33 = v3.useCallback(function() --[[ Line: 64 ]]
        -- upvalues: v24 (copy), v28 (copy), v18 (ref), v19 (ref), l_BiometricTypeEnum_0 (ref)
        v24.onChallengeAbandoned("");
        v28:logRobloxTelemetryEvent(v18, {}, {
            context = v19.ChallengeLifecycleEventConstants.ChallengeAbandoned, 
            challengeId = v24.challengeId, 
            biometricType = l_BiometricTypeEnum_0.PersonaLiveness
        });
    end, {});
    local v34 = v3.useCallback(function() --[[ Line: 73 ]]
        -- upvalues: v24 (copy), l_HttpService_0 (ref), l_BiometricTypeEnum_0 (ref), v28 (copy), v18 (ref), v19 (ref)
        v24.onChallengeCompleted(l_HttpService_0:JSONEncode({
            biometricType = l_BiometricTypeEnum_0.PersonaLiveness
        }));
        v28:logRobloxTelemetryEvent(v18, {}, {
            context = v19.ChallengeLifecycleEventConstants.ChallengeCompleted, 
            challengeId = v24.challengeId, 
            biometricType = l_BiometricTypeEnum_0.PersonaLiveness
        });
    end, {});
    local v37 = v3.useCallback(function(v35, v36) --[[ Line: 84 ]]
        -- upvalues: v25 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        v25(l_NavigateDown_0({
            name = l_AppPage_0.GenericWebPage, 
            detail = v35, 
            extraProps = {
                title = "", 
                onClose = function() --[[ Line: 90 ]] --[[ Name: onClose ]]
                    -- upvalues: v36 (copy)
                    v36();
                end
            }
        }));
    end, {
        v25
    });
    local v38 = v3.useMemo(function() --[[ Line: 97 ]]
        -- upvalues: v13 (ref), v27 (copy), v20 (ref), v21 (ref), v22 (ref), v23 (ref)
        if v13.isAvailable() or v27 then
            return {
                delay = v20, 
                retries = v21
            };
        else
            return {
                delay = v22, 
                retries = v23
            };
        end;
    end);
    local v39, v40 = l_usePollIDVStatus_0({
        delay = v38.delay, 
        retries = v38.retries
    });
    local v46 = v3.useCallback(function(v41) --[[ Line: 114 ]]
        -- upvalues: v13 (ref), v27 (copy), v4 (ref), v37 (copy), v30 (copy)
        local l_sessionIdentifier_0 = v41.sessionIdentifier;
        local l_sessionToken_0 = v41.sessionToken;
        if v13.isAvailable() then
            return v13.startFlow(l_sessionIdentifier_0, l_sessionToken_0);
        elseif v27 then
            return v4.new(function(v44) --[[ Line: 121 ]]
                -- upvalues: l_sessionIdentifier_0 (copy), v37 (ref), v41 (copy)
                local function v45() --[[ Line: 122 ]]
                    -- upvalues: v44 (copy), l_sessionIdentifier_0 (ref)
                    v44(l_sessionIdentifier_0);
                end;
                v37(v41.verificationLink, v45);
            end);
        else
            v30(v41.verificationLink);
            return v4.resolve(l_sessionIdentifier_0);
        end;
    end, {
        v27, 
        v37
    });
    v3.useEffect(function() --[[ Line: 134 ]]
        -- upvalues: l_IDVApiProvider_0 (ref), v46 (copy), v39 (copy), v34 (copy), v33 (copy), v32 (copy), v40 (copy)
        l_IDVApiProvider_0.startLivenessVerification():andThen(function(v47) --[[ Line: 136 ]]
            return v47;
        end):andThen(function(v48) --[[ Line: 139 ]]
            -- upvalues: v46 (ref)
            return v46(v48);
        end):andThen(function(v49) --[[ Line: 142 ]]
            -- upvalues: v39 (ref)
            return v39(v49);
        end):andThen(function() --[[ Line: 145 ]]
            -- upvalues: v34 (ref)
            return v34();
        end):catch(function(v50) --[[ Line: 148 ]]
            -- upvalues: v33 (ref), v32 (ref)
            if v50 and v50.resultType == Enum.FacialAgeEstimationResultType.Cancel then
                v33();
                return;
            else
                v32("Persona error");
                return;
            end;
        end);
        return function() --[[ Line: 156 ]]
            -- upvalues: v40 (ref)
            v40();
        end;
    end, {});
    if v29 then
        return v3.createElement(v14, {
            sessionId = "", 
            webLink = v29, 
            onCancel = function() --[[ Line: 165 ]] --[[ Name: onCancel ]]
                -- upvalues: v33 (copy)
                v33();
            end
        });
    else
        return v3.createElement(l_LoadingSpinner_0, {
            size = UDim2.fromOffset(42, 42), 
            position = UDim2.fromScale(0.5, 0.5), 
            anchorPoint = Vector2.new(0.5, 0.5)
        });
    end;
end;