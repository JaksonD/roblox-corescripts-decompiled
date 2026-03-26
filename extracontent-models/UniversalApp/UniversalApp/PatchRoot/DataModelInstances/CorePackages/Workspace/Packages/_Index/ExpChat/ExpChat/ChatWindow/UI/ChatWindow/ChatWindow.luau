local l_TextChatService_0 = game:GetService("TextChatService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.SignalsReact);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_List_0 = require(l_Parent_0.llama).List;
local v7 = require(l_script_FirstAncestor_0.Config);
local v8 = require(l_script_FirstAncestor_0.ClientSettings.useInterpolatedClientSettings);
local v9 = require(l_script_FirstAncestor_0.Stores.GetChatStatusStore);
local v10 = require(l_script_FirstAncestor_0.Stores.GetMessagesStore);
local l_script_FirstAncestor_1 = script:FindFirstAncestor("UI");
local v12 = require(l_script_FirstAncestor_1.ScrollingView);
local v13 = require(l_script_FirstAncestor_1.HiddenMessage);
local v14 = require(l_script_FirstAncestor_1.TranslatedTextMessage);
local v15 = require(l_script_FirstAncestor_1.TopBanner);
local v16 = require(l_script_FirstAncestor_0.isChatRegionLocked);
local v17 = require(l_script_FirstAncestor_0.showChatEnabledUI);
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local v19 = require(l_Parent_0.UserProfiles).Stores.VerifiedBadgeDisplayStore.get();
local l_FStringReportingIXPLayer_0 = require(l_Parent_0.SharedFlags).FStringReportingIXPLayer;
local l_GetFFlagEnableChatLineReporting_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableChatLineReporting;
local l_GetFFlagMemoizeChatReportingMenu_0 = require(l_Parent_0.SharedFlags).GetFFlagMemoizeChatReportingMenu;
local v23 = require(l_script_FirstAncestor_0.Flags.getFFlagChatWindowUseCallbackOptimizations);
local v24 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableV2ChatWindow);
local v25 = require(l_script_FirstAncestor_0.Flags.FFlagAEGIS2EnableGatesForExpChat);
local l_FFlagEnableVerifiedBadgeStore_0 = require(l_Parent_0.SharedFlags).FFlagEnableVerifiedBadgeStore;
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableInExpChatRewrite");
local v28 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableNewBottomLockedScrollView);
local l_ExpChatNewHiddenMessagesExperimentation_0 = require(l_Parent_0.SocialExperiments).ExpChatNewHiddenMessagesExperimentation;
local l_FFlagExpChatPerfTracking_0 = require(l_Parent_0.SharedFlags).FFlagExpChatPerfTracking;
local v31 = require(l_script_FirstAncestor_0.Telemetry.ExpChatPerfTracker);
local v32 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatRewriteInline);
local v33 = {
    LayoutOrder = 1, 
    size = UDim2.fromScale(1, 1), 
    messages = if v24 then nil else {}, 
    transparencyValue = if l_GetFFlagMemoizeChatReportingMenu_0() then v3.createBinding(v7.ChatWindowBackgroundTransparency) else v7.ChatWindowBackgroundTransparency, 
    textTransparency = v3.createBinding(0), 
    mutedUserIds = {}, 
    verifiedUserIds = {}, 
    showTranslationButton = false
};
return (v3.memo(function(v34) --[[ Line: 59 ]]
    -- upvalues: l_Dictionary_0 (copy), v33 (copy), v8 (copy), v25 (copy), v9 (copy), v4 (copy), v17 (copy), l_GetFFlagMemoizeChatReportingMenu_0 (copy), v24 (copy), v3 (copy), v10 (copy), l_List_0 (copy), l_GetFFlagEnableChatLineReporting_0 (copy), l_useUserExperiment_0 (copy), l_FStringReportingIXPLayer_0 (copy), v23 (copy), l_FFlagEnableVerifiedBadgeStore_0 (copy), v19 (copy), l_ExpChatNewHiddenMessagesExperimentation_0 (copy), v13 (copy), v14 (copy), l_game_EngineFeature_0 (copy), v32 (copy), v28 (copy), l_FFlagExpChatPerfTracking_0 (copy), v31 (copy), l_TextChatService_0 (copy), v7 (copy), v16 (copy), v15 (copy), v12 (copy)
    local v35 = l_Dictionary_0.join(v33, v34);
    local l_chatWindowSettings_0 = v35.chatWindowSettings;
    local l_BackgroundTransparency_0 = v8(l_chatWindowSettings_0).BackgroundTransparency;
    local l_BackgroundColor3_0 = v8(l_chatWindowSettings_0).BackgroundColor3;
    local v39 = nil;
    local v40 = nil;
    local v41 = true;
    if v25 then
        v40 = v9(false);
        v39 = v4.useSignalState(v40.getChatStatus);
        v41 = v17(v39);
    end;
    local v42 = nil;
    local v43 = nil;
    if l_GetFFlagMemoizeChatReportingMenu_0() and not v24 then
        v43 = v3.useRef(if v24 then nil else v35.messages);
        v3.useEffect(function() --[[ Line: 78 ]]
            -- upvalues: v43 (ref), v24 (ref), v35 (copy)
            v43.current = if v24 then nil else v35.messages;
        end, {
            if v24 then nil else v35.messages
        });
        v42 = v3.useCallback(function() --[[ Line: 82 ]]
            -- upvalues: v43 (ref)
            return v43.current;
        end, {});
    end;
    if v24 then
        v42 = v3.useCallback(function() --[[ Line: 88 ]]
            -- upvalues: v10 (ref), v35 (copy), l_List_0 (ref)
            local v44 = v10(false);
            local v45 = {
                windowMessagesInOrderByTabId = v44.getWindowMessagesInOrderByTabId(false), 
                byMessageId = v44.getByMessageId(false), 
                windowMessagesInOrder = v44.getWindowMessagesInOrder(false)
            };
            if not v35.isChannelBarVisible then
                return l_List_0.map(v45.windowMessagesInOrder, function(v46) --[[ Line: 97 ]]
                    -- upvalues: v45 (copy)
                    return v45.byMessageId[v46];
                end);
            elseif v35.targetTextChannel then
                return l_List_0.map(v45.windowMessagesInOrderByTabId[v35.targetTextChannel.Name] or {}, function(v47) --[[ Line: 104 ]]
                    -- upvalues: v45 (copy)
                    return v45.byMessageId[v47];
                end);
            else
                return {};
            end;
        end, {
            v35.isChannelBarVisible, 
            v35.targetTextChannel
        });
    end;
    local v49 = if l_GetFFlagEnableChatLineReporting_0() then l_useUserExperiment_0({
        l_FStringReportingIXPLayer_0
    }, function(v48) --[[ Line: 116 ]]
        -- upvalues: l_FStringReportingIXPLayer_0 (ref)
        return (v48[l_FStringReportingIXPLayer_0] or {}).EnableChatLineReporting;
    end) else false;
    local v53 = v3.useCallback(function(v50, v51) --[[ Line: 122 ]]
        -- upvalues: v35 (copy)
        if type(v51) == "number" then
            return v35.transparencyValue;
        else
            return v51:map(function(v52) --[[ Line: 127 ]]
                -- upvalues: v50 (copy)
                return v50 + v52 * (1 - v50);
            end);
        end;
    end, if v23() then {
        v35.transparencyValue
    } else nil);
    local v56 = v3.useCallback(function(v54) --[[ Line: 133 ]]
        -- upvalues: v35 (copy)
        v35.resetTargetChannel();
        local v55 = tonumber(v54.userId);
        if v55 then
            v35.activateWhisperMode(v55);
        end;
    end, if v23() then {
        v35.resetTargetChannel, 
        v35.activateWhisperMode
    } else nil);
    local v62 = if v24 then nil else v3.useCallback(function(v57) --[[ Line: 149 ]]
        -- upvalues: l_Dictionary_0 (ref), l_FFlagEnableVerifiedBadgeStore_0 (ref), v19 (ref), v35 (copy), l_ExpChatNewHiddenMessagesExperimentation_0 (ref), v3 (ref), v13 (ref), v14 (ref), l_game_EngineFeature_0 (ref), v56 (copy), v32 (ref), v28 (ref)
        local v61 = l_Dictionary_0.map(v57, function(v58, v59) --[[ Line: 150 ]]
            -- upvalues: l_FFlagEnableVerifiedBadgeStore_0 (ref), v19 (ref), l_Dictionary_0 (ref), v35 (ref), l_ExpChatNewHiddenMessagesExperimentation_0 (ref), v3 (ref), v13 (ref), v14 (ref), l_game_EngineFeature_0 (ref), v56 (ref), v32 (ref)
            if v58.isVisibleInChatWindow then
                local v60 = nil;
                v60 = if l_FFlagEnableVerifiedBadgeStore_0 then if v58.userId then v19.isBadgeVisible((tonumber(v58.userId))) else false else if v58.userId then l_Dictionary_0.has(v35.verifiedUserIds, v58.userId) else false;
                if l_ExpChatNewHiddenMessagesExperimentation_0.getExpChatHiddenMessagesNewDesignEnabled() and v58.isHiddenMessage then
                    return v3.createElement(v13, {
                        chatWindowSettings = v35.chatWindowSettings, 
                        isSpatialUIEnabled = v35.isSpatialUIEnabled, 
                        LayoutOrder = v59, 
                        message = v58, 
                        textTransparency = v35.textTransparency
                    });
                else
                    return v3.createElement(v14, {
                        message = v58, 
                        LayoutOrder = v59, 
                        isUserVerified = v60, 
                        textTransparency = v35.textTransparency, 
                        transparencyValue = if l_game_EngineFeature_0 then v35.transparencyValue else nil, 
                        onTextMessageLabelButtonActivated = v56, 
                        chatWindowSettings = v35.chatWindowSettings, 
                        showTranslationButton = v35.showTranslationButton, 
                        isSpatialUIEnabled = v35.isSpatialUIEnabled, 
                        onToggle = function() --[[ Line: 184 ]] --[[ Name: onToggle ]]

                        end, 
                        chatWindowTransparencyBindingOrValue = if v32 then v35.transparencyValue else nil
                    }), v58.messageId;
                end;
            else
                return nil, nil;
            end;
        end);
        v61["$layout"] = v3.createElement("UIListLayout", {
            Padding = if v28 then nil else UDim.new(0, 4), 
            SortOrder = Enum.SortOrder.LayoutOrder
        });
        return v61;
    end, if v23() then {
        v35.messages, 
        v35.textTransparency, 
        v35.verifiedUserIds, 
        v35.chatWindowSettings, 
        v35.showTranslationButton
    } else nil);
    if l_FFlagExpChatPerfTracking_0 then
        local v63 = if v35.targetTextChannel then v35.targetTextChannel.Name else "UNKNOWN_TAB";
        v3.useEffect(function() --[[ Line: 218 ]]
            -- upvalues: v31 (ref)
            v31.finish(v31.Events.ChatWindowMountTTI, {});
            return function() --[[ Line: 220 ]]
                -- upvalues: v31 (ref)
                v31.cancelAll();
            end;
        end, {});
        local l_v63_0 = v63 --[[ copy: 14 -> 15 ]];
        v3.useEffect(function() --[[ Line: 224 ]]
            -- upvalues: v31 (ref), l_v63_0 (copy)
            v31.finish(v31.Events.ChatWindowTabSwitchTTI, {
                tabId = l_v63_0
            });
        end, {
            v63
        });
    end;
    local v65 = {};
    if v24 then
        v65 = {
            showTranslationButton = v35.showTranslationButton, 
            chatWindowSettings = v35.chatWindowSettings, 
            textTransparency = v35.textTransparency, 
            onTextMessageLabelButtonActivated = v56, 
            isSpatialUIEnabled = v35.isSpatialUIEnabled
        };
    end;
    return v3.createElement("Frame", {
        BackgroundColor3 = l_BackgroundColor3_0, 
        BorderSizePixel = 0, 
        LayoutOrder = v35.LayoutOrder, 
        Size = v35.size, 
        Visible = v35.visible, 
        BackgroundTransparency = v53(l_BackgroundTransparency_0, v35.transparencyValue), 
        [v3.Event.MouseEnter] = v35.onHovered, 
        [v3.Event.MouseLeave] = v35.onUnhovered, 
        [v3.Change.AbsoluteSize] = if v23() then v3.useCallback(function(v66) --[[ Line: 252 ]]
            -- upvalues: l_TextChatService_0 (ref), v35 (copy)
            local l_ChatWindowConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatWindowConfiguration");
            if l_ChatWindowConfiguration_0 and v35.onAbsoluteSizeChanged then
                v35.onAbsoluteSizeChanged(v66, l_ChatWindowConfiguration_0);
            end;
        end, {
            l_TextChatService_0, 
            v35.onAbsoluteSizeChanged
        }) else function(v68) --[[ Line: 258 ]]
            -- upvalues: l_TextChatService_0 (ref), v35 (copy)
            local l_ChatWindowConfiguration_1 = l_TextChatService_0:FindFirstChildOfClass("ChatWindowConfiguration");
            if l_ChatWindowConfiguration_1 and v35.onAbsoluteSizeChanged then
                v35.onAbsoluteSizeChanged(v68, l_ChatWindowConfiguration_1);
            end;
        end, 
        [v3.Change.AbsolutePosition] = if v23() then v3.useCallback(function(v70) --[[ Line: 265 ]]
            -- upvalues: l_TextChatService_0 (ref), v35 (copy)
            local l_ChatWindowConfiguration_2 = l_TextChatService_0:FindFirstChildOfClass("ChatWindowConfiguration");
            if l_ChatWindowConfiguration_2 and v35.onAbsoluteSizeChanged then
                v35.onAbsolutePositionChanged(v70, l_ChatWindowConfiguration_2);
            end;
        end, {
            l_TextChatService_0, 
            v35.onAbsolutePositionChanged
        }) else function(v72) --[[ Line: 271 ]]
            -- upvalues: l_TextChatService_0 (ref), v35 (copy)
            local l_ChatWindowConfiguration_3 = l_TextChatService_0:FindFirstChildOfClass("ChatWindowConfiguration");
            if l_ChatWindowConfiguration_3 and v35.onAbsoluteSizeChanged then
                v35.onAbsolutePositionChanged(v72, l_ChatWindowConfiguration_3);
            end;
        end
    }, {
        uiSizeConstraint = v3.createElement("UISizeConstraint", {
            MaxSize = if v35.isSpatialUIEnabled then Vector2.new(1e999, 400) else Vector2.new(v7.ChatWindowMaxWidth, v7.ChatWindowMaxHeight)
        }), 
        TopBanner = if not v16() and v41 and v49 then v3.createElement(v15, {
            backgroundColor3 = l_BackgroundColor3_0, 
            backgroundTransparency = l_BackgroundTransparency_0, 
            iconTransparency = if l_GetFFlagMemoizeChatReportingMenu_0() then v35.transparencyValue else v53(l_BackgroundTransparency_0, v35.transparencyValue), 
            onFocus = v35.onFocus, 
            onUnfocus = v35.onUnfocus, 
            getMessages = if l_GetFFlagMemoizeChatReportingMenu_0() then v42 else nil, 
            messages = if not l_GetFFlagMemoizeChatReportingMenu_0() then v35.messages else nil
        }) else nil, 
        scrollingView = v3.createElement(v12, l_Dictionary_0.join({
            size = v35.size, 
            messages = if v28 then nil else v35.messages, 
            targetTextChannel = v35.targetTextChannel, 
            isChannelBarVisible = v35.isChannelBarVisible
        }, v65), if v24 then nil else v62(v35.messages))
    });
end));