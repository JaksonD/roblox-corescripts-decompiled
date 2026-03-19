local l_script_FirstAncestor_0 = script:FindFirstAncestor("CoreScriptsPlayerFeedback");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_MouseIconOverrideService_0 = require(l_Parent_0.CoreScriptsCommon).MouseIconOverrideService;
local v10 = require(l_script_FirstAncestor_0.constants);
local l_useScreenSize_0 = require(l_Parent_0.CoreScriptsRoactCommon).useScreenSize;
local l_useLastInputMethod_0 = require(l_Parent_0.FocusNavigationUtils).useLastInputMethod;
local l_GuiService_0 = game:GetService("GuiService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v17 = l_Images_0["component_assets/circle_21"];
return (v2.memo(function(v18) --[[ Line: 42 ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useStyle_0 (copy), l_useLastInputMethod_0 (copy), v2 (copy), l_useLocalization_0 (copy), l_GuiService_0 (copy), v10 (copy), l_MouseIconOverrideService_0 (copy), l_TelemetryService_0 (copy), l_ContextActionService_0 (copy), l_ImageSetLabel_0 (copy), v17 (copy), l_ButtonType_0 (copy), l_InteractiveAlert_0 (copy)
    local v19 = l_useScreenSize_0();
    local v20 = l_useStyle_0();
    local v21 = l_useLastInputMethod_0();
    local v22, v23 = v2.useState(false);
    v2.useEffect(function() --[[ Line: 48 ]]
        -- upvalues: v22 (copy), v21 (copy), v23 (copy)
        if not v22 and (v21 == "Keyboard" or v21 == "Gamepad") then
            v23(true);
        end;
    end, {
        v22, 
        v21
    });
    local v24 = l_useLocalization_0({
        Title = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Title", 
        Submit = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Submit", 
        Submitting = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Submitting", 
        Placeholder = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Placeholder", 
        Intro = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Intro", 
        Footer = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Footer"
    });
    local v25, v26 = v2.useState("");
    local v27, v28 = v2.useState(false);
    local v29 = v2.useRef(nil);
    v2.useEffect(function() --[[ Line: 67 ]]
        -- upvalues: v22 (copy), v29 (copy), l_GuiService_0 (ref)
        if not v22 then
            return;
        else
            local l_current_0 = v29.current;
            if l_current_0 then
                pcall(function() --[[ Line: 74 ]]
                    -- upvalues: l_GuiService_0 (ref), l_current_0 (copy)
                    l_GuiService_0:Select(l_current_0);
                end);
            end;
            return;
        end;
    end, {
        v22
    });
    local l_MIN_FEEDBACK_LENGTH_0 = v10.MIN_FEEDBACK_LENGTH;
    local l_MAX_FEEDBACK_LENGTH_0 = v10.MAX_FEEDBACK_LENGTH;
    local l_DELAYED_INPUT_ANIM_SEC_0 = v10.DELAYED_INPUT_ANIM_SEC;
    v2.useEffect(function() --[[ Line: 84 ]]
        -- upvalues: l_MouseIconOverrideService_0 (ref)
        l_MouseIconOverrideService_0.push("PlayerFeedbackPromptOverride", Enum.OverrideMouseIconBehavior.ForceShow);
        return function() --[[ Line: 86 ]]
            -- upvalues: l_MouseIconOverrideService_0 (ref)
            l_MouseIconOverrideService_0.pop("PlayerFeedbackPromptOverride");
        end;
    end, {});
    local v35 = v2.useCallback(function() --[[ Line: 91 ]]
        -- upvalues: v25 (copy), l_MIN_FEEDBACK_LENGTH_0 (copy), l_MAX_FEEDBACK_LENGTH_0 (copy), v28 (copy), l_TelemetryService_0 (ref), v18 (copy)
        if #v25 < l_MIN_FEEDBACK_LENGTH_0 then
            return;
        elseif #v25 > l_MAX_FEEDBACK_LENGTH_0 then
            return;
        else
            v28(true);
            pcall(function() --[[ Line: 99 ]]
                -- upvalues: l_TelemetryService_0 (ref)
                l_TelemetryService_0:LogCounter({
                    eventName = "FeedbackPrompt_Submitted", 
                    backends = {
                        "RobloxTelemetryCounter"
                    }
                }, {
                    customFields = {}
                }, 1);
            end);
            pcall(function() --[[ Line: 106 ]]
                -- upvalues: v25 (ref)
                local l_SocialService_0 = game:GetService("SocialService");
                if l_SocialService_0.SignalFeedbackSubmissionCompleted then
                    l_SocialService_0:SignalFeedbackSubmissionCompleted(v25);
                end;
            end);
            v18.closePrompt();
            return;
        end;
    end, {
        v25
    });
    local v37 = v2.useCallback(function() --[[ Line: 115 ]]
        -- upvalues: l_TelemetryService_0 (ref), v18 (copy)
        pcall(function() --[[ Line: 116 ]]
            -- upvalues: l_TelemetryService_0 (ref)
            l_TelemetryService_0:LogCounter({
                eventName = "FeedbackPrompt_Cancelled", 
                backends = {
                    "RobloxTelemetryCounter"
                }
            }, {
                customFields = {}
            }, 1);
        end);
        pcall(function() --[[ Line: 123 ]]
            local l_SocialService_1 = game:GetService("SocialService");
            if l_SocialService_1.SignalFeedbackSubmissionPermissionDenied then
                l_SocialService_1:SignalFeedbackSubmissionPermissionDenied();
            end;
        end);
        v18.closePrompt();
    end, {});
    v2.useEffect(function() --[[ Line: 132 ]]
        -- upvalues: l_ContextActionService_0 (ref), l_GuiService_0 (ref), v35 (copy), v37 (copy)
        l_ContextActionService_0:BindCoreActionAtPriority("FeedbackPromptDisableGameControls", function(_, _, v40) --[[ Line: 135 ]]
            if v40 and v40.KeyCode == Enum.KeyCode.Escape then
                return Enum.ContextActionResult.Pass;
            else
                return Enum.ContextActionResult.Sink;
            end;
        end, false, Enum.ContextActionPriority.Low.Value, Enum.PlayerActions.CharacterForward, Enum.PlayerActions.CharacterBackward, Enum.PlayerActions.CharacterLeft, Enum.PlayerActions.CharacterRight, Enum.PlayerActions.CharacterJump);
        l_ContextActionService_0:BindCoreAction("FeedbackPromptSubmit", function(_, v42) --[[ Line: 150 ]]
            -- upvalues: l_GuiService_0 (ref), v35 (ref)
            if v42 == Enum.UserInputState.Begin then
                local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
                if l_SelectedCoreObject_0 and l_SelectedCoreObject_0:IsA("TextBox") then
                    return Enum.ContextActionResult.Pass;
                else
                    v35();
                    return Enum.ContextActionResult.Sink;
                end;
            else
                return Enum.ContextActionResult.Pass;
            end;
        end, false, Enum.KeyCode.ButtonA, Enum.KeyCode.Return);
        l_ContextActionService_0:BindCoreAction("FeedbackPromptCancel", function(_, v45) --[[ Line: 162 ]]
            -- upvalues: v37 (ref)
            if v45 == Enum.UserInputState.Begin then
                v37();
                return Enum.ContextActionResult.Sink;
            else
                return Enum.ContextActionResult.Pass;
            end;
        end, false, Enum.KeyCode.ButtonB);
        return function() --[[ Line: 170 ]]
            -- upvalues: l_ContextActionService_0 (ref)
            l_ContextActionService_0:UnbindCoreAction("FeedbackPromptDisableGameControls");
            l_ContextActionService_0:UnbindCoreAction("FeedbackPromptSubmit");
            l_ContextActionService_0:UnbindCoreAction("FeedbackPromptCancel");
        end;
    end, {
        v35, 
        v37
    });
    v2.useEffect(function() --[[ Line: 177 ]]
        -- upvalues: v29 (copy), l_GuiService_0 (ref)
        local function v47() --[[ Line: 178 ]] --[[ Name: trySelect ]]
            -- upvalues: v29 (ref), l_GuiService_0 (ref)
            local l_current_1 = v29.current;
            if l_current_1 then
                pcall(function() --[[ Line: 181 ]]
                    -- upvalues: l_GuiService_0 (ref), l_current_1 (copy)
                    l_GuiService_0:Select(l_current_1);
                end);
            end;
        end;
        task.delay(0.05, v47);
        task.delay(0.1, v47);
        task.delay(0.15000000000000002, v47);
        task.delay(0.2, v47);
        task.delay(0.25, v47);
        local v50 = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 189 ]]
            -- upvalues: l_GuiService_0 (ref), v29 (ref)
            local l_SelectedCoreObject_1 = l_GuiService_0.SelectedCoreObject;
            if l_SelectedCoreObject_1 == nil or l_SelectedCoreObject_1 and not l_SelectedCoreObject_1.Parent then
                local l_current_2 = v29.current;
                if l_current_2 then
                    pcall(function() --[[ Line: 181 ]]
                        -- upvalues: l_GuiService_0 (ref), l_current_2 (copy)
                        l_GuiService_0:Select(l_current_2);
                    end);
                end;
            end;
        end);
        return function() --[[ Line: 195 ]]
            -- upvalues: v50 (copy)
            v50:Disconnect();
        end;
    end, {});
    local l_Title_0 = v24.Title;
    local v52 = v27 and v24.Submitting or v24.Submit;
    local l_Placeholder_0 = v24.Placeholder;
    local v54 = false;
    if l_MIN_FEEDBACK_LENGTH_0 <= #v25 then
        v54 = #v25 <= l_MAX_FEEDBACK_LENGTH_0;
    end;
    local v57 = v2.useCallback(function(v55) --[[ Line: 206 ]]
        -- upvalues: v26 (copy)
        local l_Text_0 = v55.Text;
        v26(l_Text_0);
    end, {});
    local v63 = v2.useCallback(function() --[[ Line: 211 ]]
        -- upvalues: v20 (copy), v19 (copy), v10 (ref), v2 (ref), v24 (copy), l_ImageSetLabel_0 (ref), v17 (ref), v25 (copy), l_Placeholder_0 (copy), v29 (copy), v57 (copy)
        local l_Body_0 = v20.Font.Body;
        local l_BaseSize_0 = v20.Font.BaseSize;
        local v60 = math.floor(l_Body_0.RelativeSize * l_BaseSize_0);
        local v61 = math.clamp(v19.Y - 320, v10.MIN_TEXTBOX_HEIGHT, v10.MAX_TEXTBOX_HEIGHT);
        local v62 = math.max(v10.MIN_TEXTBOX_HEIGHT, (math.min(v10.MAX_TEXTBOX_HEIGHT, v61)));
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v62 + 16 + 24), 
            Selectable = false
        }, {
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 16), 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left
            }), 
            Intro = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Text = v24.Intro, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextColor3 = v20.Theme.TextEmphasis.Color, 
                TextTransparency = v20.Theme.TextEmphasis.Transparency, 
                Font = l_Body_0.Font, 
                TextSize = v60, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 0, 
                Selectable = false
            }), 
            TextBoxFrame = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v62), 
                LayoutOrder = 1, 
                Selectable = false
            }, {
                InputBg = v2.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    Image = v17, 
                    ImageTransparency = v20.Theme.UIMuted.Transparency, 
                    ImageColor3 = v20.Theme.UIMuted.Color, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(8, 8, 9, 9), 
                    Selectable = false
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 12), 
                        PaddingBottom = UDim.new(0, 12), 
                        PaddingLeft = UDim.new(0, 12), 
                        PaddingRight = UDim.new(0, 12)
                    }), 
                    TextBox = v2.createElement("TextBox", {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1, 
                        Text = v25, 
                        PlaceholderText = l_Placeholder_0, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        TextColor3 = v20.Theme.TextEmphasis.Color, 
                        TextTransparency = v20.Theme.TextEmphasis.Transparency, 
                        PlaceholderColor3 = v20.Theme.TextMuted.Color, 
                        Font = l_Body_0.Font, 
                        TextSize = v60, 
                        ClearTextOnFocus = false, 
                        MultiLine = true, 
                        OverlayNativeInput = true, 
                        ref = v29, 
                        [v2.Change.Text] = v57, 
                        [v2.Tag] = "data-testid=feedbackTextBox"
                    })
                })
            })
        });
    end, {
        v20, 
        v25, 
        v57
    });
    local v64 = v2.useMemo(function() --[[ Line: 295 ]]
        -- upvalues: l_ButtonType_0 (ref), v35 (copy), v52 (copy), v18 (copy), l_DELAYED_INPUT_ANIM_SEC_0 (copy), v54 (copy), v27 (copy)
        return {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimaryContextual, 
                    props = {
                        onActivated = v35, 
                        text = v52, 
                        isDelayedInput = v18.enableInputDelayed, 
                        enableInputDelayed = v18.enableInputDelayed, 
                        delayInputSeconds = l_DELAYED_INPUT_ANIM_SEC_0, 
                        isDisabled = not v54, 
                        isLoading = v27
                    }
                }
            }
        };
    end, {
        v35, 
        v52, 
        v18.enableInputDelayed, 
        v54, 
        v27
    });
    local l_Footer_0 = v24.Footer;
    local v67 = v2.useCallback(function() --[[ Line: 316 ]]
        -- upvalues: l_Footer_0 (copy), v2 (ref), v20 (copy)
        local l_l_Footer_0_0 = l_Footer_0;
        if type(l_l_Footer_0_0) == "string" and string.find(l_l_Footer_0_0, "Roblox Terms of Use", 1, true) then
            l_l_Footer_0_0 = string.gsub(l_l_Footer_0_0, "Roblox Terms of Use", "<u>Roblox Terms of Use</u>", 1);
        end;
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            Pad = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 12)
            }), 
            Note = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Text = l_l_Footer_0_0, 
                RichText = true, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextSize = math.floor(v20.Font.CaptionHeader.RelativeSize * v20.Font.BaseSize), 
                Font = v20.Font.CaptionHeader.Font, 
                TextColor3 = v20.Theme.TextMuted.Color, 
                TextTransparency = v20.Theme.TextMuted.Transparency, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 1, 
                Selectable = false
            })
        });
    end, {
        v20, 
        l_Footer_0
    });
    return v2.createElement(l_InteractiveAlert_0, {
        title = l_Title_0, 
        onCloseClicked = v37, 
        buttonStackInfo = v64, 
        isMiddleContentFocusable = true, 
        middleContent = v63, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = v19, 
        defaultChildRef = if v22 then v29 else nil, 
        isRoactGamepadEnabled = v22, 
        footerContent = v67
    });
end));