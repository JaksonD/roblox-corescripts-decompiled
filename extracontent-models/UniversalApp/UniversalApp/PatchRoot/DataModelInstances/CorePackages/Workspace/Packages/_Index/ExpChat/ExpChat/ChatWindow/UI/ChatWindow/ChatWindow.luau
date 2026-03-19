local l_TextChatService_0 = game:GetService("TextChatService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.SignalsReact);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v6 = require(l_script_FirstAncestor_0.Config);
local v7 = require(l_script_FirstAncestor_0.ClientSettings.useInterpolatedClientSettings);
local v8 = require(l_script_FirstAncestor_0.Stores.GetChatStatusStore);
local l_script_FirstAncestor_1 = script:FindFirstAncestor("UI");
local v10 = require(l_script_FirstAncestor_1.ScrollingView);
local v11 = require(l_script_FirstAncestor_1.HiddenMessage);
local v12 = require(l_script_FirstAncestor_1.TranslatedTextMessage);
local v13 = require(l_script_FirstAncestor_1.TopBanner);
local v14 = require(l_script_FirstAncestor_0.isChatRegionLocked);
local v15 = require(l_script_FirstAncestor_0.showChatEnabledUI);
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local v17 = require(l_Parent_0.UserProfiles).Stores.VerifiedBadgeDisplayStore.get();
local l_FStringReportingIXPLayer_0 = require(l_Parent_0.SharedFlags).FStringReportingIXPLayer;
local l_GetFFlagEnableChatLineReporting_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableChatLineReporting;
local l_GetFFlagMemoizeChatReportingMenu_0 = require(l_Parent_0.SharedFlags).GetFFlagMemoizeChatReportingMenu;
local v21 = require(l_script_FirstAncestor_0.Flags.getFFlagChatWindowUseCallbackOptimizations);
local v22 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableV2ChatWindow);
local v23 = require(l_script_FirstAncestor_0.Flags.FFlagAEGIS2EnableGatesForExpChat);
local l_FFlagEnableVerifiedBadgeStore_0 = require(l_Parent_0.SharedFlags).FFlagEnableVerifiedBadgeStore;
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableInExpChatRewrite");
local v26 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableNewBottomLockedScrollView);
local l_ExpChatNewHiddenMessagesExperimentation_0 = require(l_Parent_0.SocialExperiments).ExpChatNewHiddenMessagesExperimentation;
local l_FFlagExpChatPerfTracking_0 = require(l_Parent_0.SharedFlags).FFlagExpChatPerfTracking;
local v29 = require(l_script_FirstAncestor_0.Telemetry.ExpChatPerfTracker);
local v30 = {
    LayoutOrder = 1, 
    size = UDim2.fromScale(1, 1), 
    messages = if v22 then nil else {}, 
    transparencyValue = if l_GetFFlagMemoizeChatReportingMenu_0() then v3.createBinding(v6.ChatWindowBackgroundTransparency) else v6.ChatWindowBackgroundTransparency, 
    textTransparency = v3.createBinding(0), 
    mutedUserIds = {}, 
    verifiedUserIds = {}, 
    showTranslationButton = false
};
return (v3.memo(function(v31) --[[ Line: 56 ]]
    -- upvalues: l_Dictionary_0 (copy), v30 (copy), v7 (copy), v23 (copy), v8 (copy), v4 (copy), v15 (copy), l_GetFFlagMemoizeChatReportingMenu_0 (copy), v3 (copy), v22 (copy), l_GetFFlagEnableChatLineReporting_0 (copy), l_useUserExperiment_0 (copy), l_FStringReportingIXPLayer_0 (copy), v21 (copy), l_FFlagEnableVerifiedBadgeStore_0 (copy), v17 (copy), l_ExpChatNewHiddenMessagesExperimentation_0 (copy), v11 (copy), v12 (copy), l_game_EngineFeature_0 (copy), v26 (copy), l_FFlagExpChatPerfTracking_0 (copy), v29 (copy), l_TextChatService_0 (copy), v6 (copy), v14 (copy), v13 (copy), v10 (copy)
    local v32 = l_Dictionary_0.join(v30, v31);
    local l_chatWindowSettings_0 = v32.chatWindowSettings;
    local l_BackgroundTransparency_0 = v7(l_chatWindowSettings_0).BackgroundTransparency;
    local l_BackgroundColor3_0 = v7(l_chatWindowSettings_0).BackgroundColor3;
    local v36 = nil;
    local v37 = nil;
    local v38 = true;
    if v23 then
        v37 = v8(false);
        v36 = v4.useSignalState(v37.getChatStatus);
        v38 = v15(v36);
    end;
    local v39 = nil;
    local v40 = nil;
    if l_GetFFlagMemoizeChatReportingMenu_0() then
        v40 = v3.useRef(if v22 then nil else v32.messages);
        v3.useEffect(function() --[[ Line: 76 ]]
            -- upvalues: v40 (ref), v22 (ref), v32 (copy)
            v40.current = if v22 then nil else v32.messages;
        end, {
            if v22 then nil else v32.messages
        });
        v39 = v3.useCallback(function() --[[ Line: 80 ]]
            -- upvalues: v40 (ref)
            return v40.current;
        end, {});
    end;
    local v42 = if l_GetFFlagEnableChatLineReporting_0() then l_useUserExperiment_0({
        l_FStringReportingIXPLayer_0
    }, function(v41) --[[ Line: 86 ]]
        -- upvalues: l_FStringReportingIXPLayer_0 (ref)
        return (v41[l_FStringReportingIXPLayer_0] or {}).EnableChatLineReporting;
    end) else false;
    local v46 = v3.useCallback(function(v43, v44) --[[ Line: 92 ]]
        -- upvalues: v32 (copy)
        if type(v44) == "number" then
            return v32.transparencyValue;
        else
            return v44:map(function(v45) --[[ Line: 97 ]]
                -- upvalues: v43 (copy)
                return v43 + v45 * (1 - v43);
            end);
        end;
    end, if v21() then {
        v32.transparencyValue
    } else nil);
    local v49 = v3.useCallback(function(v47) --[[ Line: 103 ]]
        -- upvalues: v32 (copy)
        v32.resetTargetChannel();
        local v48 = tonumber(v47.userId);
        if v48 then
            v32.activateWhisperMode(v48);
        end;
    end, if v21() then {
        v32.resetTargetChannel, 
        v32.activateWhisperMode
    } else nil);
    local v55 = if v22 then nil else v3.useCallback(function(v50) --[[ Line: 119 ]]
        -- upvalues: l_Dictionary_0 (ref), l_FFlagEnableVerifiedBadgeStore_0 (ref), v17 (ref), v32 (copy), l_ExpChatNewHiddenMessagesExperimentation_0 (ref), v3 (ref), v11 (ref), v12 (ref), l_game_EngineFeature_0 (ref), v49 (copy), v26 (ref)
        local v54 = l_Dictionary_0.map(v50, function(v51, v52) --[[ Line: 120 ]]
            -- upvalues: l_FFlagEnableVerifiedBadgeStore_0 (ref), v17 (ref), l_Dictionary_0 (ref), v32 (ref), l_ExpChatNewHiddenMessagesExperimentation_0 (ref), v3 (ref), v11 (ref), v12 (ref), l_game_EngineFeature_0 (ref), v49 (ref)
            if v51.isVisibleInChatWindow then
                local v53 = nil;
                v53 = if l_FFlagEnableVerifiedBadgeStore_0 then if v51.userId then v17.isBadgeVisible((tonumber(v51.userId))) else false else if v51.userId then l_Dictionary_0.has(v32.verifiedUserIds, v51.userId) else false;
                if l_ExpChatNewHiddenMessagesExperimentation_0.getExpChatHiddenMessagesNewDesignEnabled() and v51.isHiddenMessage then
                    return v3.createElement(v11, {
                        chatWindowSettings = v32.chatWindowSettings, 
                        isSpatialUIEnabled = v32.isSpatialUIEnabled, 
                        LayoutOrder = v52, 
                        message = v51, 
                        textTransparency = v32.textTransparency
                    });
                else
                    return v3.createElement(v12, {
                        message = v51, 
                        LayoutOrder = v52, 
                        isUserVerified = v53, 
                        textTransparency = v32.textTransparency, 
                        transparencyValue = if l_game_EngineFeature_0 then v32.transparencyValue else nil, 
                        onTextMessageLabelButtonActivated = v49, 
                        chatWindowSettings = v32.chatWindowSettings, 
                        showTranslationButton = v32.showTranslationButton, 
                        isSpatialUIEnabled = v32.isSpatialUIEnabled, 
                        onToggle = function() --[[ Line: 154 ]] --[[ Name: onToggle ]]

                        end
                    }), v51.messageId;
                end;
            else
                return nil, nil;
            end;
        end);
        v54["$layout"] = v3.createElement("UIListLayout", {
            Padding = if v26 then nil else UDim.new(0, 4), 
            SortOrder = Enum.SortOrder.LayoutOrder
        });
        return v54;
    end, if v21() then {
        v32.messages, 
        v32.textTransparency, 
        v32.verifiedUserIds, 
        v32.chatWindowSettings, 
        v32.showTranslationButton
    } else nil);
    if l_FFlagExpChatPerfTracking_0 then
        local v56 = if v32.targetTextChannel then v32.targetTextChannel.Name else "UNKNOWN_TAB";
        v3.useEffect(function() --[[ Line: 185 ]]
            -- upvalues: v29 (ref)
            v29.finish(v29.Events.ChatWindowMountTTI, {});
            return function() --[[ Line: 187 ]]
                -- upvalues: v29 (ref)
                v29.cancelAll();
            end;
        end, {});
        v3.useEffect(function() --[[ Line: 191 ]]
            -- upvalues: v29 (ref), v56 (copy)
            v29.finish(v29.Events.ChatWindowTabSwitchTTI, {
                tabId = v56
            });
        end, {
            v56
        });
    end;
    return v3.createElement("Frame", {
        BackgroundColor3 = l_BackgroundColor3_0, 
        BorderSizePixel = 0, 
        LayoutOrder = v32.LayoutOrder, 
        Size = v32.size, 
        Visible = v32.visible, 
        BackgroundTransparency = v46(l_BackgroundTransparency_0, v32.transparencyValue), 
        [v3.Event.MouseEnter] = v32.onHovered, 
        [v3.Event.MouseLeave] = v32.onUnhovered, 
        [v3.Change.AbsoluteSize] = if v21() then v3.useCallback(function(v57) --[[ Line: 208 ]]
            -- upvalues: l_TextChatService_0 (ref), v32 (copy)
            local l_ChatWindowConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatWindowConfiguration");
            if l_ChatWindowConfiguration_0 and v32.onAbsoluteSizeChanged then
                v32.onAbsoluteSizeChanged(v57, l_ChatWindowConfiguration_0);
            end;
        end, {
            l_TextChatService_0, 
            v32.onAbsoluteSizeChanged
        }) else function(v59) --[[ Line: 214 ]]
            -- upvalues: l_TextChatService_0 (ref), v32 (copy)
            local l_ChatWindowConfiguration_1 = l_TextChatService_0:FindFirstChildOfClass("ChatWindowConfiguration");
            if l_ChatWindowConfiguration_1 and v32.onAbsoluteSizeChanged then
                v32.onAbsoluteSizeChanged(v59, l_ChatWindowConfiguration_1);
            end;
        end, 
        [v3.Change.AbsolutePosition] = if v21() then v3.useCallback(function(v61) --[[ Line: 221 ]]
            -- upvalues: l_TextChatService_0 (ref), v32 (copy)
            local l_ChatWindowConfiguration_2 = l_TextChatService_0:FindFirstChildOfClass("ChatWindowConfiguration");
            if l_ChatWindowConfiguration_2 and v32.onAbsoluteSizeChanged then
                v32.onAbsolutePositionChanged(v61, l_ChatWindowConfiguration_2);
            end;
        end, {
            l_TextChatService_0, 
            v32.onAbsolutePositionChanged
        }) else function(v63) --[[ Line: 227 ]]
            -- upvalues: l_TextChatService_0 (ref), v32 (copy)
            local l_ChatWindowConfiguration_3 = l_TextChatService_0:FindFirstChildOfClass("ChatWindowConfiguration");
            if l_ChatWindowConfiguration_3 and v32.onAbsoluteSizeChanged then
                v32.onAbsolutePositionChanged(v63, l_ChatWindowConfiguration_3);
            end;
        end
    }, {
        uiSizeConstraint = v3.createElement("UISizeConstraint", {
            MaxSize = if v32.isSpatialUIEnabled then Vector2.new(1e999, 400) else Vector2.new(v6.ChatWindowMaxWidth, v6.ChatWindowMaxHeight)
        }), 
        TopBanner = if not v14() and v38 and v42 then v3.createElement(v13, {
            backgroundColor3 = l_BackgroundColor3_0, 
            backgroundTransparency = l_BackgroundTransparency_0, 
            iconTransparency = if l_GetFFlagMemoizeChatReportingMenu_0() then v32.transparencyValue else v46(l_BackgroundTransparency_0, v32.transparencyValue), 
            onFocus = v32.onFocus, 
            onUnfocus = v32.onUnfocus, 
            getMessages = if l_GetFFlagMemoizeChatReportingMenu_0() then v39 else nil, 
            messages = if not l_GetFFlagMemoizeChatReportingMenu_0() then v32.messages else nil
        }) else nil, 
        scrollingView = v3.createElement(v10, {
            size = v32.size, 
            messages = if v26 then nil else v32.messages, 
            targetTextChannel = v32.targetTextChannel, 
            isChannelBarVisible = v32.isChannelBarVisible
        }, if v22 then nil else v55(v32.messages))
    });
end));