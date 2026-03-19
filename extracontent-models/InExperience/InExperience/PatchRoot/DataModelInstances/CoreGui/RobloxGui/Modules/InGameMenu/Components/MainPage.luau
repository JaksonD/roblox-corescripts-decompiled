local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_VRService_0 = game:GetService("VRService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GetFFlagUIBloxUseFoundationButton_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).UIBlox.GetFFlagUIBloxUseFoundationButton;
local v10 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v10.Roact;
local l_RoactRodux_0 = v10.RoactRodux;
local l_UIBlox_0 = v10.UIBlox;
local l_t_0 = v10.t;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_ContextualMenu_0 = l_UIBlox_0.App.Menu.ContextualMenu;
local l_MenuDirection_0 = l_UIBlox_0.App.Menu.MenuDirection;
local l_KeyLabel_0 = l_UIBlox_0.App.Menu.KeyLabel;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_Parent_0 = script.Parent.Parent;
local v22 = require(l_Parent_0.Localization.withLocalization);
local v23 = require(l_Parent_0.Actions.SetRespawning);
local v24 = require(l_Parent_0.Thunks.CloseMenu);
local v25 = require(l_Parent_0.Resources.Assets);
local v26 = require(l_Parent_0.Actions.SetCurrentPage);
local v27 = require(l_RobloxGui_0.Modules.VoiceChat.Components.VoiceIndicator);
local v28 = require(l_Parent_0.Resources.Constants);
local v29 = require(l_Parent_0.Enums.Direction);
local v30 = require(script.Parent.PageNavigation);
local v31 = require(script.Parent.GameIconHeader);
local v32 = require(script.Parent.ZonePortal);
local l_Flags_0 = l_Parent_0.Flags;
local v34 = game:DefineFastFlag("TakeAScreenshotOfThis", false);
local v35 = game:DefineFastFlag("ShowContextMenuWhenButtonsArePresent", false);
local v36 = game:DefineFastFlag("UseVRSpecificLeaveButton", false);
local v37 = require(l_Flags_0.GetFFlagIGMGamepadSelectionHistory);
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v39 = require(script.Parent.Connection.FocusHandler);
local v40 = require(script.Parent.IGMMainPageControllerBar);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v42 = {
    [v28.InputType.MouseAndKeyboard] = Enum.KeyCode.R, 
    [v28.InputType.Gamepad] = Enum.KeyCode.ButtonY
};
local v43 = {
    [v28.InputType.MouseAndKeyboard] = Enum.KeyCode.L, 
    [v28.InputType.Gamepad] = Enum.KeyCode.ButtonX
};
local v44 = l_Roact_0.PureComponent:extend("MainPage");
local function _() --[[ Line: 76 ]] --[[ Name: areCapturesAllowed ]]
    -- upvalues: l_VRService_0 (copy), v34 (copy), l_CorePackages_0 (copy)
    if l_VRService_0.VREnabled then
        return false;
    elseif not v34 then
        return true;
    else
        return not require(l_CorePackages_0.Workspace.Packages.CachedPolicyService):IsSubjectToChinaPolicies();
    end;
end;
v44.renderButtonModels = function(v46, _, v48) --[[ Line: 88 ]] --[[ Name: renderButtonModels ]]
    -- upvalues: l_VRService_0 (copy), v34 (copy), l_CorePackages_0 (copy), l_Images_0 (copy), l_RunService_0 (copy), l_CoreGui_0 (copy), v25 (copy), v42 (copy)
    local v49 = {};
    local l_inputType_0 = v46.props.inputType;
    if not l_VRService_0.VREnabled and (not v34 or not require(l_CorePackages_0.Workspace.Packages.CachedPolicyService):IsSubjectToChinaPolicies()) and v34 then
        table.insert(v49, {
            icon = l_Images_0["icons/controls/screenshot"], 
            text = v48.screenCapture, 
            onActivated = function() --[[ Line: 102 ]] --[[ Name: onActivated ]]
                -- upvalues: v46 (copy), l_RunService_0 (ref), l_CoreGui_0 (ref)
                v46:setState({
                    modalOpen = false
                });
                v46.props.closeMenu();
                l_RunService_0.RenderStepped:Wait();
                l_RunService_0.RenderStepped:Wait();
                l_CoreGui_0:TakeScreenshot();
            end
        });
    end;
    if v46.props.respawnButtonVisible then
        table.insert(v49, {
            icon = v25.Images.RespawnIcon, 
            text = v48.respawnCharacter, 
            onActivated = function() --[[ Line: 121 ]] --[[ Name: onActivated ]]
                -- upvalues: v46 (copy)
                v46:setState({
                    modalOpen = false
                });
                v46.props.startRespawning();
            end, 
            keyCodeLabel = v42[l_inputType_0]
        });
    end;
    return v49;
end;
v44.validateProps = l_t_0.strictInterface({
    open = l_t_0.boolean, 
    isMainPageMoreMenuOpen = l_t_0.optional(l_t_0.boolean), 
    respawnButtonVisible = l_t_0.boolean, 
    startLeavingGame = l_t_0.callback, 
    startRespawning = l_t_0.callback, 
    setMainPageMoreMenuOpen = l_t_0.optional(l_t_0.callback), 
    closeMenu = l_t_0.callback, 
    screenSize = l_t_0.Vector2, 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    inputType = l_t_0.optional(l_t_0.string), 
    setFirstItemRef = l_t_0.optional(l_t_0.callback), 
    voiceEnabled = l_t_0.optional(l_t_0.boolean), 
    currentZone = v37() and l_t_0.optional(l_t_0.number) or nil
});
v44.init = function(v51) --[[ Line: 151 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy)
    v51.moreMenuFrameRef = nil;
    v51.moreMenuFirstItemFrameRef = nil;
    v51.moreMenuButtonRef = l_Roact_0.createRef();
    v51.mainPageFirstButtonRef = l_Roact_0.createRef();
    v51.setMoreMenuRef = function(v52) --[[ Line: 157 ]]
        -- upvalues: v51 (copy)
        v51.moreMenuFrameRef = v52;
    end;
    v51.setMoreMenuFirstItemRef = function(v53) --[[ Line: 161 ]]
        -- upvalues: v51 (copy)
        v51.moreMenuFirstItemFrameRef = v53;
    end;
    v51.state = {
        modalOpen = false
    };
end;
v44.getDerivedStateFromProps = function(v54) --[[ Line: 172 ]] --[[ Name: getDerivedStateFromProps ]]
    if not v54.canCaptureFocus then
        return {
            modalOpen = false
        };
    else
        return nil;
    end;
end;
v44.renderMainPageFocusHandler = function(v55) --[[ Line: 181 ]] --[[ Name: renderMainPageFocusHandler ]]
    -- upvalues: v37 (copy), l_Roact_0 (copy), v39 (copy), l_ContextActionService_0 (copy), l_GuiService_0 (copy)
    local v56 = v55.canGamepadCaptureFocus(v55.props);
    local v57 = nil;
    if v37() then
        local l_modalOpen_0 = v55.state.modalOpen;
        v56 = v55.canGamepadCaptureFocus(v55.props) and not l_modalOpen_0;
        v57 = not v55.props.open or v55.props.currentZone == 0;
    end;
    return l_Roact_0.createElement(v39, {
        isFocused = v56, 
        shouldForgetPreviousSelection = v57, 
        didFocus = v37() and function(v59) --[[ Line: 196 ]]
            -- upvalues: l_ContextActionService_0 (ref), v55 (copy), l_GuiService_0 (ref)
            l_ContextActionService_0:BindCoreAction("LeftStickTogglesMoreMenuAction", function(_, v61) --[[ Line: 199 ]]
                -- upvalues: v55 (ref)
                if v61 == Enum.UserInputState.End then
                    v55:setState({
                        modalOpen = true
                    });
                    return Enum.ContextActionResult.Sink;
                else
                    return Enum.ContextActionResult.Pass;
                end;
            end, false, Enum.KeyCode.ButtonL3);
            l_GuiService_0.SelectedCoreObject = v59 or v55.mainPageFirstButtonRef:getValue();
        end or function() --[[ Line: 213 ]]
            -- upvalues: l_ContextActionService_0 (ref), v55 (copy)
            l_ContextActionService_0:BindCoreAction("LeftStickTogglesMoreMenuAction", function(_, v63) --[[ Line: 214 ]]
                -- upvalues: v55 (ref)
                if v63 == Enum.UserInputState.End then
                    v55:setState({
                        modalOpen = not v55.state.modalOpen
                    });
                    return Enum.ContextActionResult.Sink;
                else
                    return Enum.ContextActionResult.Pass;
                end;
            end, false, Enum.KeyCode.ButtonL3);
        end, 
        didBlur = function() --[[ Line: 225 ]] --[[ Name: didBlur ]]
            -- upvalues: l_ContextActionService_0 (ref)
            l_ContextActionService_0:UnbindCoreAction("LeftStickTogglesMoreMenuAction");
        end
    });
end;
v44.renderMoreMenuFocusHandler = function(v64) --[[ Line: 231 ]] --[[ Name: renderMoreMenuFocusHandler ]]
    -- upvalues: l_Roact_0 (copy), v39 (copy), v37 (copy), l_ContextActionService_0 (copy), l_GuiService_0 (copy)
    local v65 = v64.canGamepadCaptureFocus(v64.props);
    local l_modalOpen_1 = v64.state.modalOpen;
    return l_Roact_0.createElement(v39, {
        isFocused = v65 and l_modalOpen_1, 
        didFocus = function() --[[ Line: 238 ]] --[[ Name: didFocus ]]
            -- upvalues: v64 (copy), v37 (ref), l_ContextActionService_0 (ref), l_GuiService_0 (ref)
            local function v69(_, v68) --[[ Line: 239 ]]
                -- upvalues: v64 (ref)
                if v68 == Enum.UserInputState.End then
                    v64:setState({
                        modalOpen = false
                    });
                    return Enum.ContextActionResult.Sink;
                else
                    return Enum.ContextActionResult.Pass;
                end;
            end;
            if v37() then
                l_ContextActionService_0:BindCoreAction("CloseMoreMenuAction", v69, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonL3);
            else
                l_ContextActionService_0:BindCoreAction("CloseMoreMenuAction", v69, false, Enum.KeyCode.ButtonB);
            end;
            if v64.moreMenuFrameRef ~= nil then
                l_GuiService_0:RemoveSelectionGroup("MainPageMoreMenu");
            end;
            l_GuiService_0:AddSelectionParent("MainPageMoreMenu", v64.moreMenuFrameRef);
            l_GuiService_0.SelectedCoreObject = v64.moreMenuFirstItemFrameRef;
        end, 
        didBlur = function() --[[ Line: 274 ]] --[[ Name: didBlur ]]
            -- upvalues: l_ContextActionService_0 (ref)
            l_ContextActionService_0:UnbindCoreAction("CloseMoreMenuAction");
        end
    });
end;
v44.render = function(v70) --[[ Line: 280 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v22 (copy), l_Roact_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v25 (copy), v35 (copy), l_VRService_0 (copy), v36 (copy), v43 (copy), v40 (copy), v27 (copy), l_Players_0 (copy), l_default_0 (copy), v32 (copy), v29 (copy), v31 (copy), v30 (copy), v28 (copy), l_ContextualMenu_0 (copy), l_MenuDirection_0 (copy), l_GetFFlagUIBloxUseFoundationButton_0 (copy), l_KeyLabel_0 (copy)
    local v71 = v70.canGamepadCaptureFocus(v70.props);
    return l_withStyle_0(function(v72) --[[ Line: 283 ]]
        -- upvalues: v22 (ref), l_Roact_0 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), v70 (copy), v25 (ref), v35 (ref), l_VRService_0 (ref), v36 (ref), v43 (ref), v40 (ref), v71 (copy), v27 (ref), l_Players_0 (ref), l_default_0 (ref), v32 (ref), v29 (ref), v31 (ref), v30 (ref), v28 (ref), l_ContextualMenu_0 (ref), l_MenuDirection_0 (ref), l_GetFFlagUIBloxUseFoundationButton_0 (ref), l_KeyLabel_0 (ref)
        return v22({
            leaveGame = "CoreScripts.InGameMenu.LeaveGame", 
            respawnCharacter = "CoreScripts.InGameMenu.RespawnCharacter", 
            screenCapture = "CoreScripts.InGameMenu.Controls.Screenshot"
        })(function(v73) --[[ Line: 288 ]]
            -- upvalues: l_Roact_0 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), v70 (ref), v25 (ref), v72 (copy), v35 (ref), l_VRService_0 (ref), v36 (ref), v43 (ref), v40 (ref), v71 (ref), v27 (ref), l_Players_0 (ref), l_default_0 (ref), v32 (ref), v29 (ref), v31 (ref), v30 (ref), v28 (ref), l_ContextualMenu_0 (ref), l_MenuDirection_0 (ref), l_GetFFlagUIBloxUseFoundationButton_0 (ref), l_KeyLabel_0 (ref)
            local v74 = l_Roact_0.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.Secondary, 
                size = UDim2.fromOffset(44, 44), 
                onActivated = function() --[[ Line: 292 ]] --[[ Name: onActivated ]]
                    -- upvalues: v70 (ref)
                    v70:setState({
                        modalOpen = true
                    });
                end, 
                icon = v25.Images.MoreActions, 
                [l_Roact_0.Ref] = v70.moreMenuButtonRef
            });
            local v75 = v70:renderButtonModels(v72, v73);
            local l_respawnButtonVisible_0 = v70.props.respawnButtonVisible;
            if v35 then
                l_respawnButtonVisible_0 = #v75 > 0;
            end;
            local l_inputType_1 = v70.props.inputType;
            local v78 = if l_VRService_0.VREnabled and v36 then Enum.KeyCode.ButtonX else v43[l_inputType_1];
            local v79 = l_respawnButtonVisible_0 and -56 or 0;
            local l_modalOpen_2 = v70.state.modalOpen;
            local v81 = l_Roact_0.createElement(v40, {
                canCaptureFocus = v71, 
                isMainPageMoreMenuOpen = l_modalOpen_2
            });
            local v82 = nil;
            if v70.props.voiceEnabled then
                v82 = l_Roact_0.createElement(v27, {
                    size = UDim2.fromOffset(44, 44), 
                    userId = tostring(l_Players_0.LocalPlayer.UserId), 
                    iconStyle = "MicLight", 
                    onClicked = function() --[[ Line: 326 ]] --[[ Name: onClicked ]]
                        -- upvalues: l_default_0 (ref)
                        l_default_0:ToggleMic("VRInGameMenuMainPage");
                    end
                });
                v79 = v79 - 56;
            end;
            return l_Roact_0.createElement("TextButton", {
                Size = UDim2.new(0, 400, 1, 0), 
                BackgroundColor3 = v72.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = v72.Theme.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                Visible = v70.props.open, 
                Text = "", 
                AutoButtonColor = false, 
                Selectable = false
            }, {
                MoreMenuFocusHandler = v70:renderMoreMenuFocusHandler(), 
                MainPageFocusHandler = not l_VRService_0.VREnabled and v70:renderMainPageFocusHandler() or nil, 
                ControllerBar = v81, 
                ZonePortal = l_Roact_0.createElement(v32, {
                    targetZone = 0, 
                    direction = v29.Left
                }), 
                GameIconHeader = l_Roact_0.createElement(v31), 
                PageNavigation = l_Roact_0.createElement(v30, {
                    Position = UDim2.new(0, v28.Zone.ContentOffset, 0, 148), 
                    mainPageFirstButtonRef = v70.mainPageFirstButtonRef
                }), 
                ContextualMenu = l_Roact_0.createElement(l_ContextualMenu_0, {
                    buttonProps = v75, 
                    setFrameRef = v70.setMoreMenuRef, 
                    setFirstItemRef = v70.setMoreMenuFirstItemRef, 
                    open = l_modalOpen_2, 
                    menuDirection = l_MenuDirection_0.Up, 
                    openPositionY = UDim.new(1, -84), 
                    closeBackgroundVisible = true, 
                    screenSize = v70.props.screenSize, 
                    onDismiss = function() --[[ Line: 368 ]] --[[ Name: onDismiss ]]
                        -- upvalues: v70 (ref)
                        v70:setState({
                            modalOpen = false
                        });
                    end
                }), 
                BottomButtons = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 84), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 1), 
                    BackgroundTransparency = 1
                }, {
                    Layout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, 12), 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = if l_GetFFlagUIBloxUseFoundationButton_0() then Enum.VerticalAlignment.Top else Enum.VerticalAlignment.Center
                    }), 
                    Padding = l_Roact_0.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 24), 
                        PaddingBottom = UDim.new(0, 24), 
                        PaddingLeft = UDim.new(0, 24), 
                        PaddingRight = UDim.new(0, 24)
                    }), 
                    LeaveGame = l_Roact_0.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, v79, 0, 44), 
                        Position = UDim2.fromScale(1, 0), 
                        AnchorPoint = Vector2.new(1, 0), 
                        LayoutOrder = 1
                    }, {
                        Button = l_Roact_0.createElement(l_Button_0, {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            size = if l_GetFFlagUIBloxUseFoundationButton_0() then UDim2.new(1, 0, 0, 44) else UDim2.fromScale(1, 1), 
                            onActivated = v70.props.startLeavingGame, 
                            text = v73.leaveGame
                        }), 
                        KeyLabel = v78 and l_Roact_0.createElement(l_KeyLabel_0, {
                            keyCode = v78, 
                            iconThemeKey = "UIDefault", 
                            textThemeKey = "SystemPrimaryContent", 
                            AnchorPoint = Vector2.new(1, 0.5), 
                            Position = UDim2.new(1, -16, 0.5, 0), 
                            LayoutOrder = 2, 
                            ZIndex = 2
                        }) or nil
                    }), 
                    VoiceChatMuteButton = v82, 
                    MoreButton = l_respawnButtonVisible_0 and v74
                })
            });
        end);
    end);
end;
v44.willUnmount = function(_) --[[ Line: 428 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_GuiService_0 (copy)
    l_GuiService_0:RemoveSelectionGroup("MainPageMoreMenu");
end;
v44.canGamepadCaptureFocus = function(v84) --[[ Line: 432 ]] --[[ Name: canGamepadCaptureFocus ]]
    -- upvalues: v28 (copy)
    return v84.canCaptureFocus and v84.inputType == v28.InputType.Gamepad;
end;
v44.didUpdate = function(v85, v86, v87) --[[ Line: 436 ]] --[[ Name: didUpdate ]]
    -- upvalues: v37 (copy), l_GuiService_0 (copy), l_VRService_0 (copy), l_UserInputService_0 (copy)
    local l_modalOpen_3 = v85.state.modalOpen;
    local l_modalOpen_4 = v87.modalOpen;
    if not v37() and v85.canGamepadCaptureFocus(v85.props) and not l_modalOpen_3 then
        if l_modalOpen_4 then
            l_GuiService_0.SelectedCoreObject = v85.moreMenuButtonRef:getValue();
        elseif not v85.canGamepadCaptureFocus(v86) then
            l_GuiService_0.SelectedCoreObject = v85.mainPageFirstButtonRef:getValue();
        end;
    end;
    if l_VRService_0.VREnabled then
        l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide;
    end;
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v90, _) --[[ Line: 456 ]]
    -- upvalues: v37 (copy), v28 (copy)
    local v92 = nil;
    if v37() then
        v92 = v90.currentZone;
    end;
    local v93 = false;
    if v90.menuPage == v28.MainPagePageKey then
        v93 = v90.isMenuOpen and not v90.respawn.dialogOpen and v90.currentZone == 1;
    end;
    return {
        open = v90.isMenuOpen, 
        respawnButtonVisible = v90.respawn.enabled, 
        screenSize = v90.screenSize, 
        voiceEnabled = v90.voiceState.voiceEnabled, 
        canCaptureFocus = v93, 
        currentZone = v92, 
        inputType = v90.displayOptions.inputType, 
        isMainPageInForeground = nil
    };
end, function(v94) --[[ Line: 479 ]]
    -- upvalues: v26 (copy), v28 (copy), v23 (copy), v24 (copy)
    return {
        startLeavingGame = function() --[[ Line: 481 ]] --[[ Name: startLeavingGame ]]
            -- upvalues: v94 (copy), v26 (ref), v28 (ref)
            v94(v26(v28.LeaveGamePromptPageKey));
        end, 
        startRespawning = function() --[[ Line: 484 ]] --[[ Name: startRespawning ]]
            -- upvalues: v94 (copy), v23 (ref)
            v94(v23(true));
        end, 
        closeMenu = function() --[[ Line: 487 ]] --[[ Name: closeMenu ]]
            -- upvalues: v94 (copy), v24 (ref)
            v94(v24);
        end
    };
end)(v44);