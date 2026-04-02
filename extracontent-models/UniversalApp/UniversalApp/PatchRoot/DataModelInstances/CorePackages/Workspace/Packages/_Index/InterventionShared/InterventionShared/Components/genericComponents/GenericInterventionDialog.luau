local l_script_FirstAncestor_0 = script:FindFirstAncestor("InterventionShared");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_VRService_0 = game:GetService("VRService");
local v3 = require(l_Parent_0.React);
local l_useCallback_0 = v3.useCallback;
local l_useRef_0 = v3.useRef;
local l_useEffect_0 = v3.useEffect;
local v7 = require(l_script_FirstAncestor_0.Utils.Constants);
local v8 = require(l_Parent_0.Cryo);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v10 = require(l_script_FirstAncestor_0.Components.genericComponents.EvidenceField);
local v11 = require(l_script_FirstAncestor_0.InterventionAnalytics);
local l_LinkingProtocol_0 = require(l_Parent_0.LinkingProtocol).LinkingProtocol;
local v13 = require(l_script_FirstAncestor_0.Http.PostDismissIntervention);
local v14 = require(l_Parent_0.Responsive);
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local v16 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceIdentifierEnum_0 = v16.FocusNavigableSurfaceIdentifierEnum;
local l_FocusRoot_0 = v16.FocusRoot;
local v19 = require(l_Parent_0.Foundation);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_Badge_0 = v19.Badge;
local l_BadgeVariant_0 = v19.Enums.BadgeVariant;
local l_Button_0 = v19.Button;
local l_ButtonVariant_0 = v19.Enums.ButtonVariant;
local l_ButtonSize_0 = v19.Enums.ButtonSize;
local l_Dialog_0 = v19.Dialog;
local l_DialogSize_0 = v19.Enums.DialogSize;
local l_Divider_0 = v19.Divider;
local l_IconName_0 = v19.Enums.IconName;
local l_IconPosition_0 = v19.Enums.IconPosition;
local l_IconVariant_0 = v19.Enums.IconVariant;
local l_Radius_0 = v19.Enums.Radius;
local l_Skeleton_0 = v19.Skeleton;
local l_Text_0 = v19.Text;
local l_View_0 = v19.View;
local v36 = require(l_script_FirstAncestor_0.Hooks.useInterventionFocusRoot);
local v37 = require(l_script_FirstAncestor_0.Hooks.useInterventionPlacement);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_usePreferredInput_0 = v14.usePreferredInput;
local l_useTokens_0 = v19.Hooks.useTokens;
local v41 = require(l_script_FirstAncestor_0.Hooks.useWebView);
local v42 = require(l_script_FirstAncestor_0.Flags.FFlagFeatureRestrictionMiscFixes);
local l_FFlagUniversalFeatureRestrictionReceivers_0 = require(l_Parent_0.SharedFlags).FFlagUniversalFeatureRestrictionReceivers;
return v3.memo(function(v44) --[[ Line: 82 ]] --[[ Name: GenericInterventionDialog ]]
    -- upvalues: l_useTokens_0 (copy), l_useRef_0 (copy), v37 (copy), l_useLocalization_0 (copy), v7 (copy), l_usePreferredInput_0 (copy), v14 (copy), l_UrlBuilder_0 (copy), v41 (copy), l_LinkingProtocol_0 (copy), v42 (copy), v36 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_useEffect_0 (copy), v11 (copy), l_useCallback_0 (copy), v13 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_VRService_0 (copy), l_FFlagUniversalFeatureRestrictionReceivers_0 (copy), v3 (copy), l_Text_0 (copy), l_View_0 (copy), l_Divider_0 (copy), v10 (copy), l_Badge_0 (copy), l_BadgeVariant_0 (copy), l_IconName_0 (copy), l_IconPosition_0 (copy), l_IconVariant_0 (copy), v8 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_ButtonSize_0 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_FocusRoot_0 (copy)
    local v45 = l_useTokens_0();
    local v46 = l_useRef_0(DateTime.now().UnixTimestampMillis);
    local v47 = v37();
    local v48 = l_useLocalization_0(v7.localizationKeys);
    local v49 = l_usePreferredInput_0() == v14.Input.Directional;
    local v50 = l_UrlBuilder_0.static.appealsPortal.main();
    local v51 = v41(v50, v48.AppealsPortalTitleText);
    local l_default_0 = l_LinkingProtocol_0.default;
    local v53 = if v42 then v36({
        surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.ModerationOverlay, 
        isAutoFocusRoot = true
    }) else nil;
    l_useEffect_0(function() --[[ Line: 101 ]]
        -- upvalues: v11 (ref), v44 (copy), v47 (copy), v46 (copy)
        v11.sendAnalyticsEvent(v11.TelemetryConfigs.DialogRendered, {
            eventType = v11.Constants.EventTypes.ModalAppeared, 
            interventionType = v44.interventionTypeForAnalytics, 
            placement = v47, 
            renderedTimestamp = v46.current, 
            eventId = v44.eventId, 
            evidence = v44.evidence, 
            duration = v44.durationForAnalytics, 
            acknowledgeable = v44.acknowledgeable
        });
    end, {
        v46
    });
    local v56 = l_useCallback_0(function() --[[ Line: 115 ]]
        -- upvalues: v11 (ref), v44 (copy), v47 (copy), v46 (copy), v13 (ref)
        v11.sendAnalyticsEvent(v11.TelemetryConfigs.DialogCtaClicked, {
            eventType = v11.Constants.EventTypes.CtaClicked, 
            interventionType = v44.interventionTypeForAnalytics, 
            placement = v47, 
            renderedTimestamp = v46.current, 
            eventId = v44.eventId, 
            acknowledgeable = v44.acknowledgeable
        });
        if v44.acknowledgeable and v44.interventionId then
            v13(v44.interventionId):andThen(function(_) --[[ Line: 126 ]]
                -- upvalues: v11 (ref), v44 (ref), v47 (ref), v46 (ref)
                v11.sendAnalyticsEvent(v11.TelemetryConfigs.DialogInterventionDismissSuccess, {
                    eventType = v11.Constants.EventTypes.DialogInterventionDismissSuccess, 
                    interventionType = v44.interventionTypeForAnalytics, 
                    placement = v47, 
                    renderedTimestamp = v46.current, 
                    eventId = v44.eventId, 
                    acknowledgeable = v44.acknowledgeable
                });
            end):catch(function(v55) --[[ Line: 138 ]]
                -- upvalues: v11 (ref), v44 (ref), v47 (ref), v46 (ref)
                v11.sendAnalyticsEvent(v11.TelemetryConfigs.DialogInterventionDismissFailed, {
                    eventType = v11.Constants.EventTypes.DialogInterventionDismissFailed, 
                    interventionType = v44.interventionTypeForAnalytics, 
                    placement = v47, 
                    renderedTimestamp = v46.current, 
                    eventId = v44.eventId, 
                    error = v55.error, 
                    acknowledgeable = v44.acknowledgeable
                });
            end);
        end;
        v44.onDismiss();
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v44.onDismiss, 
        v44.interventionTypeForAnalytics, 
        v47, 
        v46.current, 
        v44.eventId
    } else l_dependencyArray_0(v44.onDismiss, v44.interventionTypeForAnalytics, v47, v46.current, v44.eventId));
    local v57 = l_useCallback_0(function() --[[ Line: 177 ]]
        -- upvalues: v11 (ref), v44 (copy), v47 (copy), v46 (copy), l_VRService_0 (ref), v49 (copy), l_default_0 (copy), v50 (copy), v51 (copy)
        v11.sendAnalyticsEvent(v11.TelemetryConfigs.DialogAppealClicked, {
            eventType = v11.Constants.EventTypes.AppealClicked, 
            interventionType = v44.interventionTypeForAnalytics, 
            placement = v47, 
            renderedTimestamp = v46.current, 
            eventId = v44.eventId, 
            acknowledgeable = v44.acknowledgeable
        });
        if l_VRService_0.VREnabled or v49 then
            l_default_0:openURL(v50);
            return;
        else
            v51();
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v51, 
        l_default_0, 
        l_VRService_0.VREnabled, 
        v49, 
        v44.interventionTypeForAnalytics, 
        v47, 
        v46.current
    } else l_dependencyArray_0(v51, l_default_0, l_VRService_0.VREnabled, v49, v44.interventionTypeForAnalytics, v47, v46.current));
    local v58 = {};
    local v59 = l_FFlagUniversalFeatureRestrictionReceivers_0 and v44.useDetailedLayout;
    if v44.bodyText and v44.bodyText ~= "" then
        v58.BodyText = v3.createElement(l_Text_0, {
            Text = v44.bodyText, 
            tag = "auto-xy text-body-medium content-default text-align-x-left text-wrap", 
            testId = "dialog-body-text", 
            LayoutOrder = 1
        });
    end;
    if v59 then
        local v60 = {};
        if v44.evidence and v44.evidence ~= "" then
            v60.EvidenceItem = v3.createElement(l_View_0, {
                tag = "size-full-0 auto-y padding-x-medium", 
                testId = "dialog-evidence-item", 
                LayoutOrder = 1
            }, {
                EvidenceText = v3.createElement(l_Text_0, {
                    Text = v44.evidence, 
                    tag = "auto-xy text-body-medium text-align-x-left text-wrap", 
                    RichText = true
                })
            });
        end;
        if v44.violationReason and v44.violationReason ~= "" then
            if v44.evidence and v44.evidence ~= "" then
                v60.DividerAfterEvidence = v3.createElement(l_Divider_0, {
                    LayoutOrder = 2
                });
            end;
            v60.ReasonItem = v3.createElement(l_View_0, {
                tag = "size-full-0 auto-y padding-x-medium", 
                testId = "dialog-reason-item", 
                LayoutOrder = 3
            }, {
                ReasonField = v3.createElement(v10, {
                    fieldLabel = v48.ReasonText, 
                    fieldValue = v44.violationReason
                })
            });
        end;
        if v44.formattedEndDate and v44.formattedEndDate ~= "" then
            v60.EndingOnItem = v3.createElement(l_View_0, {
                tag = "size-full-0 auto-y row padding-x-medium align-y-center", 
                testId = "dialog-ending-on-item", 
                LayoutOrder = 4
            }, {
                EndingOnInfo = v3.createElement(l_View_0, {
                    tag = "auto-y col fill", 
                    LayoutOrder = 1
                }, {
                    EvidenceField = v3.createElement(v10, {
                        fieldLabel = "Ending on", 
                        fieldValue = v44.formattedEndDate
                    })
                }), 
                CountdownBadge = v3.createElement(l_Badge_0, {
                    text = v44.countdownText or "Complete", 
                    variant = l_BadgeVariant_0.Neutral, 
                    icon = if v44.countdownText then {
                        name = l_IconName_0.Clock, 
                        position = l_IconPosition_0.Left, 
                        variant = l_IconVariant_0.Filled
                    } else nil, 
                    LayoutOrder = 2
                })
            });
        end;
        if not v8.isEmpty(v60) then
            v58.DetailedList = v3.createElement(l_View_0, {
                tag = "size-full-0 auto-y padding-top-xxsmall padding-x-xxsmall padding-bottom-medium", 
                testId = "dialog-detailed-list", 
                LayoutOrder = 2
            }, v3.createElement(l_View_0, {
                tag = "size-full-0 auto-y col padding-y-large gap-large radius-large bg-shift-100 stroke-standard stroke-default"
            }, v60));
        end;
    elseif v44.evidence and v44.evidence ~= "" or v44.violationReason and v44.violationReason ~= "" or v44.isAppealable then
        v58.Evidence = v3.createElement(l_View_0, {
            tag = "size-full-0 auto-y padding-xxsmall", 
            LayoutOrder = 2
        }, {
            v3.createElement(l_View_0, {
                tag = "size-full-0 auto-y col gap-small padding-medium radius-medium bg-surface-200 stroke-standard stroke-default"
            }, {
                EvidenceText = v44.evidence and v44.evidence ~= "" and v3.createElement(l_Text_0, {
                    Text = v44.evidence, 
                    tag = "auto-xy text-body-medium text-align-x-left text-wrap", 
                    RichText = true, 
                    LayoutOrder = 1
                }), 
                Reason = v44.violationReason and v44.violationReason ~= "" and v3.createElement(l_Text_0, {
                    Text = ("<b>%*:</b>\n%*"):format(v48.ReasonText, v44.violationReason), 
                    tag = "auto-xy text-body-medium text-align-x-left text-wrap", 
                    RichText = true, 
                    LayoutOrder = 2
                }), 
                AppealButton = v44.isAppealable and v3.createElement(l_Button_0, {
                    text = v48.ReportMistakeText, 
                    variant = l_ButtonVariant_0.Standard, 
                    size = l_ButtonSize_0.XSmall, 
                    width = UDim.new(1, 0), 
                    onActivated = v57, 
                    LayoutOrder = 3
                })
            })
        });
    end;
    if v44.dsaMessage and v44.dsaMessage ~= "" and not v59 then
        v58.DsaMessage = v3.createElement(l_Text_0, {
            Text = v44.dsaMessage, 
            tag = "auto-xy text-caption-small content-default text-align-x-left text-wrap", 
            LayoutOrder = 3
        });
    end;
    local v61 = nil;
    if v59 then
        v61 = {
            {
                variant = l_ButtonVariant_0.Emphasis, 
                size = l_ButtonSize_0.Medium, 
                text = v48.OkText, 
                onActivated = v56, 
                width = UDim.new(1, 0)
            }
        };
        if v44.isAppealable then
            table.insert(v61, {
                variant = l_ButtonVariant_0.Standard, 
                size = l_ButtonSize_0.Medium, 
                text = v48.ReportMistakeText, 
                onActivated = v57, 
                width = UDim.new(1, 0)
            });
        end;
    end;
    if v42 then
        return v3.createElement(l_Dialog_0.Root, {
            size = l_DialogSize_0.Medium, 
            hasCloseButton = false, 
            ref = v53, 
            hasBackdrop = not l_VRService_0.VREnabled, 
            disablePortal = v47 ~= v7.InterventionPlacementType.InExperience
        }, {
            DialogTitle = not v44.isLoading and v3.createElement(l_Dialog_0.Title, {
                text = v44.titleText
            }), 
            DialogContent = v3.createElement(l_Dialog_0.Content, nil, if v44.isLoading then v3.createElement(l_View_0, {
                tag = "size-full-0 auto-y col gap-medium margin-top-small"
            }, {
                Heading = v3.createElement(l_Skeleton_0, {
                    Size = UDim2.new(0.6, 0, 0, v45.Size.Size_1100), 
                    radius = l_Radius_0.Medium, 
                    LayoutOrder = 1
                }), 
                Body = v3.createElement(l_Skeleton_0, {
                    Size = UDim2.new(1, 0, 0, v45.Size.Size_2000), 
                    radius = l_Radius_0.Medium, 
                    LayoutOrder = 2
                }), 
                Actions = v3.createElement(l_Skeleton_0, {
                    Size = UDim2.new(1, 0, 0, v45.Size.Size_800), 
                    radius = l_Radius_0.Medium, 
                    LayoutOrder = 3
                })
            }) else v3.createElement(l_View_0, {
                tag = "size-full-0 auto-y col gap-medium"
            }, v58)), 
            DialogActions = not v44.isLoading and v3.createElement(l_Dialog_0.Actions, {
                actions = if v59 then v61 else {
                    {
                        variant = l_ButtonVariant_0.Emphasis, 
                        size = l_ButtonSize_0.Small, 
                        text = v48.OkText, 
                        onActivated = v56
                    }
                }, 
                label = if v59 and v44.useDetailedLayout and v44.dsaMessage and v44.dsaMessage ~= "" then v44.dsaMessage else nil
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
                DialogTitle = not v44.isLoading and v3.createElement(l_Dialog_0.Title, {
                    text = v44.titleText
                }), 
                DialogContent = v3.createElement(l_Dialog_0.Content, nil, if v44.isLoading then v3.createElement(l_View_0, {
                    tag = "size-full-0 auto-y col gap-medium margin-top-small"
                }, {
                    Heading = v3.createElement(l_Skeleton_0, {
                        Size = UDim2.new(0.6, 0, 0, v45.Size.Size_1100), 
                        radius = l_Radius_0.Medium, 
                        LayoutOrder = 1
                    }), 
                    Body = v3.createElement(l_Skeleton_0, {
                        Size = UDim2.new(1, 0, 0, v45.Size.Size_2000), 
                        radius = l_Radius_0.Medium, 
                        LayoutOrder = 2
                    }), 
                    Actions = v3.createElement(l_Skeleton_0, {
                        Size = UDim2.new(1, 0, 0, v45.Size.Size_800), 
                        radius = l_Radius_0.Medium, 
                        LayoutOrder = 3
                    })
                }) else v3.createElement(l_View_0, {
                    tag = "size-full-0 auto-y col gap-medium"
                }, v58)), 
                DialogActions = not v44.isLoading and v3.createElement(l_Dialog_0.Actions, {
                    actions = {
                        {
                            variant = l_ButtonVariant_0.Emphasis, 
                            size = l_ButtonSize_0.Small, 
                            text = v48.OkText, 
                            onActivated = v56
                        }
                    }
                })
            })
        }));
    end;
end);