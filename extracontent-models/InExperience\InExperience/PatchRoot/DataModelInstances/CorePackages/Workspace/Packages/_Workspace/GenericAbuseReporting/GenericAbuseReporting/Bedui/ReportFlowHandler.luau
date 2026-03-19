local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Players_0 = game:GetService("Players");
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.Dash);
local v6 = require(l_Parent_0.React);
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v8 = require(l_Parent_0.Foundation);
local l_ButtonVariant_0 = v8.Enums.ButtonVariant;
local l_Empty_0 = v8.Empty;
local l_FillBehavior_0 = v8.Enums.FillBehavior;
local l_Radius_0 = v8.Enums.Radius;
local l_Skeleton_0 = v8.Skeleton;
local l_useLayerCollector_0 = require(l_Parent_0.UIBlox).Core.Layout.LayerCollector.useLayerCollector;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useTokens_0 = v8.Hooks.useTokens;
local v17 = require(l_script_FirstAncestor_0.Bedui.Provider.AbuseReportBeduiTypes);
local l_AbuseReportBeduiContextStatus_0 = v17.AbuseReportBeduiContextStatus;
local v19 = require(l_script_FirstAncestor_0.Enums.AbuseCategory);
local v20 = require(l_script_FirstAncestor_0.Enums.AbuseVector);
local v21 = require(l_script_FirstAncestor_0.Bedui.Utils.BeduiAnalytics);
local v22 = require(l_script_FirstAncestor_0.Bedui.Utils.createReport);
local v23 = require(l_script_FirstAncestor_0.Bedui.Utils.getReportBody);
local v24 = require(l_script_FirstAncestor_0.Bedui.Utils.getReportTags);
local l_InnerContentConfigType_0 = v17.InnerContentConfigType;
local l_sendAnalyticsEvent_0 = v21.sendAnalyticsEvent;
local v27 = require(l_script_FirstAncestor_0.Bedui.SingleStepContainer);
local v28 = require(l_script_FirstAncestor_0.Bedui.SingleStepInnerContentRenderer);
local v29 = require(l_script_FirstAncestor_0.Common.Stepper);
local l_TelemetryEventType_0 = v21.TelemetryEventType;
local v31 = require(l_script_FirstAncestor_0.Bedui.Utils.submitReport);
local v32 = require(l_script_FirstAncestor_0.Bedui.Utils.submitReportV1);
local v33 = require(l_script_FirstAncestor_0.Bedui.Provider.useAnalyticsContext);
local v34 = require(l_script_FirstAncestor_0.Bedui.Provider.useBeduiData);
local v35 = require(l_script_FirstAncestor_0.Bedui.Provider.useFormData);
local v36 = require(l_script_FirstAncestor_0.Bedui.Provider.validateBeduiData);
local v37 = require(l_script_FirstAncestor_0.Enums.ValueToAbuseCategory);
local v38 = require(l_Parent_0.SharedFlags);
local v39 = game:DefineFastFlag("FixRevampDropdownString", false);
local l_FFlagAddThumbnailSelectorReport_0 = v38.FFlagAddThumbnailSelectorReport;
local v41 = game:DefineFastFlag("DynamicReportPrettyErrorMessage", false);
local l_FFlagFixNotificationReportsMobile_0 = v38.FFlagFixNotificationReportsMobile;
local v43 = game:DefineFastFlag("UseNewEndpointWithAdsReporting2", false);
return v6.memo(function(v44) --[[ Line: 65 ]] --[[ Name: ReportFlowHandler ]]
    -- upvalues: l_useTokens_0 (copy), v6 (copy), v34 (copy), v35 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v33 (copy), l_useLayerCollector_0 (copy), l_AbuseReportBeduiContextStatus_0 (copy), v36 (copy), l_sendAnalyticsEvent_0 (copy), l_TelemetryEventType_0 (copy), l_InnerContentConfigType_0 (copy), v4 (copy), l_Players_0 (copy), v43 (copy), v20 (copy), v23 (copy), v32 (copy), l_FFlagFixNotificationReportsMobile_0 (copy), v41 (copy), v5 (copy), l_FFlagAddThumbnailSelectorReport_0 (copy), v24 (copy), v31 (copy), v22 (copy), v39 (copy), v37 (copy), v19 (copy), v27 (copy), v28 (copy), v3 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_Empty_0 (copy), v29 (copy)
    local v45 = l_useTokens_0();
    local v46, v47 = v6.useState({});
    local v48 = v34();
    local l_formData_0 = v35().formData;
    local l_additionalReportTags_0 = v35().additionalReportTags;
    local v51 = l_useRoactService_0(l_RoactNetworking_0);
    local v52 = v33();
    local l_isReportSubmitted_0 = v52.isReportSubmitted;
    local l_setIsReportSubmitted_0 = v52.setIsReportSubmitted;
    local v55 = l_useLayerCollector_0().absoluteSize.X < 540;
    local v57 = v6.useMemo(function() --[[ Line: 81 ]]
        -- upvalues: v48 (copy), l_AbuseReportBeduiContextStatus_0 (ref)
        local v56 = true;
        if v48 ~= nil then
            v56 = v48.status == l_AbuseReportBeduiContextStatus_0.Loading;
        end;
        return v56;
    end, {
        v48
    });
    local v60 = v6.useMemo(function() --[[ Line: 85 ]]
        -- upvalues: v57 (copy), v48 (copy), v36 (ref), l_sendAnalyticsEvent_0 (ref), l_TelemetryEventType_0 (ref), v52 (copy), l_AbuseReportBeduiContextStatus_0 (ref)
        if v57 or v48 == nil then
            return true;
        else
            local v58, v59 = v36(v48.beduiData);
            if not v58 then
                l_sendAnalyticsEvent_0({
                    eventType = l_TelemetryEventType_0.Error, 
                    context = v52, 
                    meta = {
                        error = ("ReportFlowHandler - Invalid Bedui data: %*"):format((tostring(v59)))
                    }
                });
                return true;
            else
                return v48.status == l_AbuseReportBeduiContextStatus_0.Error;
            end;
        end;
    end, {
        v48, 
        v57, 
        v36, 
        l_sendAnalyticsEvent_0, 
        v52
    });
    local v65 = v6.useCallback(function(v61) --[[ Line: 104 ]]
        -- upvalues: l_InnerContentConfigType_0 (ref), l_formData_0 (copy), v47 (copy), v4 (ref), v46 (copy)
        if v61 == nil then
            return true;
        else
            local v62 = false;
            if v61.type == l_InnerContentConfigType_0.ConfigurableComponentList then
                for _, v64 in v61.configurableComponentList.components do
                    if not v64.isOptional and l_formData_0[v64.formDataKey] == nil then
                        v62 = true;
                        v47(v4.List.join(v46, {
                            v64.formDataKey
                        }));
                    end;
                end;
            end;
            return not v62;
        end;
    end, {
        l_formData_0, 
        v46
    });
    local v79 = v6.useCallback(function() --[[ Line: 123 ]]
        -- upvalues: l_Players_0 (ref), l_sendAnalyticsEvent_0 (ref), l_TelemetryEventType_0 (ref), v52 (copy), v43 (ref), v44 (copy), v20 (ref), v23 (ref), l_formData_0 (copy), l_additionalReportTags_0 (copy), v32 (ref), v51 (copy), l_FFlagFixNotificationReportsMobile_0 (ref), v41 (ref), v5 (ref), l_FFlagAddThumbnailSelectorReport_0 (ref), v24 (ref), v31 (ref), v22 (ref), v39 (ref), v37 (ref), v19 (ref)
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        if l_LocalPlayer_0 == nil then
            l_sendAnalyticsEvent_0({
                eventType = l_TelemetryEventType_0.Error, 
                context = v52, 
                meta = {
                    error = "ReportFlowHandler - LocalPlayer is nil"
                }
            });
            return;
        elseif v43 and v44.abuseVector == v20.AdV2 then
            local v67 = v23({
                abuseVector = v44.abuseVector, 
                formData = l_formData_0, 
                localPlayerUserId = l_LocalPlayer_0.UserId, 
                targetIdStr = v44.targetId, 
                additionalReportTags = l_additionalReportTags_0
            });
            v32(v51, v67):andThen(function(_) --[[ Line: 145 ]]
                -- upvalues: l_sendAnalyticsEvent_0 (ref), l_TelemetryEventType_0 (ref), v52 (ref), l_FFlagFixNotificationReportsMobile_0 (ref), v44 (ref)
                l_sendAnalyticsEvent_0({
                    eventType = l_TelemetryEventType_0.Submitted, 
                    context = v52
                });
                if l_FFlagFixNotificationReportsMobile_0 and v44.onSubmit then
                    v44.onSubmit();
                end;
            end):catch(function(v69) --[[ Line: 154 ]]
                -- upvalues: v41 (ref), v5 (ref), l_sendAnalyticsEvent_0 (ref), l_TelemetryEventType_0 (ref), v52 (ref)
                if v41 then
                    local v70 = v5.pretty(v69, {
                        depth = 10
                    });
                    l_sendAnalyticsEvent_0({
                        eventType = l_TelemetryEventType_0.Error, 
                        context = v52, 
                        meta = {
                            error = ("ReportFlowHandler - Submitting v1 report: %*"):format(v70)
                        }
                    });
                    return;
                else
                    l_sendAnalyticsEvent_0({
                        eventType = l_TelemetryEventType_0.Error, 
                        context = v52, 
                        meta = {
                            error = ("ReportFlowHandler - Submitting v1 report: %*"):format((tostring(v69)))
                        }
                    });
                    return;
                end;
            end);
            return;
        elseif l_FFlagAddThumbnailSelectorReport_0 then
            local v71 = v24({
                formData = l_formData_0, 
                localPlayerUserId = tostring(l_LocalPlayer_0.UserId), 
                abuseVector = v44.abuseVector, 
                targetId = v44.targetId, 
                custom = v44.custom, 
                additionalReportTags = l_additionalReportTags_0
            });
            v31(v51, v71):andThen(function(_) --[[ Line: 185 ]]
                -- upvalues: l_sendAnalyticsEvent_0 (ref), l_TelemetryEventType_0 (ref), v52 (ref), l_FFlagFixNotificationReportsMobile_0 (ref), v44 (ref)
                l_sendAnalyticsEvent_0({
                    eventType = l_TelemetryEventType_0.Submitted, 
                    context = v52
                });
                if l_FFlagFixNotificationReportsMobile_0 and v44.onSubmit then
                    v44.onSubmit();
                end;
            end):catch(function(v73) --[[ Line: 194 ]]
                -- upvalues: v41 (ref), v5 (ref), l_sendAnalyticsEvent_0 (ref), l_TelemetryEventType_0 (ref), v52 (ref)
                if v41 then
                    local v74 = v5.pretty(v73, {
                        depth = 10
                    });
                    l_sendAnalyticsEvent_0({
                        eventType = l_TelemetryEventType_0.Error, 
                        context = v52, 
                        meta = {
                            error = ("ReportFlowHandler - Submitting report: %*"):format(v74)
                        }
                    });
                    return;
                else
                    l_sendAnalyticsEvent_0({
                        eventType = l_TelemetryEventType_0.Error, 
                        context = v52, 
                        meta = {
                            error = ("ReportFlowHandler - Submitting report: %*"):format((tostring(v73)))
                        }
                    });
                    return;
                end;
            end);
            return;
        else
            local v75 = v22({
                abuseCategory = if v39 then v37[l_formData_0.legacy_abuse_category] or l_formData_0.abuse_category or v19.ABUSE_CATEGORY_INVALID else v37[l_formData_0.legacy_abuse_category] or v19.ABUSE_CATEGORY_INVALID, 
                abuseVector = v44.abuseVector, 
                comment = l_formData_0.free_comment, 
                submitterId = tostring(l_LocalPlayer_0.UserId), 
                targetId = v44.targetId, 
                custom = v44.custom
            });
            v31(v51, v75):andThen(function(_) --[[ Line: 229 ]]
                -- upvalues: l_sendAnalyticsEvent_0 (ref), l_TelemetryEventType_0 (ref), v52 (ref)
                l_sendAnalyticsEvent_0({
                    eventType = l_TelemetryEventType_0.Submitted, 
                    context = v52
                });
            end):catch(function(v77) --[[ Line: 235 ]]
                -- upvalues: v41 (ref), v5 (ref), l_sendAnalyticsEvent_0 (ref), l_TelemetryEventType_0 (ref), v52 (ref)
                if v41 then
                    local v78 = v5.pretty(v77, {
                        depth = 10
                    });
                    l_sendAnalyticsEvent_0({
                        eventType = l_TelemetryEventType_0.Error, 
                        context = v52, 
                        meta = {
                            error = ("ReportFlowHandler - Submitting report: %*"):format(v78)
                        }
                    });
                    return;
                else
                    l_sendAnalyticsEvent_0({
                        eventType = l_TelemetryEventType_0.Error, 
                        context = v52, 
                        meta = {
                            error = ("ReportFlowHandler - Submitting report: %*"):format((tostring(v77)))
                        }
                    });
                    return;
                end;
            end);
            return;
        end;
    end, {
        l_formData_0, 
        l_Players_0.LocalPlayer, 
        v44.abuseVector, 
        v44.targetId, 
        l_sendAnalyticsEvent_0, 
        v52
    });
    local v87 = v6.useMemo(function() --[[ Line: 268 ]]
        -- upvalues: v57 (copy), v60 (copy), v48 (copy), l_sendAnalyticsEvent_0 (ref), l_TelemetryEventType_0 (ref), v52 (copy), v5 (ref), v55 (copy), v4 (ref), v6 (ref), v27 (ref), v46 (copy), v28 (ref), v3 (ref), l_isReportSubmitted_0 (copy), v79 (copy), l_setIsReportSubmitted_0 (copy), v65 (copy), l_ButtonVariant_0 (ref), l_FillBehavior_0 (ref)
        if v57 then
            return {};
        elseif v60 or not v48.beduiData or not v48.beduiData.nodes then
            l_sendAnalyticsEvent_0({
                eventType = l_TelemetryEventType_0.Error, 
                context = v52, 
                meta = {
                    error = "ReportFlowHandler - Invalid Bedui data or no nodes found"
                }
            });
            return {};
        else
            local v80 = {};
            for _, v82 in v48.beduiData.nodes do
                local v83 = v5.joinDeep({}, v82);
                local l_innerContentConfig_0 = v83.innerContentConfig;
                local v85 = v55 and v82.footerContentConfig;
                if v85 then
                    l_innerContentConfig_0 = {
                        type = l_innerContentConfig_0.type, 
                        configurableComponentList = {
                            components = v4.List.join(l_innerContentConfig_0.configurableComponentList.components, v83.footerContentConfig.configurableComponentList.components)
                        }
                    };
                end;
                if v80[v83.stepId] ~= nil then
                    l_sendAnalyticsEvent_0({
                        eventType = l_TelemetryEventType_0.Error, 
                        context = v52, 
                        meta = {
                            error = ("ReportFlowHandler - Duplicate stepId found: %*"):format((tostring(v83.stepId)))
                        }
                    });
                    return {};
                else
                    do
                        local l_l_innerContentConfig_0_0 = l_innerContentConfig_0;
                        v80[v83.stepId] = {
                            stepId = v83.stepId, 
                            predefinedNextStepId = v83.actionInfo.predefinedNextStepId, 
                            content = v6.createElement(v27, {
                                node = v83, 
                                contentConfig = l_l_innerContentConfig_0_0, 
                                formDataKeysWithError = v46
                            }), 
                            footer = if not v83.footerContentConfig or v85 then nil else v6.createElement(v28, {
                                contentConfig = v83.footerContentConfig, 
                                formDataKeysWithError = v46
                            }), 
                            labels = {
                                continueButton = v83.actionInfo.actionLabel
                            }, 
                            onStepCancel = nil, 
                            onStepContinue = function() --[[ Line: 331 ]] --[[ Name: onStepContinue ]]
                                -- upvalues: v3 (ref), l_isReportSubmitted_0 (ref), l_sendAnalyticsEvent_0 (ref), l_TelemetryEventType_0 (ref), v52 (ref), v83 (copy), v79 (ref), l_setIsReportSubmitted_0 (ref)
                                v3.assert(l_isReportSubmitted_0 == false, "Report should only be able to be submitted once");
                                if l_isReportSubmitted_0 then
                                    l_sendAnalyticsEvent_0({
                                        eventType = l_TelemetryEventType_0.Error, 
                                        context = v52, 
                                        meta = {
                                            error = ("ReportFlowHandler - Report already submitted for stepId: %*"):format((tostring(v83.stepId)))
                                        }
                                    });
                                end;
                                if v83.actionInfo.shouldSubmit and not l_isReportSubmitted_0 then
                                    v79();
                                    l_setIsReportSubmitted_0(true);
                                end;
                            end, 
                            validateState = function() --[[ Line: 349 ]] --[[ Name: validateState ]]
                                -- upvalues: v65 (ref), l_l_innerContentConfig_0_0 (ref)
                                return v65(l_l_innerContentConfig_0_0);
                            end, 
                            stepStyle = {
                                continueButton = {
                                    variant = if v83.actionInfo.shouldSubmit then l_ButtonVariant_0.Emphasis else l_ButtonVariant_0.Standard, 
                                    fillBehavior = if v55 then l_FillBehavior_0.Fill else l_FillBehavior_0.Fit
                                }, 
                                buttonXAlignment = "align-x-right"
                            }
                        };
                    end;
                end;
            end;
            return v80;
        end;
    end, {
        v57, 
        v60, 
        v48, 
        v46, 
        v55, 
        v79, 
        v65, 
        l_isReportSubmitted_0, 
        l_sendAnalyticsEvent_0, 
        v52
    });
    if v57 then
        return (v6.createElement(l_Skeleton_0, {
            radius = l_Radius_0.Medium, 
            Size = UDim2.new(1, 0, 0, v45.Size.Size_2500)
        }));
    elseif v60 or not next(v87) then
        return (v6.createElement(l_Empty_0, {}));
    elseif next(v87) and v48.beduiData then
        return (v6.createElement(v29, {
            currentStep = v48.beduiData.rootStepId, 
            steps = v87
        }));
    else
        return nil;
    end;
end);