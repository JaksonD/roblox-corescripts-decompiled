local l_script_FirstAncestor_0 = script:FindFirstAncestor("InterventionShared");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_VRService_0 = game:GetService("VRService");
local v3 = require(l_Parent_0.React);
local l_useCallback_0 = v3.useCallback;
local l_useRef_0 = v3.useRef;
local l_useEffect_0 = v3.useEffect;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v8 = require(l_script_FirstAncestor_0.Utils.Constants);
local v9 = require(l_script_FirstAncestor_0.Http.PostDismissIntervention);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v11 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceIdentifierEnum_0 = v11.FocusNavigableSurfaceIdentifierEnum;
local l_FocusRoot_0 = v11.FocusRoot;
local v14 = require(l_script_FirstAncestor_0.Hooks.useInterventionPlacement);
local v15 = require(l_script_FirstAncestor_0.InterventionAnalytics);
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local v17 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v17.usePreferredInput;
local v19 = require(l_script_FirstAncestor_0.Hooks.useWebView);
local v20 = require(l_Parent_0.Foundation);
local l_Dialog_0 = v20.Dialog;
local l_DialogSize_0 = v20.Enums.DialogSize;
local l_ButtonVariant_0 = v20.Enums.ButtonVariant;
local l_ButtonSize_0 = v20.Enums.ButtonSize;
local l_View_0 = v20.View;
local l_Text_0 = v20.Text;
local l_Button_0 = v20.Button;
local l_Skeleton_0 = v20.Skeleton;
local l_Radius_0 = v20.Enums.Radius;
local l_useTokens_0 = v20.Hooks.useTokens;
local l_LinkingProtocol_0 = require(l_Parent_0.LinkingProtocol).LinkingProtocol;
return v3.memo(function(v32) --[[ Line: 62 ]] --[[ Name: GenericInterventionDialog ]]
    -- upvalues: l_useTokens_0 (copy), l_useRef_0 (copy), v14 (copy), l_useLocalization_0 (copy), v8 (copy), l_usePreferredInput_0 (copy), v17 (copy), l_UrlBuilder_0 (copy), v19 (copy), l_LinkingProtocol_0 (copy), l_useEffect_0 (copy), v15 (copy), l_useCallback_0 (copy), v9 (copy), l_dependencyArray_0 (copy), l_VRService_0 (copy), v3 (copy), l_Text_0 (copy), l_View_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_ButtonSize_0 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy)
    local v33 = l_useTokens_0();
    local v34 = l_useRef_0(DateTime.now().UnixTimestampMillis);
    local v35 = v14();
    local v36 = l_useLocalization_0(v8.localizationKeys);
    local v37 = l_usePreferredInput_0() == v17.Input.Directional;
    local v38 = l_UrlBuilder_0.static.appealsPortal.main();
    local v39 = v19(v38, v36.AppealsPortalTitleText);
    local l_default_0 = l_LinkingProtocol_0.default;
    l_useEffect_0(function() --[[ Line: 74 ]]
        -- upvalues: v15 (ref), v32 (copy), v35 (copy), v34 (copy)
        v15.sendAnalyticsEvent(v15.TelemetryConfigs.DialogRendered, {
            eventType = v15.Constants.EventTypes.ModalAppeared, 
            interventionType = v32.interventionTypeForAnalytics, 
            placement = v35, 
            renderedTimestamp = v34.current, 
            eventId = v32.eventId, 
            evidence = v32.evidence, 
            duration = v32.durationForAnalytics, 
            acknowledgeable = v32.acknowledgeable
        });
    end, {
        v34
    });
    local v43 = l_useCallback_0(function() --[[ Line: 88 ]]
        -- upvalues: v15 (ref), v32 (copy), v35 (copy), v34 (copy), v9 (ref)
        v15.sendAnalyticsEvent(v15.TelemetryConfigs.DialogCtaClicked, {
            eventType = v15.Constants.EventTypes.CtaClicked, 
            interventionType = v32.interventionTypeForAnalytics, 
            placement = v35, 
            renderedTimestamp = v34.current, 
            eventId = v32.eventId, 
            acknowledgeable = v32.acknowledgeable
        });
        if v32.acknowledgeable and v32.interventionId then
            v9(v32.interventionId):andThen(function(_) --[[ Line: 99 ]]
                -- upvalues: v15 (ref), v32 (ref), v35 (ref), v34 (ref)
                v15.sendAnalyticsEvent(v15.TelemetryConfigs.DialogInterventionDismissSuccess, {
                    eventType = v15.Constants.EventTypes.DialogInterventionDismissSuccess, 
                    interventionType = v32.interventionTypeForAnalytics, 
                    placement = v35, 
                    renderedTimestamp = v34.current, 
                    eventId = v32.eventId, 
                    acknowledgeable = v32.acknowledgeable
                });
            end):catch(function(v42) --[[ Line: 111 ]]
                -- upvalues: v15 (ref), v32 (ref), v35 (ref), v34 (ref)
                v15.sendAnalyticsEvent(v15.TelemetryConfigs.DialogInterventionDismissFailed, {
                    eventType = v15.Constants.EventTypes.DialogInterventionDismissFailed, 
                    interventionType = v32.interventionTypeForAnalytics, 
                    placement = v35, 
                    renderedTimestamp = v34.current, 
                    eventId = v32.eventId, 
                    error = v42.error, 
                    acknowledgeable = v32.acknowledgeable
                });
            end);
        end;
        v32.onDismiss();
    end, l_dependencyArray_0(v32.onDismiss, v32.interventionTypeForAnalytics, v35, v34.current, v32.eventId));
    local v44 = l_useCallback_0(function() --[[ Line: 142 ]]
        -- upvalues: v15 (ref), v32 (copy), v35 (copy), v34 (copy), l_VRService_0 (ref), v37 (copy), l_default_0 (copy), v38 (copy), v39 (copy)
        v15.sendAnalyticsEvent(v15.TelemetryConfigs.DialogAppealClicked, {
            eventType = v15.Constants.EventTypes.AppealClicked, 
            interventionType = v32.interventionTypeForAnalytics, 
            placement = v35, 
            renderedTimestamp = v34.current, 
            eventId = v32.eventId, 
            acknowledgeable = v32.acknowledgeable
        });
        if l_VRService_0.VREnabled or v37 then
            l_default_0:openURL(v38);
            return;
        else
            v39();
            return;
        end;
    end, l_dependencyArray_0(v39, l_default_0, l_VRService_0.VREnabled, v37, v32.interventionTypeForAnalytics, v35, v34.current));
    local v45 = {};
    if v32.bodyText and v32.bodyText ~= "" then
        v45.BodyText = v3.createElement(l_Text_0, {
            Text = v32.bodyText, 
            tag = "auto-xy text-body-medium text-content-default text-align-x-left text-wrap", 
            LayoutOrder = 1
        });
    end;
    if v32.evidence and v32.evidence ~= "" or v32.violationReason and v32.violationReason ~= "" or v32.isAppealable then
        v45.Evidence = v3.createElement(l_View_0, {
            tag = "size-full-0 auto-y padding-xxsmall", 
            LayoutOrder = 2
        }, {
            v3.createElement(l_View_0, {
                tag = "size-full-0 auto-y col gap-small padding-medium radius-medium bg-surface-200 stroke-standard stroke-default"
            }, {
                EvidenceText = v32.evidence and v32.evidence ~= "" and v3.createElement(l_Text_0, {
                    Text = v32.evidence, 
                    tag = "auto-xy text-body-medium text-align-x-left text-wrap", 
                    RichText = true, 
                    LayoutOrder = 1
                }), 
                Reason = v32.violationReason and v32.violationReason ~= "" and v3.createElement(l_Text_0, {
                    Text = ("<b>%*:</b>\n%*"):format(v36.ReasonText, v32.violationReason), 
                    tag = "auto-xy text-body-medium text-align-x-left text-wrap", 
                    RichText = true, 
                    LayoutOrder = 2
                }), 
                AppealButton = v32.isAppealable and v3.createElement(l_Button_0, {
                    text = v36.ReportMistakeText, 
                    variant = l_ButtonVariant_0.Standard, 
                    size = l_ButtonSize_0.XSmall, 
                    width = UDim.new(1, 0), 
                    onActivated = v44, 
                    LayoutOrder = 3
                })
            })
        });
    end;
    if v32.dsaMessage and v32.dsaMessage ~= "" then
        v45.DsaMessage = v3.createElement(l_Text_0, {
            Text = v32.dsaMessage, 
            tag = "auto-xy text-caption-small text-content-default text-align-x-left text-wrap", 
            LayoutOrder = 3
        });
    end;
    return (v3.createElement(l_FocusRoot_0, {
        surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
        isIsolated = true, 
        isAutoFocusRoot = true
    }, {
        v3.createElement(l_Dialog_0.Root, {
            size = l_DialogSize_0.Medium, 
            hasCloseButton = false
        }, {
            DialogTitle = not v32.isLoading and v3.createElement(l_Dialog_0.Title, {
                text = v32.titleText
            }), 
            DialogContent = v3.createElement(l_Dialog_0.Content, nil, if v32.isLoading then v3.createElement(l_View_0, {
                tag = "size-full-0 auto-y col gap-medium margin-top-small"
            }, {
                Heading = v3.createElement(l_Skeleton_0, {
                    Size = UDim2.new(0.6, 0, 0, v33.Size.Size_1100), 
                    radius = l_Radius_0.Medium, 
                    LayoutOrder = 1
                }), 
                Body = v3.createElement(l_Skeleton_0, {
                    Size = UDim2.new(1, 0, 0, v33.Size.Size_2000), 
                    radius = l_Radius_0.Medium, 
                    LayoutOrder = 2
                }), 
                Actions = v3.createElement(l_Skeleton_0, {
                    Size = UDim2.new(1, 0, 0, v33.Size.Size_800), 
                    radius = l_Radius_0.Medium, 
                    LayoutOrder = 3
                })
            }) else v3.createElement(l_View_0, {
                tag = "size-full-0 auto-y col gap-medium"
            }, v45)), 
            DialogActions = not v32.isLoading and v3.createElement(l_Dialog_0.Actions, {
                actions = {
                    {
                        variant = l_ButtonVariant_0.Emphasis, 
                        size = l_ButtonSize_0.Small, 
                        text = v36.OkText, 
                        onActivated = v43
                    }
                }
            })
        })
    }));
end);