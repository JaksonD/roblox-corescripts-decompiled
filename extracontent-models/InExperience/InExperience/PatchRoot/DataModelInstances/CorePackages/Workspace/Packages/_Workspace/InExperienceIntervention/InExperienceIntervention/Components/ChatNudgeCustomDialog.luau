local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceIntervention");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.Utils.Constants);
local v4 = require(l_Parent_0.React);
local v5 = require(l_script_FirstAncestor_0.Components.InterventionContestFeedbackFooter);
local v6 = require(l_Parent_0.UIBlox);
local v7 = require(l_Parent_0.Foundation);
local l_PartialPageModal_0 = v6.App.Dialog.Modal.PartialPageModal;
local l_Text_0 = v7.Text;
local l_View_0 = v7.View;
local l_Button_0 = v7.Button;
local l_useTokens_0 = v7.Hooks.useTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_useLayerCollector_0 = v6.Core.Layout.LayerCollector.useLayerCollector;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v17 = require(l_script_FirstAncestor_0.InExperienceInterventionAnalytics);
local l_ScrollView_0 = v7.ScrollView;
local l_ScrollBarVisibility_0 = v7.Enums.ScrollBarVisibility;
local l_ButtonVariant_0 = v7.Enums.ButtonVariant;
local l_FillBehavior_0 = v7.Enums.FillBehavior;
local l_useProperty_0 = require(l_Parent_0.GuiObjectUtils).useProperty;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v24 = require(l_Parent_0.ReactFocusNavigation);
local v25 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusRoot_0 = v25.FocusRoot;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v25.FocusNavigableSurfaceIdentifierEnum;
local v28 = v24.FocusNavigationService.new(v24.EngineInterface.CoreGui);
local l_FFlagFixScrollFrameHeightCalculation_0 = require(l_Parent_0.InterventionShared).Flags.FFlagFixScrollFrameHeightCalculation;
ChatNudgeCustomDialog = function(v30) --[[ Line: 45 ]] --[[ Name: ChatNudgeCustomDialog ]]
    -- upvalues: v4 (copy), v17 (copy), l_useLocalization_0 (copy), v3 (copy), l_useStyle_0 (copy), l_useLayerCollector_0 (copy), l_useTokens_0 (copy), l_FFlagFixScrollFrameHeightCalculation_0 (copy), l_useProperty_0 (copy), l_dependencyArray_0 (copy), l_LocalPlayer_0 (copy), l_View_0 (copy), l_Text_0 (copy), l_PartialPageModal_0 (copy), l_ScrollView_0 (copy), l_ScrollBarVisibility_0 (copy), v24 (copy), v28 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy), v5 (copy)
    local v31 = v4.useRef(DateTime.now().UnixTimestampMillis);
    local v32 = v4.useRef(nil);
    local v33, v34 = v4.useState(0);
    v4.useEffect(function() --[[ Line: 49 ]]
        -- upvalues: v17 (ref), v31 (copy), v30 (copy)
        v17.sendAnalyticsEvent(v17.Constants.EventTypes.ModalAppeared, v17.Constants.InterventionTypes.Nudge, v31.current, v30.eventId, v30.violatingChatLine, nil);
    end, {
        v31
    });
    local v35 = l_useLocalization_0(v3.localizationKeys);
    local v36 = l_useStyle_0();
    local v37 = l_useLayerCollector_0();
    local v38 = l_useTokens_0();
    local v39 = if l_FFlagFixScrollFrameHeightCalculation_0 then l_useProperty_0(v32, "AbsoluteSize") else nil;
    v4.useEffect(function() --[[ Line: 71 ]]
        -- upvalues: l_FFlagFixScrollFrameHeightCalculation_0 (ref), v39 (copy), v37 (copy), v3 (ref), v34 (copy), v32 (copy)
        if l_FFlagFixScrollFrameHeightCalculation_0 then
            local v40 = if v39 then v39.Y else 0;
            local v41 = math.min(v37.absoluteSize.Y - v3.UNIBAR_HEIGHT - v3.DIALOG_HEADER_HEIGHT, v40);
            v34(v41);
            return;
        else
            local v42 = if v32.current then v32.current.AbsoluteSize.Y else 0;
            local v43 = math.min(v37.absoluteSize.Y - v3.UNIBAR_HEIGHT - v3.DIALOG_HEADER_HEIGHT, v42);
            v34(v43);
            return;
        end;
    end, if l_FFlagFixScrollFrameHeightCalculation_0 then l_dependencyArray_0(v37.absoluteSize.Y, v39) else {
        v37.absoluteSize.Y, 
        v32.current
    });
    local v44 = if l_LocalPlayer_0 then ("%*: %*"):format(l_LocalPlayer_0.DisplayName, v30.violatingChatLine) else v30.violatingChatLine;
    local v45 = v4.useCallback(function() --[[ Line: 103 ]]
        -- upvalues: v17 (ref), v31 (copy), v30 (copy)
        v17.sendAnalyticsEvent(v17.Constants.EventTypes.CtaClicked, v17.Constants.InterventionTypes.Nudge, v31.current, v30.eventId, v30.violatingChatLine, nil);
        v30.onDismiss();
    end, {
        v31
    });
    local v46 = if v30.violatingChatLine then v4.createElement(l_View_0, {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = 1
    }, {
        Layout = v4.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v3.STANDARD_PADDING / 2)
        }), 
        ChatIncludesTextFrame = v4.createElement(l_View_0, {
            Size = UDim2.new(1, 0, 0, 0), 
            LayoutOrder = 1, 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            ChatIncludesText = v4.createElement(l_Text_0, {
                Text = v35.ChatIncludesText, 
                fontStyle = v38.Typography.BodySmall, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                AnchorPoint = Vector2.new(0, 0), 
                AutomaticSize = Enum.AutomaticSize.XY
            })
        }), 
        ViolatingTextFrame = v4.createElement(l_View_0, {
            Size = UDim2.new(1, 0, 0, v3.VIOLATION_HEIGHT), 
            LayoutOrder = 2, 
            BackgroundTransparency = 0, 
            BackgroundColor3 = v36.Theme.BackgroundUIDefault.Color, 
            tag = "col gap-small align-x-center align-y-center padding-x-large radius-medium stroke-default"
        }, {
            ViolationText = v4.createElement(l_Text_0, {
                LayoutOrder = 2, 
                Text = v44, 
                textStyle = v36.Theme.TextMuted, 
                fontStyle = v36.Font.Body, 
                Size = UDim2.new(1, 0, 0, 0), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextWrapped = true, 
                TextTruncate = Enum.TextTruncate.AtEnd
            })
        })
    }) else nil;
    return v4.createElement(l_PartialPageModal_0, {
        title = v35.ChatBreaksRulesText, 
        screenSize = v37.absoluteSize
    }, {
        ScrollView = v4.createElement(l_ScrollView_0, {
            Size = UDim2.new(1, 0, 0, v33), 
            scroll = {
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                CanvasSize = UDim2.new(1, 0, 1, 0), 
                scrollBarVisibility = l_ScrollBarVisibility_0.Always, 
                ScrollingDirection = Enum.ScrollingDirection.Y
            }
        }, {
            FocusNavigationCoreScriptsProvider = v4.createElement(v24.FocusNavigationContext.Provider, {
                value = v28
            }, {
                FocusNavigationCoreScriptsWrapper = v4.createElement(l_FocusRoot_0, {
                    surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
                    isIsolated = true, 
                    isAutoFocusRoot = true, 
                    frameProps = {
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }
                }, {
                    InnerContent = v4.createElement(l_View_0, {
                        ref = v32, 
                        Size = UDim2.new(1, -v3.SCROLL_BAR_WIDTH, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        tag = "col gap-large align-x-center align-y-center padding-x-small padding-top-large"
                    }, {
                        MiddleContent = v46, 
                        WarningText = v4.createElement(l_Text_0, {
                            LayoutOrder = 3, 
                            Text = v35.TextChatMayBeSuspendedText, 
                            textStyle = v36.Theme.TextEmphasis, 
                            fontStyle = v36.Font.Body, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            TextXAlignment = Enum.TextXAlignment.Center, 
                            TextYAlignment = Enum.TextYAlignment.Center, 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            TextWrapped = true
                        }), 
                        UnderstandButtonFrame = v4.createElement(l_View_0, {
                            Size = UDim2.new(1, 0, 0, 0), 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            LayoutOrder = 4
                        }, {
                            UnderstandButton = v4.createElement(l_Button_0, {
                                text = v35.IUnderstandText, 
                                variant = l_ButtonVariant_0.Standard, 
                                onActivated = v45, 
                                fillBehavior = l_FillBehavior_0.Fill, 
                                FillDirection = Enum.FillDirection.Horizontal
                            })
                        }), 
                        FeedbackFrame = v4.createElement(l_View_0, {
                            Size = UDim2.new(1, 0, 0, 0), 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            LayoutOrder = 5
                        }, {
                            FeedbackFooter = v4.createElement(v5, {
                                onDismiss = v30.onDismiss, 
                                renderTimestamp = v31.current, 
                                interventionType = v17.Constants.InterventionTypes.Nudge, 
                                eventId = v30.eventId, 
                                violatingChatLine = v30.violatingChatLine, 
                                duration = nil
                            })
                        })
                    })
                })
            })
        })
    });
end;
return ChatNudgeCustomDialog;