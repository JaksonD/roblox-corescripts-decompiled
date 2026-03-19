local l_script_FirstAncestor_0 = script:FindFirstAncestor("AmpUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v4 = require(l_script_FirstAncestor_0.Common.Enums);
local l_ActionTypeEnum_0 = v4.ActionTypeEnum;
local l_ActionStatusEnum_0 = v4.ActionStatusEnum;
local l_AccessResponseEnum_0 = v4.AccessResponseEnum;
local l_accountSettingsUpsellStrings_0 = require(l_script_FirstAncestor_0.Common.LocalizationStrings).accountSettingsUpsellStrings;
local l_LoadingSpinner_0 = require(l_Parent_0.UIBlox).App.Loading.LoadingSpinner;
local v10 = require(l_Parent_0.Cryo);
local v11 = require(l_script_FirstAncestor_0.Analytics.AnalyticsService);
local v12 = require(l_script_FirstAncestor_0.Analytics.sendModalActionEvent);
local v13 = require(l_script_FirstAncestor_0.Common.AmpApiProvider);
local v14 = require(l_script_FirstAncestor_0.Common.AppScreens);
local v15 = require(l_script_FirstAncestor_0.Components.ErrorScreen);
local l_useApolloClient_0 = require(l_Parent_0.ApolloClient).useApolloClient;
local v17 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableAmpUpsellGql);
local v18 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableAmpEmailUpsellSupport);
local v19 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableAmpIDVUpsellSupport);
local v20 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableAmpSubscriptionUpsell);
local l_FFlagEnableCommsFAEUpsell_0 = require(l_Parent_0.SharedFlags).FFlagEnableCommsFAEUpsell;
local l_logEventOnceIfEnabled_0 = require(l_script_FirstAncestor_0.Common.LoggingUtils).logEventOnceIfEnabled;
local function v27(v23) --[[ Line: 54 ]] --[[ Name: getSuccessfulActions ]]
    -- upvalues: l_ActionStatusEnum_0 (copy)
    local v24 = {};
    for v25, v26 in pairs(v23) do
        if v26 == l_ActionStatusEnum_0.Success then
            table.insert(v24, v25);
        end;
    end;
    return v24;
end;
return function(v28) --[[ Line: 64 ]] --[[ Name: WizardContainer ]]
    -- upvalues: l_useNavigation_0 (copy), v13 (copy), v11 (copy), v2 (copy), l_useApolloClient_0 (copy), l_ActionTypeEnum_0 (copy), v14 (copy), v10 (copy), l_ActionStatusEnum_0 (copy), l_AccessResponseEnum_0 (copy), v18 (copy), v19 (copy), l_FFlagEnableCommsFAEUpsell_0 (copy), l_logEventOnceIfEnabled_0 (copy), v20 (copy), l_accountSettingsUpsellStrings_0 (copy), v17 (copy), v27 (copy), v12 (copy), v15 (copy), l_LoadingSpinner_0 (copy)
    local v29 = l_useNavigation_0();
    local l_featureName_0 = v28.featureName;
    local l_nameSpace_0 = v28.nameSpace;
    local l_recourseData_0 = v28.recourseData;
    local l_extraParameters_0 = v28.extraParameters;
    local l_entryPointEventCtx_0 = v28.entryPointEventCtx;
    local l_openUpsells_0 = v28.openUpsells;
    local l_completionCallback_0 = v28.completionCallback;
    local l_metadata_0 = v28.metadata;
    local v38 = if v28.ampApiProvider then v28.ampApiProvider else v13;
    local v39 = if v28.analyticsService then v28.analyticsService else v11.EventStream;
    local v40 = if v28.openAccountSettingsUpsell then v28.openAccountSettingsUpsell else v29.push;
    local v41, v42 = v2.useState({});
    local v43, v44 = v2.useState(false);
    local v45 = l_useApolloClient_0();
    local v51 = v2.useCallback(function(_, v47) --[[ Line: 85 ]]
        -- upvalues: l_ActionTypeEnum_0 (ref), v14 (ref), v42 (copy), v10 (ref), v41 (copy), l_ActionStatusEnum_0 (ref), l_completionCallback_0 (copy), l_AccessResponseEnum_0 (ref), v18 (ref), v19 (ref), l_featureName_0 (copy), l_recourseData_0 (copy), l_entryPointEventCtx_0 (copy), v29 (copy), l_metadata_0 (copy), l_FFlagEnableCommsFAEUpsell_0 (ref), v28 (copy), l_logEventOnceIfEnabled_0 (ref), v20 (ref)
        local l_action_0 = v47.action;
        if l_action_0 == l_ActionTypeEnum_0.Phone then
            return {
                eventContext = "AmpUpsell", 
                origin = v14.AmpWizardContainer, 
                onSuccess = function() --[[ Line: 91 ]] --[[ Name: onSuccess ]]
                    -- upvalues: v42 (ref), v10 (ref), v41 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    v42(v10.Dictionary.join(v41, {
                        [l_ActionTypeEnum_0.Phone] = l_ActionStatusEnum_0.Success
                    }));
                end, 
                onFailure = function() --[[ Line: 96 ]] --[[ Name: onFailure ]]
                    -- upvalues: l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v10 (ref), v41 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v10.Dictionary.join(v41, {
                        [l_ActionTypeEnum_0.Phone] = l_ActionStatusEnum_0.Failure
                    }));
                end, 
                onCancelled = function() --[[ Line: 102 ]] --[[ Name: onCancelled ]]
                    -- upvalues: l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v10 (ref), v41 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v10.Dictionary.join(v41, {
                        [l_ActionTypeEnum_0.Phone] = l_ActionStatusEnum_0.Cancelled
                    }));
                end
            };
        elseif v18() and l_action_0 == l_ActionTypeEnum_0.AddedEmail then
            return {
                eventContext = "AmpUpsell", 
                closeOnEmailUpdate = true, 
                addEmailOver13TextKey = "Feature.VerificationUpsell.Description.IDVerificationAddEmailText", 
                addEmailUnder13TextKey = "Feature.VerificationUpsell.Description.IDVerificationAddEmailText", 
                addEmailTitleKey = "Feature.VerificationUpsell.Heading.AddEmail", 
                successCallback = function(_) --[[ Line: 116 ]] --[[ Name: successCallback ]]
                    -- upvalues: v42 (ref), v10 (ref), v41 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    v42(v10.Dictionary.join(v41, {
                        [l_ActionTypeEnum_0.Email] = l_ActionStatusEnum_0.Success
                    }));
                end, 
                failureCallback = function() --[[ Line: 121 ]] --[[ Name: failureCallback ]]
                    -- upvalues: l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v10 (ref), v41 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v10.Dictionary.join(v41, {
                        [l_ActionTypeEnum_0.Phone] = l_ActionStatusEnum_0.Failure
                    }));
                end, 
                closeCentralOverlay = function() --[[ Line: 127 ]] --[[ Name: closeCentralOverlay ]]

                end
            };
        elseif v19() and l_action_0 == l_ActionTypeEnum_0.GovernmentId then
            return {
                featureName = l_featureName_0, 
                onSuccess = function() --[[ Line: 132 ]] --[[ Name: onSuccess ]]
                    -- upvalues: v42 (ref), v10 (ref), v41 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    v42(v10.Dictionary.join(v41, {
                        [l_ActionTypeEnum_0.GovernmentId] = l_ActionStatusEnum_0.Success
                    }));
                end, 
                onFailure = function() --[[ Line: 140 ]] --[[ Name: onFailure ]]
                    -- upvalues: l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v10 (ref), v41 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v10.Dictionary.join(v41, {
                        [l_ActionTypeEnum_0.GovernmentId] = l_ActionStatusEnum_0.Failure
                    }));
                end, 
                onCancelled = function() --[[ Line: 149 ]] --[[ Name: onCancelled ]]
                    -- upvalues: l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v10 (ref), v41 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v10.Dictionary.join(v41, {
                        [l_ActionTypeEnum_0.GovernmentId] = l_ActionStatusEnum_0.Cancelled
                    }));
                end
            };
        elseif l_action_0 == l_ActionTypeEnum_0.ParentConsent or l_action_0 == l_ActionTypeEnum_0.ParentLink then
            return {
                recourseAction = v47.action, 
                parentConsentTypes = v47.parentConsentTypes, 
                recourseData = l_recourseData_0, 
                entryPointEventCtx = l_entryPointEventCtx_0, 
                onCancel = function() --[[ Line: 166 ]] --[[ Name: onCancel ]]
                    -- upvalues: l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v10 (ref), v41 (ref), l_action_0 (copy), l_ActionStatusEnum_0 (ref)
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v10.Dictionary.join(v41, {
                        [l_action_0] = l_ActionStatusEnum_0.Cancelled
                    }));
                end, 
                onSuccess = function() --[[ Line: 172 ]] --[[ Name: onSuccess ]]
                    -- upvalues: l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v10 (ref), v41 (ref), l_action_0 (copy), l_ActionStatusEnum_0 (ref)
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v10.Dictionary.join(v41, {
                        [l_action_0] = l_ActionStatusEnum_0.Success
                    }));
                end, 
                onRetryAmp = function() --[[ Line: 178 ]] --[[ Name: onRetryAmp ]]
                    -- upvalues: v29 (ref), v42 (ref), v10 (ref), v41 (ref), l_action_0 (copy), l_ActionStatusEnum_0 (ref)
                    v29.pop();
                    v42(v10.Dictionary.join(v41, {
                        [l_action_0] = l_ActionStatusEnum_0.RetryRequested
                    }));
                end
            };
        elseif l_action_0 == l_ActionTypeEnum_0.AgeEstimation then
            return {
                featureName = l_featureName_0, 
                entryPointEventCtx = l_entryPointEventCtx_0, 
                metadata = l_metadata_0, 
                skipFacialAgeEstimationWebLinkModal = if l_FFlagEnableCommsFAEUpsell_0 then v28.skipFacialAgeEstimationWebLinkModal else nil, 
                onSuccess = function() --[[ Line: 193 ]] --[[ Name: onSuccess ]]
                    -- upvalues: l_logEventOnceIfEnabled_0 (ref), v29 (ref), l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v10 (ref), v41 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    l_logEventOnceIfEnabled_0("complete_flow_with_success");
                    v29.pop();
                    l_completionCallback_0(l_AccessResponseEnum_0.Granted, v10.Dictionary.join(v41, {
                        [l_ActionTypeEnum_0.AgeEstimation] = l_ActionStatusEnum_0.Success
                    }));
                end, 
                onFailure = function() --[[ Line: 204 ]] --[[ Name: onFailure ]]
                    -- upvalues: l_logEventOnceIfEnabled_0 (ref), v29 (ref), l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v10 (ref), v41 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    l_logEventOnceIfEnabled_0("complete_flow_with_error");
                    v29.pop();
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v10.Dictionary.join(v41, {
                        [l_ActionTypeEnum_0.AgeEstimation] = l_ActionStatusEnum_0.Failure
                    }));
                end, 
                onCancel = function() --[[ Line: 215 ]] --[[ Name: onCancel ]]
                    -- upvalues: l_logEventOnceIfEnabled_0 (ref), v29 (ref), l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v10 (ref), v41 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    l_logEventOnceIfEnabled_0("complete_flow_with_cancel");
                    v29.pop();
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v10.Dictionary.join(v41, {
                        [l_ActionTypeEnum_0.AgeEstimation] = l_ActionStatusEnum_0.Cancelled
                    }));
                end, 
                onRetry = function() --[[ Line: 226 ]] --[[ Name: onRetry ]]
                    -- upvalues: v29 (ref), v42 (ref), v10 (ref), v41 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    v29.pop();
                    v42(v10.Dictionary.join(v41, {
                        [l_ActionTypeEnum_0.AgeEstimation] = l_ActionStatusEnum_0.RetryRequested
                    }));
                end
            };
        elseif v20() and l_action_0 == l_ActionTypeEnum_0.Subscription then
            local l_l_recourseData_0_0 = l_recourseData_0;
            return {
                purchaseUIOptions = l_l_recourseData_0_0 and l_l_recourseData_0_0.purchaseUIOptions, 
                surfaceName = l_l_recourseData_0_0 and l_l_recourseData_0_0.surfaceName, 
                surfaceContext = l_l_recourseData_0_0 and l_l_recourseData_0_0.surfaceContext, 
                onSuccess = function() --[[ Line: 242 ]] --[[ Name: onSuccess ]]
                    -- upvalues: v29 (ref), l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v10 (ref), v41 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    v29.pop();
                    l_completionCallback_0(l_AccessResponseEnum_0.Granted, v10.Dictionary.join(v41, {
                        [l_ActionTypeEnum_0.Subscription] = l_ActionStatusEnum_0.Success
                    }));
                end, 
                onFailure = function() --[[ Line: 252 ]] --[[ Name: onFailure ]]
                    -- upvalues: v29 (ref), l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v10 (ref), v41 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    v29.pop();
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v10.Dictionary.join(v41, {
                        [l_ActionTypeEnum_0.Subscription] = l_ActionStatusEnum_0.Failure
                    }));
                end, 
                onCancel = function() --[[ Line: 262 ]] --[[ Name: onCancel ]]
                    -- upvalues: v29 (ref), l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v10 (ref), v41 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    v29.pop();
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v10.Dictionary.join(v41, {
                        [l_ActionTypeEnum_0.Subscription] = l_ActionStatusEnum_0.Cancelled
                    }));
                end
            };
        else
            return {};
        end;
    end, {
        v41
    });
    local v58 = v2.useCallback(function(_, v53) --[[ Line: 281 ]]
        -- upvalues: l_openUpsells_0 (copy), v51 (copy), l_ActionTypeEnum_0 (ref), l_completionCallback_0 (copy), l_AccessResponseEnum_0 (ref), v41 (copy), l_featureName_0 (copy), l_accountSettingsUpsellStrings_0 (ref), v29 (copy), v10 (ref), l_ActionStatusEnum_0 (ref), v40 (copy)
        local v54 = nil;
        if #v53 == 0 then
            return;
        else
            local l_action_1 = v53[1].action;
            local v56 = v53[1];
            local v57 = l_openUpsells_0[l_action_1];
            if v57 ~= nil then
                v57((v51(l_action_1, v56)));
                return;
            elseif l_action_1 == l_ActionTypeEnum_0.Subscription then
                l_completionCallback_0(l_AccessResponseEnum_0.Denied, v41);
                return;
            else
                v54 = {
                    featureName = l_featureName_0, 
                    localizationStrings = l_accountSettingsUpsellStrings_0[l_action_1], 
                    onCloseModal = function() --[[ Line: 302 ]] --[[ Name: onCloseModal ]]
                        -- upvalues: v29 (ref), l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v10 (ref), v41 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                        v29.pop();
                        l_completionCallback_0(l_AccessResponseEnum_0.Denied, v10.Dictionary.join(v41, {
                            [l_ActionTypeEnum_0.GovernmentId] = l_ActionStatusEnum_0.Cancelled
                        }));
                    end
                };
                v40(v54);
                return;
            end;
        end;
    end, {});
    local v62 = v2.useCallback(function(v59, v60) --[[ Line: 317 ]]
        -- upvalues: v44 (copy), l_logEventOnceIfEnabled_0 (ref), v17 (ref), v38 (copy), v45 (copy), v27 (ref), v41 (copy), l_extraParameters_0 (copy), l_AccessResponseEnum_0 (ref), v58 (copy), l_completionCallback_0 (copy)
        v44(false);
        l_logEventOnceIfEnabled_0("amp_feature_access_init");
        local v61 = if v17() then v38.upsellFeatureAccessGql(v45, v59, v27(v41), v60, l_extraParameters_0) else v38.upsellFeatureAccess(v59, v27(v41), v60, l_extraParameters_0);
        if v61.access == l_AccessResponseEnum_0.Error then
            v44(true);
            return;
        elseif v61.access == l_AccessResponseEnum_0.Actionable then
            l_logEventOnceIfEnabled_0("amp_feature_access_actionable");
            v58(v61.recourse, v61.recourses);
            return;
        elseif v61.access == l_AccessResponseEnum_0.Granted then
            l_logEventOnceIfEnabled_0("amp_feature_access_granted");
            l_completionCallback_0(l_AccessResponseEnum_0.Granted, v41);
            return;
        elseif v61.access == l_AccessResponseEnum_0.Denied then
            l_logEventOnceIfEnabled_0("amp_feature_access_denied");
            l_completionCallback_0(l_AccessResponseEnum_0.Denied, v41);
            return;
        else
            l_completionCallback_0(l_AccessResponseEnum_0.Pending, v41);
            return;
        end;
    end, {
        v38, 
        l_extraParameters_0
    });
    v2.useEffect(function() --[[ Line: 350 ]]
        -- upvalues: v12 (ref), v39 (copy), v14 (ref), l_featureName_0 (copy)
        v12(v39, v14.AmpWizardContainer, l_featureName_0, "Shown");
    end, {
        v39
    });
    v2.useEffect(function() --[[ Line: 354 ]]
        -- upvalues: v62 (copy), l_featureName_0 (copy), l_nameSpace_0 (copy)
        v62(l_featureName_0, l_nameSpace_0);
    end, {
        v41, 
        l_featureName_0, 
        l_completionCallback_0, 
        l_nameSpace_0
    });
    if v43 then
        return v2.createElement(v15, {
            featureName = l_featureName_0, 
            onRetry = function() --[[ Line: 361 ]] --[[ Name: onRetry ]]
                -- upvalues: v44 (copy), v62 (copy), l_featureName_0 (copy)
                v44(false);
                v62(l_featureName_0);
            end, 
            onCancel = function() --[[ Line: 365 ]] --[[ Name: onCancel ]]
                -- upvalues: l_completionCallback_0 (copy), l_AccessResponseEnum_0 (ref), v41 (copy)
                l_completionCallback_0(l_AccessResponseEnum_0.Denied, v41);
            end
        });
    else
        return v2.createElement(l_LoadingSpinner_0, {
            size = UDim2.fromOffset(42, 42), 
            position = UDim2.fromScale(0.5, 0.5), 
            anchorPoint = Vector2.new(0.5, 0.5)
        });
    end;
end;