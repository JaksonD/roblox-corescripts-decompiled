local l_script_FirstAncestor_0 = script:FindFirstAncestor("InterventionShared");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Foundation);
local l_Text_0 = v4.Text;
local l_ModalWindow_0 = v3.App.Dialog.Modal.ModalWindow;
local l_useLayerCollector_0 = v3.Core.Layout.LayerCollector.useLayerCollector;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v10 = require(l_script_FirstAncestor_0.Utils.Constants);
local v11 = require(l_script_FirstAncestor_0.InterventionAnalytics);
local l_Icon_0 = v4.Icon;
local l_View_0 = v4.View;
local l_ScrollView_0 = v4.ScrollView;
local l_ScrollBarVisibility_0 = v4.Enums.ScrollBarVisibility;
local l_useTokens_0 = v4.Hooks.useTokens;
local v17 = require(l_Parent_0.NotificationModalsManager);
local v18 = v3.App.ImageSet.Images["icons/actions/accept"];
local l_ButtonStack_0 = v3.App.Button.ButtonStack;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local v21 = require(l_script_FirstAncestor_0.Hooks.useScrollFrameHeightCalculation);
local l_useCursor_0 = v3.App.SelectionCursor.useCursor;
local v23 = require(l_script_FirstAncestor_0.Hooks.useInterventionPlacement);
local v24 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceIdentifierEnum_0 = v24.FocusNavigableSurfaceIdentifierEnum;
local l_FocusRoot_0 = v24.FocusRoot;
InterventionDialog = function(v27) --[[ Line: 48 ]] --[[ Name: InterventionDialog ]]
    -- upvalues: l_useLayerCollector_0 (copy), v2 (copy), l_useTokens_0 (copy), l_useStyle_0 (copy), v23 (copy), l_useLocalization_0 (copy), v10 (copy), v11 (copy), v17 (copy), v18 (copy), v21 (copy), l_useCursor_0 (copy), l_ModalWindow_0 (copy), l_View_0 (copy), l_ScrollView_0 (copy), l_ScrollBarVisibility_0 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_Icon_0 (copy), l_Text_0 (copy), l_ButtonStack_0 (copy), l_ButtonType_0 (copy)
    local l_absoluteSize_0 = l_useLayerCollector_0().absoluteSize;
    local v29 = v2.useRef(DateTime.now().UnixTimestampMillis);
    local v30 = l_useTokens_0();
    local v31 = l_useStyle_0();
    local v32 = v23();
    local v33 = l_useLocalization_0(v10.localizationKeys);
    local v34 = v2.useCallback(function() --[[ Line: 59 ]]
        -- upvalues: v11 (ref), v27 (copy), v32 (copy), v29 (copy)
        v11.sendAnalyticsEvent(v11.TelemetryConfigs.DialogCtaClicked, {
            eventType = v11.Constants.EventTypes.CtaClicked, 
            counterNamespace = v27.namespaceForAnalytics, 
            interventionType = v27.interventionTypeForAnalytics, 
            placement = v32, 
            renderedTimestamp = v29.current, 
            eventId = v27.eventId, 
            evidence = v27.evidence, 
            duration = v27.durationForAnalytics
        });
        v27.onDismiss();
    end, {
        v29, 
        v27.interventionTypeForAnalytics, 
        v27.eventId, 
        v27.evidence, 
        v27.durationForAnalytics, 
        v27.onDismiss
    });
    local v35 = v2.useCallback(function() --[[ Line: 83 ]]
        -- upvalues: v27 (copy), v17 (ref), v18 (ref), v33 (copy), v31 (copy), v11 (ref), v32 (copy), v29 (copy)
        v27.onDismiss();
        v17.SetUIBloxToast({
            iconImage = v18, 
            toastTitle = v33.TakeALookText, 
            toastSubtitle = v33.FeedbackHelpsText, 
            sequenceNumber = DateTime.now().UnixTimestamp, 
            iconColorStyle = {
                Color = v31.Tokens.Semantic.Color.Common.Success.Color3, 
                Transparency = 0
            }
        });
        v11.sendAnalyticsEvent(v11.TelemetryConfigs.DialogAppealClicked, {
            eventType = v11.Constants.EventTypes.AppealClicked, 
            counterNamespace = v27.namespaceForAnalytics, 
            interventionType = v27.interventionTypeForAnalytics, 
            placement = v32, 
            renderedTimestamp = v29.current, 
            eventId = v27.eventId, 
            evidence = v27.evidence, 
            duration = v27.durationForAnalytics
        });
    end, {
        v27.onDismiss, 
        v27.interventionTypeForAnalytics, 
        v27.eventId, 
        v27.evidence, 
        v27.durationForAnalytics
    });
    v2.useEffect(function() --[[ Line: 118 ]]
        -- upvalues: v11 (ref), v27 (copy), v32 (copy), v29 (copy)
        v11.sendAnalyticsEvent(v11.TelemetryConfigs.DialogRendered, {
            eventType = v11.Constants.EventTypes.ModalAppeared, 
            counterNamespace = v27.namespaceForAnalytics, 
            interventionType = v27.interventionTypeForAnalytics, 
            placement = v32, 
            renderedTimestamp = v29.current, 
            eventId = v27.eventId, 
            evidence = v27.evidence, 
            duration = v27.durationForAnalytics
        });
    end, {
        v29, 
        v27.eventId
    });
    local v36 = v21({});
    local v37 = l_absoluteSize_0.X > 540 and "gap-xlarge" or "gap-medium";
    local v38 = l_useCursor_0(UDim.new(0, v31.Tokens.Semantic.Radius.Medium), v31.Tokens.Global.Space_50, v31.Tokens.Global.Size_25);
    return v2.createElement(l_ModalWindow_0, {
        screenSize = l_absoluteSize_0, 
        isFullHeight = false
    }, {
        ContentContainer = v2.createElement(l_View_0, {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            tag = "padding-x-xlarge padding-y-large"
        }, {
            ScrollView = v2.createElement(l_ScrollView_0, {
                Size = UDim2.new(1, 0, 0, v36.scrollFrameContainerHeight), 
                scroll = {
                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                    CanvasSize = UDim2.new(1, 0, 1, 0), 
                    scrollBarVisibility = l_ScrollBarVisibility_0.Always, 
                    ScrollingDirection = Enum.ScrollingDirection.Y
                }
            }, {
                FocusNavigationCoreScriptsWrapper = v2.createElement(l_FocusRoot_0, {
                    surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
                    isIsolated = true, 
                    isAutoFocusRoot = v32 ~= v10.InterventionPlacementType.InApp, 
                    frameProps = {
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }
                }, {
                    InnerContent = v2.createElement(l_View_0, {
                        Size = UDim2.new(1, if v36.shouldShowScrollBar then -v10.SCROLL_BAR_WIDTH else 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        tag = ("col %* align-x-center align-y-center"):format(v37) .. (v36.shouldShowScrollBar and " padding-right-xsmall" or ""), 
                        onAbsoluteSizeChanged = v36.onInnerContentSizeChanged
                    }, {
                        IconAndText = v2.createElement(l_View_0, {
                            Size = UDim2.new(1, 0, 0, 0), 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            tag = if l_absoluteSize_0.X > 540 then ("col %* align-x-center"):format(v37) else ("row %* align-x-center align-y-center"):format(v37), 
                            LayoutOrder = 1
                        }, {
                            Icon = if v27.iconName then v2.createElement(l_Icon_0, {
                                size = v27.iconSize, 
                                name = v27.iconName, 
                                style = v27.iconStyle, 
                                LayoutOrder = 1
                            }) else nil, 
                            TextContent = v2.createElement(l_View_0, {
                                Size = UDim2.new(1, 0, 0, 0), 
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                LayoutOrder = 2, 
                                tag = "col fill"
                            }, {
                                TitleText = if v27.titleText then v2.createElement(l_Text_0, {
                                    LayoutOrder = 1, 
                                    Text = v27.titleText, 
                                    textStyle = v30.Color.Content.Emphasis, 
                                    fontStyle = v30.Typography.TitleLarge, 
                                    TextXAlignment = if l_absoluteSize_0.X > 540 then Enum.TextXAlignment.Center else Enum.TextXAlignment.Left, 
                                    TextYAlignment = Enum.TextYAlignment.Center, 
                                    Size = UDim2.new(1, 0, 0, 0), 
                                    AutomaticSize = Enum.AutomaticSize.Y, 
                                    TextWrapped = true
                                }) else nil, 
                                BodyText = if v27.bodyText then v2.createElement(l_Text_0, {
                                    LayoutOrder = 2, 
                                    Text = v27.bodyText, 
                                    textStyle = v30.Color.Content.Default, 
                                    fontStyle = v30.Typography.BodyMedium, 
                                    TextXAlignment = if l_absoluteSize_0.X > 540 then Enum.TextXAlignment.Center else Enum.TextXAlignment.Left, 
                                    TextYAlignment = Enum.TextYAlignment.Center, 
                                    Size = UDim2.new(1, 0, 0, 0), 
                                    AutomaticSize = Enum.AutomaticSize.Y, 
                                    TextWrapped = true
                                }) else nil
                            })
                        }), 
                        ButtonContainer = v2.createElement(l_View_0, {
                            Size = UDim2.new(1, 0, 0, 0), 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            LayoutOrder = 2
                        }, {
                            ButtonStack = v2.createElement(l_ButtonStack_0, {
                                buttons = {
                                    {
                                        buttonType = l_ButtonType_0.PrimarySystem, 
                                        props = {
                                            cursor = v38, 
                                            text = v33.IUnderstandText, 
                                            onActivated = v34, 
                                            layoutOrder = 1
                                        }
                                    }, 
                                    {
                                        buttonType = l_ButtonType_0.Secondary, 
                                        props = {
                                            cursor = v38, 
                                            text = v33.MistakeText, 
                                            onActivated = v35, 
                                            layoutOrder = 2
                                        }
                                    }
                                }
                            })
                        })
                    })
                })
            })
        })
    });
end;
return v2.memo(InterventionDialog);