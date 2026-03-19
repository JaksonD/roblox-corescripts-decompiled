local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Signals);
local v4 = require(l_Parent_0.SignalsReact);
local v5 = require(l_script_FirstAncestor_0.ChatWindow.UI.TranslatedTextMessageV2);
local v6 = require(l_script_FirstAncestor_0.Config);
local function v7() --[[ Line: 11 ]]

end;
return function(v8) --[[ Line: 37 ]] --[[ Name: useV2MessagePool ]]
    -- upvalues: v4 (copy), v2 (copy), v6 (copy), v3 (copy), v5 (copy), v7 (copy)
    local l_messagesStore_0 = v8.messagesStore;
    local l_enabled_0 = v8.enabled;
    local v11 = v4.useSignalState(l_messagesStore_0.getWindowMessageAddedCount);
    local v13 = v2.useMemo(function() --[[ Line: 45 ]]
        -- upvalues: v6 (ref), v8 (copy)
        local l_DefaultChatWindowMessagePropertiesInstanceSettings_0 = v6.DefaultChatWindowMessagePropertiesInstanceSettings;
        return {
            FontFace = v8.chatWindowSettings.FontFace or l_DefaultChatWindowMessagePropertiesInstanceSettings_0.FontFace, 
            TextSize = v8.chatWindowSettings.TextSize or l_DefaultChatWindowMessagePropertiesInstanceSettings_0.TextSize, 
            TextColor3 = v8.chatWindowSettings.TextColor3 or l_DefaultChatWindowMessagePropertiesInstanceSettings_0.TextColor3, 
            TextStrokeColor3 = v8.chatWindowSettings.TextStrokeColor3 or l_DefaultChatWindowMessagePropertiesInstanceSettings_0.TextStrokeColor3, 
            TextStrokeTransparency = v8.chatWindowSettings.TextStrokeTransparency or l_DefaultChatWindowMessagePropertiesInstanceSettings_0.TextStrokeTransparency
        };
    end, {
        v8.chatWindowSettings
    });
    local v14, v15 = v2.useBinding(v13);
    v2.useEffect(function() --[[ Line: 58 ]]
        -- upvalues: v15 (copy), v13 (copy)
        v15(v13);
    end, {
        v13
    });
    local v16 = v2.useBinding(false);
    local v17 = v2.useRef(nil);
    if not v17.current then
        local v18 = {};
        for v19 = 1, 50 do
            local v20, v21 = v2.createBinding("");
            local v22, v23 = v2.createBinding("");
            local v24, v25 = v2.createBinding(false);
            local v26, v27 = v2.createBinding(0);
            local v28, v29 = v2.createBinding(false);
            v18[v19] = {
                bodyText = v20, 
                setBodyText = v21, 
                prefixText = v22, 
                setPrefixText = v23, 
                shouldShowTranslation = v24, 
                setShowTranslation = v25, 
                layoutOrder = v26, 
                setLayoutOrder = v27, 
                visible = v28, 
                setVisible = v29, 
                userId = {
                    current = 0
                }, 
                useTranslation = {
                    current = false
                }, 
                messageId = {
                    current = ""
                }
            };
        end;
        v17.current = v18;
    end;
    v2.useEffect(function() --[[ Line: 95 ]]
        -- upvalues: l_enabled_0 (copy), v17 (copy), l_messagesStore_0 (copy), v3 (ref), v8 (copy)
        if not l_enabled_0 then
            return function() --[[ Line: 97 ]]

            end;
        else
            local v30 = {};
            for v31 = 1, 50 do
                local v32 = "msg-component-" .. v31;
                local v33 = v17.current[v31];
                local v34 = l_messagesStore_0.registerMessageComponent(v32);
                local v35 = l_messagesStore_0.getLayoutOrderSignal(v32);
                local v41 = v3.createEffect(function(v36) --[[ Line: 108 ]]
                    -- upvalues: v34 (copy), l_messagesStore_0 (ref), v33 (copy)
                    local v37 = v34(v36);
                    if v37 then
                        local v38 = l_messagesStore_0.getMessage(v37)(v36);
                        if v38 then
                            v33.setBodyText(v38.text or "");
                            v33.setPrefixText(v38.prefixText or "");
                            local l_setShowTranslation_0 = v33.setShowTranslation;
                            local v40 = false;
                            if v38.translation ~= nil then
                                v40 = v38.translation ~= "";
                            end;
                            l_setShowTranslation_0(v40);
                            v33.setVisible(true);
                            v33.userId.current = v38.userId or 0;
                            v33.useTranslation.current = v38.useTranslation or false;
                            v33.messageId.current = v38.messageId;
                            return;
                        end;
                    else
                        v33.setVisible(false);
                    end;
                end);
                local v43 = if v35 then v3.createEffect(function(v42) --[[ Line: 128 ]]
                    -- upvalues: v33 (copy), v35 (copy)
                    v33.setLayoutOrder(v35(v42));
                end) else nil;
                table.insert(v30, {
                    cleanupMsg = v41, 
                    cleanupLayout = v43, 
                    componentId = v32
                });
            end;
            local v44 = if v8.isChannelBarVisible and v8.targetTextChannel then v8.targetTextChannel.Name else nil;
            l_messagesStore_0.setActiveChannelFilter(v44);
            l_messagesStore_0.repopulateMessageComponents();
            return function() --[[ Line: 148 ]]
                -- upvalues: v30 (copy), l_messagesStore_0 (ref)
                for _, v46 in ipairs(v30) do
                    if v46.cleanupMsg then
                        pcall(v46.cleanupMsg);
                    end;
                    if v46.cleanupLayout then
                        pcall(v46.cleanupLayout);
                    end;
                    l_messagesStore_0.unregisterMessageComponent(v46.componentId);
                end;
            end;
        end;
    end, {});
    local v47 = v2.useRef(false);
    v2.useEffect(function() --[[ Line: 163 ]]
        -- upvalues: l_enabled_0 (copy), v47 (copy), v8 (copy), l_messagesStore_0 (copy)
        if not l_enabled_0 then
            v47.current = false;
            return;
        elseif not v47.current then
            v47.current = true;
            return;
        else
            local v48 = if v8.isChannelBarVisible and v8.targetTextChannel then v8.targetTextChannel.Name else nil;
            l_messagesStore_0.setActiveChannelFilter(v48);
            l_messagesStore_0.repopulateMessageComponents();
            return;
        end;
    end, {
        l_enabled_0, 
        v8.targetTextChannel, 
        v8.isChannelBarVisible
    });
    return {
        children = v2.useMemo(function() --[[ Line: 180 ]]
            -- upvalues: l_enabled_0 (copy), v17 (copy), v2 (ref), v5 (ref), v14 (copy), v8 (copy), v16 (copy), v7 (ref)
            if not l_enabled_0 then
                return nil;
            else
                local v49 = {};
                for v50 = 1, 50 do
                    local v51 = "msg-component-" .. v50;
                    local v52 = v17.current[v50];
                    v49[v51] = v2.createElement(v5, {
                        originalBodyText = v52.bodyText, 
                        originalPrefixText = v52.prefixText, 
                        shouldShowTranslationToggle = v52.shouldShowTranslation, 
                        bodyTextProperties = v14, 
                        prefixTextProperties = v14, 
                        layoutOrder = v52.layoutOrder, 
                        visible = v52.visible, 
                        textTransparency = v8.textTransparency, 
                        isUserVerified = v16, 
                        userId = v52.userId, 
                        useTranslation = v52.useTranslation, 
                        messageId = v52.messageId, 
                        isSpatialUIEnabled = v8.isSpatialUIEnabled, 
                        chatWindowSettings = v8.chatWindowSettings, 
                        onTextMessageLabelButtonActivated = v8.onTextMessageLabelButtonActivated or v7, 
                        onToggle = v8.onToggle or v7
                    });
                end;
                v49["$layout"] = v2.createElement("UIListLayout", {
                    Padding = UDim.new(0, 4), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                });
                return v49;
            end;
        end, {
            l_enabled_0, 
            v8.textTransparency, 
            v8.isSpatialUIEnabled, 
            v8.chatWindowSettings, 
            v8.onTextMessageLabelButtonActivated, 
            v8.onToggle
        }), 
        windowMessageAddedCount = v11
    };
end;