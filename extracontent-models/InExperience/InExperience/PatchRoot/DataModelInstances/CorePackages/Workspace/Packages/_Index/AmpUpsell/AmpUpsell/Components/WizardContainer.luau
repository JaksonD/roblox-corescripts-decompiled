local l_script_FirstAncestor_0 = script:FindFirstAncestor("AmpUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v4 = require(l_script_FirstAncestor_0.Common.Enums);
local l_ActionTypeEnum_0 = v4.ActionTypeEnum;
local l_ActionStatusEnum_0 = v4.ActionStatusEnum;
local l_AccessResponseEnum_0 = v4.AccessResponseEnum;
local l_UserSettingsSettingNameEnum_0 = v4.UserSettingsSettingNameEnum;
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_accountSettingsUpsellStringsFn_0 = require(l_script_FirstAncestor_0.Common.LocalizationStrings).accountSettingsUpsellStringsFn;
local l_LoadingSpinner_0 = require(l_Parent_0.UIBlox).App.Loading.LoadingSpinner;
local v12 = require(l_Parent_0.Cryo);
local v13 = require(l_script_FirstAncestor_0.Analytics.AnalyticsService);
local v14 = require(l_script_FirstAncestor_0.Analytics.sendModalActionEvent);
local v15 = require(l_script_FirstAncestor_0.Common.AmpApiProvider);
local v16 = require(l_script_FirstAncestor_0.Common.AppScreens);
local v17 = require(l_script_FirstAncestor_0.Components.ErrorScreen);
local l_useApolloClient_0 = require(l_Parent_0.ApolloClient).useApolloClient;
local v19 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableAmpUpsellGql);
local v20 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableAmpEmailUpsellSupport);
local v21 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableAmpIDVUpsellSupport);
local v22 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableAmpSubscriptionUpsell);
local l_logEventOnceIfEnabled_0 = require(l_script_FirstAncestor_0.Common.LoggingUtils).logEventOnceIfEnabled;
local function v28(v24) --[[ Line: 54 ]] --[[ Name: getSuccessfulActions ]]
    -- upvalues: l_ActionStatusEnum_0 (copy)
    local v25 = {};
    for v26, v27 in pairs(v24) do
        if v27 == l_ActionStatusEnum_0.Success then
            table.insert(v25, v26);
        end;
    end;
    return v25;
end;
return function(v29) --[[ Line: 64 ]] --[[ Name: WizardContainer ]]
    -- upvalues: l_useNavigation_0 (copy), v15 (copy), v13 (copy), v2 (copy), l_useApolloClient_0 (copy), l_ActionTypeEnum_0 (copy), v16 (copy), v12 (copy), l_ActionStatusEnum_0 (copy), l_AccessResponseEnum_0 (copy), v20 (copy), v21 (copy), l_logEventOnceIfEnabled_0 (copy), v22 (copy), l_UserSettingsSettingNameEnum_0 (copy), l_accountSettingsUpsellStringsFn_0 (copy), v19 (copy), v28 (copy), v14 (copy), v17 (copy), l_LoadingSpinner_0 (copy)
    local v30 = l_useNavigation_0();
    local l_featureName_0 = v29.featureName;
    local l_nameSpace_0 = v29.nameSpace;
    local l_recourseData_0 = v29.recourseData;
    local l_extraParameters_0 = v29.extraParameters;
    local l_entryPointEventCtx_0 = v29.entryPointEventCtx;
    local l_openUpsells_0 = v29.openUpsells;
    local l_completionCallback_0 = v29.completionCallback;
    local l_metadata_0 = v29.metadata;
    local v39 = if v29.ampApiProvider then v29.ampApiProvider else v15;
    local v40 = if v29.analyticsService then v29.analyticsService else v13.EventStream;
    local v41 = if v29.openAccountSettingsUpsell then v29.openAccountSettingsUpsell else v30.push;
    local v42, v43 = v2.useState({});
    local v44, v45 = v2.useState(false);
    local v46 = l_useApolloClient_0();
    local v52 = v2.useCallback(function(_, v48) --[[ Line: 85 ]]
        -- upvalues: l_ActionTypeEnum_0 (ref), v16 (ref), v43 (copy), v12 (ref), v42 (copy), l_ActionStatusEnum_0 (ref), l_completionCallback_0 (copy), l_AccessResponseEnum_0 (ref), v20 (ref), v21 (ref), l_featureName_0 (copy), l_recourseData_0 (copy), l_entryPointEventCtx_0 (copy), v30 (copy), l_metadata_0 (copy), v29 (copy), l_logEventOnceIfEnabled_0 (ref), v22 (ref)
        local l_action_0 = v48.action;
        if l_action_0 == l_ActionTypeEnum_0.Phone then
            return {
                eventContext = "AmpUpsell", 
                origin = v16.AmpWizardContainer, 
                onSuccess = function() --[[ Line: 91 ]] --[[ Name: onSuccess ]]
                    -- upvalues: v43 (ref), v12 (ref), v42 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    v43(v12.Dictionary.join(v42, {
                        [l_ActionTypeEnum_0.Phone] = l_ActionStatusEnum_0.Success
                    }));
                end, 
                onFailure = function() --[[ Line: 96 ]] --[[ Name: onFailure ]]
                    -- upvalues: l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v12 (ref), v42 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v12.Dictionary.join(v42, {
                        [l_ActionTypeEnum_0.Phone] = l_ActionStatusEnum_0.Failure
                    }));
                end, 
                onCancelled = function() --[[ Line: 102 ]] --[[ Name: onCancelled ]]
                    -- upvalues: l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v12 (ref), v42 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v12.Dictionary.join(v42, {
                        [l_ActionTypeEnum_0.Phone] = l_ActionStatusEnum_0.Cancelled
                    }));
                end
            };
        elseif v20() and l_action_0 == l_ActionTypeEnum_0.AddedEmail then
            return {
                eventContext = "AmpUpsell", 
                closeOnEmailUpdate = true, 
                addEmailOver13TextKey = "Feature.VerificationUpsell.Description.IDVerificationAddEmailText", 
                addEmailUnder13TextKey = "Feature.VerificationUpsell.Description.IDVerificationAddEmailText", 
                addEmailTitleKey = "Feature.VerificationUpsell.Heading.AddEmail", 
                successCallback = function(_) --[[ Line: 116 ]] --[[ Name: successCallback ]]
                    -- upvalues: v43 (ref), v12 (ref), v42 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    v43(v12.Dictionary.join(v42, {
                        [l_ActionTypeEnum_0.Email] = l_ActionStatusEnum_0.Success
                    }));
                end, 
                failureCallback = function() --[[ Line: 121 ]] --[[ Name: failureCallback ]]
                    -- upvalues: l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v12 (ref), v42 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v12.Dictionary.join(v42, {
                        [l_ActionTypeEnum_0.Phone] = l_ActionStatusEnum_0.Failure
                    }));
                end, 
                closeCentralOverlay = function() --[[ Line: 127 ]] --[[ Name: closeCentralOverlay ]]

                end
            };
        elseif v21() and l_action_0 == l_ActionTypeEnum_0.GovernmentId then
            return {
                featureName = l_featureName_0, 
                onSuccess = function() --[[ Line: 132 ]] --[[ Name: onSuccess ]]
                    -- upvalues: v43 (ref), v12 (ref), v42 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    v43(v12.Dictionary.join(v42, {
                        [l_ActionTypeEnum_0.GovernmentId] = l_ActionStatusEnum_0.Success
                    }));
                end, 
                onFailure = function() --[[ Line: 140 ]] --[[ Name: onFailure ]]
                    -- upvalues: l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v12 (ref), v42 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v12.Dictionary.join(v42, {
                        [l_ActionTypeEnum_0.GovernmentId] = l_ActionStatusEnum_0.Failure
                    }));
                end, 
                onCancelled = function() --[[ Line: 149 ]] --[[ Name: onCancelled ]]
                    -- upvalues: l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v12 (ref), v42 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v12.Dictionary.join(v42, {
                        [l_ActionTypeEnum_0.GovernmentId] = l_ActionStatusEnum_0.Cancelled
                    }));
                end
            };
        elseif l_action_0 == l_ActionTypeEnum_0.ParentConsent or l_action_0 == l_ActionTypeEnum_0.ParentLink then
            return {
                recourseAction = v48.action, 
                parentConsentTypes = v48.parentConsentTypes, 
                recourseData = l_recourseData_0, 
                entryPointEventCtx = l_entryPointEventCtx_0, 
                onCancel = function() --[[ Line: 166 ]] --[[ Name: onCancel ]]
                    -- upvalues: l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v12 (ref), v42 (ref), l_action_0 (copy), l_ActionStatusEnum_0 (ref)
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v12.Dictionary.join(v42, {
                        [l_action_0] = l_ActionStatusEnum_0.Cancelled
                    }));
                end, 
                onSuccess = function() --[[ Line: 172 ]] --[[ Name: onSuccess ]]
                    -- upvalues: l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v12 (ref), v42 (ref), l_action_0 (copy), l_ActionStatusEnum_0 (ref)
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v12.Dictionary.join(v42, {
                        [l_action_0] = l_ActionStatusEnum_0.Success
                    }));
                end, 
                onRetryAmp = function() --[[ Line: 178 ]] --[[ Name: onRetryAmp ]]
                    -- upvalues: v30 (ref), v43 (ref), v12 (ref), v42 (ref), l_action_0 (copy), l_ActionStatusEnum_0 (ref)
                    v30.pop();
                    v43(v12.Dictionary.join(v42, {
                        [l_action_0] = l_ActionStatusEnum_0.RetryRequested
                    }));
                end
            };
        elseif l_action_0 == l_ActionTypeEnum_0.AgeEstimation then
            return {
                featureName = l_featureName_0, 
                entryPointEventCtx = l_entryPointEventCtx_0, 
                metadata = l_metadata_0, 
                skipFacialAgeEstimationWebLinkModal = v29.skipFacialAgeEstimationWebLinkModal, 
                onSuccess = function() --[[ Line: 191 ]] --[[ Name: onSuccess ]]
                    -- upvalues: l_logEventOnceIfEnabled_0 (ref), v30 (ref), l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v12 (ref), v42 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    l_logEventOnceIfEnabled_0("complete_flow_with_success");
                    v30.pop();
                    l_completionCallback_0(l_AccessResponseEnum_0.Granted, v12.Dictionary.join(v42, {
                        [l_ActionTypeEnum_0.AgeEstimation] = l_ActionStatusEnum_0.Success
                    }));
                end, 
                onFailure = function() --[[ Line: 202 ]] --[[ Name: onFailure ]]
                    -- upvalues: l_logEventOnceIfEnabled_0 (ref), v30 (ref), l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v12 (ref), v42 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    l_logEventOnceIfEnabled_0("complete_flow_with_error");
                    v30.pop();
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v12.Dictionary.join(v42, {
                        [l_ActionTypeEnum_0.AgeEstimation] = l_ActionStatusEnum_0.Failure
                    }));
                end, 
                onCancel = function() --[[ Line: 213 ]] --[[ Name: onCancel ]]
                    -- upvalues: l_logEventOnceIfEnabled_0 (ref), v30 (ref), l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v12 (ref), v42 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    l_logEventOnceIfEnabled_0("complete_flow_with_cancel");
                    v30.pop();
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v12.Dictionary.join(v42, {
                        [l_ActionTypeEnum_0.AgeEstimation] = l_ActionStatusEnum_0.Cancelled
                    }));
                end, 
                onRetry = function() --[[ Line: 224 ]] --[[ Name: onRetry ]]
                    -- upvalues: v30 (ref), v43 (ref), v12 (ref), v42 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    v30.pop();
                    v43(v12.Dictionary.join(v42, {
                        [l_ActionTypeEnum_0.AgeEstimation] = l_ActionStatusEnum_0.RetryRequested
                    }));
                end
            };
        elseif v22() and l_action_0 == l_ActionTypeEnum_0.Subscription then
            local l_l_recourseData_0_0 = l_recourseData_0;
            return {
                purchaseUIOptions = l_l_recourseData_0_0 and l_l_recourseData_0_0.purchaseUIOptions, 
                surfaceName = l_l_recourseData_0_0 and l_l_recourseData_0_0.surfaceName, 
                surfaceContext = l_l_recourseData_0_0 and l_l_recourseData_0_0.surfaceContext, 
                analyticsContext = l_l_recourseData_0_0 and l_l_recourseData_0_0.analyticsContext, 
                onSuccess = function() --[[ Line: 241 ]] --[[ Name: onSuccess ]]
                    -- upvalues: v30 (ref), l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v12 (ref), v42 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    v30.pop();
                    l_completionCallback_0(l_AccessResponseEnum_0.Granted, v12.Dictionary.join(v42, {
                        [l_ActionTypeEnum_0.Subscription] = l_ActionStatusEnum_0.Success
                    }));
                end, 
                onFailure = function() --[[ Line: 251 ]] --[[ Name: onFailure ]]
                    -- upvalues: v30 (ref), l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v12 (ref), v42 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    v30.pop();
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v12.Dictionary.join(v42, {
                        [l_ActionTypeEnum_0.Subscription] = l_ActionStatusEnum_0.Failure
                    }));
                end, 
                onCancel = function() --[[ Line: 261 ]] --[[ Name: onCancel ]]
                    -- upvalues: v30 (ref), l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v12 (ref), v42 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    v30.pop();
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v12.Dictionary.join(v42, {
                        [l_ActionTypeEnum_0.Subscription] = l_ActionStatusEnum_0.Cancelled
                    }));
                end
            };
        else
            return {};
        end;
    end, {
        v42
    });
    local v56 = v2.useCallback(function(v53) --[[ Line: 282 ]]
        -- upvalues: l_ActionTypeEnum_0 (ref), l_UserSettingsSettingNameEnum_0 (ref), l_openUpsells_0 (copy)
        local l_action_1 = v53.action;
        if l_action_1 == l_ActionTypeEnum_0.UserSettings then
            local l_userSettings_0 = v53.userSettings;
            if l_userSettings_0 and l_userSettings_0.settingName == l_UserSettingsSettingNameEnum_0.AllowFacialAgeEstimation then
                return nil;
            end;
        end;
        return l_openUpsells_0[l_action_1];
    end, {
        l_openUpsells_0
    });
    local v63 = v2.useCallback(function(_, v58) --[[ Line: 296 ]]
        -- upvalues: v45 (copy), v56 (copy), v52 (copy), l_ActionTypeEnum_0 (ref), l_completionCallback_0 (copy), l_AccessResponseEnum_0 (ref), v42 (copy), l_accountSettingsUpsellStringsFn_0 (ref), v41 (copy), l_featureName_0 (copy), v30 (copy), v12 (ref), l_ActionStatusEnum_0 (ref)
        if v58 == nil or #v58 == 0 then
            v45(true);
            return;
        else
            local v59 = v58[1];
            local l_action_2 = v59.action;
            local v61 = v56(v59);
            if v61 ~= nil then
                v61((v52(l_action_2, v59)));
                return;
            elseif l_action_2 == l_ActionTypeEnum_0.Subscription then
                l_completionCallback_0(l_AccessResponseEnum_0.Denied, v42);
                return;
            else
                local v62 = l_accountSettingsUpsellStringsFn_0(v59);
                if not v62 then
                    l_completionCallback_0(l_AccessResponseEnum_0.Error, v42);
                    return;
                else
                    v41({
                        featureName = l_featureName_0, 
                        localizationStrings = v62, 
                        onCloseModal = function() --[[ Line: 325 ]] --[[ Name: onCloseModal ]]
                            -- upvalues: v30 (ref), l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v12 (ref), v42 (ref), l_action_2 (copy), l_ActionStatusEnum_0 (ref)
                            v30.pop();
                            l_completionCallback_0(l_AccessResponseEnum_0.Denied, v12.Dictionary.join(v42, {
                                [l_action_2] = l_ActionStatusEnum_0.Cancelled
                            }));
                        end
                    });
                    return;
                end;
            end;
        end;
    end, {
        v42, 
        l_completionCallback_0, 
        l_featureName_0, 
        v52, 
        v30.pop, 
        v41, 
        v56
    });
    local v67 = v2.useCallback(function(v64, v65) --[[ Line: 343 ]]
        -- upvalues: v45 (copy), l_logEventOnceIfEnabled_0 (ref), v19 (ref), v39 (copy), v46 (copy), v28 (ref), v42 (copy), l_extraParameters_0 (copy), l_AccessResponseEnum_0 (ref), v63 (copy), l_completionCallback_0 (copy)
        v45(false);
        l_logEventOnceIfEnabled_0("amp_feature_access_init");
        local v66 = if v19() then v39.upsellFeatureAccessGql(v46, v64, v28(v42), v65, l_extraParameters_0) else v39.upsellFeatureAccess(v64, v28(v42), v65, l_extraParameters_0);
        if v66.access == l_AccessResponseEnum_0.Error then
            v45(true);
            return;
        elseif v66.access == l_AccessResponseEnum_0.Actionable then
            l_logEventOnceIfEnabled_0("amp_feature_access_actionable");
            v63(v66.recourse, v66.recourses);
            return;
        elseif v66.access == l_AccessResponseEnum_0.Granted then
            l_logEventOnceIfEnabled_0("amp_feature_access_granted");
            l_completionCallback_0(l_AccessResponseEnum_0.Granted, v42);
            return;
        elseif v66.access == l_AccessResponseEnum_0.Denied then
            l_logEventOnceIfEnabled_0("amp_feature_access_denied");
            l_completionCallback_0(l_AccessResponseEnum_0.Denied, v42);
            return;
        else
            l_completionCallback_0(l_AccessResponseEnum_0.Pending, v42);
            return;
        end;
    end, {
        v39, 
        l_extraParameters_0
    });
    v2.useEffect(function() --[[ Line: 376 ]]
        -- upvalues: v14 (ref), v40 (copy), v16 (ref), l_featureName_0 (copy)
        v14(v40, v16.AmpWizardContainer, l_featureName_0, "Shown");
    end, {
        v40
    });
    v2.useEffect(function() --[[ Line: 380 ]]
        -- upvalues: v67 (copy), l_featureName_0 (copy), l_nameSpace_0 (copy)
        v67(l_featureName_0, l_nameSpace_0);
    end, {
        v42, 
        l_featureName_0, 
        l_completionCallback_0, 
        l_nameSpace_0
    });
    if v44 then
        return v2.createElement(v17, {
            featureName = l_featureName_0, 
            onRetry = function() --[[ Line: 387 ]] --[[ Name: onRetry ]]
                -- upvalues: v45 (copy), v67 (copy), l_featureName_0 (copy)
                v45(false);
                v67(l_featureName_0);
            end, 
            onCancel = function() --[[ Line: 391 ]] --[[ Name: onCancel ]]
                -- upvalues: l_completionCallback_0 (copy), l_AccessResponseEnum_0 (ref), v42 (copy)
                l_completionCallback_0(l_AccessResponseEnum_0.Denied, v42);
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