local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.SocialLibraries);
local v3 = require(l_Parent_0.Roact);
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local v5 = require(l_Parent_0.UIBlox);
local l_Images_0 = v5.App.ImageSet.Images;
local l_IconSize_0 = v5.App.Constant.IconSize;
local l_Interactable_0 = v5.Core.Control.Interactable;
local l_withStyle_0 = v5.Style.withStyle;
local v10 = require(script.Parent.isMessageValid);
local v11 = require(l_script_FirstAncestor_0.Components.ChatConversation.Utils.isKeyCodePressed);
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Players_0 = game:GetService("Players");
local v16 = require(l_script_FirstAncestor_0.Contexts.ChatPagePadding.withChatPagePadding);
local l_withSelectionCursorProvider_0 = v5.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local v19 = require(l_Parent_0.ReactFocusNavigation);
local l_FocusNavigationEventNameEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigationEventNameEnum;
local l_CallbackInputBox_0 = v2.Components.CallbackInputBox;
local v22 = require(l_script_FirstAncestor_0.Components.ChatConversation.ChatInputBoxDisabled);
local v23 = require(l_script_FirstAncestor_0.Analytics.Enums.SendButtonClickActionResult);
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
local l_IsVRAppBuild_0 = require(l_Parent_0.AppCommonLib).IsVRAppBuild;
local v26 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatBehaviorCollectionEnabledMaster);
local v27 = require(l_script_FirstAncestor_0.Flags.getFIntAppChatBehaviorCollectionEnabledPercentage);
local l_getFFlagAppChatEnableIntervention_0 = require(l_Parent_0.InterventionShared).Flags.getFFlagAppChatEnableIntervention;
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local l_FFlagIsSquadEnabledAMP_0 = require(l_Parent_0.SharedFlags).FFlagIsSquadEnabledAMP;
local v31 = v3.PureComponent:extend("ChatInputBarDeprecated");
local v32 = require(l_script_FirstAncestor_0.Analytics.KeystrokeEvent);
v31.defaultProps = {
    userInputService = l_UserInputService_0, 
    initialInputText = "", 
    placeholderText = "Say something", 
    inputBarDisabledText = "Chat Disabled", 
    onDisabledInputBarActivated = function() --[[ Line: 54 ]] --[[ Name: onDisabledInputBarActivated ]]

    end, 
    sendButtonContainerSize = 45, 
    LayoutOrder = 0, 
    maxCharacterLength = 160, 
    maxKeystrokeDataLength = 200, 
    messageListRef = nil, 
    onHeightChanged = function() --[[ Line: 60 ]] --[[ Name: onHeightChanged ]]

    end, 
    onPositionChanged = function() --[[ Line: 61 ]] --[[ Name: onPositionChanged ]]

    end, 
    onFocusLost = function() --[[ Line: 62 ]] --[[ Name: onFocusLost ]]

    end, 
    isDisabled = false, 
    disabledEndTimestampDisplay = nil, 
    moreMenuEnabled = not l_FFlagIsSquadEnabledAMP_0 and nil, 
    onSendBtnClicked = nil, 
    onSendChat = nil, 
    onTextChanged = function() --[[ Line: 69 ]] --[[ Name: onTextChanged ]]

    end, 
    inputBoxRef = nil, 
    inputBarRef = nil, 
    eventLoggingFunc = l_default_0.logRobloxTelemetryEvent, 
    textChangedFallback = false
};
v31.init = function(v33) --[[ Line: 78 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_UserInputService_0 (copy), l_Text_0 (copy), l_FFlagIsSquadEnabledAMP_0 (copy), l_getAppFeaturePolicies_0 (copy), v26 (copy), v27 (copy), l_Players_0 (copy), v10 (copy), v11 (copy), v23 (copy)
    v33.isMounted = false;
    v33.state = {
        inputText = v33.props.initialInputText, 
        showSendChat = false, 
        chatBarWidth = 0, 
        frameHeight = 0
    };
    v33.inputBoxRef = v33.props.inputBoxRef or v3.createRef();
    v33.messageListRef = v33.props.messageListRef;
    v33.inputBoxFocusLossKeyCodeRef = if l_FFlagEnableAppChatFocusableFixes_0 then v3.createRef() else nil;
    if l_FFlagEnableAppChatFocusableFixes_0 then
        v33.inputBoxFocusLossKeyCodeRef.current = Enum.KeyCode.Unknown;
    end;
    v33.inputBarRef = if l_FFlagEnableAppChatFocusableFixes_0 then v33.props.inputBarRef or v3.createRef() else nil;
    v33.sendButtonRef = if l_FFlagEnableAppChatFocusableFixes_0 then v3.createRef() else nil;
    v33.eventHandlerRegistration = nil;
    v33.textChangedFallback = v33.props.textChangedFallback or not l_UserInputService_0.KeyboardEnabled;
    v33.heightOfFourLines = function(v34, v35, v36) --[[ Line: 99 ]]
        -- upvalues: l_Text_0 (ref)
        return l_Text_0.GetTextHeight("A\nB\nC\nD", v34, v35, v36);
    end;
    v33.isMoreMenuEnabled = function() --[[ Line: 103 ]]
        -- upvalues: l_FFlagIsSquadEnabledAMP_0 (ref), v33 (copy)
        return l_FFlagIsSquadEnabledAMP_0 and v33.props.moreMenuEnabled or not l_FFlagIsSquadEnabledAMP_0;
    end;
    v33.calculateInputBoxHeight = function(v37, v38, v39, v40) --[[ Line: 107 ]]
        -- upvalues: l_Text_0 (ref), v33 (copy)
        local v41 = l_Text_0.GetTextHeight(v37, v38, v39, v40);
        local v42 = v33.heightOfFourLines(v38, v39, v40);
        local v43 = nil;
        v43 = if v33.isMoreMenuEnabled() then v39 + math.min(v41, v42) else v39 + math.min(v41, v42) + 16;
        if v33.props.onHeightChanged then
            v33.props.onHeightChanged(v43);
        end;
        return v43;
    end;
    v33.inputConnectionActive = false;
    v33.inputBeganConnection = nil;
    v33.inputEndedConnection = nil;
    v33.keyPressedData = {};
    v33.eventTypeData = {};
    v33.timestampData = {};
    v33.shouldCollectKeystrokes = false;
    local v44 = l_getAppFeaturePolicies_0().getKeystrokeCollectionEnabled();
    if v26() then
        local v45 = v27();
        if v45 > 0 and l_Players_0.LocalPlayer and v44 then
            v33.shouldCollectKeystrokes = l_Players_0.LocalPlayer.UserId % 100 < v45;
        end;
    end;
    v33.onTextChanged = function(v46, v47, v48, v49) --[[ Line: 140 ]]
        -- upvalues: v33 (copy), v10 (ref)
        if not v33.isMounted then
            return;
        else
            local v50 = false;
            if v46 and v10(v46, v33.props.maxCharacterLength) then
                v50 = true;
            end;
            local v51 = v33.calculateInputBoxHeight(v46, v47, v48, v49);
            v33:setState({
                inputText = v46, 
                showSendChat = v50, 
                frameHeight = v51
            });
            v33.props.onTextChanged(v46);
            if v33.shouldCollectKeystrokes and v33.textChangedFallback then
                v33:recordTextChange(v46);
            end;
            return;
        end;
    end;
    v33.onInputBeganEvent = function(v52) --[[ Line: 167 ]]
        -- upvalues: v33 (copy), v11 (ref)
        if v33.shouldCollectKeystrokes and not v33.textChangedFallback and v52.UserInputType == Enum.UserInputType.Keyboard then
            v33:recordKeystroke(true, v52.KeyCode);
        end;
        if v11({
            v52
        }, Enum.KeyCode.Return, Enum.KeyCode.KeypadEnter) and not v11(v33.props.userInputService:GetKeysPressed(), Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift) then
            v33.onSendActivated();
        end;
    end;
    v33.onInputEndedEvent = function(v53) --[[ Line: 186 ]]
        -- upvalues: v33 (copy)
        if v33.shouldCollectKeystrokes and not v33.textChangedFallback and v53.UserInputType == Enum.UserInputType.Keyboard then
            v33:recordKeystroke(false, v53.KeyCode);
        end;
    end;
    v33.focusChanged = function(v54) --[[ Line: 194 ]]
        -- upvalues: v33 (copy)
        if v54 and not v33.inputConnectionActive then
            v33.inputBeganConnection = v33.props.userInputService.InputBegan:Connect(v33.onInputBeganEvent);
            v33.inputEndedConnection = v33.props.userInputService.InputEnded:Connect(v33.onInputEndedEvent);
            v33.inputConnectionActive = true;
            return;
        else
            if not v54 and v33.inputConnectionActive then
                v33:disconnectInputConnection();
                v33.props.onFocusLost();
            end;
            return;
        end;
    end;
    v33.onSendActivated = function() --[[ Line: 205 ]]
        -- upvalues: l_Text_0 (ref), v33 (copy), v23 (ref), v10 (ref), l_FFlagEnableAppChatFocusableFixes_0 (ref)
        local v55 = l_Text_0.Trim(v33.state.inputText);
        local l_None_0 = v23.None;
        if v33.state.showSendChat and v10(v55, v33.props.maxCharacterLength) then
            v33.inputBoxRef:getValue().Text = "";
            if l_FFlagEnableAppChatFocusableFixes_0 and v33.focusNavigationService and v33.focusNavigationService.focusedGuiObject:getValue() == v33.sendButtonRef:getValue() then
                v33.focusNavigationService:focusGuiObject(v33.inputBarRef:getValue(), false);
            end;
            v33:setState({
                inputText = "", 
                showSendChat = false
            });
            if v33.props.onSendChat then
                if v55 == "/shrug" then
                    v33.props.onSendChat("\194\175\\_(\227\131\132)_/\194\175");
                else
                    v33.props.onSendChat(v55);
                end;
                l_None_0 = v23.WillSend;
            end;
            local v57 = v33.messageListRef and v33.messageListRef.current and v33.messageListRef.current._listRef;
            if v57 then
                v57:scrollToOffset({
                    offset = 0
                });
            end;
        else
            l_None_0 = if not v33.state.showSendChat then v23.ButtonInactive else v23.MessageInvalid;
        end;
        if v33.props.onSendBtnClicked then
            v33.props.onSendBtnClicked(l_None_0);
        end;
        if v33.shouldCollectKeystrokes then
            v33:sendKeystrokeEvent("UASendPressed");
        end;
    end;
    v33.chatBoxSizeChanged = function(v58, v59, v60, v61) --[[ Line: 260 ]]
        -- upvalues: v33 (copy)
        local v62 = v33.calculateInputBoxHeight(v59, v60, v61, v58.AbsoluteSize.X);
        v33:setState({
            chatBarWidth = v58.AbsoluteSize.X, 
            frameHeight = v62
        });
    end;
    v33.onDisabledInputBarActivated = function() --[[ Line: 268 ]]
        -- upvalues: v33 (copy)
        v33.props.onDisabledInputBarActivated();
    end;
    v33.focusChatInputBox = l_FFlagEnableAppChatFocusableFixes_0 and function() --[[ Line: 273 ]]
        -- upvalues: v33 (copy)
        if v33.inputBoxRef and v33.inputBoxRef.current then
            v33.inputBoxRef.current:CaptureFocus();
        end;
    end or nil;
    v33.focusNavigationEventHandler = l_FFlagEnableAppChatFocusableFixes_0 and function(v63) --[[ Line: 281 ]]
        -- upvalues: v33 (copy)
        if v63.eventData and v33.inputBoxFocusLossKeyCodeRef.current == v63.eventData.KeyCode then
            v63:cancel();
            v33.inputBoxFocusLossKeyCodeRef.current = Enum.KeyCode.Unknown;
        end;
    end or nil;
end;
v31.render = function(v64) --[[ Line: 290 ]] --[[ Name: render ]]
    -- upvalues: l_getFFlagAppChatEnableIntervention_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v3 (copy), v19 (copy)
    local v65 = l_getFFlagAppChatEnableIntervention_0() and v64.props.isDisabled;
    if l_FFlagEnableAppChatFocusableFixes_0 then
        return v3.createElement(v19.FocusNavigationContext.Consumer, {
            render = function(v66) --[[ Line: 295 ]] --[[ Name: render ]]
                -- upvalues: v64 (copy), v65 (copy)
                v64.focusNavigationService = v66;
                return v64:renderContent(v65);
            end
        });
    else
        return v64:renderContent(v65);
    end;
end;
v31.renderContent = function(v67, v68) --[[ Line: 305 ]] --[[ Name: renderContent ]]
    -- upvalues: l_withStyle_0 (copy), v16 (copy), l_withSelectionCursorProvider_0 (copy), v3 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_getFFlagAppChatEnableIntervention_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_Interactable_0 (copy), l_CursorKind_0 (copy), v22 (copy), l_CallbackInputBox_0 (copy), l_IsVRAppBuild_0 (copy), l_IconSize_0 (copy)
    return l_withStyle_0(function(v69) --[[ Line: 306 ]]
        -- upvalues: v16 (ref), l_withSelectionCursorProvider_0 (ref), v67 (copy), v68 (copy), v3 (ref), l_ImageSetLabel_0 (ref), l_Images_0 (ref), l_getFFlagAppChatEnableIntervention_0 (ref), l_FFlagEnableAppChatFocusableFixes_0 (ref), l_Interactable_0 (ref), l_CursorKind_0 (ref), v22 (ref), l_CallbackInputBox_0 (ref), l_IsVRAppBuild_0 (ref), l_IconSize_0 (ref)
        return v16(function(v70) --[[ Line: 307 ]]
            -- upvalues: l_withSelectionCursorProvider_0 (ref), v69 (copy), v67 (ref), v68 (ref), v3 (ref), l_ImageSetLabel_0 (ref), l_Images_0 (ref), l_getFFlagAppChatEnableIntervention_0 (ref), l_FFlagEnableAppChatFocusableFixes_0 (ref), l_Interactable_0 (ref), l_CursorKind_0 (ref), v22 (ref), l_CallbackInputBox_0 (ref), l_IsVRAppBuild_0 (ref), l_IconSize_0 (ref)
            return l_withSelectionCursorProvider_0(function(v71) --[[ Line: 308 ]]
                -- upvalues: v69 (ref), v67 (ref), v70 (copy), v68 (ref), v3 (ref), l_ImageSetLabel_0 (ref), l_Images_0 (ref), l_getFFlagAppChatEnableIntervention_0 (ref), l_FFlagEnableAppChatFocusableFixes_0 (ref), l_Interactable_0 (ref), l_CursorKind_0 (ref), v22 (ref), l_CallbackInputBox_0 (ref), l_IsVRAppBuild_0 (ref), l_withSelectionCursorProvider_0 (ref), l_IconSize_0 (ref)
                local l_Font_0 = v69.Font;
                local l_Font_1 = l_Font_0.Body.Font;
                local v74 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
                local l_frameHeight_0 = v67.state.frameHeight;
                if l_frameHeight_0 == 0 then
                    l_frameHeight_0 = v67.calculateInputBoxHeight(v67.state.inputText, l_Font_1, v74, v67.state.chatBarWidth);
                end;
                local v76 = UDim.new(0, (math.max(v70.right - 6, 0)));
                if v68 then
                    v76 = UDim.new(0, v70.right);
                end;
                return v3.createElement("Frame", {
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = v67.props.LayoutOrder, 
                    Size = UDim2.new(1, 0, 0, l_frameHeight_0), 
                    [v3.Change.AbsolutePosition] = v67.props.onPositionChanged
                }, {
                    layout = v3.createElement("UIListLayout", {
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    flex = if v67.isMoreMenuEnabled() then v3.createElement("UIFlexItem", {
                        FlexMode = Enum.UIFlexMode.Fill
                    }) else nil, 
                    padding = if v67.isMoreMenuEnabled() then nil else v3.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v70.left), 
                        PaddingRight = v76, 
                        PaddingBottom = UDim.new(0, 13), 
                        PaddingTop = UDim.new(0, 8)
                    }), 
                    inputBorder = v3.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.new(1, v68 and 0 or -v67.props.sendButtonContainerSize, 1, 0), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1, 
                        Image = l_Images_0["component_assets/circle_21_stroke_1"], 
                        ImageColor3 = if l_getFFlagAppChatEnableIntervention_0() and v67.props.isDisabled then v69.Tokens.Global.Color.Red.Color3 else v69.Theme.Divider.Color, 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = Rect.new(8, 8, 9, 9)
                    }, {
                        inputImage = if l_FFlagEnableAppChatFocusableFixes_0 then v3.createElement(l_Interactable_0, {
                            SelectionImageObject = v71(l_CursorKind_0.RoundedRectNoInset), 
                            Size = UDim2.new(1, 0, 1, 0), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 1, 
                            Selectable = true, 
                            onActivated = v67.focusChatInputBox, 
                            [v3.Ref] = v67.inputBarRef
                        }, {
                            v3.createElement(l_ImageSetLabel_0, {
                                Size = UDim2.new(1, 0, 1, 0), 
                                BackgroundTransparency = 1, 
                                LayoutOrder = 1, 
                                Image = l_Images_0["component_assets/circle_21"], 
                                ImageColor3 = v69.Theme.UIMuted.Color, 
                                ImageTransparency = v69.Theme.UIMuted.Transparency, 
                                ScaleType = Enum.ScaleType.Slice, 
                                SliceCenter = Rect.new(8, 8, 9, 9)
                            }, {
                                padding = v3.createElement("UIPadding", {
                                    PaddingTop = if v67.isMoreMenuEnabled() then nil else UDim.new(0, v74 / 2.5), 
                                    PaddingLeft = UDim.new(0.02, 0), 
                                    PaddingRight = UDim.new(0.02, 0)
                                }), 
                                inputBox = if v68 then v3.createElement(v22, {
                                    bodyText = v67.props.inputBarDisabledText, 
                                    contentSize = v74, 
                                    endTimestamp = v67.props.disabledEndTimestampDisplay, 
                                    font = l_Font_1, 
                                    onActivated = v67.onDisabledInputBarActivated
                                }) else v3.createElement(l_CallbackInputBox_0, {
                                    initialInputText = v67.props.initialInputText, 
                                    inputTextFont = l_Font_1, 
                                    inputTextColor3 = v69.Theme.TextEmphasis.Color, 
                                    inputTextSize = v74, 
                                    inputTextXAlignment = Enum.TextXAlignment.Left, 
                                    inputTextYAlignment = if v67.isMoreMenuEnabled() then Enum.TextYAlignment.Center else Enum.TextYAlignment.Top, 
                                    placeholderText = v67.props.placeholderText, 
                                    placeholderTextColor3 = v69.Theme.TextMuted.Color, 
                                    placeholderTextTransparency = v69.Theme.TextMuted.Transparency, 
                                    clipsDescendants = false, 
                                    multiLine = not l_IsVRAppBuild_0(), 
                                    manualFocusRelease = true, 
                                    textWrapped = true, 
                                    focusChangedCallback = v67.focusChanged, 
                                    clearButtonDisabled = true, 
                                    clearButtonSize = 0, 
                                    textChangedCallback = function(v77) --[[ Line: 429 ]] --[[ Name: textChangedCallback ]]
                                        -- upvalues: v67 (ref), l_Font_1 (copy), v74 (copy)
                                        v67.onTextChanged(v77, l_Font_1, v74, v67.state.chatBarWidth);
                                    end, 
                                    [v3.Change.AbsoluteSize] = function(v78) --[[ Line: 432 ]]
                                        -- upvalues: v67 (ref), l_Font_1 (copy), v74 (copy)
                                        v67.chatBoxSizeChanged(v78, v67.state.inputText, l_Font_1, v74);
                                    end, 
                                    inputBoxRef = v67.inputBoxRef, 
                                    returnPressedFromOnScreenKeyboardCallback = if l_IsVRAppBuild_0() then v67.onSendActivated else nil
                                })
                            })
                        }) else v3.createElement(l_ImageSetLabel_0, {
                            Size = UDim2.new(1, 0, 1, 0), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 1, 
                            Image = l_Images_0["component_assets/circle_21"], 
                            ImageColor3 = v69.Theme.UIMuted.Color, 
                            ImageTransparency = v69.Theme.UIMuted.Transparency, 
                            ScaleType = Enum.ScaleType.Slice, 
                            SliceCenter = Rect.new(8, 8, 9, 9)
                        }, {
                            padding = v3.createElement("UIPadding", {
                                PaddingTop = if v67.isMoreMenuEnabled() then nil else UDim.new(0, v74 / 2.5), 
                                PaddingLeft = UDim.new(0.02, 0), 
                                PaddingRight = UDim.new(0.02, 0)
                            }), 
                            inputBox = if v68 then v3.createElement(v22, {
                                bodyText = v67.props.inputBarDisabledText, 
                                contentSize = v74, 
                                endTimestamp = v67.props.disabledEndTimestampDisplay, 
                                font = l_Font_1, 
                                onActivated = v67.onDisabledInputBarActivated
                            }) else v3.createElement(l_CallbackInputBox_0, {
                                initialInputText = v67.props.initialInputText, 
                                inputTextFont = l_Font_1, 
                                inputTextColor3 = v69.Theme.TextEmphasis.Color, 
                                inputTextSize = v74, 
                                inputTextXAlignment = Enum.TextXAlignment.Left, 
                                inputTextYAlignment = if v67.isMoreMenuEnabled() then Enum.TextYAlignment.Center else Enum.TextYAlignment.Top, 
                                placeholderText = v67.props.placeholderText, 
                                placeholderTextColor3 = v69.Theme.TextMuted.Color, 
                                placeholderTextTransparency = v69.Theme.TextMuted.Transparency, 
                                clipsDescendants = false, 
                                multiLine = not l_IsVRAppBuild_0(), 
                                manualFocusRelease = true, 
                                textWrapped = true, 
                                focusChangedCallback = v67.focusChanged, 
                                clearButtonDisabled = true, 
                                clearButtonSize = 0, 
                                textChangedCallback = function(v79) --[[ Line: 490 ]] --[[ Name: textChangedCallback ]]
                                    -- upvalues: v67 (ref), l_Font_1 (copy), v74 (copy)
                                    v67.onTextChanged(v79, l_Font_1, v74, v67.state.chatBarWidth);
                                end, 
                                [v3.Change.AbsoluteSize] = function(v80) --[[ Line: 493 ]]
                                    -- upvalues: v67 (ref), l_Font_1 (copy), v74 (copy)
                                    v67.chatBoxSizeChanged(v80, v67.state.inputText, l_Font_1, v74);
                                end, 
                                inputBoxRef = v67.inputBoxRef, 
                                returnPressedFromOnScreenKeyboardCallback = if l_IsVRAppBuild_0() then v67.onSendActivated else nil
                            })
                        })
                    }), 
                    sendButton = if not v68 then if l_FFlagEnableAppChatFocusableFixes_0 then l_withSelectionCursorProvider_0(function(v81) --[[ Line: 505 ]]
                        -- upvalues: v3 (ref), v67 (ref), l_CursorKind_0 (ref), l_ImageSetLabel_0 (ref), l_IconSize_0 (ref), v69 (ref), l_Images_0 (ref)
                        return v3.createElement("TextButton", {
                            Size = UDim2.new(0, v67.props.sendButtonContainerSize, 1, 0), 
                            LayoutOrder = 2, 
                            BackgroundTransparency = 1, 
                            Text = "", 
                            SelectionImageObject = v81(l_CursorKind_0.RoundedRectNoInset), 
                            Selectable = true, 
                            NextSelectionLeft = v67.inputBarRef, 
                            [v3.Event.Activated] = v67.onSendActivated, 
                            [v3.Ref] = v67.sendButtonRef
                        }, {
                            layout = v3.createElement("UIListLayout", {
                                VerticalAlignment = Enum.VerticalAlignment.Center, 
                                HorizontalAlignment = Enum.HorizontalAlignment.Right
                            }), 
                            sendIcon = v3.createElement(l_ImageSetLabel_0, {
                                Size = UDim2.new(0, l_IconSize_0.Regular, 0, l_IconSize_0.Regular), 
                                BackgroundTransparency = 1, 
                                ImageColor3 = if v67.state.showSendChat then v69.Tokens.Semantic.Color.Icon.Emphasis.Color3 else v69.Tokens.Semantic.Color.Icon.Default.Color3, 
                                ImageTransparency = v67.state.showSendChat and 0 or 0.5, 
                                Image = l_Images_0["icons/actions/send"]
                            })
                        });
                    end) else v3.createElement("TextButton", {
                        Size = UDim2.new(0, v67.props.sendButtonContainerSize, 1, 0), 
                        LayoutOrder = 2, 
                        BackgroundTransparency = 1, 
                        Text = "", 
                        [v3.Event.Activated] = v67.onSendActivated
                    }, {
                        layout = v3.createElement("UIListLayout", {
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Right
                        }), 
                        sendIcon = v3.createElement(l_ImageSetLabel_0, {
                            Size = UDim2.new(0, l_IconSize_0.Regular, 0, l_IconSize_0.Regular), 
                            BackgroundTransparency = 1, 
                            ImageColor3 = if v67.state.showSendChat then v69.Tokens.Semantic.Color.Icon.Emphasis.Color3 else v69.Tokens.Semantic.Color.Icon.Default.Color3, 
                            ImageTransparency = v67.state.showSendChat and 0 or 0.5, 
                            Image = l_Images_0["icons/actions/send"]
                        })
                    }) else nil
                });
            end);
        end);
    end);
end;
v31.didMount = function(v82) --[[ Line: 563 ]] --[[ Name: didMount ]]
    -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (copy), l_FocusNavigationEventNameEnum_0 (copy)
    v82.isMounted = true;
    if l_FFlagEnableAppChatFocusableFixes_0 and v82.inputBoxRef and v82.inputBoxRef.current then
        v82.inputBoxRef.current.Selectable = false;
        v82.focusLostConnection = v82.inputBoxRef.current.FocusLost:Connect(function(_, v84) --[[ Line: 568 ]]
            -- upvalues: v82 (copy)
            v82.inputBoxFocusLossKeyCodeRef.current = if v84 then v84.KeyCode else Enum.KeyCode.Unknown;
        end);
    end;
    if l_FFlagEnableAppChatFocusableFixes_0 and v82.focusNavigationService and v82.inputBarRef.current then
        v82.eventHandlerRegistration = v82.focusNavigationService:registerEventHandler(v82.inputBarRef.current, l_FocusNavigationEventNameEnum_0.NavigateBack, v82.focusNavigationEventHandler);
    end;
end;
v31.willUnmount = function(v85) --[[ Line: 586 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (copy)
    v85.isMounted = false;
    if v85.inputConnectionActive then
        v85:disconnectInputConnection();
    end;
    if v85.props.onHeightChanged then
        v85.props.onHeightChanged(0);
    end;
    if l_FFlagEnableAppChatFocusableFixes_0 and v85.focusLostConnection then
        v85.focusLostConnection:Disconnect();
    end;
    if l_FFlagEnableAppChatFocusableFixes_0 and v85.eventHandlerRegistration then
        v85.eventHandlerRegistration:Disconnect();
    end;
end;
v31.recordKeystroke = function(v86, v87, v88) --[[ Line: 606 ]] --[[ Name: recordKeystroke ]]
    if v87 then
        table.insert(v86.keyPressedData, v88.Name);
        table.insert(v86.eventTypeData, 0);
        table.insert(v86.timestampData, DateTime.now().UnixTimestampMillis);
    elseif v88 ~= Enum.KeyCode.Return and v88 ~= Enum.KeyCode.KeypadEnter or #v86.keyPressedData ~= 0 then
        table.insert(v86.keyPressedData, v88.Name);
        table.insert(v86.eventTypeData, 1);
        table.insert(v86.timestampData, DateTime.now().UnixTimestampMillis);
    end;
    if #v86.keyPressedData >= v86.props.maxKeystrokeDataLength then
        v86:sendKeystrokeEvent("UAMaxLengthReached");
    end;
end;
v31.recordTextChange = function(v89, v90) --[[ Line: 626 ]] --[[ Name: recordTextChange ]]
    table.insert(v89.keyPressedData, v90:sub(-1));
    table.insert(v89.timestampData, DateTime.now().UnixTimestampMillis);
    if #v89.keyPressedData >= v89.props.maxKeystrokeDataLength then
        v89:sendKeystrokeEvent("UAMaxLengthReached");
    end;
end;
v31.sendKeystrokeEvent = function(v91, v92) --[[ Line: 636 ]] --[[ Name: sendKeystrokeEvent ]]
    -- upvalues: l_default_0 (copy), v32 (copy)
    if #v91.keyPressedData >= 0 then
        v91.props.eventLoggingFunc(l_default_0, v32, {}, {
            chatContext = v92, 
            keyPressedData = table.concat(v91.keyPressedData, ","), 
            eventTypeData = table.concat(v91.eventTypeData, ","), 
            timestampData = table.concat(v91.timestampData, ",")
        });
        v91.keyPressedData = {};
        v91.eventTypeData = {};
        v91.timestampData = {};
    end;
end;
v31.disconnectInputConnection = function(v93) --[[ Line: 650 ]] --[[ Name: disconnectInputConnection ]]
    if v93.inputBeganConnection then
        v93.inputBeganConnection:Disconnect();
        v93.inputBeganConnection = nil;
    end;
    if v93.inputEndedConnection then
        v93.inputEndedConnection:Disconnect();
        v93.inputEndedConnection = nil;
    end;
    v93.inputConnectionActive = false;
end;
return v31;