local l_script_FirstAncestor_0 = script:FindFirstAncestor("InterventionShared");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_VRService_0 = game:GetService("VRService");
local v3 = require(l_Parent_0.React);
local l_useCallback_0 = v3.useCallback;
local l_useRef_0 = v3.useRef;
local l_useEffect_0 = v3.useEffect;
local v7 = require(l_script_FirstAncestor_0.Utils.Constants);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v9 = require(l_script_FirstAncestor_0.InterventionAnalytics);
local l_LinkingProtocol_0 = require(l_Parent_0.LinkingProtocol).LinkingProtocol;
local v11 = require(l_script_FirstAncestor_0.Http.PostDismissIntervention);
local v12 = require(l_Parent_0.Responsive);
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local v14 = require(l_script_FirstAncestor_0.Hooks.useInterventionPlacement);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_usePreferredInput_0 = v12.usePreferredInput;
local v17 = require(l_script_FirstAncestor_0.Hooks.useInterventionFocusRoot);
local v18 = require(l_script_FirstAncestor_0.Hooks.useWebView);
local v19 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceIdentifierEnum_0 = v19.FocusNavigableSurfaceIdentifierEnum;
local l_FocusRoot_0 = v19.FocusRoot;
local v22 = require(l_Parent_0.Foundation);
local l_Dialog_0 = v22.Dialog;
local l_DialogSize_0 = v22.Enums.DialogSize;
local l_ButtonVariant_0 = v22.Enums.ButtonVariant;
local l_ButtonSize_0 = v22.Enums.ButtonSize;
local l_View_0 = v22.View;
local l_Text_0 = v22.Text;
local l_Button_0 = v22.Button;
local l_Skeleton_0 = v22.Skeleton;
local l_Radius_0 = v22.Enums.Radius;
local l_useTokens_0 = v22.Hooks.useTokens;
local v33 = require(l_script_FirstAncestor_0.Flags.FFlagFeatureRestrictionMiscFixes);
return v3.memo(function(v34) --[[ Line: 65 ]] --[[ Name: GenericInterventionDialog ]]
    -- upvalues: l_useTokens_0 (copy), l_useRef_0 (copy), v14 (copy), l_useLocalization_0 (copy), v7 (copy), l_usePreferredInput_0 (copy), v12 (copy), l_UrlBuilder_0 (copy), v18 (copy), l_LinkingProtocol_0 (copy), v33 (copy), v17 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_useEffect_0 (copy), v9 (copy), l_useCallback_0 (copy), v11 (copy), l_dependencyArray_0 (copy), l_VRService_0 (copy), v3 (copy), l_Text_0 (copy), l_View_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_ButtonSize_0 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_FocusRoot_0 (copy)
    local v35 = l_useTokens_0();
    local v36 = l_useRef_0(DateTime.now().UnixTimestampMillis);
    local v37 = v14();
    local v38 = l_useLocalization_0(v7.localizationKeys);
    local v39 = l_usePreferredInput_0() == v12.Input.Directional;
    local v40 = l_UrlBuilder_0.static.appealsPortal.main();
    local v41 = v18(v40, v38.AppealsPortalTitleText);
    local l_default_0 = l_LinkingProtocol_0.default;
    local v43 = if v33 then v17({
        surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.ModerationOverlay, 
        isAutoFocusRoot = true
    }) else nil;
    l_useEffect_0(function() --[[ Line: 84 ]]
        -- upvalues: v9 (ref), v34 (copy), v37 (copy), v36 (copy)
        v9.sendAnalyticsEvent(v9.TelemetryConfigs.DialogRendered, {
            eventType = v9.Constants.EventTypes.ModalAppeared, 
            interventionType = v34.interventionTypeForAnalytics, 
            placement = v37, 
            renderedTimestamp = v36.current, 
            eventId = v34.eventId, 
            evidence = v34.evidence, 
            duration = v34.durationForAnalytics, 
            acknowledgeable = v34.acknowledgeable
        });
    end, {
        v36
    });
    local v46 = l_useCallback_0(function() --[[ Line: 98 ]]
        -- upvalues: v9 (ref), v34 (copy), v37 (copy), v36 (copy), v11 (ref)
        v9.sendAnalyticsEvent(v9.TelemetryConfigs.DialogCtaClicked, {
            eventType = v9.Constants.EventTypes.CtaClicked, 
            interventionType = v34.interventionTypeForAnalytics, 
            placement = v37, 
            renderedTimestamp = v36.current, 
            eventId = v34.eventId, 
            acknowledgeable = v34.acknowledgeable
        });
        if v34.acknowledgeable and v34.interventionId then
            v11(v34.interventionId):andThen(function(_) --[[ Line: 109 ]]
                -- upvalues: v9 (ref), v34 (ref), v37 (ref), v36 (ref)
                v9.sendAnalyticsEvent(v9.TelemetryConfigs.DialogInterventionDismissSuccess, {
                    eventType = v9.Constants.EventTypes.DialogInterventionDismissSuccess, 
                    interventionType = v34.interventionTypeForAnalytics, 
                    placement = v37, 
                    renderedTimestamp = v36.current, 
                    eventId = v34.eventId, 
                    acknowledgeable = v34.acknowledgeable
                });
            end):catch(function(v45) --[[ Line: 121 ]]
                -- upvalues: v9 (ref), v34 (ref), v37 (ref), v36 (ref)
                v9.sendAnalyticsEvent(v9.TelemetryConfigs.DialogInterventionDismissFailed, {
                    eventType = v9.Constants.EventTypes.DialogInterventionDismissFailed, 
                    interventionType = v34.interventionTypeForAnalytics, 
                    placement = v37, 
                    renderedTimestamp = v36.current, 
                    eventId = v34.eventId, 
                    error = v45.error, 
                    acknowledgeable = v34.acknowledgeable
                });
            end);
        end;
        v34.onDismiss();
    end, l_dependencyArray_0(v34.onDismiss, v34.interventionTypeForAnalytics, v37, v36.current, v34.eventId));
    local v47 = l_useCallback_0(function() --[[ Line: 152 ]]
        -- upvalues: v9 (ref), v34 (copy), v37 (copy), v36 (copy), l_VRService_0 (ref), v39 (copy), l_default_0 (copy), v40 (copy), v41 (copy)
        v9.sendAnalyticsEvent(v9.TelemetryConfigs.DialogAppealClicked, {
            eventType = v9.Constants.EventTypes.AppealClicked, 
            interventionType = v34.interventionTypeForAnalytics, 
            placement = v37, 
            renderedTimestamp = v36.current, 
            eventId = v34.eventId, 
            acknowledgeable = v34.acknowledgeable
        });
        if l_VRService_0.VREnabled or v39 then
            l_default_0:openURL(v40);
            return;
        else
            v41();
            return;
        end;
    end, l_dependencyArray_0(v41, l_default_0, l_VRService_0.VREnabled, v39, v34.interventionTypeForAnalytics, v37, v36.current));
    local v48 = {};
    if v34.bodyText and v34.bodyText ~= "" then
        v48.BodyText = v3.createElement(l_Text_0, {
            Text = v34.bodyText, 
            tag = "auto-xy text-body-medium text-content-default text-align-x-left text-wrap", 
            LayoutOrder = 1
        });
    end;
    if v34.evidence and v34.evidence ~= "" or v34.violationReason and v34.violationReason ~= "" or v34.isAppealable then
        v48.Evidence = v3.createElement(l_View_0, {
            tag = "size-full-0 auto-y padding-xxsmall", 
            LayoutOrder = 2
        }, {
            v3.createElement(l_View_0, {
                tag = "size-full-0 auto-y col gap-small padding-medium radius-medium bg-surface-200 stroke-standard stroke-default"
            }, {
                EvidenceText = v34.evidence and v34.evidence ~= "" and v3.createElement(l_Text_0, {
                    Text = v34.evidence, 
                    tag = "auto-xy text-body-medium text-align-x-left text-wrap", 
                    RichText = true, 
                    LayoutOrder = 1
                }), 
                Reason = v34.violationReason and v34.violationReason ~= "" and v3.createElement(l_Text_0, {
                    Text = ("<b>%*:</b>\n%*"):format(v38.ReasonText, v34.violationReason), 
                    tag = "auto-xy text-body-medium text-align-x-left text-wrap", 
                    RichText = true, 
                    LayoutOrder = 2
                }), 
                AppealButton = v34.isAppealable and v3.createElement(l_Button_0, {
                    text = v38.ReportMistakeText, 
                    variant = l_ButtonVariant_0.Standard, 
                    size = l_ButtonSize_0.XSmall, 
                    width = UDim.new(1, 0), 
                    onActivated = v47, 
                    LayoutOrder = 3
                })
            })
        });
    end;
    if v34.dsaMessage and v34.dsaMessage ~= "" then
        v48.DsaMessage = v3.createElement(l_Text_0, {
            Text = v34.dsaMessage, 
            tag = "auto-xy text-caption-small text-content-default text-align-x-left text-wrap", 
            LayoutOrder = 3
        });
    end;
    if v33 then
        return v3.createElement(l_Dialog_0.Root, {
            size = l_DialogSize_0.Medium, 
            hasCloseButton = false, 
            ref = v43, 
            hasBackdrop = not l_VRService_0.VREnabled, 
            disablePortal = v37 ~= v7.InterventionPlacementType.InExperience
        }, {
            DialogTitle = not v34.isLoading and v3.createElement(l_Dialog_0.Title, {
                text = v34.titleText
            }), 
            DialogContent = v3.createElement(l_Dialog_0.Content, nil, if v34.isLoading then v3.createElement(l_View_0, {
                tag = "size-full-0 auto-y col gap-medium margin-top-small"
            }, {
                Heading = v3.createElement(l_Skeleton_0, {
                    Size = UDim2.new(0.6, 0, 0, v35.Size.Size_1100), 
                    radius = l_Radius_0.Medium, 
                    LayoutOrder = 1
                }), 
                Body = v3.createElement(l_Skeleton_0, {
                    Size = UDim2.new(1, 0, 0, v35.Size.Size_2000), 
                    radius = l_Radius_0.Medium, 
                    LayoutOrder = 2
                }), 
                Actions = v3.createElement(l_Skeleton_0, {
                    Size = UDim2.new(1, 0, 0, v35.Size.Size_800), 
                    radius = l_Radius_0.Medium, 
                    LayoutOrder = 3
                })
            }) else v3.createElement(l_View_0, {
                tag = "size-full-0 auto-y col gap-medium"
            }, v48)), 
            DialogActions = not v34.isLoading and v3.createElement(l_Dialog_0.Actions, {
                actions = {
                    {
                        variant = l_ButtonVariant_0.Emphasis, 
                        size = l_ButtonSize_0.Small, 
                        text = v38.OkText, 
                        onActivated = v46
                    }
                }
            })
        });
    else
        return (v3.createElement(l_FocusRoot_0, {
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
            isIsolated = true, 
            isAutoFocusRoot = true
        }, {
            v3.createElement(l_Dialog_0.Root, {
                size = l_DialogSize_0.Medium, 
                hasCloseButton = false
            }, {
                DialogTitle = not v34.isLoading and v3.createElement(l_Dialog_0.Title, {
                    text = v34.titleText
                }), 
                DialogContent = v3.createElement(l_Dialog_0.Content, nil, if v34.isLoading then v3.createElement(l_View_0, {
                    tag = "size-full-0 auto-y col gap-medium margin-top-small"
                }, {
                    Heading = v3.createElement(l_Skeleton_0, {
                        Size = UDim2.new(0.6, 0, 0, v35.Size.Size_1100), 
                        radius = l_Radius_0.Medium, 
                        LayoutOrder = 1
                    }), 
                    Body = v3.createElement(l_Skeleton_0, {
                        Size = UDim2.new(1, 0, 0, v35.Size.Size_2000), 
                        radius = l_Radius_0.Medium, 
                        LayoutOrder = 2
                    }), 
                    Actions = v3.createElement(l_Skeleton_0, {
                        Size = UDim2.new(1, 0, 0, v35.Size.Size_800), 
                        radius = l_Radius_0.Medium, 
                        LayoutOrder = 3
                    })
                }) else v3.createElement(l_View_0, {
                    tag = "size-full-0 auto-y col gap-medium"
                }, v48)), 
                DialogActions = not v34.isLoading and v3.createElement(l_Dialog_0.Actions, {
                    actions = {
                        {
                            variant = l_ButtonVariant_0.Emphasis, 
                            size = l_ButtonSize_0.Small, 
                            text = v38.OkText, 
                            onActivated = v46
                        }
                    }
                })
            })
        }));
    end;
end);