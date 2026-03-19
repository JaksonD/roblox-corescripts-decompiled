local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceIntervention");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.InterventionContestFeedbackFooter);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.Foundation);
local l_Text_0 = v5.Text;
local l_PartialPageModal_0 = v4.App.Dialog.Modal.PartialPageModal;
local l_useLayerCollector_0 = v4.Core.Layout.LayerCollector.useLayerCollector;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useStyle_0 = v4.Core.Style.useStyle;
local v11 = require(l_script_FirstAncestor_0.Utils.Constants);
local v12 = require(l_script_FirstAncestor_0.InExperienceInterventionAnalytics);
local l_View_0 = v5.View;
local l_Button_0 = v5.Button;
local l_ScrollView_0 = v5.ScrollView;
local l_ScrollBarVisibility_0 = v5.Enums.ScrollBarVisibility;
local l_ButtonVariant_0 = v5.Enums.ButtonVariant;
local l_FillBehavior_0 = v5.Enums.FillBehavior;
local l_useTokens_0 = v5.Hooks.useTokens;
local l_useProperty_0 = require(l_Parent_0.GuiObjectUtils).useProperty;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v22 = require(l_Parent_0.ReactFocusNavigation);
local v23 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusRoot_0 = v23.FocusRoot;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v23.FocusNavigableSurfaceIdentifierEnum;
local v26 = v22.FocusNavigationService.new(v22.EngineInterface.CoreGui);
local l_FFlagFixScrollFrameHeightCalculation_0 = require(l_Parent_0.InterventionShared).Flags.FFlagFixScrollFrameHeightCalculation;
ChatTimeoutCustomDialog = function(v28) --[[ Line: 43 ]] --[[ Name: ChatTimeoutCustomDialog ]]
    -- upvalues: l_useLayerCollector_0 (copy), v2 (copy), l_useTokens_0 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v11 (copy), l_FFlagFixScrollFrameHeightCalculation_0 (copy), l_useProperty_0 (copy), v12 (copy), l_dependencyArray_0 (copy), l_PartialPageModal_0 (copy), l_ScrollView_0 (copy), l_ScrollBarVisibility_0 (copy), v22 (copy), v26 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_View_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy), v3 (copy)
    local v29 = l_useLayerCollector_0();
    local v30 = v2.useRef(DateTime.now().UnixTimestampMillis);
    local v31 = v2.useRef(nil);
    local v32, v33 = v2.useState(0);
    local v34 = l_useTokens_0();
    local v35 = l_useStyle_0();
    local v36 = l_useLocalization_0(v11.localizationKeys);
    local v37 = if l_FFlagFixScrollFrameHeightCalculation_0 then l_useProperty_0(v31, "AbsoluteSize") else nil;
    local v38 = v2.useCallback(function() --[[ Line: 59 ]]
        -- upvalues: v12 (ref), v30 (copy), v28 (copy)
        v12.sendAnalyticsEvent(v12.Constants.EventTypes.CtaClicked, v12.Constants.InterventionTypes.Timeout, v30.current, v28.eventId, v28.violatingChatLine, v28.duration);
        v28.onDismiss();
    end, {
        v30
    });
    v2.useEffect(function() --[[ Line: 71 ]]
        -- upvalues: v12 (ref), v30 (copy), v28 (copy)
        v12.sendAnalyticsEvent(v12.Constants.EventTypes.ModalAppeared, v12.Constants.InterventionTypes.Timeout, v30.current, v28.eventId, v28.violatingChatLine, v28.duration);
    end, {
        v30
    });
    v2.useEffect(function() --[[ Line: 83 ]]
        -- upvalues: l_FFlagFixScrollFrameHeightCalculation_0 (ref), v37 (copy), v29 (copy), v11 (ref), v33 (copy), v31 (copy)
        if l_FFlagFixScrollFrameHeightCalculation_0 then
            local v39 = if v37 then v37.Y else 0;
            local v40 = math.min(v29.absoluteSize.Y - v11.UNIBAR_HEIGHT - v11.DIALOG_HEADER_HEIGHT, v39);
            v33(v40);
            return;
        else
            local v41 = if v31.current then v31.current.AbsoluteSize.Y else 0;
            local v42 = math.min(v29.absoluteSize.Y - v11.UNIBAR_HEIGHT - v11.DIALOG_HEADER_HEIGHT, v41);
            v33(v42);
            return;
        end;
    end, if l_FFlagFixScrollFrameHeightCalculation_0 then l_dependencyArray_0(v29.absoluteSize.Y, v37) else {
        v29.absoluteSize.Y, 
        v31.current
    });
    local v43 = nil;
    v43 = if v28.duration <= 60 then v36.CannotSend1MinText else l_useLocalization_0({
        value = {
            v11.localizationKeys.CannotSendText; 
            number = math.ceil(v28.duration / 60)
        }
    }).value;
    return v2.createElement(l_PartialPageModal_0, {
        title = v36.TextChatSuspensionText, 
        screenSize = v29.absoluteSize
    }, {
        ScrollView = v2.createElement(l_ScrollView_0, {
            Size = UDim2.new(1, 0, 0, v32), 
            scroll = {
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                CanvasSize = UDim2.new(1, 0, 1, 0), 
                scrollBarVisibility = l_ScrollBarVisibility_0.Always, 
                ScrollingDirection = Enum.ScrollingDirection.Y
            }
        }, {
            FocusNavigationCoreScriptsProvider = v2.createElement(v22.FocusNavigationContext.Provider, {
                value = v26
            }, {
                FocusNavigationCoreScriptsWrapper = v2.createElement(l_FocusRoot_0, {
                    surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
                    isIsolated = true, 
                    isAutoFocusRoot = true, 
                    frameProps = {
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }
                }, {
                    InnerContent = v2.createElement(l_View_0, {
                        ref = v31, 
                        Size = UDim2.new(1, -v11.SCROLL_BAR_WIDTH, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        tag = "col gap-large align-x-center align-y-center padding-x-small padding-top-large"
                    }, {
                        ChatDisabledText = v2.createElement(l_Text_0, {
                            LayoutOrder = 1, 
                            Text = v43, 
                            textStyle = v35.Theme.TextEmphasis, 
                            fontStyle = v34.Typography.LabelLarge, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            TextXAlignment = Enum.TextXAlignment.Center, 
                            TextYAlignment = Enum.TextYAlignment.Center, 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            TextWrapped = true
                        }), 
                        WarningTextLabel = v2.createElement(l_Text_0, {
                            LayoutOrder = 2, 
                            Text = v36.MayLoseAccessText, 
                            tag = "padding-small size-full-800 text-wrap", 
                            TextWrapped = true, 
                            AutomaticSize = Enum.AutomaticSize.Y
                        }), 
                        UnderstandButtonFrame = v2.createElement(l_View_0, {
                            Size = UDim2.new(1, 0, 0, 0), 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            LayoutOrder = 3
                        }, {
                            UnderstandButton = v2.createElement(l_Button_0, {
                                text = v36.IUnderstandText, 
                                variant = l_ButtonVariant_0.Standard, 
                                onActivated = v38, 
                                fillBehavior = l_FillBehavior_0.Fill, 
                                FillDirection = Enum.FillDirection.Horizontal
                            })
                        }), 
                        FeedbackFrame = v2.createElement(l_View_0, {
                            Size = UDim2.new(1, 0, 0, 0), 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            LayoutOrder = 4
                        }, {
                            FeedbackFooter = v2.createElement(v3, {
                                onDismiss = v28.onDismiss, 
                                renderTimestamp = v30.current, 
                                interventionType = v12.Constants.InterventionTypes.Timeout, 
                                eventId = v28.eventId, 
                                violatingChatLine = v28.violatingChatLine, 
                                duration = v28.duration
                            })
                        })
                    })
                })
            })
        })
    });
end;
return ChatTimeoutCustomDialog;