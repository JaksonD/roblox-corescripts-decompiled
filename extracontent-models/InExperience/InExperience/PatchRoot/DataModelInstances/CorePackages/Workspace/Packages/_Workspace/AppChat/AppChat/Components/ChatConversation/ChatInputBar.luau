local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_script_FirstAncestor_0.SocialLibraries);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Foundation);
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local v7 = require(l_Parent_0.UIBlox);
local v8 = require(l_Parent_0.BuilderIcons);
local l_useStyle_0 = v7.Core.Style.useStyle;
local v10 = require(l_script_FirstAncestor_0.Components.ChatConversation.Utils.isKeyCodePressed);
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local v12 = require(l_Parent_0.Cryo);
local v13 = require(l_Parent_0.ReactFocusNavigation);
local l_FocusNavigationEventNameEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigationEventNameEnum;
local l_CallbackInputBox_0 = v3.Components.CallbackInputBox;
local v16 = require(script.Parent.ChatInputBoxDisabled);
local v17 = require(script.Parent.isMessageValid);
local v18 = require(script.Parent.Hooks.useKeystrokeCollection);
local v19 = require(script.Parent.Hooks.useInputConnections);
local v20 = require(l_script_FirstAncestor_0.Contexts.ChatPagePadding.useChatPagePadding);
local l_useIsSpatial_0 = require(l_Parent_0.Responsive).useIsSpatial;
local v22 = require(l_script_FirstAncestor_0.Analytics.Enums.SendButtonClickActionResult);
local _ = require(l_script_FirstAncestor_0.types);
local l_getFFlagAppChatEnableIntervention_0 = require(l_Parent_0.InterventionShared).Flags.getFFlagAppChatEnableIntervention;
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local v26 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatReplyComposeBarContainer);
local l_FFlagIsSquadEnabledAMP_0 = require(l_Parent_0.SharedFlags).FFlagIsSquadEnabledAMP;
local v33 = {
    userInputService = l_UserInputService_0, 
    initialInputText = "", 
    placeholderText = "Write a message", 
    inputBarDisabledText = "Chat Disabled", 
    inputBarRef = nil, 
    inputBoxRef = nil, 
    onDisabledInputBarActivated = function() --[[ Line: 67 ]] --[[ Name: onDisabledInputBarActivated ]]

    end, 
    LayoutOrder = 0, 
    maxCharacterLength = 160, 
    maxKeystrokeDataLength = 200, 
    messageListRef = nil, 
    onHeightChanged = function(_) --[[ Line: 72 ]] --[[ Name: onHeightChanged ]]

    end, 
    onPositionChanged = function(_) --[[ Line: 73 ]] --[[ Name: onPositionChanged ]]

    end, 
    onFocusLost = function() --[[ Line: 74 ]] --[[ Name: onFocusLost ]]

    end, 
    isDisabled = false, 
    disabledEndTimestampDisplay = nil, 
    onSendBtnClicked = function(_) --[[ Line: 77 ]] --[[ Name: onSendBtnClicked ]]

    end, 
    onSendChat = function(_) --[[ Line: 78 ]] --[[ Name: onSendChat ]]

    end, 
    onTextChanged = function(_) --[[ Line: 79 ]] --[[ Name: onTextChanged ]]

    end, 
    eventLoggingFunc = l_default_0.logRobloxTelemetryEvent, 
    textChangedFallback = false, 
    moreMenuEnabled = not l_FFlagIsSquadEnabledAMP_0 and nil
};
local function v38(v34, v35, v36, v37) --[[ Line: 89 ]] --[[ Name: heightOfNLines ]]
    -- upvalues: l_Text_0 (copy)
    return l_Text_0.GetTextHeight(string.rep("A\n", v34 - 1), v35, v36, v37);
end;
return v4.memo(function(v39) --[[ Line: 93 ]] --[[ Name: ChatInputBar ]]
    -- upvalues: v12 (copy), v33 (copy), v4 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v13 (copy), l_FocusNavigationEventNameEnum_0 (copy), l_UserInputService_0 (copy), v20 (copy), v5 (copy), l_useStyle_0 (copy), v38 (copy), v18 (copy), v17 (copy), l_Text_0 (copy), v22 (copy), v10 (copy), v19 (copy), v26 (copy), l_FFlagIsSquadEnabledAMP_0 (copy), l_useIsSpatial_0 (copy), l_getFFlagAppChatEnableIntervention_0 (copy), v16 (copy), l_CallbackInputBox_0 (copy), v8 (copy)
    local v40 = v12.Dictionary.union(v33, v39);
    local v41, v42 = v4.useState(0);
    local v43, v44 = v4.useState(0);
    local v45, v46 = v4.useState(false);
    local v47 = v4.useRef(nil);
    if v40.inputBoxRef then
        v47 = v40.inputBoxRef;
    end;
    local v48 = v4.useRef(nil);
    local v49 = v4.useRef(nil);
    if l_FFlagEnableAppChatFocusableFixes_0 and v40.inputBarRef then
        v48 = v40.inputBarRef;
    end;
    local v50 = v4.useRef(Enum.KeyCode.Unknown);
    local v52 = if l_FFlagEnableAppChatFocusableFixes_0 then v13.useEventHandler(l_FocusNavigationEventNameEnum_0.NavigateBack, function(v51) --[[ Line: 111 ]]
        -- upvalues: v50 (copy)
        if v51.eventData and v50.current == v51.eventData.KeyCode then
            v51:cancel();
            v50.current = Enum.KeyCode.Unknown;
        end;
    end, "Bubble", v48) else v48;
    local v53 = v4.useRef(v40.initialInputText or "");
    local v54 = v4.useRef(false);
    local v55 = v4.useRef(v40.textChangedFallback or not l_UserInputService_0.KeyboardEnabled);
    local v56, v57 = v4.useBinding(v53.current ~= "");
    v20();
    local v58 = v5.Hooks.useTokens();
    local v59 = l_useStyle_0();
    local l_Font_0 = v59.Font.Body.Font;
    local v61 = v59.Font.BaseSize * v59.Font.Body.RelativeSize;
    local v62 = v4.useMemo(function() --[[ Line: 130 ]]
        -- upvalues: v38 (ref), l_Font_0 (copy), v61 (copy), v41 (copy)
        return v38(4, l_Font_0, v61, v41);
    end, {
        l_Font_0, 
        v61, 
        v41
    });
    local v63 = v4.useMemo(function() --[[ Line: 133 ]]
        -- upvalues: v38 (ref), l_Font_0 (copy), v61 (copy)
        return v38(1, l_Font_0, v61);
    end, {
        l_Font_0, 
        v61
    });
    local v64 = v18({
        eventLoggingFunc = v40.eventLoggingFunc, 
        maxKeystrokeDataLength = v40.maxKeystrokeDataLength
    });
    local v65 = v4.useCallback(function() --[[ Line: 142 ]]
        -- upvalues: v53 (copy), v17 (ref), v40 (copy)
        return v53.current and v17(v53.current, v40.maxCharacterLength);
    end, {
        v40.maxCharacterLength
    });
    local v66 = nil;
    if l_FFlagEnableAppChatFocusableFixes_0 then
        v66 = v4.useContext(v13.FocusNavigationContext);
    end;
    local v71 = v4.useCallback(function() --[[ Line: 151 ]]
        -- upvalues: v53 (copy), v47 (ref), l_Text_0 (ref), v22 (ref), v65 (copy), v17 (ref), v40 (copy), l_FFlagEnableAppChatFocusableFixes_0 (ref), v66 (ref), v49 (copy), v48 (ref), v57 (copy), v64 (copy)
        local l_current_0 = v53.current;
        if v47.current then
            l_current_0 = v47.current.Text or "";
        end;
        local v68 = l_Text_0.Trim(l_current_0);
        local l_None_0 = v22.None;
        if v65() and v17(v68, v40.maxCharacterLength) then
            if v47.current then
                v47.current.Text = "";
            end;
            if l_FFlagEnableAppChatFocusableFixes_0 and v66 and v66.focusedGuiObject:getValue() == v49.current then
                v66:focusGuiObject(v48.current, false);
            end;
            v53.current = "";
            v57(false);
            if v68 == "/shrug" then
                v40.onSendChat("\194\175\\_(\227\131\132)_/\194\175");
            else
                v40.onSendChat(v68);
            end;
            l_None_0 = v22.WillSend;
            local v70 = v40.messageListRef and v40.messageListRef.current and v40.messageListRef.current._listRef;
            if v70 then
                v70:scrollToOffset({
                    offset = 0
                });
            end;
        else
            l_None_0 = if not v65() then v22.ButtonInactive else v22.MessageInvalid;
        end;
        v40.onSendBtnClicked(l_None_0);
        v64.sendKeystrokeEventOnSend();
    end, {
        v65, 
        v40.onSendChat, 
        v40.onSendBtnClicked, 
        v64.sendKeystrokeEventOnSend, 
        v66
    });
    local v74 = v4.useCallback(function(v72, _) --[[ Line: 215 ]]
        -- upvalues: v64 (copy), v55 (copy)
        if v64 and not v55.current and v72.UserInputType == Enum.UserInputType.Keyboard then
            v64.recordKeystroke(false, v72.KeyCode);
        end;
    end, {
        v64.recordKeystroke
    });
    local v77 = v4.useCallback(function(v75, _) --[[ Line: 226 ]]
        -- upvalues: v64 (copy), v55 (copy), v10 (ref), v40 (copy), v71 (copy)
        if v64 and not v55.current and v75.UserInputType == Enum.UserInputType.Keyboard then
            v64.recordKeystroke(true, v75.KeyCode);
        end;
        if v10({
            v75
        }, Enum.KeyCode.Return, Enum.KeyCode.KeypadEnter) and not v10(v40.userInputService:GetKeysPressed(), Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift) then
            v71();
        end;
    end, {
        v40.userInputService, 
        v64.recordKeystroke, 
        v64.sendKeystrokeEventOnSend, 
        v71
    });
    local v78 = v19({
        userInputService = v40.userInputService, 
        onInputBegan = v77, 
        onInputEnded = v74, 
        onFocusLost = v40.onFocusLost
    });
    local v83 = v4.useCallback(function(v79, v80) --[[ Line: 261 ]]
        -- upvalues: l_Text_0 (ref), l_Font_0 (copy), v61 (copy), v62 (copy), v26 (ref), v58 (copy), v40 (copy)
        local v81 = l_Text_0.GetTextHeight(v79, l_Font_0, v61, v80);
        local v82 = v61 + math.min(v81, v62) + (v26 and 0 or v58.Padding.Medium * 2);
        if v40.onHeightChanged then
            v40.onHeightChanged(v82);
        end;
        return v82;
    end, {
        v58, 
        v62, 
        v40.onHeightChanged, 
        l_Font_0, 
        v61
    });
    local v86 = v4.useCallback(function(v84) --[[ Line: 277 ]]
        -- upvalues: v54 (copy), v53 (copy), v57 (copy), v46 (copy), v65 (copy), v64 (copy), v55 (copy), v83 (copy), v41 (copy), v44 (copy), v40 (copy)
        if not v54.current then
            return;
        else
            v53.current = v84;
            v57(v84 ~= "");
            v46(v65());
            if v64 and v55.current then
                v64.recordTextChange(v84);
            end;
            local v85 = v83(v84, v41);
            v44(v85);
            if v40.onTextChanged then
                v40.onTextChanged(v84);
            end;
            return;
        end;
    end, {
        v64.recordTextChange, 
        v83, 
        v40.onTextChanged, 
        v41
    });
    local v89 = v4.useCallback(function(v87) --[[ Line: 300 ]]
        -- upvalues: v83 (copy), v53 (copy), v42 (copy), v44 (copy)
        local v88 = v83(v53.current, v87.AbsoluteSize.X);
        v42(v87.AbsoluteSize.X);
        v44(v88);
    end, {
        v83
    });
    local v90 = v4.useCallback(function() --[[ Line: 306 ]]
        -- upvalues: v47 (ref)
        if v47.current then
            v47.current:CaptureFocus();
        end;
    end, {});
    v4.useEffect(function() --[[ Line: 312 ]]
        -- upvalues: v54 (copy), v40 (copy)
        v54.current = true;
        return function() --[[ Line: 314 ]]
            -- upvalues: v54 (ref), v40 (ref)
            v54.current = false;
            if v40.onHeightChanged then
                v40.onHeightChanged(0);
            end;
        end;
    end, {
        v40.onHeightChanged
    });
    v4.useEffect(function() --[[ Line: 323 ]]
        -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (ref), v47 (ref), v50 (copy)
        local v91 = nil;
        if l_FFlagEnableAppChatFocusableFixes_0 and v47 and v47.current then
            v47.current.Selectable = false;
            v91 = v47.current.FocusLost:Connect(function(_, v93) --[[ Line: 328 ]]
                -- upvalues: v50 (ref)
                v50.current = if v93 then v93.KeyCode else Enum.KeyCode.Unknown;
            end);
        end;
        return function() --[[ Line: 335 ]]
            -- upvalues: v91 (ref)
            if v91 then
                v91:Disconnect();
            end;
        end;
    end, {});
    local v94 = l_FFlagIsSquadEnabledAMP_0 and v40.moreMenuEnabled or not l_FFlagIsSquadEnabledAMP_0;
    local v95 = l_useIsSpatial_0();
    local v96 = if v43 ~= 0 then v43 else v83(v53.current, v41);
    local v97 = v61 + v63;
    local v98 = l_getFFlagAppChatEnableIntervention_0() and v40.isDisabled;
    return v4.createElement(v5.View, {
        tag = {
            ["padding-y-medium"] = not v26, 
            ["padding-x-xlarge"] = not v94, 
            fill = v94
        }, 
        Size = UDim2.new(v94 and 0 or 1, 0, 0, v96), 
        LayoutOrder = v40.LayoutOrder, 
        onAbsolutePositionChanged = v40.onPositionChanged
    }, {
        inputBar = v4.createElement(v5.View, {
            tag = {
                ["row size-full"] = true, 
                ["stroke-emphasis stroke-thick"] = not v98, 
                ["stroke-alert"] = v98
            }, 
            onActivated = v90, 
            ref = v52, 
            cornerRadius = UDim.new(0, v97 / 2), 
            selection = if l_FFlagEnableAppChatFocusableFixes_0 then {
                Selectable = true
            } else nil, 
            cursor = if l_FFlagEnableAppChatFocusableFixes_0 then {
                radius = UDim.new(0, v97 / 2), 
                offset = 0
            } else nil, 
            LayoutOrder = 1
        }, {
            inputBoxWrapper = v4.createElement(v5.View, {
                tag = "size-0-full fill padding-left-large", 
                padding = {
                    top = UDim.new(0, v61 / 2), 
                    bottom = UDim.new(0, v61 / 2)
                }, 
                LayoutOrder = 1
            }, {
                inputBox = if v98 then v4.createElement(v16, {
                    bodyText = v40.inputBarDisabledText, 
                    font = l_Font_0, 
                    contentSize = v61, 
                    endTimestamp = v40.disabledEndTimestampDisplay, 
                    onActivated = v40.onDisabledInputBarActivated
                }) else v4.createElement(l_CallbackInputBox_0, {
                    initialInputText = v40.initialInputText, 
                    inputTextFont = l_Font_0, 
                    inputTextColor3 = v59.Theme.TextEmphasis.Color, 
                    inputTextSize = v61, 
                    inputTextXAlignment = Enum.TextXAlignment.Left, 
                    inputTextYAlignment = Enum.TextYAlignment.Center, 
                    placeholderText = v40.placeholderText, 
                    placeholderTextColor3 = v59.Theme.TextMuted.Color, 
                    placeholderTextTransparency = v59.Theme.TextMuted.Transparency, 
                    clipsDescendants = false, 
                    multiLine = not v95, 
                    manualFocusRelease = true, 
                    textWrapped = true, 
                    focusChangedCallback = v78.focusChanged, 
                    clearButtonDisabled = true, 
                    clearButtonSize = 0, 
                    textChangedCallback = v86, 
                    [v4.Change.AbsoluteSize] = v89, 
                    inputBoxRef = v47, 
                    returnPressedFromOnScreenKeyboardCallback = if v95 then v71 else nil
                })
            }), 
            sendButtonColumn = v4.createElement(v5.View, {
                tag = "col size-0-full auto-x align-y-bottom", 
                LayoutOrder = 2, 
                Visible = v56
            }, {
                sendButtonWrapper = v4.createElement(v5.View, {
                    tag = "col flex-around padding-small", 
                    Size = UDim2.new(0, v97, 0, v97)
                }, {
                    sendButton = v4.createElement(v5.View, {
                        tag = {
                            ["col radius-circle flex-around"] = true, 
                            ["bg-action-emphasis"] = v45, 
                            ["bg-action-standard"] = not v45
                        }, 
                        Size = UDim2.new(0, v97 - v58.Padding.Small, 0, v97 - v58.Padding.Small), 
                        isDisabled = not v45, 
                        onActivated = v71, 
                        selection = if l_FFlagEnableAppChatFocusableFixes_0 then {
                            Selectable = true, 
                            NextSelectionLeft = v48
                        } else nil, 
                        cursor = if l_FFlagEnableAppChatFocusableFixes_0 then {
                            radius = UDim.new(0, v97 / 2), 
                            offset = v58.Padding.Small / 2
                        } else nil, 
                        ref = v49
                    }, {
                        sendButtonIcon = v4.createElement(v5.Icon, {
                            style = v58.Color.ActionEmphasis.Foreground, 
                            size = v5.Enums.IconSize.Small, 
                            name = v8.Icon.ArrowLargeUp
                        })
                    })
                })
            })
        })
    });
end);