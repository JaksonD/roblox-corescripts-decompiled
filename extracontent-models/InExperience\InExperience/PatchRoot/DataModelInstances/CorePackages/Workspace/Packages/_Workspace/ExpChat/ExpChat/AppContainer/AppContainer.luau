local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.RoactRodux);
local v4 = require(l_Parent_0.SharedFlags);
local v5 = require(l_script_FirstAncestor_0.ClientSettings);
local v6 = require(script.Parent.mapStateToProps);
local v7 = require(script.Parent.mapDispatchToProps);
local v8 = require(script.Parent.Parent.BubbleChat);
local v9 = require(script.Parent.Parent.AppLayout);
local v10 = require(l_script_FirstAncestor_0.isChatRegionLocked);
local l_TextChatService_0 = game:GetService("TextChatService");
local v12 = require(l_script_FirstAncestor_0.Flags.getFFlagChatTranslationShowFTUX);
local v13 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatRemoveMessagesFromAppContainer);
local l_getFFlagExpChatAlwaysRunTCS_0 = v4.getFFlagExpChatAlwaysRunTCS;
local l_FFlagExpChatUseMessagesStore_0 = v4.FFlagExpChatUseMessagesStore;
getChatWindowEnabled = function() --[[ Line: 24 ]] --[[ Name: getChatWindowEnabled ]]
    -- upvalues: l_TextChatService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 25 ]]
        -- upvalues: l_TextChatService_0 (ref)
        local l_ChatWindowConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatWindowConfiguration");
        if l_ChatWindowConfiguration_0 ~= nil then
            return l_ChatWindowConfiguration_0.Enabled;
        else
            return false;
        end;
    end);
    return l_status_0 and l_result_0;
end;
getChatTranslationEnabled = function() --[[ Line: 37 ]] --[[ Name: getChatTranslationEnabled ]]
    -- upvalues: l_TextChatService_0 (copy)
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 38 ]]
        -- upvalues: l_TextChatService_0 (ref)
        return l_TextChatService_0.ChatTranslationEnabled;
    end);
    return l_status_1 and l_result_1;
end;
getChatTranslationToggleEnabled = function() --[[ Line: 45 ]] --[[ Name: getChatTranslationToggleEnabled ]]
    -- upvalues: l_TextChatService_0 (copy)
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 46 ]]
        -- upvalues: l_TextChatService_0 (ref)
        return l_TextChatService_0.ChatTranslationToggleEnabled;
    end);
    return l_status_2 and l_result_2;
end;
shouldShowChatTranslationFTUX = function() --[[ Line: 53 ]] --[[ Name: shouldShowChatTranslationFTUX ]]
    -- upvalues: l_TextChatService_0 (copy)
    if game:GetEngineFeature("TextChatServiceSettingsSaved") then
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 55 ]]
            -- upvalues: l_TextChatService_0 (ref)
            return l_TextChatService_0.ChatTranslationFTUXShown;
        end);
        return not (l_status_3 and l_result_3);
    else
        return true;
    end;
end;
local v25 = shouldShowChatTranslationFTUX();
local v26 = require(script.Parent.Parent.ChatTranslationFTUX);
local v27 = v2.PureComponent:extend("AppContainer");
v27.defaultProps = {
    isChatInputBarVisible = true, 
    isChatWindowVisible = true, 
    isChannelBarVisible = false, 
    onSendChat = nil, 
    messages = if v13 then nil else {}, 
    mutedUserIds = nil, 
    textTimer = nil, 
    timer = nil, 
    textChatService = l_TextChatService_0, 
    chat = game:GetService("Chat")
};
local v28 = nil;
v27.init = function(v29) --[[ Line: 85 ]] --[[ Name: init ]]
    v29:setState({
        showTranslationButton = false, 
        isTextChatServiceEnabled = false
    });
end;
v27.willUnmount = function(_) --[[ Line: 92 ]] --[[ Name: willUnmount ]]
    -- upvalues: v28 (ref)
    v28:Disconnect();
end;
v27.didMount = function(v31) --[[ Line: 96 ]] --[[ Name: didMount ]]
    -- upvalues: l_TextChatService_0 (copy), v28 (ref), l_getFFlagExpChatAlwaysRunTCS_0 (copy)
    v31.migrationConnection = v31.props.chat:GetPropertyChangedSignal("IsAutoMigrated"):Connect(function() --[[ Line: 97 ]]
        -- upvalues: v31 (copy)
        if v31.props.chat.IsAutoMigrated then
            v31:setState({
                isTextChatServiceEnabled = true
            });
        end;
    end);
    local function v39(v32) --[[ Line: 105 ]] --[[ Name: onTextChatServicePropertyChanged ]]
        -- upvalues: l_TextChatService_0 (ref), v31 (copy)
        if v32 == "ChatTranslationEnabled" then
            local l_status_4, l_result_4 = pcall(function() --[[ Line: 107 ]]
                -- upvalues: l_TextChatService_0 (ref)
                return l_TextChatService_0.ChatTranslationEnabled;
            end);
            if l_status_4 then
                v31.props.onToggleTranslation(l_result_4);
                v31:setState({
                    showTranslationButton = getChatTranslationEnabled() and getChatTranslationToggleEnabled()
                });
                return;
            end;
        elseif v32 == "ChatTranslationToggleEnabled" then
            local l_status_5, _ = pcall(function() --[[ Line: 119 ]]
                -- upvalues: l_TextChatService_0 (ref)
                return l_TextChatService_0.ChatTranslationToggleEnabled;
            end);
            local l_status_6, l_result_6 = pcall(function() --[[ Line: 123 ]]
                -- upvalues: l_TextChatService_0 (ref)
                return l_TextChatService_0.ChatTranslationEnabled;
            end);
            if l_status_5 then
                if l_status_6 then
                    v31.props.onToggleTranslation(l_result_6);
                end;
                v31:setState({
                    showTranslationButton = getChatTranslationEnabled() and getChatTranslationToggleEnabled()
                });
            end;
        end;
    end;
    if not v28 then
        v28 = l_TextChatService_0.Changed:Connect(v39);
    end;
    local v40 = {
        showTranslationButton = getChatTranslationEnabled() and getChatTranslationToggleEnabled()
    };
    local v41 = true;
    if v31.props.textChatService.ChatVersion ~= Enum.ChatVersion.TextChatService then
        v41 = l_getFFlagExpChatAlwaysRunTCS_0();
    end;
    v40.isTextChatServiceEnabled = v41;
    v31:setState(v40);
end;
v27.render = function(v42) --[[ Line: 151 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v8 (copy), v5 (copy), v9 (copy), l_FFlagExpChatUseMessagesStore_0 (copy), v10 (copy), v13 (copy), v12 (copy), v25 (copy), v26 (copy)
    local l_isTextChatServiceEnabled_0 = v42.state.isTextChatServiceEnabled;
    local v44 = v2.createElement(v8, {
        getIconVoiceIndicator = v42.props.getIconVoiceIndicator, 
        onClickedVoiceIndicator = v42.props.onClickedVoiceIndicator, 
        onClickedCameraIndicator = v42.props.onClickedCameraIndicator, 
        selfViewListenerChanged = v42.props.selfViewListenerChanged, 
        getPermissions = v42.props.getPermissions, 
        displayCameraDeniedToast = v42.props.displayCameraDeniedToast, 
        isCamEnabledForUserAndPlace = v42.props.isCamEnabledForUserAndPlace, 
        isCameraOnlyUser = v42.props.isCameraOnlyUser, 
        isTextChatServiceOn = l_isTextChatServiceEnabled_0, 
        isVoiceServiceInitialized = v42.props.isVoiceServiceInitialized, 
        onClickedLikelySpeakingBubble = v42.props.onClickedLikelySpeakingBubble
    });
    if l_isTextChatServiceEnabled_0 then
        return v2.createElement(v5.Provider, {
            value = v42.props.clientSettings
        }, {
            app = v2.createFragment({
                appLayout = v2.createElement(v9, {
                    canLocalUserChat = if l_FFlagExpChatUseMessagesStore_0 then nil else v42.props.canLocalUserChat, 
                    isChatInputBarVisible = not v10() and v42.props.isChatInputBarVisible, 
                    isChatWindowVisible = v42.props.isChatWindowVisible, 
                    isChannelBarVisible = v42.props.isChannelBarVisible, 
                    chatTopBarVisibility = v42.props.chatTopBarVisibility, 
                    messages = if v13 then nil else v42.props.messages, 
                    mutedUserIds = v42.props.mutedUserIds, 
                    onSendChat = v42.props.onSendChat, 
                    timer = v42.props.timer, 
                    textTimer = v42.props.textTimer, 
                    activateWhisperMode = v42.props.activateWhisperMode, 
                    resetTargetChannel = v42.props.resetTargetChannel, 
                    isTextBoxFocused = v42.props.isTextBoxFocused, 
                    onHovered = v42.props.onHovered, 
                    onUnhovered = v42.props.onUnhovered, 
                    chatLayoutAlignment = v42.props.chatLayoutAlignment, 
                    chatWindowSettings = v42.props.chatWindowSettings, 
                    clientSettings = v42.props.clientSettings, 
                    showTranslationButton = v42.state.showTranslationButton, 
                    isSpatialUIEnabled = v42.props.isSpatialUIEnabled
                }), 
                bubbleChat = v44, 
                ChatTranslationFTUX = if v12() and v25 and getChatTranslationEnabled() and getChatWindowEnabled() then v2.createElement(v26, {}) else nil
            })
        });
    else
        return v2.createElement(v5.Provider, {
            value = v42.props.clientSettings
        }, {
            bubbleChat = v44
        });
    end;
end;
return v3.connect(v6, v7)(v27);