local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v3 = require(l_script_FirstAncestor_0.Stores.GetTransparencyStore);
local v4 = require(l_script_FirstAncestor_0.Localization);
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v7 = require(l_Parent_0.ExpChatShared);
local v8 = require(l_Parent_0.Roact);
local v9 = require(l_Parent_0.React);
local v10 = require(l_Parent_0.RoactRodux);
local v11 = require(l_script_FirstAncestor_0.Config);
local v12 = require(l_Parent_0.InputType);
local l_getInputGroup_0 = require(l_Parent_0.InputType).getInputGroup;
local v14 = require(l_Parent_0.SharedFlags);
local v15 = require(l_script_FirstAncestor_0.Actions.FocusChatHotKeyActivated);
local v16 = require(l_script_FirstAncestor_0.Actions.AutocompleteDropdownActivated);
local v17 = require(l_script_FirstAncestor_0.Actions.AutocompleteDropdownResultsChanged);
local v18 = require(l_script_FirstAncestor_0.Actions.AutocompleteDropdownSelectionChanged);
local v19 = require(l_script_FirstAncestor_0.Actions.AutocompleteDropdownTypeChanged);
local v20 = require(l_script_FirstAncestor_0.Actions.AutocompleteDropdownDeactivated);
local v21 = game:DefineFastFlag("MemoizeChatInputApp", false);
local l_FFlagEnableConsoleExpControls_0 = v14.FFlagEnableConsoleExpControls;
local l_GetFFlagTextChatEnableUniverseChatTabs_0 = v7.Flags.GetFFlagTextChatEnableUniverseChatTabs;
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v25 = require(l_Flags_0.getFFlagUnreduxLastInputTypeChanged);
local v26 = require(l_script_FirstAncestor_0.selectSelectedTabName);
local l_UI_0 = script.Parent.UI;
local v28 = require(l_UI_0.ChatInputBar);
local l_Localization_0 = require(l_Parent_0.InExperienceLocales).Localization;
local v30 = require(l_Parent_0.Cryo);
local v31 = (if v25() then v8.PureComponent else v8.Component):extend("ChatInputBarApp");
v31.defaultProps = {
    addTopPadding = true, 
    LayoutOrder = 1, 
    onSendChat = nil, 
    transparencyValue = v8.createBinding(0.3)
};
if v25() then
    v31.init = function(v32) --[[ Line: 52 ]] --[[ Name: init ]]
        -- upvalues: l_UserInputService_0 (copy), l_getInputGroup_0 (copy), v12 (copy)
        v32:setState({
            isUsingTouch = l_UserInputService_0.TouchEnabled, 
            isUsingGamepad = l_UserInputService_0.PreferredInput == Enum.PreferredInput.Gamepad
        });
        v32.connection = l_UserInputService_0.LastInputTypeChanged:Connect(function(v33) --[[ Line: 57 ]]
            -- upvalues: l_getInputGroup_0 (ref), v32 (copy), v12 (ref)
            local v34 = l_getInputGroup_0(v33);
            v32:setState({
                isUsingTouch = v34 == v12.InputTypeConstants.Touch, 
                isUsingGamepad = v34 == v12.InputTypeConstants.Gamepad
            });
        end);
    end;
    v31.getPlaceholderText = function(v35) --[[ Line: 67 ]] --[[ Name: getPlaceholderText ]]
        if v35.state.isUsingGamepad then
            return v35.props.placeholderGamepadText;
        elseif v35.state.isUsingTouch then
            return v35.props.placeholderTouchText;
        else
            return v35.props.placeholderKeyboardText;
        end;
    end;
    v31.willUnmount = function(v36) --[[ Line: 77 ]] --[[ Name: willUnmount ]]
        if v36.connection then
            v36.connection:Disconnect();
        end;
    end;
else
    v31.getPlaceholderText = function(v37) --[[ Line: 83 ]] --[[ Name: getPlaceholderText ]]
        if v37.props.isUsingGamepad then
            return v37.props.placeholderGamepadText;
        elseif v37.props.isUsingTouch then
            return v37.props.placeholderTouchText;
        else
            return v37.props.placeholderKeyboardText;
        end;
    end;
end;
v31.render = function(v38) --[[ Line: 94 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), v28 (copy), l_UserInputService_0 (copy), v11 (copy)
    return v9.createElement(v28, {
        userInputService = l_UserInputService_0, 
        contextActionService = game:GetService("ContextActionService"), 
        messageCharacterLimit = v11.MessageCharacterLimit, 
        sendButtonContainerWidth = 30, 
        addTopPadding = v38.props.addTopPadding, 
        LayoutOrder = v38.props.LayoutOrder, 
        placeholderText = v38:getPlaceholderText(), 
        disabledChatPlaceholderText = v38.props.disabledChatPlaceholderText, 
        size = UDim2.fromScale(1, 0), 
        chatIntervention = v38.props.chatIntervention, 
        onSendChat = v38.props.onSendChat, 
        onSendGlobalChat = v38.props.onSendGlobalChat, 
        transparencyValue = v38.props.transparencyValue, 
        canLocalUserChat = v38.props.canLocalUserChat, 
        targetTextChannel = v38.props.targetTextChannel, 
        localTeam = v38.props.localTeam, 
        localPlayer = v38.props.localPlayer, 
        defaultSystemTextChannel = v38.props.defaultSystemTextChannel, 
        shouldFocusChatInputBar = v38.props.shouldFocusChatInputBar, 
        resetTargetChannel = v38.props.resetTargetChannel, 
        focusChatHotKeyActivated = v38.props.focusChatHotKeyActivated, 
        devDefinedFocusKeyCode = v38.props.devDefinedFocusKeyCode, 
        visible = v38.props.visible, 
        onFocus = v38.props.onFocus, 
        onUnfocus = v38.props.onUnfocus, 
        onHovered = v38.props.onHovered, 
        onUnhovered = v38.props.onUnhovered, 
        onAbsoluteSizeChanged = v38.props.onAbsoluteSizeChanged, 
        onAbsolutePositionChanged = v38.props.onAbsolutePositionChanged, 
        chatWindowSettings = v38.props.chatWindowSettings, 
        chatInputBarSettings = v38.props.chatInputBarSettings, 
        isChatHotkeyEnabled = v38.props.isChatHotkeyEnabled, 
        autocompleteDropdownReducer = v38.props.autocompleteDropdownReducer, 
        autocompleteDropdownActivated = v38.props.autocompleteDropdownActivated, 
        autocompleteDropdownResultsChanged = v38.props.autocompleteDropdownResultsChanged, 
        autocompleteDropdownSelectionChanged = v38.props.autocompleteDropdownSelectionChanged, 
        autocompleteDropdownTypeChanged = v38.props.autocompleteDropdownTypeChanged, 
        autocompleteDropdownDeactivated = v38.props.autocompleteDropdownDeactivated, 
        autocompleteEnabled = v38.props.autocompleteEnabled, 
        isChannelBarVisible = v38.props.isChannelBarVisible, 
        isGlobalChatTabActive = v38.props.isGlobalChatTabActive, 
        developerChannelTabsEnabled = v38.props.developerChannelTabsEnabled
    });
end;
local v49 = v10.connect(function(v39) --[[ Line: 141 ]]
    -- upvalues: l_GetFFlagTextChatEnableUniverseChatTabs_0 (copy), l_Players_0 (copy), v25 (copy), v26 (copy)
    local l_ChannelTabs_0 = v39.ChannelTabs;
    local v41 = if l_GetFFlagTextChatEnableUniverseChatTabs_0() and l_ChannelTabs_0 then l_ChannelTabs_0.channelTabsConfigurationEnabled else false;
    return {
        targetTextChannel = v39.TextChannels.targetTextChannel, 
        localPlayer = l_Players_0.LocalPlayer, 
        localTeam = v39.LocalTeam, 
        isUsingTouch = if not v25() then v39.isUsingTouch else nil, 
        isUsingGamepad = if not v25() then v39.isUsingGamepad else nil, 
        devDefinedFocusKeyCode = v39.ChatLayout.ChatInputBarSettings.KeyboardKeyCode, 
        defaultSystemTextChannel = v39.TextChannels.allTextChannels.RBXSystem, 
        shouldFocusChatInputBar = v39.shouldFocusChatInputBar, 
        chatInputBarSettings = v39.ChatLayout.ChatInputBarSettings, 
        chatIntervention = v39.ChatIntervention, 
        isChatHotkeyEnabled = v39.ChatVisibility.isChatHotkeyEnabled.value, 
        autocompleteDropdownReducer = v39.AutocompleteDropdown, 
        autocompleteEnabled = v39.ChatLayout.ChatInputBarSettings.AutocompleteEnabled, 
        isGlobalChatTabActive = l_GetFFlagTextChatEnableUniverseChatTabs_0() and v26(v39) == "RBXGlobal", 
        developerChannelTabsEnabled = v41
    };
end, function(v42) --[[ Line: 165 ]]
    -- upvalues: v3 (copy), v15 (copy), v16 (copy), v17 (copy), v18 (copy), v19 (copy), v20 (copy)
    local v43 = v3(false);
    return {
        focusChatHotKeyActivated = function() --[[ Line: 168 ]] --[[ Name: focusChatHotKeyActivated ]]
            -- upvalues: v42 (copy), v15 (ref)
            return v42(v15());
        end, 
        onFocus = function() --[[ Line: 172 ]] --[[ Name: onFocus ]]
            -- upvalues: v43 (copy)
            return v43.setTextboxFocus();
        end, 
        onUnfocus = function() --[[ Line: 176 ]] --[[ Name: onUnfocus ]]
            -- upvalues: v43 (copy)
            return v43.clearTextboxFocus();
        end, 
        onHovered = function() --[[ Line: 180 ]] --[[ Name: onHovered ]]
            -- upvalues: v43 (copy)
            return v43.resetAllTransparency();
        end, 
        onUnhovered = function() --[[ Line: 184 ]] --[[ Name: onUnhovered ]]
            -- upvalues: v43 (copy)
            return v43.resetAllTransparency();
        end, 
        autocompleteDropdownActivated = function(v44) --[[ Line: 188 ]] --[[ Name: autocompleteDropdownActivated ]]
            -- upvalues: v42 (copy), v16 (ref)
            return v42(v16(v44));
        end, 
        autocompleteDropdownResultsChanged = function(v45) --[[ Line: 192 ]] --[[ Name: autocompleteDropdownResultsChanged ]]
            -- upvalues: v42 (copy), v17 (ref)
            return v42(v17(v45));
        end, 
        autocompleteDropdownSelectionChanged = function(v46) --[[ Line: 196 ]] --[[ Name: autocompleteDropdownSelectionChanged ]]
            -- upvalues: v42 (copy), v18 (ref)
            return v42(v18(v46));
        end, 
        autocompleteDropdownTypeChanged = function(v47) --[[ Line: 200 ]] --[[ Name: autocompleteDropdownTypeChanged ]]
            -- upvalues: v42 (copy), v19 (ref)
            return v42(v19(v47));
        end, 
        autocompleteDropdownDeactivated = function() --[[ Line: 204 ]] --[[ Name: autocompleteDropdownDeactivated ]]
            -- upvalues: v42 (copy), v20 (ref)
            return v42(v20());
        end
    };
end)(v4.connect(function(v48) --[[ Line: 208 ]]
    -- upvalues: l_UserInputService_0 (copy)
    return {
        placeholderKeyboardText = {
            "CoreScripts.TextChat.InputBar.Hint.MouseKeyboard", 
            {
                KEY = l_UserInputService_0:GetStringForKeyCode(v48.devDefinedFocusKeyCode)
            }
        }, 
        placeholderTouchText = "CoreScripts.TextChat.InputBar.Hint.Touch", 
        disabledChatPlaceholderText = "CoreScripts.TextChat.InputBar.Hint.PrivacySettingsDisabled"
    };
end)(v31));
local function v55(v50) --[[ Line: 220 ]]
    -- upvalues: l_Localization_0 (copy), l_LocalizationService_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v30 (copy), v9 (copy), v49 (copy)
    local v51 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    local _ = nil;
    local v53 = nil;
    v53 = if l_FFlagEnableConsoleExpControls_0 then v51:Format("CoreScripts.TextChat.InputBar.Hint.GamepadConnected", {
        CONFIRM_KEY = v51:Format("CoreScripts.TextChat.InputBar.Hint.GamepadConnectedConfirm")
    }) else v51:Format("CoreScripts.TextChat.InputBar.Hint.Gamepad", {
        CHAT_BUTTON = v51:Format("CoreScripts.TopBar.Chat")
    });
    local v54 = v30.Dictionary.join(v50, {
        placeholderGamepadText = v53
    });
    return v9.createElement(v49, v54);
end;
if v21 then
    return (v9.memo(v55));
else
    return v55;
end;