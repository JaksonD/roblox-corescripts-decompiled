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
local l_logEventOnceIfEnabled_0 = require(l_script_FirstAncestor_0.Common.LoggingUtils).logEventOnceIfEnabled;
local v29 = game:DefineFastInt("FAEWithCallbackPollDelay", 2);
local v30 = game:DefineFastInt("FAEWithCallbackPollMaxRetries", 5);
local v31 = game:DefineFastInt("FAEBackgroundOnlyPollDelay", 15);
local v32 = game:DefineFastInt("FAEBackgroundOnlyPollMaxRetries", 40);
local v33 = game:DefineFastInt("FAEWithWebViewCallbackPollDelay", 2);
local v34 = game:DefineFastInt("FAEWithWebViewCallbackPollMaxRetries", 15);
return function() --[[ Line: 64 ]] --[[ Name: FAEUpsellContainer ]]
    -- upvalues: l_useNavigation_0 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useAppPolicy_0 (copy), l_AppLinking_0 (copy), v3 (copy), l_authModalShown_0 (copy), l_authFormInteraction_0 (copy), l_authMsgShown_0 (copy), l_GetFFlagMoveAmpUpsellOffNavigateDown_0 (copy), l_AppPage_0 (copy), l_NavigateDown_0 (copy), v13 (copy), v29 (copy), v30 (copy), v33 (copy), v34 (copy), v31 (copy), v32 (copy), l_usePollIDVStatus_0 (copy), v26 (copy), v4 (copy), v23 (copy), l_logEventOnceIfEnabled_0 (copy), l_IDVApiProvider_0 (copy), v25 (copy), v15 (copy), v14 (copy), v24 (copy), v16 (copy), l_LoadingSpinner_0 (copy)
    local v35 = l_useNavigation_0();
    local v36 = l_useDispatch_0();
    local v37 = l_useRoactService_0(l_RoactNetworking_0);
    local v39 = l_useAppPolicy_0(function(v38) --[[ Line: 69 ]]
        return v38.getHasWebViewSupportForFAE();
    end);
    local v40 = v35.getParam("extraProps");
    local l_entryPointEventCtx_0 = v40.entryPointEventCtx;
    local l_metadata_0 = v40.metadata;
    local l_skipFacialAgeEstimationWebLinkModal_0 = v40.skipFacialAgeEstimationWebLinkModal;
    local v44 = l_useRoactService_0(l_AppLinking_0);
    local l_onSuccess_0 = v40.onSuccess;
    local l_onCancel_0 = v40.onCancel;
    local l_onFailure_0 = v40.onFailure;
    local l_onRetry_0 = v40.onRetry;
    local v49, v50 = v3.useState(false);
    local v51, v52 = v3.useState(nil);
    local v53, v54 = v3.useState(false);
    local v55, v56 = v3.useState(false);
    local v57 = l_metadata_0 and l_metadata_0.sessionId or "";
    local v58, v59 = v3.useState(v57);
    local v61 = v3.useCallback(function(v60) --[[ Line: 93 ]]
        -- upvalues: l_authModalShown_0 (ref), l_entryPointEventCtx_0 (copy), v50 (copy)
        l_authModalShown_0(l_entryPointEventCtx_0, v60, "faeFailed");
        v50(true);
    end, {
        l_entryPointEventCtx_0
    });
    local v63 = v3.useCallback(function(v62) --[[ Line: 98 ]]
        -- upvalues: l_authFormInteraction_0 (ref), l_entryPointEventCtx_0 (copy), l_onCancel_0 (copy)
        l_authFormInteraction_0(l_entryPointEventCtx_0, v62, "faeCancelled");
        l_onCancel_0();
    end, {
        l_onCancel_0, 
        l_entryPointEventCtx_0
    });
    local v65 = v3.useCallback(function(v64) --[[ Line: 103 ]]
        -- upvalues: l_authMsgShown_0 (ref), l_entryPointEventCtx_0 (copy), l_onSuccess_0 (copy)
        l_authMsgShown_0(l_entryPointEventCtx_0, v64, "faeSuccess");
        l_onSuccess_0();
    end, {
        l_onSuccess_0, 
        l_entryPointEventCtx_0
    });
    local v68 = v3.useCallback(function(v66, v67) --[[ Line: 108 ]]
        -- upvalues: l_GetFFlagMoveAmpUpsellOffNavigateDown_0 (ref), v35 (copy), l_AppPage_0 (ref), v36 (copy), l_NavigateDown_0 (ref)
        if l_GetFFlagMoveAmpUpsellOffNavigateDown_0() then
            v35.push(l_AppPage_0.GenericWebPage, {
                detail = v66, 
                extraProps = {
                    title = "", 
                    onClose = function() --[[ Line: 114 ]] --[[ Name: onClose ]]
                        -- upvalues: v67 (copy)
                        v67();
                    end
                }
            });
            return;
        else
            v36(l_NavigateDown_0({
                name = l_AppPage_0.GenericWebPage, 
                detail = v66, 
                extraProps = {
                    title = "", 
                    onClose = function() --[[ Line: 125 ]] --[[ Name: onClose ]]
                        -- upvalues: v67 (copy)
                        v67();
                    end
                }
            }));
            return;
        end;
    end, {
        l_GetFFlagMoveAmpUpsellOffNavigateDown_0() and v35 or v36
    });
    local v69 = v3.useMemo(function() --[[ Line: 133 ]]
        -- upvalues: v13 (ref), v29 (ref), v30 (ref), v39 (copy), v33 (ref), v34 (ref), v31 (ref), v32 (ref)
        if v13.isAvailable() then
            return {
                delay = v29, 
                retries = v30
            };
        elseif v39 then
            return {
                delay = v33, 
                retries = v34
            };
        else
            return {
                delay = v31, 
                retries = v32
            };
        end;
    end, {
        v39
    });
    local v70, v71 = l_usePollIDVStatus_0({
        delay = v69.delay, 
        retries = v69.retries
    });
    local v78 = v3.useCallback(function(v72, v73) --[[ Line: 155 ]]
        -- upvalues: v13 (ref), l_authModalShown_0 (ref), l_entryPointEventCtx_0 (copy), v54 (copy), v26 (ref), v4 (ref), v39 (copy), v68 (copy), l_skipFacialAgeEstimationWebLinkModal_0 (copy), v44 (copy), v52 (copy)
        local l_sessionIdentifier_0 = v72.sessionIdentifier;
        local l_verificationLink_0 = v72.verificationLink;
        local l_sessionToken_0 = v72.sessionToken;
        if v13.isAvailable() then
            l_authModalShown_0(l_entryPointEventCtx_0, v73, "nativeFae");
            v54(true);
            return v13.startFlow(l_sessionIdentifier_0, l_sessionToken_0);
        elseif v26 and (not l_verificationLink_0 or l_verificationLink_0 == "") then
            return v4.reject("Invalid verification link");
        else
            l_authModalShown_0(l_entryPointEventCtx_0, v73, "noNativeFae");
            v54(false);
            if v39 then
                return v4.new(function(v77) --[[ Line: 174 ]]
                    -- upvalues: l_sessionIdentifier_0 (copy), v68 (ref), l_verificationLink_0 (copy)
                    v68(l_verificationLink_0, function() --[[ Line: 175 ]]
                        -- upvalues: v77 (copy), l_sessionIdentifier_0 (ref)
                        v77(l_sessionIdentifier_0);
                    end);
                end);
            else
                if l_skipFacialAgeEstimationWebLinkModal_0 then
                    v44:openURL(l_verificationLink_0);
                else
                    v52(l_verificationLink_0);
                end;
                return v4.resolve(l_sessionIdentifier_0);
            end;
        end;
    end, {
        l_entryPointEventCtx_0, 
        v39, 
        v68, 
        v54, 
        l_skipFacialAgeEstimationWebLinkModal_0, 
        v44
    });
    v3.useEffect(function() --[[ Line: 201 ]]
        -- upvalues: v57 (copy), v23 (ref), l_logEventOnceIfEnabled_0 (ref), l_IDVApiProvider_0 (ref), v37 (copy), v59 (copy), v78 (copy), v56 (copy), v70 (copy), v65 (copy), v25 (ref), v63 (copy), v61 (copy), v71 (copy)
        local l_v57_0 = v57;
        if v23() then
            l_logEventOnceIfEnabled_0("start_verification_init");
            l_IDVApiProvider_0.startVerificationWithWrappedNetworking(v37, {
                ageEstimation = true
            }):andThen(function(v80) --[[ Line: 206 ]]
                -- upvalues: l_v57_0 (ref), v59 (ref), l_logEventOnceIfEnabled_0 (ref)
                l_v57_0 = ("%*_%*"):format(l_v57_0, v80.sessionIdentifier);
                v59(l_v57_0);
                l_logEventOnceIfEnabled_0("start_verification_end");
                return v80;
            end):andThen(function(v81) --[[ Line: 212 ]]
                -- upvalues: l_logEventOnceIfEnabled_0 (ref), v78 (ref), l_v57_0 (ref)
                l_logEventOnceIfEnabled_0("persona_flow_init");
                return v78(v81, l_v57_0);
            end):andThen(function(v82) --[[ Line: 216 ]]
                -- upvalues: l_logEventOnceIfEnabled_0 (ref), v56 (ref), v70 (ref)
                l_logEventOnceIfEnabled_0("persona_flow_end");
                v56(true);
                l_logEventOnceIfEnabled_0("status_polling_init");
                return v70(v82);
            end):andThen(function() --[[ Line: 222 ]]
                -- upvalues: l_logEventOnceIfEnabled_0 (ref), v65 (ref), l_v57_0 (ref)
                l_logEventOnceIfEnabled_0("status_polling_end");
                return v65(l_v57_0);
            end):catch(function(v83) --[[ Line: 226 ]]
                -- upvalues: l_logEventOnceIfEnabled_0 (ref), v25 (ref), v63 (ref), l_v57_0 (ref), v61 (ref)
                l_logEventOnceIfEnabled_0("status_polling_end");
                if v25 and v83 and v83.resultType == Enum.FacialAgeEstimationResultType.Cancel then
                    v63(l_v57_0);
                    return;
                else
                    v61(l_v57_0);
                    return;
                end;
            end);
            return function() --[[ Line: 239 ]]
                -- upvalues: v71 (ref)
                v71();
            end;
        else
            l_IDVApiProvider_0.startVerification({
                ageEstimation = true
            }):andThen(function(v84) --[[ Line: 244 ]]
                -- upvalues: l_v57_0 (ref), v59 (ref)
                l_v57_0 = ("%*_%*"):format(l_v57_0, v84.sessionIdentifier);
                v59(l_v57_0);
                return v84;
            end):andThen(function(v85) --[[ Line: 249 ]]
                -- upvalues: v78 (ref), l_v57_0 (ref)
                return v78(v85, l_v57_0);
            end):andThen(function(v86) --[[ Line: 252 ]]
                -- upvalues: v56 (ref), v70 (ref)
                v56(true);
                return v70(v86);
            end):andThen(function() --[[ Line: 256 ]]
                -- upvalues: v65 (ref), l_v57_0 (ref)
                return v65(l_v57_0);
            end):catch(function(v87) --[[ Line: 259 ]]
                -- upvalues: v25 (ref), v63 (ref), l_v57_0 (ref), v61 (ref)
                if v25 and v87 and v87.resultType == Enum.FacialAgeEstimationResultType.Cancel then
                    v63(l_v57_0);
                    return;
                else
                    v61(l_v57_0);
                    return;
                end;
            end);
            return function() --[[ Line: 271 ]]
                -- upvalues: v71 (ref)
                v71();
            end;
        end;
    end, {});
    if v49 then
        return v3.createElement(v15, {
            sessionId = v58, 
            entryPointEventCtx = l_entryPointEventCtx_0, 
            onClose = l_onFailure_0, 
            onRetry = l_onRetry_0
        });
    elseif v51 then
        return v3.createElement(v14, {
            sessionId = v58, 
            entryPointEventCtx = l_entryPointEventCtx_0, 
            webLink = v51, 
            onCancel = l_onCancel_0
        });
    elseif v24() and v55 and not v53 then
        return v3.createElement(v16, {
            sessionId = v58, 
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