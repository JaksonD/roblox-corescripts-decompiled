local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Analytics);
local v5 = require(l_Parent_0.ServerUI);
local l_ReactServerUIView_0 = v5.ReactServerUIView;
local v7 = require(l_Parent_0.Cryo);
local l_Navigation_0 = v5.Navigation;
local v9 = require(l_Parent_0.HttpRequest);
local v10 = require(l_Parent_0.RoduxNetworking);
local v11 = require(l_Parent_0.ReactFocusNavigation);
local l_FocusNavigationEventNameEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v13 = require(l_Parent_0.InputHandlers);
local v14 = require(l_Parent_0.ToastRodux);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_useState_0 = v3.useState;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v18 = require(l_script_FirstAncestor_0.Common.Constants);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v20 = require(l_Parent_0.tutils);
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local l_FFlagLuaAppDefaultHttpRetry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppDefaultHttpRetry;
local v23 = require(l_script_FirstAncestor_0.Templates.ReportFullscreenTemplate);
local v24 = require(l_script_FirstAncestor_0.Transformers.DynamicDialogUITransformer);
local v25 = require(l_script_FirstAncestor_0.Components.ReportListSelection);
local v26 = require(l_script_FirstAncestor_0.Components.ReportSubmission);
local v27 = require(l_script_FirstAncestor_0.Components.constructAbuseReportTags);
local v28 = require(l_Parent_0.SharedFlags);
local l_GetFFlagDSALuaGeoGateBEDUIDevMode_0 = v28.GetFFlagDSALuaGeoGateBEDUIDevMode;
local l_GetFFlagEnableAbuseReportMutedError_0 = v28.GetFFlagEnableAbuseReportMutedError;
local l_isInDSAFeaturesOverrideList_0 = require(l_Parent_0.DsaIllegalContentReporting).isInDSAFeaturesOverrideList;
local l_isShowEUDSAIllegalContentReportingLink_0 = require(l_Parent_0.DsaIllegalContentReporting).isShowEUDSAIllegalContentReportingLink;
local v33 = {
    ListSelection = "listSelection", 
    Submission = "submission"
};
local v34 = {
    toastMessage = "Feature.ReportAbuse.Label.Confirmation.Title", 
    toastSubMessage = "Feature.ReportAbuse.Label.Confirmation.Subheading", 
    isLocalized = false, 
    toastType = v14.Enums.ToastType.SuccessConfirmation
};
local v35 = {
    toastMessage = "Feature.ReportAbuse.Message.ErrorSubmit", 
    isLocalized = false, 
    toastType = v14.Enums.ToastType.NetworkingError
};
local function v73(v36) --[[ Line: 81 ]] --[[ Name: ReportScreen ]]
    -- upvalues: l_useDispatch_0 (copy), l_useState_0 (copy), v4 (copy), v7 (copy), v3 (copy), v13 (copy), v11 (copy), l_FocusNavigationEventNameEnum_0 (copy), v9 (copy), l_FFlagLuaAppDefaultHttpRetry_0 (copy), v10 (copy), v24 (copy), v33 (copy), v25 (copy), v26 (copy), v27 (copy), v14 (copy), v34 (copy), l_GetFFlagEnableAbuseReportMutedError_0 (copy), l_mutedError_0 (copy), v20 (copy), v35 (copy), v23 (copy), v18 (copy), l_GetFFlagDSALuaGeoGateBEDUIDevMode_0 (copy), l_isShowEUDSAIllegalContentReportingLink_0 (copy), l_isInDSAFeaturesOverrideList_0 (copy), l_ReactServerUIView_0 (copy), l_LocalizationService_0 (copy)
    local v37 = l_useDispatch_0();
    local v38, v39 = l_useState_0({});
    local v40 = nil;
    local function _() --[[ Line: 85 ]]
        -- upvalues: v40 (ref), v4 (ref), v36 (copy)
        if not v40 then
            v40 = v4.new(v36.platform, v36.context);
        end;
        return v40;
    end;
    local function _(v42, v43) --[[ Line: 92 ]]
        -- upvalues: v39 (copy), v7 (ref)
        v39(function(v44) --[[ Line: 93 ]]
            -- upvalues: v7 (ref), v43 (copy), v42 (copy)
            local v45 = table.clone(v44);
            table.insert(v45, v7.Dictionary.join(v43, {
                tagKey = v42
            }));
            return v45;
        end);
    end;
    local v48 = v3.useCallback(v13.onRelease(function(_) --[[ Line: 106 ]]
        -- upvalues: v40 (ref), v4 (ref), v36 (copy)
        if not v40 then
            v40 = v4.new(v36.platform, v36.context);
        end;
        v40:onReportAbandoned();
    end), {
        v40
    });
    local v49 = v11.useEventHandler(l_FocusNavigationEventNameEnum_0.NavigateBack, v48);
    local v50 = v9.config({
        requestFunction = v9.requestFunctions.HttpRbxApi, 
        maxRetryCount = if l_FFlagLuaAppDefaultHttpRetry_0 then game:DefineFastInt("ReportScreenHttpRetryCount", 4) else nil
    });
    local v51 = v10.config({
        keyPath = "AbuseReporting", 
        networkImpl = v50
    });
    local v67 = v24.new({
        componentMap = {
            [v33.ListSelection] = {
                name = v33.ListSelection, 
                component = v25, 
                props = {
                    onItemSelected = function(v52, v53) --[[ Line: 134 ]] --[[ Name: onItemSelected ]]
                        -- upvalues: v39 (copy), v7 (ref), v40 (ref), v4 (ref), v36 (copy)
                        local l_params_0 = v52.params;
                        local l_tagKey_0 = l_params_0.tagKey;
                        local v56 = {
                            tagValues = v53.tagValues, 
                            heading = l_params_0.heading, 
                            humanReadableText = v53.humanReadableText
                        };
                        v39(function(v57) --[[ Line: 93 ]]
                            -- upvalues: v7 (ref), v56 (copy), l_tagKey_0 (copy)
                            local v58 = table.clone(v57);
                            table.insert(v58, v7.Dictionary.join(v56, {
                                tagKey = l_tagKey_0
                            }));
                            return v58;
                        end);
                        if not v40 then
                            v40 = v4.new(v36.platform, v36.context);
                        end;
                        v40:onSingleListItemSelected();
                    end, 
                    onCancel = function() --[[ Line: 146 ]] --[[ Name: onCancel ]]
                        -- upvalues: v40 (ref), v4 (ref), v36 (copy)
                        if not v40 then
                            v40 = v4.new(v36.platform, v36.context);
                        end;
                        v40:onReportAbandoned();
                        v36.navigation.goBack();
                    end
                }
            }, 
            [v33.Submission] = {
                name = v33.Submission, 
                component = v26, 
                props = {
                    onCancel = function() --[[ Line: 156 ]] --[[ Name: onCancel ]]
                        -- upvalues: v40 (ref), v4 (ref), v36 (copy)
                        if not v40 then
                            v40 = v4.new(v36.platform, v36.context);
                        end;
                        v40:onReportAbandoned();
                        v36.navigation.goBack();
                    end, 
                    onMounted = function() --[[ Line: 160 ]] --[[ Name: onMounted ]]
                        -- upvalues: v40 (ref), v4 (ref), v36 (copy)
                        if not v40 then
                            v40 = v4.new(v36.platform, v36.context);
                        end;
                        v40:onSubmissionPageMount();
                    end, 
                    onSubmit = function(v59) --[[ Line: 163 ]] --[[ Name: onSubmit ]]
                        -- upvalues: v27 (ref), v36 (copy), v51 (copy), v37 (copy), v14 (ref), v34 (ref), l_GetFFlagEnableAbuseReportMutedError_0 (ref), l_mutedError_0 (ref), v20 (ref), v35 (ref), v40 (ref), v4 (ref)
                        local l_url_0 = v59.params.url;
                        local v61 = {
                            safetyEvent = {
                                tags = v27(v59.report, {
                                    context = v36.context, 
                                    platform = v36.platform, 
                                    assetId = v36.assetId, 
                                    reportAbuseVector = v36.reportAbuseVector
                                })
                            }
                        };
                        local v64 = v51.POST("SubmitAbuseReport", function(v62, _) --[[ Line: 178 ]]
                            -- upvalues: l_url_0 (copy), v61 (copy)
                            return v62(l_url_0):body(v61);
                        end);
                        v37(v64.API()):andThen(function(_) --[[ Line: 183 ]]
                            -- upvalues: v37 (ref), v14 (ref), v34 (ref)
                            v37(v14.Actions.SetCurrentToastMessage(v34));
                        end):catch(function(v66) --[[ Line: 186 ]]
                            -- upvalues: l_GetFFlagEnableAbuseReportMutedError_0 (ref), l_mutedError_0 (ref), v20 (ref), v37 (ref), v14 (ref), v35 (ref)
                            if l_GetFFlagEnableAbuseReportMutedError_0() then
                                l_mutedError_0("(Abuse Reporting [Console]) submission failed: " .. v20.toString(v66));
                            end;
                            v37(v14.Actions.SetCurrentToastMessage(v35));
                        end);
                        if not v40 then
                            v40 = v4.new(v36.platform, v36.context);
                        end;
                        v40:onReportSubmitted();
                        v36.navigation.goBack();
                    end
                }
            }
        }, 
        templateMap = {
            default = {
                component = v23
            }
        }
    });
    local function v69(v68) --[[ Line: 208 ]]
        -- upvalues: v33 (ref), v38 (copy)
        if v68.name == v33.Submission then
            return {
                report = v38
            };
        else
            return {};
        end;
    end;
    local l_V1_0 = v18.BEDUI_VERSIONS.V1;
    if l_GetFFlagDSALuaGeoGateBEDUIDevMode_0() then
        if l_isShowEUDSAIllegalContentReportingLink_0() then
            l_V1_0 = v18.BEDUI_VERSIONS.DEV;
        end;
    elseif l_isInDSAFeaturesOverrideList_0() then
        l_V1_0 = v18.BEDUI_VERSIONS.DEV;
    end;
    return v3.createElement(l_ReactServerUIView_0, {
        url = "abuse-reporting/v1/dynamic-dialog", 
        queryArgs = {
            version = l_V1_0, 
            surface = v36.platform, 
            context = v36.context, 
            locale = l_LocalizationService_0.RobloxLocaleId, 
            target_type = v36.reportAbuseVector, 
            target_id = v36.assetId
        }, 
        mapComponentPropsFromState = v69, 
        transform = function(v71) --[[ Line: 243 ]] --[[ Name: transform ]]
            -- upvalues: v67 (copy)
            return v67:transform(v71);
        end, 
        onError = function(v72) --[[ Line: 246 ]] --[[ Name: onError ]]
            -- upvalues: l_GetFFlagEnableAbuseReportMutedError_0 (ref), l_mutedError_0 (ref), v20 (ref), v37 (copy), v14 (ref), v35 (ref), v36 (copy)
            if l_GetFFlagEnableAbuseReportMutedError_0() then
                l_mutedError_0("(Abuse Reporting [Console]) BEDUI fetch failed: " .. v20.toString(v72));
            end;
            v37(v14.Actions.SetCurrentToastMessage(v35));
            v36.navigation.goBack();
        end, 
        ref = v49
    });
end;
return function(v74) --[[ Line: 257 ]] --[[ Name: ReportScreenNavigationWrapper ]]
    -- upvalues: l_useNavigation_0 (copy), v3 (copy), l_Navigation_0 (copy), v73 (copy), v7 (copy)
    local v75 = l_useNavigation_0();
    local v76 = v75.getParam("reportData", {});
    return v3.createElement(l_Navigation_0, {}, {
        Screen = v3.createElement(v73, v7.Dictionary.join(v74, v76, {
            navigation = v75
        }))
    });
end;