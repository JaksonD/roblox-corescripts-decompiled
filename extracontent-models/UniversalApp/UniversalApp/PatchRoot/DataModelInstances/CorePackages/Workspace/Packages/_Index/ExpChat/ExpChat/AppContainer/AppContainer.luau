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
local l_getFFlagExpChatAlwaysRunTCS_0 = v4.getFFlagExpChatAlwaysRunTCS;
local l_FFlagExpChatUseMessagesStore_0 = v4.FFlagExpChatUseMessagesStore;
getChatWindowEnabled = function() --[[ Line: 22 ]] --[[ Name: getChatWindowEnabled ]]
    -- upvalues: l_TextChatService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 23 ]]
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
getChatTranslationEnabled = function() --[[ Line: 35 ]] --[[ Name: getChatTranslationEnabled ]]
    -- upvalues: l_TextChatService_0 (copy)
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 36 ]]
        -- upvalues: l_TextChatService_0 (ref)
        return l_TextChatService_0.ChatTranslationEnabled;
    end);
    return l_status_1 and l_result_1;
end;
getChatTranslationToggleEnabled = function() --[[ Line: 43 ]] --[[ Name: getChatTranslationToggleEnabled ]]
    -- upvalues: l_TextChatService_0 (copy)
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 44 ]]
        -- upvalues: l_TextChatService_0 (ref)
        return l_TextChatService_0.ChatTranslationToggleEnabled;
    end);
    return l_status_2 and l_result_2;
end;
shouldShowChatTranslationFTUX = function() --[[ Line: 51 ]] --[[ Name: shouldShowChatTranslationFTUX ]]
    -- upvalues: l_TextChatService_0 (copy)
    if game:GetEngineFeature("TextChatServiceSettingsSaved") then
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 53 ]]
            -- upvalues: l_TextChatService_0 (ref)
            return l_TextChatService_0.ChatTranslationFTUXShown;
        end);
        return not (l_status_3 and l_result_3);
    else
        return true;
    end;
end;
local v24 = shouldShowChatTranslationFTUX();
local v25 = require(script.Parent.Parent.ChatTranslationFTUX);
local v26 = v2.PureComponent:extend("AppContainer");
v26.defaultProps = {
    isChatInputBarVisible = true, 
    isChatWindowVisible = true, 
    isChannelBarVisible = false, 
    onSendChat = nil, 
    onSendGlobalChat = nil, 
    mutedUserIds = nil, 
    textTimer = nil, 
    timer = nil, 
    textChatService = l_TextChatService_0, 
    chat = game:GetService("Chat")
};
local v27 = nil;
v26.init = function(v28) --[[ Line: 83 ]] --[[ Name: init ]]
    v28:setState({
        showTranslationButton = false, 
        isTextChatServiceEnabled = false
    });
end;
v26.willUnmount = function(_) --[[ Line: 90 ]] --[[ Name: willUnmount ]]
    -- upvalues: v27 (ref)
    v27:Disconnect();
end;
v26.didMount = function(v30) --[[ Line: 94 ]] --[[ Name: didMount ]]
    -- upvalues: l_TextChatService_0 (copy), v27 (ref), l_getFFlagExpChatAlwaysRunTCS_0 (copy)
    v30.migrationConnection = v30.props.chat:GetPropertyChangedSignal("IsAutoMigrated"):Connect(function() --[[ Line: 95 ]]
        -- upvalues: v30 (copy)
        if v30.props.chat.IsAutoMigrated then
            v30:setState({
                isTextChatServiceEnabled = true
            });
        end;
    end);
    local function v38(v31) --[[ Line: 103 ]] --[[ Name: onTextChatServicePropertyChanged ]]
        -- upvalues: l_TextChatService_0 (ref), v30 (copy)
        if v31 == "ChatTranslationEnabled" then
            local l_status_4, l_result_4 = pcall(function() --[[ Line: 105 ]]
                -- upvalues: l_TextChatService_0 (ref)
                return l_TextChatService_0.ChatTranslationEnabled;
            end);
            if l_status_4 then
                v30.props.onToggleTranslation(l_result_4);
                v30:setState({
                    showTranslationButton = getChatTranslationEnabled() and getChatTranslationToggleEnabled()
                });
                return;
            end;
        elseif v31 == "ChatTranslationToggleEnabled" then
            local l_status_5, _ = pcall(function() --[[ Line: 117 ]]
                -- upvalues: l_TextChatService_0 (ref)
                return l_TextChatService_0.ChatTranslationToggleEnabled;
            end);
            local l_status_6, l_result_6 = pcall(function() --[[ Line: 121 ]]
                -- upvalues: l_TextChatService_0 (ref)
                return l_TextChatService_0.ChatTranslationEnabled;
            end);
            if l_status_5 then
                if l_status_6 then
                    v30.props.onToggleTranslation(l_result_6);
                end;
                v30:setState({
                    showTranslationButton = getChatTranslationEnabled() and getChatTranslationToggleEnabled()
                });
            end;
        end;
    end;
    if not v27 then
        v27 = l_TextChatService_0.Changed:Connect(v38);
    end;
    local v39 = {
        showTranslationButton = getChatTranslationEnabled() and getChatTranslationToggleEnabled()
    };
    local v40 = true;
    if v30.props.textChatService.ChatVersion ~= Enum.ChatVersion.TextChatService then
        v40 = l_getFFlagExpChatAlwaysRunTCS_0();
    end;
    v39.isTextChatServiceEnabled = v40;
    v30:setState(v39);
end;
v26.render = function(v41) --[[ Line: 149 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v8 (copy), v5 (copy), v9 (copy), l_FFlagExpChatUseMessagesStore_0 (copy), v10 (copy), v12 (copy), v24 (copy), v25 (copy)
    local l_isTextChatServiceEnabled_0 = v41.state.isTextChatServiceEnabled;
    local v43 = v2.createElement(v8, {
        getIconVoiceIndicator = v41.props.getIconVoiceIndicator, 
        onClickedVoiceIndicator = v41.props.onClickedVoiceIndicator, 
        onClickedCameraIndicator = v41.props.onClickedCameraIndicator, 
        selfViewListenerChanged = v41.props.selfViewListenerChanged, 
        getPermissions = v41.props.getPermissions, 
        displayCameraDeniedToast = v41.props.displayCameraDeniedToast, 
        isCamEnabledForUserAndPlace = v41.props.isCamEnabledForUserAndPlace, 
        isCameraOnlyUser = v41.props.isCameraOnlyUser, 
        isTextChatServiceOn = l_isTextChatServiceEnabled_0, 
        isVoiceServiceInitialized = v41.props.isVoiceServiceInitialized, 
        onClickedLikelySpeakingBubble = v41.props.onClickedLikelySpeakingBubble
    });
    if l_isTextChatServiceEnabled_0 then
        return v2.createElement(v5.Provider, {
            value = v41.props.clientSettings
        }, {
            app = v2.createFragment({
                appLayout = v2.createElement(v9, {
                    canLocalUserChat = if l_FFlagExpChatUseMessagesStore_0 then nil else v41.props.canLocalUserChat, 
                    isChatInputBarVisible = not v10() and v41.props.isChatInputBarVisible, 
                    isChatWindowVisible = v41.props.isChatWindowVisible, 
                    isChannelBarVisible = v41.props.isChannelBarVisible, 
                    chatTopBarVisibility = v41.props.chatTopBarVisibility, 
                    mutedUserIds = v41.props.mutedUserIds, 
                    onSendChat = v41.props.onSendChat, 
                    onSendGlobalChat = v41.props.onSendGlobalChat, 
                    timer = v41.props.timer, 
                    textTimer = v41.props.textTimer, 
                    activateWhisperMode = v41.props.activateWhisperMode, 
                    resetTargetChannel = v41.props.resetTargetChannel, 
                    isTextBoxFocused = v41.props.isTextBoxFocused, 
                    onHovered = v41.props.onHovered, 
                    onUnhovered = v41.props.onUnhovered, 
                    chatLayoutAlignment = v41.props.chatLayoutAlignment, 
                    chatWindowSettings = v41.props.chatWindowSettings, 
                    clientSettings = v41.props.clientSettings, 
                    showTranslationButton = v41.state.showTranslationButton, 
                    isSpatialUIEnabled = v41.props.isSpatialUIEnabled
                }), 
                bubbleChat = v43, 
                ChatTranslationFTUX = if v12() and v24 and getChatTranslationEnabled() and getChatWindowEnabled() then v2.createElement(v25, {}) else nil
            })
        });
    else
        return v2.createElement(v5.Provider, {
            value = v41.props.clientSettings
        }, {
            bubbleChat = v43
        });
    end;
end;
return v3.connect(v6, v7)(v26);