local l_script_FirstAncestor_0 = script:FindFirstAncestor("AmpUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppLinking_0 = require(l_Parent_0.RoactServiceTags).AppLinking;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Promise);
local l_IDVApiProvider_0 = require(l_Parent_0.IdentityVerification).IDVApiProvider;
local l_usePollIDVStatus_0 = require(l_Parent_0.IdentityVerification).usePollIDVStatus;
local l_LoadingSpinner_0 = require(l_Parent_0.UIBlox).App.Loading.LoadingSpinner;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v13 = require(script.Parent.FacialAgeEstimationServiceWrapper);
local v14 = require(script.Parent.FAEDirectLinkUpsell);
local v15 = require(script.Parent.FAEFailedModal);
local v16 = require(script.Parent.FAELoadingModal);
local v17 = require(l_Parent_0.AuthAnalytics);
local l_authMsgShown_0 = v17.Events.authMsgShown;
local l_authModalShown_0 = v17.Events.authModalShown;
local l_authFormInteraction_0 = v17.Events.authFormInteraction;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v23 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableRoactNetworkingForChallengeInteception);
local v24 = require(l_script_FirstAncestor_0.Flags.GetFFlagShowFAELoadingModal);
local v25 = game:DefineFastFlag("EnableFAECancellationAnalytics", false);
local v26 = game:DefineFastFlag("EnableValidateFAEVerificationLink", false);
local l_GetFFlagMoveAmpUpsellOffNavigateDown_0 = require(l_Parent_0.SharedFlags).GetFFlagMoveAmpUpsellOffNavigateDown;
local l_FFlagEnableCommsFAEUpsell_0 = require(l_Parent_0.SharedFlags).FFlagEnableCommsFAEUpsell;
local l_logEventOnceIfEnabled_0 = require(l_script_FirstAncestor_0.Common.LoggingUtils).logEventOnceIfEnabled;
local v30 = game:DefineFastInt("FAEWithCallbackPollDelay", 2);
local v31 = game:DefineFastInt("FAEWithCallbackPollMaxRetries", 5);
local v32 = game:DefineFastInt("FAEBackgroundOnlyPollDelay", 15);
local v33 = game:DefineFastInt("FAEBackgroundOnlyPollMaxRetries", 40);
local v34 = game:DefineFastInt("FAEWithWebViewCallbackPollDelay", 2);
local v35 = game:DefineFastInt("FAEWithWebViewCallbackPollMaxRetries", 15);
return function() --[[ Line: 65 ]] --[[ Name: FAEUpsellContainer ]]
    -- upvalues: l_useNavigation_0 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useAppPolicy_0 (copy), l_FFlagEnableCommsFAEUpsell_0 (copy), l_AppLinking_0 (copy), v3 (copy), l_authModalShown_0 (copy), l_authFormInteraction_0 (copy), l_authMsgShown_0 (copy), l_GetFFlagMoveAmpUpsellOffNavigateDown_0 (copy), l_AppPage_0 (copy), l_NavigateDown_0 (copy), v13 (copy), v30 (copy), v31 (copy), v34 (copy), v35 (copy), v32 (copy), v33 (copy), l_usePollIDVStatus_0 (copy), v26 (copy), v4 (copy), v23 (copy), l_logEventOnceIfEnabled_0 (copy), l_IDVApiProvider_0 (copy), v25 (copy), v15 (copy), v14 (copy), v24 (copy), v16 (copy), l_LoadingSpinner_0 (copy)
    local v36 = l_useNavigation_0();
    local v37 = l_useDispatch_0();
    local v38 = l_useRoactService_0(l_RoactNetworking_0);
    local v40 = l_useAppPolicy_0(function(v39) --[[ Line: 70 ]]
        return v39.getHasWebViewSupportForFAE();
    end);
    local v41 = v36.getParam("extraProps");
    local l_entryPointEventCtx_0 = v41.entryPointEventCtx;
    local l_metadata_0 = v41.metadata;
    local v44 = if l_FFlagEnableCommsFAEUpsell_0 then v41.skipFacialAgeEstimationWebLinkModal else nil;
    local v45 = l_useRoactService_0(l_AppLinking_0);
    local l_onSuccess_0 = v41.onSuccess;
    local l_onCancel_0 = v41.onCancel;
    local l_onFailure_0 = v41.onFailure;
    local l_onRetry_0 = v41.onRetry;
    local v50, v51 = v3.useState(false);
    local v52, v53 = v3.useState(nil);
    local v54, v55 = v3.useState(false);
    local v56, v57 = v3.useState(false);
    local v58 = l_metadata_0 and l_metadata_0.sessionId or "";
    local v59, v60 = v3.useState(v58);
    local v62 = v3.useCallback(function(v61) --[[ Line: 96 ]]
        -- upvalues: l_authModalShown_0 (ref), l_entryPointEventCtx_0 (copy), v51 (copy)
        l_authModalShown_0(l_entryPointEventCtx_0, v61, "faeFailed");
        v51(true);
    end, {
        l_entryPointEventCtx_0
    });
    local v64 = v3.useCallback(function(v63) --[[ Line: 101 ]]
        -- upvalues: l_authFormInteraction_0 (ref), l_entryPointEventCtx_0 (copy), l_onCancel_0 (copy)
        l_authFormInteraction_0(l_entryPointEventCtx_0, v63, "faeCancelled");
        l_onCancel_0();
    end, {
        l_onCancel_0, 
        l_entryPointEventCtx_0
    });
    local v66 = v3.useCallback(function(v65) --[[ Line: 106 ]]
        -- upvalues: l_authMsgShown_0 (ref), l_entryPointEventCtx_0 (copy), l_onSuccess_0 (copy)
        l_authMsgShown_0(l_entryPointEventCtx_0, v65, "faeSuccess");
        l_onSuccess_0();
    end, {
        l_onSuccess_0, 
        l_entryPointEventCtx_0
    });
    local v69 = v3.useCallback(function(v67, v68) --[[ Line: 111 ]]
        -- upvalues: l_GetFFlagMoveAmpUpsellOffNavigateDown_0 (ref), v36 (copy), l_AppPage_0 (ref), v37 (copy), l_NavigateDown_0 (ref)
        if l_GetFFlagMoveAmpUpsellOffNavigateDown_0() then
            v36.push(l_AppPage_0.GenericWebPage, {
                detail = v67, 
                extraProps = {
                    title = "", 
                    onClose = function() --[[ Line: 117 ]] --[[ Name: onClose ]]
                        -- upvalues: v68 (copy)
                        v68();
                    end
                }
            });
            return;
        else
            v37(l_NavigateDown_0({
                name = l_AppPage_0.GenericWebPage, 
                detail = v67, 
                extraProps = {
                    title = "", 
                    onClose = function() --[[ Line: 128 ]] --[[ Name: onClose ]]
                        -- upvalues: v68 (copy)
                        v68();
                    end
                }
            }));
            return;
        end;
    end, {
        l_GetFFlagMoveAmpUpsellOffNavigateDown_0() and v36 or v37
    });
    local v70 = v3.useMemo(function() --[[ Line: 136 ]]
        -- upvalues: v13 (ref), v30 (ref), v31 (ref), v40 (copy), v34 (ref), v35 (ref), v32 (ref), v33 (ref)
        if v13.isAvailable() then
            return {
                delay = v30, 
                retries = v31
            };
        elseif v40 then
            return {
                delay = v34, 
                retries = v35
            };
        else
            return {
                delay = v32, 
                retries = v33
            };
        end;
    end, {
        v40
    });
    local v71, v72 = l_usePollIDVStatus_0({
        delay = v70.delay, 
        retries = v70.retries
    });
    local v79 = v3.useCallback(function(v73, v74) --[[ Line: 158 ]]
        -- upvalues: v13 (ref), l_authModalShown_0 (ref), l_entryPointEventCtx_0 (copy), v55 (copy), v26 (ref), v4 (ref), v40 (copy), v69 (copy), l_FFlagEnableCommsFAEUpsell_0 (ref), v44 (copy), v45 (copy), v53 (copy)
        local l_sessionIdentifier_0 = v73.sessionIdentifier;
        local l_verificationLink_0 = v73.verificationLink;
        local l_sessionToken_0 = v73.sessionToken;
        if v13.isAvailable() then
            l_authModalShown_0(l_entryPointEventCtx_0, v74, "nativeFae");
            v55(true);
            return v13.startFlow(l_sessionIdentifier_0, l_sessionToken_0);
        elseif v26 and (not l_verificationLink_0 or l_verificationLink_0 == "") then
            return v4.reject("Invalid verification link");
        else
            l_authModalShown_0(l_entryPointEventCtx_0, v74, "noNativeFae");
            v55(false);
            if v40 then
                return v4.new(function(v78) --[[ Line: 177 ]]
                    -- upvalues: l_sessionIdentifier_0 (copy), v69 (ref), l_verificationLink_0 (copy)
                    v69(l_verificationLink_0, function() --[[ Line: 178 ]]
                        -- upvalues: v78 (copy), l_sessionIdentifier_0 (ref)
                        v78(l_sessionIdentifier_0);
                    end);
                end);
            else
                if l_FFlagEnableCommsFAEUpsell_0 and v44 then
                    v45:openURL(l_verificationLink_0);
                else
                    v53(l_verificationLink_0);
                end;
                return v4.resolve(l_sessionIdentifier_0);
            end;
        end;
    end, {
        l_entryPointEventCtx_0, 
        v40, 
        v69, 
        v55, 
        if l_FFlagEnableCommsFAEUpsell_0 then v44 else nil, 
        if l_FFlagEnableCommsFAEUpsell_0 then v45 else nil
    });
    v3.useEffect(function() --[[ Line: 204 ]]
        -- upvalues: v58 (copy), v23 (ref), l_logEventOnceIfEnabled_0 (ref), l_IDVApiProvider_0 (ref), v38 (copy), v60 (copy), v79 (copy), v57 (copy), v71 (copy), v66 (copy), v25 (ref), v64 (copy), v62 (copy), v72 (copy)
        local l_v58_0 = v58;
        if v23() then
            l_logEventOnceIfEnabled_0("start_verification_init");
            l_IDVApiProvider_0.startVerificationWithWrappedNetworking(v38, {
                ageEstimation = true
            }):andThen(function(v81) --[[ Line: 209 ]]
                -- upvalues: l_v58_0 (ref), v60 (ref), l_logEventOnceIfEnabled_0 (ref)
                l_v58_0 = ("%*_%*"):format(l_v58_0, v81.sessionIdentifier);
                v60(l_v58_0);
                l_logEventOnceIfEnabled_0("start_verification_end");
                return v81;
            end):andThen(function(v82) --[[ Line: 215 ]]
                -- upvalues: l_logEventOnceIfEnabled_0 (ref), v79 (ref), l_v58_0 (ref)
                l_logEventOnceIfEnabled_0("persona_flow_init");
                return v79(v82, l_v58_0);
            end):andThen(function(v83) --[[ Line: 219 ]]
                -- upvalues: l_logEventOnceIfEnabled_0 (ref), v57 (ref), v71 (ref)
                l_logEventOnceIfEnabled_0("persona_flow_end");
                v57(true);
                l_logEventOnceIfEnabled_0("status_polling_init");
                return v71(v83);
            end):andThen(function() --[[ Line: 225 ]]
                -- upvalues: l_logEventOnceIfEnabled_0 (ref), v66 (ref), l_v58_0 (ref)
                l_logEventOnceIfEnabled_0("status_polling_end");
                return v66(l_v58_0);
            end):catch(function(v84) --[[ Line: 229 ]]
                -- upvalues: l_logEventOnceIfEnabled_0 (ref), v25 (ref), v64 (ref), l_v58_0 (ref), v62 (ref)
                l_logEventOnceIfEnabled_0("status_polling_end");
                if v25 and v84 and v84.resultType == Enum.FacialAgeEstimationResultType.Cancel then
                    v64(l_v58_0);
                    return;
                else
                    v62(l_v58_0);
                    return;
                end;
            end);
            return function() --[[ Line: 242 ]]
                -- upvalues: v72 (ref)
                v72();
            end;
        else
            l_IDVApiProvider_0.startVerification({
                ageEstimation = true
            }):andThen(function(v85) --[[ Line: 247 ]]
                -- upvalues: l_v58_0 (ref), v60 (ref)
                l_v58_0 = ("%*_%*"):format(l_v58_0, v85.sessionIdentifier);
                v60(l_v58_0);
                return v85;
            end):andThen(function(v86) --[[ Line: 252 ]]
                -- upvalues: v79 (ref), l_v58_0 (ref)
                return v79(v86, l_v58_0);
            end):andThen(function(v87) --[[ Line: 255 ]]
                -- upvalues: v57 (ref), v71 (ref)
                v57(true);
                return v71(v87);
            end):andThen(function() --[[ Line: 259 ]]
                -- upvalues: v66 (ref), l_v58_0 (ref)
                return v66(l_v58_0);
            end):catch(function(v88) --[[ Line: 262 ]]
                -- upvalues: v25 (ref), v64 (ref), l_v58_0 (ref), v62 (ref)
                if v25 and v88 and v88.resultType == Enum.FacialAgeEstimationResultType.Cancel then
                    v64(l_v58_0);
                    return;
                else
                    v62(l_v58_0);
                    return;
                end;
            end);
            return function() --[[ Line: 274 ]]
                -- upvalues: v72 (ref)
                v72();
            end;
        end;
    end, {});
    if v50 then
        return v3.createElement(v15, {
            sessionId = v59, 
            entryPointEventCtx = l_entryPointEventCtx_0, 
            onClose = l_onFailure_0, 
            onRetry = l_onRetry_0
        });
    elseif v52 then
        return v3.createElement(v14, {
            sessionId = v59, 
            entryPointEventCtx = l_entryPointEventCtx_0, 
            webLink = v52, 
            onCancel = l_onCancel_0
        });
    elseif v24() and v56 and not v54 then
        return v3.createElement(v16, {
            sessionId = v59, 
            entryPointEventCtx = l_entryPointEventCtx_0, 
            onCancel = l_onCancel_0
        });
    else
        return v3.createElement(l_LoadingSpinner_0, {
            size = UDim2.fromOffset(42, 42), 
            position = UDim2.fromScale(0.5, 0.5), 
            anchorPoint = Vector2.new(0.5, 0.5)
        });
    end;
end;