local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v3 = require(l_script_FirstAncestor_0.Stores.GetTransparencyStore);
local v4 = require(l_script_FirstAncestor_0.Localization);
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v7 = require(l_Parent_0.Roact);
local v8 = require(l_Parent_0.React);
local v9 = require(l_Parent_0.RoactRodux);
local v10 = require(l_script_FirstAncestor_0.Config);
local v11 = require(l_Parent_0.InputType);
local l_getInputGroup_0 = require(l_Parent_0.InputType).getInputGroup;
local v13 = require(l_Parent_0.SharedFlags);
local v14 = require(l_script_FirstAncestor_0.Actions.FocusChatHotKeyActivated);
local v15 = require(l_script_FirstAncestor_0.Actions.AutocompleteDropdownActivated);
local v16 = require(l_script_FirstAncestor_0.Actions.AutocompleteDropdownResultsChanged);
local v17 = require(l_script_FirstAncestor_0.Actions.AutocompleteDropdownSelectionChanged);
local v18 = require(l_script_FirstAncestor_0.Actions.AutocompleteDropdownTypeChanged);
local v19 = require(l_script_FirstAncestor_0.Actions.AutocompleteDropdownDeactivated);
local v20 = game:DefineFastFlag("MemoizeChatInputApp", false);
local l_FFlagEnableConsoleExpControls_0 = v13.FFlagEnableConsoleExpControls;
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v23 = require(l_Flags_0.getFFlagUnreduxLastInputTypeChanged);
local l_UI_0 = script.Parent.UI;
local v25 = require(l_UI_0.ChatInputBar);
local l_Localization_0 = require(l_Parent_0.InExperienceLocales).Localization;
local v27 = require(l_Parent_0.Cryo);
local v28 = (if v23() then v7.PureComponent else v7.Component):extend("ChatInputBarApp");
v28.defaultProps = {
    addTopPadding = true, 
    LayoutOrder = 1, 
    onSendChat = nil, 
    transparencyValue = v7.createBinding(0.3)
};
if v23() then
    v28.init = function(v29) --[[ Line: 48 ]] --[[ Name: init ]]
        -- upvalues: l_UserInputService_0 (copy), l_getInputGroup_0 (copy), v11 (copy)
        v29:setState({
            isUsingTouch = l_UserInputService_0.TouchEnabled, 
            isUsingGamepad = l_UserInputService_0.PreferredInput == Enum.PreferredInput.Gamepad
        });
        v29.connection = l_UserInputService_0.LastInputTypeChanged:Connect(function(v30) --[[ Line: 53 ]]
            -- upvalues: l_getInputGroup_0 (ref), v29 (copy), v11 (ref)
            local v31 = l_getInputGroup_0(v30);
            v29:setState({
                isUsingTouch = v31 == v11.InputTypeConstants.Touch, 
                isUsingGamepad = v31 == v11.InputTypeConstants.Gamepad
            });
        end);
    end;
    v28.getPlaceholderText = function(v32) --[[ Line: 63 ]] --[[ Name: getPlaceholderText ]]
        if v32.state.isUsingGamepad then
            return v32.props.placeholderGamepadText;
        elseif v32.state.isUsingTouch then
            return v32.props.placeholderTouchText;
        else
            return v32.props.placeholderKeyboardText;
        end;
    end;
    v28.willUnmount = function(v33) --[[ Line: 73 ]] --[[ Name: willUnmount ]]
        if v33.connection then
            v33.connection:Disconnect();
        end;
    end;
else
    v28.getPlaceholderText = function(v34) --[[ Line: 79 ]] --[[ Name: getPlaceholderText ]]
        if v34.props.isUsingGamepad then
            return v34.props.placeholderGamepadText;
        elseif v34.props.isUsingTouch then
            return v34.props.placeholderTouchText;
        else
            return v34.props.placeholderKeyboardText;
        end;
    end;
end;
v28.render = function(v35) --[[ Line: 90 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v25 (copy), l_UserInputService_0 (copy), v10 (copy)
    return v8.createElement(v25, {
        userInputService = l_UserInputService_0, 
        contextActionService = game:GetService("ContextActionService"), 
        messageCharacterLimit = v10.MessageCharacterLimit, 
        sendButtonContainerWidth = 30, 
        addTopPadding = v35.props.addTopPadding, 
        LayoutOrder = v35.props.LayoutOrder, 
        placeholderText = v35:getPlaceholderText(), 
        disabledChatPlaceholderText = v35.props.disabledChatPlaceholderText, 
        size = UDim2.fromScale(1, 0), 
        chatIntervention = v35.props.chatIntervention, 
        onSendChat = v35.props.onSendChat, 
        transparencyValue = v35.props.transparencyValue, 
        canLocalUserChat = v35.props.canLocalUserChat, 
        targetTextChannel = v35.props.targetTextChannel, 
        localTeam = v35.props.localTeam, 
        localPlayer = v35.props.localPlayer, 
        defaultSystemTextChannel = v35.props.defaultSystemTextChannel, 
        shouldFocusChatInputBar = v35.props.shouldFocusChatInputBar, 
        resetTargetChannel = v35.props.resetTargetChannel, 
        focusChatHotKeyActivated = v35.props.focusChatHotKeyActivated, 
        devDefinedFocusKeyCode = v35.props.devDefinedFocusKeyCode, 
        visible = v35.props.visible, 
        onFocus = v35.props.onFocus, 
        onUnfocus = v35.props.onUnfocus, 
        onHovered = v35.props.onHovered, 
        onUnhovered = v35.props.onUnhovered, 
        onAbsoluteSizeChanged = v35.props.onAbsoluteSizeChanged, 
        onAbsolutePositionChanged = v35.props.onAbsolutePositionChanged, 
        chatWindowSettings = v35.props.chatWindowSettings, 
        chatInputBarSettings = v35.props.chatInputBarSettings, 
        isChatHotkeyEnabled = v35.props.isChatHotkeyEnabled, 
        autocompleteDropdownReducer = v35.props.autocompleteDropdownReducer, 
        autocompleteDropdownActivated = v35.props.autocompleteDropdownActivated, 
        autocompleteDropdownResultsChanged = v35.props.autocompleteDropdownResultsChanged, 
        autocompleteDropdownSelectionChanged = v35.props.autocompleteDropdownSelectionChanged, 
        autocompleteDropdownTypeChanged = v35.props.autocompleteDropdownTypeChanged, 
        autocompleteDropdownDeactivated = v35.props.autocompleteDropdownDeactivated, 
        autocompleteEnabled = v35.props.autocompleteEnabled, 
        isChannelBarVisible = v35.props.isChannelBarVisible
    });
end;
local v44 = v9.connect(function(v36) --[[ Line: 134 ]]
    -- upvalues: l_Players_0 (copy), v23 (copy)
    return {
        targetTextChannel = v36.TextChannels.targetTextChannel, 
        localPlayer = l_Players_0.LocalPlayer, 
        localTeam = v36.LocalTeam, 
        isUsingTouch = if not v23() then v36.isUsingTouch else nil, 
        isUsingGamepad = if not v23() then v36.isUsingGamepad else nil, 
        devDefinedFocusKeyCode = v36.ChatLayout.ChatInputBarSettings.KeyboardKeyCode, 
        defaultSystemTextChannel = v36.TextChannels.allTextChannels.RBXSystem, 
        shouldFocusChatInputBar = v36.shouldFocusChatInputBar, 
        chatInputBarSettings = v36.ChatLayout.ChatInputBarSettings, 
        chatIntervention = v36.ChatIntervention, 
        isChatHotkeyEnabled = v36.ChatVisibility.isChatHotkeyEnabled.value, 
        autocompleteDropdownReducer = v36.AutocompleteDropdown, 
        autocompleteEnabled = v36.ChatLayout.ChatInputBarSettings.AutocompleteEnabled
    };
end, function(v37) --[[ Line: 150 ]]
    -- upvalues: v3 (copy), v14 (copy), v15 (copy), v16 (copy), v17 (copy), v18 (copy), v19 (copy)
    local v38 = v3(false);
    return {
        focusChatHotKeyActivated = function() --[[ Line: 153 ]] --[[ Name: focusChatHotKeyActivated ]]
            -- upvalues: v37 (copy), v14 (ref)
            return v37(v14());
        end, 
        onFocus = function() --[[ Line: 157 ]] --[[ Name: onFocus ]]
            -- upvalues: v38 (copy)
            return v38.setTextboxFocus();
        end, 
        onUnfocus = function() --[[ Line: 161 ]] --[[ Name: onUnfocus ]]
            -- upvalues: v38 (copy)
            return v38.clearTextboxFocus();
        end, 
        onHovered = function() --[[ Line: 165 ]] --[[ Name: onHovered ]]
            -- upvalues: v38 (copy)
            return v38.resetAllTransparency();
        end, 
        onUnhovered = function() --[[ Line: 169 ]] --[[ Name: onUnhovered ]]
            -- upvalues: v38 (copy)
            return v38.resetAllTransparency();
        end, 
        autocompleteDropdownActivated = function(v39) --[[ Line: 173 ]] --[[ Name: autocompleteDropdownActivated ]]
            -- upvalues: v37 (copy), v15 (ref)
            return v37(v15(v39));
        end, 
        autocompleteDropdownResultsChanged = function(v40) --[[ Line: 177 ]] --[[ Name: autocompleteDropdownResultsChanged ]]
            -- upvalues: v37 (copy), v16 (ref)
            return v37(v16(v40));
        end, 
        autocompleteDropdownSelectionChanged = function(v41) --[[ Line: 181 ]] --[[ Name: autocompleteDropdownSelectionChanged ]]
            -- upvalues: v37 (copy), v17 (ref)
            return v37(v17(v41));
        end, 
        autocompleteDropdownTypeChanged = function(v42) --[[ Line: 185 ]] --[[ Name: autocompleteDropdownTypeChanged ]]
            -- upvalues: v37 (copy), v18 (ref)
            return v37(v18(v42));
        end, 
        autocompleteDropdownDeactivated = function() --[[ Line: 189 ]] --[[ Name: autocompleteDropdownDeactivated ]]
            -- upvalues: v37 (copy), v19 (ref)
            return v37(v19());
        end
    };
end)(v4.connect(function(v43) --[[ Line: 193 ]]
    -- upvalues: l_UserInputService_0 (copy)
    return {
        placeholderKeyboardText = {
            "CoreScripts.TextChat.InputBar.Hint.MouseKeyboard", 
            {
                KEY = l_UserInputService_0:GetStringForKeyCode(v43.devDefinedFocusKeyCode)
            }
        }, 
        placeholderTouchText = "CoreScripts.TextChat.InputBar.Hint.Touch", 
        disabledChatPlaceholderText = "CoreScripts.TextChat.InputBar.Hint.PrivacySettingsDisabled"
    };
end)(v28));
local function v50(v45) --[[ Line: 205 ]]
    -- upvalues: l_Localization_0 (copy), l_LocalizationService_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v27 (copy), v8 (copy), v44 (copy)
    local v46 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    local _ = nil;
    local v48 = nil;
    v48 = if l_FFlagEnableConsoleExpControls_0 then v46:Format("CoreScripts.TextChat.InputBar.Hint.GamepadConnected", {
        CONFIRM_KEY = v46:Format("CoreScripts.TextChat.InputBar.Hint.GamepadConnectedConfirm")
    }) else v46:Format("CoreScripts.TextChat.InputBar.Hint.Gamepad", {
        CHAT_BUTTON = v46:Format("CoreScripts.TopBar.Chat")
    });
    local v49 = v27.Dictionary.join(v45, {
        placeholderGamepadText = v48
    });
    return v8.createElement(v44, v49);
end;
if v20 then
    return (v8.memo(v50));
else
    return v50;
end;