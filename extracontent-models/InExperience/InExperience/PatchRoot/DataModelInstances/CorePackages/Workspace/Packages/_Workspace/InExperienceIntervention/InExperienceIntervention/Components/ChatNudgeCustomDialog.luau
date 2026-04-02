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
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
ChatNudgeCustomDialog = function(v31) --[[ Line: 47 ]] --[[ Name: ChatNudgeCustomDialog ]]
    -- upvalues: v4 (copy), v17 (copy), l_useLocalization_0 (copy), v3 (copy), l_useStyle_0 (copy), l_useLayerCollector_0 (copy), l_useTokens_0 (copy), l_FFlagFixScrollFrameHeightCalculation_0 (copy), l_useProperty_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_LocalPlayer_0 (copy), l_View_0 (copy), l_Text_0 (copy), l_PartialPageModal_0 (copy), l_ScrollView_0 (copy), l_ScrollBarVisibility_0 (copy), v24 (copy), v28 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy), v5 (copy)
    local v32 = v4.useRef(DateTime.now().UnixTimestampMillis);
    local v33 = v4.useRef(nil);
    local v34, v35 = v4.useState(0);
    v4.useEffect(function() --[[ Line: 51 ]]
        -- upvalues: v17 (ref), v32 (copy), v31 (copy)
        v17.sendAnalyticsEvent(v17.Constants.EventTypes.ModalAppeared, v17.Constants.InterventionTypes.Nudge, v32.current, v31.eventId, v31.violatingChatLine, nil);
    end, {
        v32
    });
    local v36 = l_useLocalization_0(v3.localizationKeys);
    local v37 = l_useStyle_0();
    local v38 = l_useLayerCollector_0();
    local v39 = l_useTokens_0();
    local v40 = if l_FFlagFixScrollFrameHeightCalculation_0 then l_useProperty_0(v33, "AbsoluteSize") else nil;
    v4.useEffect(function() --[[ Line: 73 ]]
        -- upvalues: l_FFlagFixScrollFrameHeightCalculation_0 (ref), v40 (copy), v38 (copy), v3 (ref), v35 (copy), v33 (copy)
        if l_FFlagFixScrollFrameHeightCalculation_0 then
            local v41 = if v40 then v40.Y else 0;
            local v42 = math.min(v38.absoluteSize.Y - v3.UNIBAR_HEIGHT - v3.DIALOG_HEADER_HEIGHT, v41);
            v35(v42);
            return;
        else
            local v43 = if v33.current then v33.current.AbsoluteSize.Y else 0;
            local v44 = math.min(v38.absoluteSize.Y - v3.UNIBAR_HEIGHT - v3.DIALOG_HEADER_HEIGHT, v43);
            v35(v44);
            return;
        end;
    end, if l_FFlagFixScrollFrameHeightCalculation_0 then if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v38.absoluteSize.Y, 
        v40
    } else l_dependencyArray_0(v38.absoluteSize.Y, v40) else {
        v38.absoluteSize.Y, 
        v33.current
    });
    local v45 = if l_LocalPlayer_0 then ("%*: %*"):format(l_LocalPlayer_0.DisplayName, v31.violatingChatLine) else v31.violatingChatLine;
    local v46 = v4.useCallback(function() --[[ Line: 107 ]]
        -- upvalues: v17 (ref), v32 (copy), v31 (copy)
        v17.sendAnalyticsEvent(v17.Constants.EventTypes.CtaClicked, v17.Constants.InterventionTypes.Nudge, v32.current, v31.eventId, v31.violatingChatLine, nil);
        v31.onDismiss();
    end, {
        v32
    });
    local v47 = if v31.violatingChatLine then v4.createElement(l_View_0, {
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
                Text = v36.ChatIncludesText, 
                fontStyle = v39.Typography.BodySmall, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                AnchorPoint = Vector2.new(0, 0), 
                AutomaticSize = Enum.AutomaticSize.XY
            })
        }), 
        ViolatingTextFrame = v4.createElement(l_View_0, {
            Size = UDim2.new(1, 0, 0, v3.VIOLATION_HEIGHT), 
            LayoutOrder = 2, 
            BackgroundTransparency = 0, 
            BackgroundColor3 = v37.Theme.BackgroundUIDefault.Color, 
            tag = "col gap-small align-x-center align-y-center padding-x-large radius-medium stroke-default"
        }, {
            ViolationText = v4.createElement(l_Text_0, {
                LayoutOrder = 2, 
                Text = v45, 
                textStyle = v37.Theme.TextMuted, 
                fontStyle = v37.Font.Body, 
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
        title = v36.ChatBreaksRulesText, 
        screenSize = v38.absoluteSize
    }, {
        ScrollView = v4.createElement(l_ScrollView_0, {
            Size = UDim2.new(1, 0, 0, v34), 
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
                        ref = v33, 
                        Size = UDim2.new(1, -v3.SCROLL_BAR_WIDTH, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        tag = "col gap-large align-x-center align-y-center padding-x-small padding-top-large"
                    }, {
                        MiddleContent = v47, 
                        WarningText = v4.createElement(l_Text_0, {
                            LayoutOrder = 3, 
                            Text = v36.TextChatMayBeSuspendedText, 
                            textStyle = v37.Theme.TextEmphasis, 
                            fontStyle = v37.Font.Body, 
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
                                text = v36.IUnderstandText, 
                                variant = l_ButtonVariant_0.Standard, 
                                onActivated = v46, 
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
                                onDismiss = v31.onDismiss, 
                                renderTimestamp = v32.current, 
                                interventionType = v17.Constants.InterventionTypes.Nudge, 
                                eventId = v31.eventId, 
                                violatingChatLine = v31.violatingChatLine, 
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