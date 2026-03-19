local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_ExperienceAuthService_0 = game:GetService("ExperienceAuthService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local v7 = require(l_CorePackages_0.Packages.Signals);
local v8 = require(l_CorePackages_0.Workspace.Packages.Display);
local v9 = require(l_CorePackages_0.Packages.Roact);
local v10 = require(l_CorePackages_0.Packages.RoactRodux);
local v11 = require(l_CorePackages_0.Packages.t);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v13 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v14 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v14.Style.withStyle;
local l_FullPageModal_0 = v14.App.Dialog.Modal.FullPageModal;
local l_Overlay_0 = v14.App.Dialog.Overlay;
local l_ButtonType_0 = v14.App.Button.Enum.ButtonType;
local l_GamepadUtils_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).Gamepad.GamepadUtils;
local l_MouseIconOverrideService_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v22 = require(l_CorePackages_0.Workspace.Packages.InputType);
local l_getInputGroup_0 = require(l_CorePackages_0.Workspace.Packages.InputType).getInputGroup;
local l_Parent_0 = script.Parent;
local v25 = require(l_Parent_0.Common.LabeledTextBox);
local v26 = require(script.Parent.Parent.Actions.CloseOpenPrompt);
local v27 = require(script.Parent.Parent.Actions.SetPromptVisibility);
local v28 = require(script.Parent.LeaveCreationAlert);
local v29 = require(script.Parent.Parent.Constants);
local v30 = require(l_RobloxGui_0.Modules.TopBar.Constants);
local v31 = require(l_Parent_0.Common.PreviewViewport);
local v32 = require(l_Parent_0.ValidationErrorModal);
local l_PublishAssetAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePrompt).PublishAssetAnalytics;
local v34 = v9.PureComponent:extend("BasePublishPrompt");
local v35 = UDim.new(1.5, 0);
local function _(v36) --[[ Line: 69 ]] --[[ Name: isGamepadInput ]]
    -- upvalues: l_getInputGroup_0 (copy), v22 (copy)
    return l_getInputGroup_0(v36) == v22.InputTypeConstants.Gamepad;
end;
v34.validateProps = v11.strictInterface({
    screenSize = v11.Vector2, 
    nameLabel = v11.string, 
    defaultName = v11.string, 
    promptBody = v11.any, 
    titleText = v11.string, 
    showingPreviewView = v11.boolean, 
    closePreviewView = v11.callback, 
    asset = v11.optional(v11.union(v11.instanceOf("Model"), v11.instanceIsA("AnimationClip"))), 
    onNameUpdated = v11.callback, 
    canSubmit = v11.callback, 
    onSubmit = v11.callback, 
    enableInputDelayed = v11.optional(v11.boolean), 
    isDelayedInput = v11.optional(v11.boolean), 
    delayInputSeconds = v11.optional(v11.number), 
    priceInRobux = v11.optional(v11.number), 
    showTopScrim = v11.optional(v11.boolean), 
    guid = v11.any, 
    scopes = v11.any, 
    errorMessage = v11.optional(v11.string), 
    promptVisible = v11.optional(v11.boolean), 
    closePrompt = v11.callback, 
    SetPromptVisibility = v11.callback
});
v34.init = function(v38) --[[ Line: 107 ]] --[[ Name: init ]]
    -- upvalues: v9 (copy), v7 (copy), v8 (copy), l_UserInputService_0 (copy), l_getInputGroup_0 (copy), v22 (copy), l_PublishAssetAnalytics_0 (copy), l_ExperienceAuthService_0 (copy)
    v38.swipeScrollingFrameRef = v9.createRef();
    v38.inputState = nil;
    v38.inputObject = nil;
    v38.connection = nil;
    v38.disposeUiScaleEffect = v7.createEffect(function(v39) --[[ Line: 112 ]]
        -- upvalues: v8 (ref), v38 (copy)
        local v40 = v8.GetDisplayStore(v39);
        v38:setState({
            UiScale = v40.getUIScale(v39)
        });
    end);
    v38.storeInput = function(_, v42, v43) --[[ Line: 119 ]]
        -- upvalues: v38 (copy)
        v38.inputState = v42;
        v38.inputObject = v43;
        return Enum.ContextActionResult.Sink;
    end;
    local v44 = {
        showUnsavedDataWarning = false
    };
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    v44.isGamepad = l_getInputGroup_0(l_l_UserInputService_0_LastInputType_0) == v22.InputTypeConstants.Gamepad;
    v38:setState(v44);
    v38.closePrompt = function() --[[ Line: 133 ]]
        -- upvalues: v38 (copy)
        v38.props.closePrompt();
        v38.props.SetPromptVisibility(false);
    end;
    v38.showUnsavedDataWarning = function() --[[ Line: 138 ]]
        -- upvalues: v38 (copy), l_PublishAssetAnalytics_0 (ref)
        v38:setState({
            showUnsavedDataWarning = true
        });
        l_PublishAssetAnalytics_0.sendButtonClicked(l_PublishAssetAnalytics_0.Section.BuyCreationPage, l_PublishAssetAnalytics_0.Element.X);
    end;
    v38.cancelClosePrompt = function() --[[ Line: 146 ]]
        -- upvalues: v38 (copy)
        v38:setState({
            showUnsavedDataWarning = false
        });
    end;
    v38.denyAndClose = function() --[[ Line: 152 ]]
        -- upvalues: l_ExperienceAuthService_0 (ref), v38 (copy)
        l_ExperienceAuthService_0:ScopeCheckUIComplete(v38.props.guid, v38.props.scopes, Enum.ScopeCheckResult.ConsentDenied, {});
        v38.closePrompt();
    end;
    v38.confirmAndUpload = function() --[[ Line: 163 ]]
        -- upvalues: v38 (copy)
        if v38.props.canSubmit() then
            v38.props.onSubmit();
        end;
    end;
end;
v34.setUpGamepad = function(v46) --[[ Line: 170 ]] --[[ Name: setUpGamepad ]]
    -- upvalues: l_UserInputService_0 (copy), l_ContextActionService_0 (copy), l_RunService_0 (copy), l_GamepadUtils_0 (copy), v35 (copy)
    if l_UserInputService_0.GamepadEnabled then
        l_ContextActionService_0:UnbindCoreAction("ScrollPrompt");
        l_ContextActionService_0:BindCoreAction("ScrollPrompt", v46.storeInput, false, Enum.KeyCode.Thumbstick2);
        v46.connection = l_RunService_0.RenderStepped:Connect(function(v47) --[[ Line: 174 ]]
            -- upvalues: v46 (copy), l_GamepadUtils_0 (ref), v35 (ref)
            if v46.inputState == Enum.UserInputState.Change and v46.inputObject then
                local l_Position_0 = v46.inputObject.Position;
                local l_current_0 = v46.swipeScrollingFrameRef.current;
                local v50 = l_current_0.CanvasPosition.Y + v47 * -l_GamepadUtils_0.normalizeStickByDeadzone(l_Position_0).Y * 1000;
                if v50 <= l_current_0.AbsoluteSize.Y * v35.Scale + v35.Offset then
                    l_current_0.CanvasPosition = Vector2.new(0, v50);
                end;
            end;
        end);
        l_ContextActionService_0:UnbindCoreAction("ClosePrompt");
        l_ContextActionService_0:BindCoreAction("ClosePrompt", v46.storeInput, false, Enum.KeyCode.ButtonB);
    end;
end;
v34.cleanupGamepad = function(v51) --[[ Line: 194 ]] --[[ Name: cleanupGamepad ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("ClosePrompt");
    l_ContextActionService_0:UnbindCoreAction("ScrollPrompt");
    if v51.connection then
        v51.connection:Disconnect();
    end;
end;
v34.overrideMouseIconBehavior = function(v52) --[[ Line: 202 ]] --[[ Name: overrideMouseIconBehavior ]]
    -- upvalues: l_MouseIconOverrideService_0 (copy)
    local v53 = if v52.state.isGamepad then Enum.OverrideMouseIconBehavior.ForceHide else Enum.OverrideMouseIconBehavior.ForceShow;
    l_MouseIconOverrideService_0.push("BasePublishPromptOverrideKey", v53);
end;
v34.removeMouseIconBehaviorOverride = function(_) --[[ Line: 210 ]] --[[ Name: removeMouseIconBehaviorOverride ]]
    -- upvalues: l_MouseIconOverrideService_0 (copy)
    l_MouseIconOverrideService_0.pop("BasePublishPromptOverrideKey");
end;
v34.didMount = function(v55) --[[ Line: 214 ]] --[[ Name: didMount ]]
    v55:setUpGamepad();
    v55.props.SetPromptVisibility(true);
    v55:overrideMouseIconBehavior();
end;
v34.didUpdate = function(v56, v57, v58) --[[ Line: 223 ]] --[[ Name: didUpdate ]]
    if v57.promptVisible ~= v56.props.promptVisible and v56.props.promptVisible == false then
        v56.closePrompt();
    end;
    if v56.state.isGamepad ~= v58.isGamepad then
        v56:overrideMouseIconBehavior();
    end;
end;
v34.renderMiddle = function(v59, v60) --[[ Line: 237 ]] --[[ Name: renderMiddle ]]
    -- upvalues: l_withStyle_0 (copy), v9 (copy), v29 (copy), v25 (copy)
    return l_withStyle_0(function(v61) --[[ Line: 238 ]]
        -- upvalues: v9 (ref), v59 (copy), v29 (ref), v25 (ref), v60 (copy)
        local l_Font_0 = v61.Font;
        local l_BaseSize_0 = l_Font_0.BaseSize;
        local l_Theme_0 = v61.Theme;
        local l_Footer_0 = l_Font_0.Footer;
        local l_Color_0 = l_Theme_0.TextDefault.Color;
        return v9.createFragment({
            ScrollingFrame = v9.createElement("ScrollingFrame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, -50), 
                CanvasSize = UDim2.new(1, 0, 0, 0), 
                ScrollBarThickness = 0, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                Selectable = false, 
                [v9.Ref] = v59.swipeScrollingFrameRef
            }, {
                layout = v9.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                padding = v9.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v29.PromptSidePadding), 
                    PaddingRight = UDim.new(0, v29.PromptSidePadding)
                }), 
                NameInput = v9.createElement(v25, {
                    LayoutOrder = 1, 
                    labelText = v59.props.nameLabel, 
                    topPadding = 24, 
                    defaultText = v59.props.defaultName, 
                    onTextUpdated = v59.props.onNameUpdated, 
                    textBoxHeight = 30
                }), 
                PromptBody = v9.createElement("Frame", {
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }, v59.props.promptBody)
            }), 
            BottomGradient = v9.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 5), 
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.new(0, 0, 1, -50), 
                BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                ZIndex = 2
            }, {
                gradient = v9.createElement("UIGradient", {
                    Rotation = 270, 
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, l_Theme_0.BackgroundUIDefault.Color), 
                        ColorSequenceKeypoint.new(1, l_Theme_0.BackgroundUIDefault.Color)
                    }), 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, l_Theme_0.BackgroundUIDefault.Transparency), 
                        NumberSequenceKeypoint.new(0.5, l_Theme_0.BackgroundUIDefault.Transparency), 
                        NumberSequenceKeypoint.new(1, 1)
                    })
                })
            }), 
            DisclaimerContainer = v9.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 50), 
                Position = UDim2.new(0, 0, 1, -50)
            }, {
                padding = v9.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v29.PromptSidePadding), 
                    PaddingRight = UDim.new(0, v29.PromptSidePadding)
                }), 
                Disclaimer = v9.createElement("TextLabel", {
                    Size = UDim2.fromScale(1, 1), 
                    Text = v60.disclaimer, 
                    Font = l_Footer_0.Font, 
                    TextSize = l_BaseSize_0 * l_Footer_0.RelativeSize, 
                    TextColor3 = l_Color_0, 
                    BackgroundTransparency = 1, 
                    TextWrapped = true
                })
            })
        });
    end);
end;
v34.renderAlertLocalized = function(v67, v68) --[[ Line: 329 ]] --[[ Name: renderAlertLocalized ]]
    -- upvalues: l_GuiService_0 (copy), v30 (copy), l_withStyle_0 (copy), v9 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), l_getInputGroup_0 (copy), v22 (copy), l_Overlay_0 (copy), l_FullPageModal_0 (copy), l_ButtonType_0 (copy), v28 (copy), v32 (copy), v31 (copy)
    local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
    local v71 = UDim2.new(0, 0, 0, -l_l_GuiService_0_GuiInset_0.Y);
    local v72 = UDim2.new(1, 0, 1, l_l_GuiService_0_GuiInset_0.Y);
    local v73 = v30.TopBarHeight * v67.state.UiScale;
    return l_withStyle_0(function(v74) --[[ Line: 335 ]]
        -- upvalues: v67 (copy), v68 (copy), v9 (ref), l_ExternalEventConnection_0 (ref), l_UserInputService_0 (ref), l_getInputGroup_0 (ref), v22 (ref), v71 (copy), v72 (copy), l_Overlay_0 (ref), v73 (copy), l_FullPageModal_0 (ref), l_ButtonType_0 (ref), v28 (ref), v32 (ref), v31 (ref)
        local l_Theme_1 = v74.Theme;
        local v76 = if v67.props.priceInRobux and v67.props.priceInRobux > 0 then string.format("%s %i", "\238\128\130", v67.props.priceInRobux) else v68.submit;
        return v9.createFragment({
            LastInputTypeConnection = v9.createElement(l_ExternalEventConnection_0, {
                event = l_UserInputService_0.LastInputTypeChanged, 
                callback = function(v77) --[[ Line: 345 ]] --[[ Name: callback ]]
                    -- upvalues: v67 (ref), l_getInputGroup_0 (ref), v22 (ref)
                    v67:setState({
                        isGamepad = l_getInputGroup_0(v77) == v22.InputTypeConstants.Gamepad
                    });
                end
            }), 
            BottomScrim = v9.createElement("Frame", {
                Position = v71, 
                Size = v72, 
                ZIndex = -1, 
                BackgroundTransparency = 1
            }, {
                Overlay = v9.createElement(l_Overlay_0, {
                    showGradient = false
                }), 
                InputSink = v9.createElement("TextButton", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    Text = "", 
                    Modal = true
                })
            }), 
            PublishPrompt = v9.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, -v73), 
                Position = UDim2.fromOffset(0, v73), 
                Visible = not v67.state.showUnsavedDataWarning and not v67.props.showingPreviewView and not v67.props.showTopScrim
            }, {
                FullPageModal = v9.createElement(l_FullPageModal_0, {
                    title = v67.props.titleText, 
                    onCloseClicked = v67.showUnsavedDataWarning, 
                    distanceFromTop = 4, 
                    marginSize = 0, 
                    screenSize = v67.props.screenSize, 
                    buttonStackProps = {
                        buttons = {
                            {
                                buttonType = l_ButtonType_0.PrimarySystem, 
                                props = {
                                    isDisabled = not v67.props.canSubmit(), 
                                    isDelayedInput = v67.props.isDelayedInput, 
                                    enableInputDelayed = v67.props.enableInputDelayed, 
                                    delayInputSeconds = v67.props.delayInputSeconds, 
                                    onActivated = v67.confirmAndUpload, 
                                    text = v76, 
                                    isLoading = not v67.props.priceInRobux
                                }
                            }
                        }, 
                        disableRoactGamepadButtonSelection = true
                    }
                }, {
                    middleContent = v67:renderMiddle(v68)
                })
            }), 
            LeaveCreationAlert = if v67.state.showUnsavedDataWarning then v9.createElement(v28, {
                screenSize = v67.props.screenSize, 
                closePrompt = v67.denyAndClose, 
                cancelClosePrompt = v67.cancelClosePrompt
            }) else nil, 
            ValidationErrorAlert = if v67.props.errorMessage then v9.createElement(v32, {
                screenSize = v67.props.screenSize, 
                closePrompt = v67.closePrompt
            }) else nil, 
            PreviewFrame = v67.props.showingPreviewView and v9.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = l_Theme_1.BackgroundUIDefault.Color, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundTransparency = l_Theme_1.BackgroundUIDefault.Transparency
            }, {
                PreviewViewport = v9.createElement(v31, {
                    asset = v67.props.asset, 
                    closePreviewView = v67.props.closePreviewView
                })
            }) or nil, 
            TopScrim = v9.createElement("Frame", {
                Position = v71, 
                Size = v72, 
                ZIndex = 2, 
                BackgroundTransparency = 1, 
                Visible = v67.props.showTopScrim
            }, {
                InputSink = v9.createElement("TextButton", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    Text = ""
                })
            })
        });
    end);
end;
local function _() --[[ Line: 450 ]] --[[ Name: GetLocalizedStrings ]]
    -- upvalues: v13 (copy)
    return {
        submit = v13:FormatByKey("CoreScripts.PublishAssetPrompt.Submit"), 
        disclaimer = v13:FormatByKey("CoreScripts.PublishCommon.Disclaimer")
    };
end;
v34.render = function(v79) --[[ Line: 458 ]] --[[ Name: render ]]
    -- upvalues: v13 (copy)
    return v79:renderAlertLocalized({
        submit = v13:FormatByKey("CoreScripts.PublishAssetPrompt.Submit"), 
        disclaimer = v13:FormatByKey("CoreScripts.PublishCommon.Disclaimer")
    });
end;
v34.willUnmount = function(v80) --[[ Line: 463 ]] --[[ Name: willUnmount ]]
    v80:removeMouseIconBehaviorOverride();
    v80:cleanupGamepad();
    if v80.disposeUiScaleEffect then
        v80.disposeUiScaleEffect();
    end;
    v80.props.SetPromptVisibility(false);
end;
return v10.connect(function(v81) --[[ Line: 476 ]] --[[ Name: mapStateToProps ]]
    return {
        guid = v81.promptRequest.promptInfo.guid, 
        scopes = v81.promptRequest.promptInfo.scopes, 
        errorMessage = v81.promptRequest.promptInfo.errorMessage, 
        promptVisible = v81.promptRequest.promptInfo.promptVisible
    };
end, function(v82) --[[ Line: 485 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v26 (copy), v27 (copy)
    return {
        closePrompt = function() --[[ Line: 487 ]] --[[ Name: closePrompt ]]
            -- upvalues: v82 (copy), v26 (ref)
            return v82(v26());
        end, 
        SetPromptVisibility = function(v83) --[[ Line: 490 ]] --[[ Name: SetPromptVisibility ]]
            -- upvalues: v82 (copy), v27 (ref)
            return v82(v27(v83));
        end
    };
end)(v34);