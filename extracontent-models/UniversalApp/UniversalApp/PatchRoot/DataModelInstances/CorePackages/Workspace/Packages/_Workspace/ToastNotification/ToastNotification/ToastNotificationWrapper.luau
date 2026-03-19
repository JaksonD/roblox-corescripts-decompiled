local l_UserInputService_0 = game:GetService("UserInputService");
local l_Players_0 = game:GetService("Players");
local l_GuiService_0 = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_ThirdPartyUserService_0 = game:GetService("ThirdPartyUserService");
local l_TouchEnabled_0 = l_UserInputService_0.TouchEnabled;
local l_Parent_0 = script.Parent;
local l_Components_0 = l_Parent_0.Components;
local l_context_0 = l_Parent_0.context;
local l_utils_0 = l_Parent_0.utils;
local v11 = require(l_Parent_0.dependencies);
local v12 = require(l_Parent_0.Logger);
local v13 = require(l_utils_0.toastNotificationHelper);
local v14 = require(l_utils_0.toastNotificationSessionizationHelper);
local l_Parent_1 = l_Parent_0.Parent;
local v16 = require(l_Parent_1.NotificationsCommon);
local v17 = require(l_Parent_1.React);
local v18 = require(l_Parent_1.UIBlox);
local v19 = require(l_Parent_1.Cryo);
local l_IsVRAppBuild_0 = require(l_Parent_1.AppCommonLib).IsVRAppBuild;
local v21 = require(l_Parent_1.Responsive);
local l_usePreferredInput_0 = v21.usePreferredInput;
local l_useIsSpatial_0 = v21.useIsSpatial;
local v24 = require(l_Parent_1.ReactOtter);
local v25 = require(script.Parent.utils.LifecycleEvents);
local l_ToastNotificationProtocol_0 = require(l_Parent_1.ToastNotificationsProtocol).ToastNotificationProtocol;
local l_Images_0 = v18.App.ImageSet.Images;
local l_ImageSetLabel_0 = v18.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = v18.Core.Style.useStyle;
local v30 = require(l_Parent_1.SharedFlags);
local l_dependencyArray_0 = v11.Hooks.dependencyArray;
local v32 = require(l_Parent_0.analytics.analyticsService);
local v33 = require(l_context_0.NotificationCardProvider);
local v34 = require(l_Components_0.NotificationCard);
local v35 = require(l_Components_0.ToastNotificationSnoozeMenu);
local l_DeeplinkConfirmationModal_0 = v16.DeeplinkConfirmationModal;
local v37 = require(l_Components_0.SwipeDetectionWrapper);
local v38 = require(l_Components_0.ToastVRWrapper);
local v39 = require(l_Components_0.ClientNotificationWrapper);
local v40 = require(l_Components_0.useKeyCodeHold);
local v41 = require(l_Parent_0.type);
local v42 = require(l_Parent_0.constants);
local l_JoinExperience_0 = v16.JoinExperience;
local l_SpringAnimatedItem_0 = v18.Utility.SpringAnimatedItem;
local v45 = l_Images_0["icons/navigation/close"];
local l_GetFFlagEnableChatNewMessage_0 = v30.GetFFlagEnableChatNewMessage;
local l_game_EngineFeature_0 = game:GetEngineFeature("ClientToastNotificationsEnabled");
local v48 = game:DefineFastFlag("EnableClientToastNotificationsReducedMotion", false);
local v49 = game:DefineFastFlag("EnableNotificationsToastTTLFix", false);
local l_default_0 = require(l_Parent_0.ToastNotificationSnoozeManager).default;
local l_GetFFlagFilterNotificationsForPCGDKEnabled_0 = v30.GetFFlagFilterNotificationsForPCGDKEnabled;
local l_GetFStringPCGDKFilteredNotificationTypes_0 = v30.GetFStringPCGDKFilteredNotificationTypes;
local function _() --[[ Line: 66 ]] --[[ Name: GetIsFriendCommunicationRestricted ]]
    -- upvalues: l_GetFFlagFilterNotificationsForPCGDKEnabled_0 (copy), l_ThirdPartyUserService_0 (copy)
    return l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_ThirdPartyUserService_0 and l_ThirdPartyUserService_0:IsChatRestrictionSupported() and l_ThirdPartyUserService_0.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted;
end;
local l_GetFFlagFilterSecurityAlertsVRToastEnabled_0 = v30.GetFFlagFilterSecurityAlertsVRToastEnabled;
local v55 = game:DefineFastFlag("EnableDisplayLoggingForToastsFix", false);
local v56 = {
    frequency = 4, 
    damping = 1
};
local l_getDeviceOrientation_0 = v13.getDeviceOrientation;
local l_getNotificationSize_0 = v13.getNotificationSize;
local l_marshalNotificationData_0 = v13.marshalNotificationData;
local l_calculateToastPosition_0 = v13.calculateToastPosition;
local l_isToastToRight_0 = v13.isToastToRight;
local l_calculateTimeRemaining_0 = v13.calculateTimeRemaining;
return function(v63) --[[ Line: 95 ]]
    -- upvalues: v41 (copy), v13 (copy), v42 (copy), l_ToastNotificationProtocol_0 (copy), v17 (copy), l_UserGameSettings_0 (copy), l_getNotificationSize_0 (copy), l_getDeviceOrientation_0 (copy), l_calculateToastPosition_0 (copy), l_isToastToRight_0 (copy), l_useIsSpatial_0 (copy), l_usePreferredInput_0 (copy), v21 (copy), l_UserInputService_0 (copy), v40 (copy), l_useStyle_0 (copy), l_Players_0 (copy), v12 (copy), v32 (copy), v14 (copy), v19 (copy), l_default_0 (copy), v49 (copy), l_game_EngineFeature_0 (copy), l_GuiService_0 (copy), l_dependencyArray_0 (copy), l_JoinExperience_0 (copy), l_HttpService_0 (copy), l_calculateTimeRemaining_0 (copy), v25 (copy), l_GetFFlagFilterNotificationsForPCGDKEnabled_0 (copy), l_GetFStringPCGDKFilteredNotificationTypes_0 (copy), l_ThirdPartyUserService_0 (copy), v55 (copy), l_GetFFlagFilterSecurityAlertsVRToastEnabled_0 (copy), l_GetFFlagEnableChatNewMessage_0 (copy), l_marshalNotificationData_0 (copy), v56 (copy), v24 (copy), l_IsVRAppBuild_0 (copy), l_TouchEnabled_0 (copy), l_ImageSetLabel_0 (copy), v45 (copy), l_SpringAnimatedItem_0 (copy), v37 (copy), v39 (copy), v48 (copy), v33 (copy), v34 (copy), v38 (copy), v35 (copy), l_DeeplinkConfirmationModal_0 (copy)
    local v64 = v63.renderLocation == v41.RenderLocationEnum.CoreScript;
    local v65 = v13.isDesktopDevice();
    local v66 = if v64 then v42.CardTopMargin.Experience else v42.CardTopMargin.App;
    local l_default_1 = l_ToastNotificationProtocol_0.default;
    local function _() --[[ Line: 102 ]]
        return workspace.CurrentCamera.ViewportSize;
    end;
    local function _(v69) --[[ Line: 107 ]]
        -- upvalues: v42 (ref)
        return v69 and workspace.CurrentCamera.ViewportSize.X < v42.CompactCardThreashold;
    end;
    local v71, v72 = v17.useState(l_UserGameSettings_0.ReducedMotion);
    local v73, v74 = v17.useState(l_getNotificationSize_0(v64, workspace.CurrentCamera.ViewportSize.X));
    local v75, v76 = v17.useState(l_getDeviceOrientation_0(workspace.CurrentCamera.ViewportSize));
    local v77, v78 = v17.useState(false);
    local v79, v80 = v17.useState(nil);
    local v81, v82 = v17.useState(nil);
    local v83, v84 = v17.useState(l_calculateToastPosition_0(false, l_isToastToRight_0(v75), v66, v71));
    local v85, v86 = v17.useState(nil);
    local v87, v88 = v17.useState(nil);
    local v89, v90 = v17.useState(function() --[[ Line: 125 ]]
        -- upvalues: v64 (copy), v42 (ref)
        return v64 and workspace.CurrentCamera.ViewportSize.X < v42.CompactCardThreashold;
    end);
    local v91, v92 = v17.useState(false);
    local v93, v94 = v17.useState(false);
    local v95, v96 = v17.useState(false);
    local v97 = v17.useRef(false);
    local v98, v99 = v17.useState(false);
    local v100, v101 = v17.useState(false);
    local v102, v103 = v17.useState(false);
    local v104, v105 = v17.useState({});
    local v106 = l_useIsSpatial_0();
    local v107 = nil;
    local v108 = nil;
    local v109 = l_usePreferredInput_0() == v21.Input.Directional;
    local v110, v111 = v17.useState(false);
    v107 = v110;
    v108 = v111;
    v110 = v17.useMemo(function() --[[ Line: 144 ]]
        -- upvalues: v109 (copy), v107 (ref), v79 (copy)
        return not v109 or v107 or v79 == nil;
    end, {
        v109, 
        v107, 
        v79
    });
    v17.useEffect(function() --[[ Line: 149 ]]
        -- upvalues: v107 (ref), l_UserInputService_0 (ref), v108 (ref)
        if not v107 then
            return;
        else
            local v114 = l_UserInputService_0.InputBegan:Connect(function(v112, v113) --[[ Line: 154 ]]
                -- upvalues: v108 (ref)
                if v113 then
                    return;
                else
                    if v112.KeyCode == Enum.KeyCode.ButtonB then
                        v108(false);
                    end;
                    return;
                end;
            end);
            return function() --[[ Line: 164 ]]
                -- upvalues: v114 (copy)
                v114:Disconnect();
            end;
        end;
    end, {
        v107
    });
    v111 = v17.useCallback(function() --[[ Line: 170 ]]
        -- upvalues: v108 (ref)
        v108(true);
    end, {});
    local v115 = v40(Enum.KeyCode.ButtonSelect, v42.SIGNAL_HOLD_INTENT_SECONDS, v42.SIGNAL_HOLD_COMPLETE_SECONDS, v111, v110);
    local l_holdProgress_0 = v115.holdProgress;
    local l_holding_0 = v115.holding;
    local v118, v119 = v17.useState((Instance.new("BindableEvent")));
    local v120 = l_useStyle_0();
    local function v124() --[[ Line: 187 ]]
        -- upvalues: l_getDeviceOrientation_0 (ref), l_getNotificationSize_0 (ref), v64 (copy), v74 (copy), v90 (copy), v42 (ref), v76 (copy)
        local l_ViewportSize_0 = workspace.CurrentCamera.ViewportSize;
        local v122 = l_getDeviceOrientation_0(l_ViewportSize_0);
        local v123 = l_getNotificationSize_0(v64, l_ViewportSize_0.X);
        v74(v123);
        v90(v64 and workspace.CurrentCamera.ViewportSize.X < v42.CompactCardThreashold);
        v76(v122);
    end;
    local function _(v125) --[[ Line: 196 ]]
        -- upvalues: l_default_1 (copy)
        l_default_1:dismissNotification(v125);
    end;
    local v127 = v98 or v100;
    local v128 = l_Players_0 and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or nil;
    local function v134(v129, v130, v131) --[[ Line: 203 ]]
        -- upvalues: v12 (ref), v32 (ref), v14 (ref), v13 (ref), v19 (ref), v42 (ref), v64 (copy), l_default_0 (ref)
        if v131 == nil then
            return;
        else
            v12:info("NotificationType: {} with event: {}", v131.notificationType, v129);
            local l_EventStream_0 = v32.EventStream;
            v14(v129);
            local v133 = 0;
            if v131 and v131.displayTimestamp then
                v133 = DateTime.now().UnixTimestampMillis - v131.displayTimestamp;
            end;
            v13.fireEvent(l_EventStream_0, v19.Dictionary.join({
                action_type = v129, 
                delivery_channel = v42.DeliveryChannel, 
                notification_type = v131 and v131.notificationType or nil, 
                notification_id = v131 and v131.id or nil, 
                recipient_userid = v130 or nil, 
                recipient_universe_id = if v64 then game and game.GameId else nil, 
                client_destination = if v64 then v42.Destinations.Experience else v42.Destinations.App, 
                deliver_timestamp = v131 and v131.deliverTimestamp or nil, 
                snoozed = if v131 and v131.notificationType then l_default_0:isSnoozedNotificationType(v131.notificationType) else false, 
                time_to_action_timestamp = v133
            }, v131 and v131.clientEventsPayload or {}));
            return;
        end;
    end;
    v17.useEffect(function() --[[ Line: 245 ]]
        -- upvalues: l_UserGameSettings_0 (ref), v72 (copy)
        local v138 = l_UserGameSettings_0.Changed:Connect(function(v135) --[[ Line: 246 ]]
            -- upvalues: l_UserGameSettings_0 (ref), v72 (ref)
            if v135 == "ReducedMotion" then
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 248 ]]
                    -- upvalues: l_UserGameSettings_0 (ref), v135 (copy)
                    return l_UserGameSettings_0[v135];
                end);
                if l_status_0 then
                    v72(l_result_0);
                end;
            end;
        end);
        return function() --[[ Line: 258 ]]
            -- upvalues: v138 (copy)
            if v138 then
                v138:Disconnect();
            end;
        end;
    end, {
        v72, 
        l_UserGameSettings_0
    });
    local function v140(v139) --[[ Line: 265 ]]
        -- upvalues: v134 (copy), v41 (ref), v128 (copy), v79 (copy), v94 (copy), v118 (copy)
        if not v139 then
            v134(v41.ToastNotificationActionsEnum.ModalCancel, v128, v79);
            v94(false);
        end;
        if v118 then
            v134(v41.ToastNotificationActionsEnum.ModalConfirm, v128, v79);
            v118:Fire(v139);
        end;
    end;
    local v141 = v17.useCallback(function() --[[ Line: 276 ]]
        -- upvalues: v85 (copy), v86 (copy)
        if v85 then
            task.cancel(v85);
        end;
        v86(nil);
    end, {
        v85
    });
    local function _(v142) --[[ Line: 285 ]]
        -- upvalues: l_default_1 (copy), v82 (copy), v141 (copy)
        l_default_1:dismissNotification(v142);
        v82(nil);
        v141();
    end;
    local function _(v144) --[[ Line: 291 ]]
        -- upvalues: v42 (ref)
        local v145 = v144.state and v144.state.timeOnScreenMs;
        if v145 then
            v145 = v145 / 1000;
        end;
        return (v145 or v42.DefaultNotificationDisplayTime) + 1;
    end;
    local v147 = nil;
    v147 = v49 and function(v148, v149, v150) --[[ Line: 303 ]]
        -- upvalues: v141 (copy), v97 (copy), v134 (copy), v41 (ref), v128 (copy), l_game_EngineFeature_0 (ref), l_GuiService_0 (ref), l_default_1 (copy), v82 (copy), v86 (copy)
        v141();
        local v151 = task.delay(v149, function() --[[ Line: 309 ]]
            -- upvalues: v97 (ref), v141 (ref), v134 (ref), v41 (ref), v128 (ref), v150 (copy), l_game_EngineFeature_0 (ref), l_GuiService_0 (ref), v148 (copy), l_default_1 (ref), v82 (ref)
            if v97.current then
                v141();
                return;
            else
                v134(v41.ToastNotificationActionsEnum.Ignored, v128, v150);
                if l_game_EngineFeature_0 and v150 and v150.luaNotifInfo then
                    l_GuiService_0:DismissNotification(v148);
                    return;
                else
                    l_default_1:dismissNotification(v148);
                    v82(nil);
                    v141();
                    return;
                end;
            end;
        end);
        v86(v151);
    end or v17.useCallback(function(v152, v153, v154) --[[ Line: 329 ]]
        -- upvalues: v141 (copy), v95 (copy), v134 (copy), v41 (ref), v128 (copy), l_game_EngineFeature_0 (ref), l_GuiService_0 (ref), l_default_1 (copy), v82 (copy), v86 (copy)
        v141();
        local v155 = task.delay(v153, function() --[[ Line: 331 ]]
            -- upvalues: v95 (ref), v134 (ref), v41 (ref), v128 (ref), v154 (copy), l_game_EngineFeature_0 (ref), l_GuiService_0 (ref), v152 (copy), l_default_1 (ref), v82 (ref), v141 (ref)
            if not v95 then
                v134(v41.ToastNotificationActionsEnum.Ignored, v128, v154);
                if l_game_EngineFeature_0 and v154 and v154.luaNotifInfo then
                    l_GuiService_0:DismissNotification(v152);
                    return;
                else
                    l_default_1:dismissNotification(v152);
                    v82(nil);
                    v141();
                end;
            end;
        end);
        v86(v155);
    end, {
        v95
    });
    local v157 = v17.useCallback(function() --[[ Line: 352 ]]
        -- upvalues: v79 (copy), v81 (copy), l_game_EngineFeature_0 (ref), l_GuiService_0 (ref), l_default_1 (copy), v82 (copy), v141 (copy)
        if v79 and v81 and v81.id == v79.id then
            if l_game_EngineFeature_0 and v79.luaNotifInfo then
                l_GuiService_0:DismissNotification(v79.id);
                return;
            else
                local l_id_0 = v79.id;
                l_default_1:dismissNotification(l_id_0);
                v82(nil);
                v141();
            end;
        end;
    end, {
        v79, 
        v81
    });
    local function v158() --[[ Line: 369 ]]
        -- upvalues: v134 (copy), v41 (ref), v128 (copy), v79 (copy), v157 (copy), v101 (copy)
        v134(v41.ToastNotificationActionsEnum.Dismissed, v128, v79);
        v157();
        v101(false);
    end;
    local v159 = v17.useCallback(function() --[[ Line: 376 ]]
        -- upvalues: v64 (copy), v118 (copy), v94 (copy)
        if v64 and v118 then
            v94(true);
            return v118.Event:Wait();
        else
            return true;
        end;
    end, {
        v64, 
        v118
    });
    local function v164() --[[ Line: 390 ]]
        -- upvalues: v79 (copy), v81 (copy), v85 (copy), v147 (ref), v42 (ref)
        if v79 and v81 and not v85 then
            local l_v147_0 = v147;
            local l_id_1 = v79.id;
            local l_v79_0 = v79;
            local v163 = l_v79_0.state and l_v79_0.state.timeOnScreenMs;
            if v163 then
                v163 = v163 / 1000;
            end;
            l_v147_0(l_id_1, (v163 or v42.DefaultNotificationDisplayTime) + 1, v79);
        end;
    end;
    local v165 = nil;
    v165 = v49 and function(v166, ...) --[[ Line: 404 ]]
        -- upvalues: v141 (copy), v79 (copy), v81 (copy), v85 (copy), v147 (ref), v42 (ref)
        if v166 then
            v141();
            return;
        else
            if v79 and v81 and not v85 then
                local l_v147_1 = v147;
                local l_id_2 = v79.id;
                local l_v79_1 = v79;
                local v170 = l_v79_1.state and l_v79_1.state.timeOnScreenMs;
                if v170 then
                    v170 = v170 / 1000;
                end;
                l_v147_1(l_id_2, (v170 or v42.DefaultNotificationDisplayTime) + 1, v79);
            end;
            return;
        end;
    end or function(v171, v172, v173) --[[ Line: 413 ]]
        if v171 then
            v172();
            return;
        else
            v173();
            return;
        end;
    end;
    local v176 = v17.useCallback(function() --[[ Line: 423 ]]
        -- upvalues: v104 (copy)
        for _, v175 in ipairs(v104) do
            task.cancel(v175);
        end;
    end, l_dependencyArray_0(v104));
    v17.useEffect(function() --[[ Line: 429 ]]
        -- upvalues: v176 (copy)
        return function() --[[ Line: 432 ]]
            -- upvalues: v176 (ref)
            v176();
        end;
    end, {
        v176
    });
    local v182 = v17.useCallback(function(v177, v178) --[[ Line: 438 ]]
        -- upvalues: v41 (ref), v157 (copy), v159 (copy), l_JoinExperience_0 (ref), v64 (copy), v94 (copy), l_default_1 (copy), v134 (copy), v128 (copy), l_HttpService_0 (ref), v12 (ref), l_ToastNotificationProtocol_0 (ref)
        if v177.actionType == v41.ActionTypeEnum.Dismiss then
            v157();
            return;
        else
            if v177.actionType == v41.ActionTypeEnum.Deeplink then
                if v159() then
                    if l_JoinExperience_0(v177.path or "", v64) then
                        v94(false);
                        if v178 then
                            local l_id_3 = v178.id;
                            l_default_1:dismissNotification(l_id_3);
                            return;
                        end;
                    else
                        v134(v41.ToastNotificationActionsEnum.DeeplinkFailed, v128, v178);
                        v157();
                        return;
                    end;
                end;
            elseif v177.actionType == v41.ActionTypeEnum.VoltronBroadcast then
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 465 ]]
                    -- upvalues: l_HttpService_0 (ref), v177 (copy)
                    return l_HttpService_0:JSONDecode(v177.parameters);
                end);
                if l_status_1 then
                    l_default_1:voltronBroadcast(v177.messageId, l_result_1);
                    return;
                else
                    v12:warning("Invalid decoded payload for voltronBroadcast");
                    return;
                end;
            elseif v177.actionType == v41.ActionTypeEnum.UpdateState and v177.nextState ~= nil and v177.nextState ~= "" and v178 and v178.id then
                l_ToastNotificationProtocol_0:updateNotification(v178.id, v177.nextState);
            end;
            return;
        end;
    end, l_dependencyArray_0(v157, v159));
    local v198 = v17.useCallback(function(v183) --[[ Line: 494 ]]
        -- upvalues: v182 (copy), v176 (copy), l_calculateTimeRemaining_0 (ref), v105 (copy)
        local _ = function(v184) --[[ Line: 495 ]] --[[ Name: executeAllActions ]]
            -- upvalues: v182 (ref), v183 (copy)
            for _, v186 in ipairs(v184) do
                v182(v186, v183);
            end;
        end;
        v176();
        if v183.timers then
            local v188 = {};
            for _, v190 in pairs(v183.timers) do
                local v191 = l_calculateTimeRemaining_0(v190, v183.notificationReceivedTimestampMs, v183.displayTimestamp);
                if v191 > 0 then
                    table.insert(v188, (task.delay(v191 / 1000, function() --[[ Line: 511 ]]
                        -- upvalues: v190 (copy), v182 (ref), v183 (copy)
                        local l_actions_0 = v190.actions;
                        for _, v194 in ipairs(l_actions_0) do
                            v182(v194, v183);
                        end;
                    end)));
                else
                    local l_actions_1 = v190.actions;
                    for _, v197 in ipairs(l_actions_1) do
                        v182(v197, v183);
                    end;
                end;
            end;
            if #v188 > 0 then
                v105(v188);
            end;
        end;
    end, l_dependencyArray_0(v182, v176, l_calculateTimeRemaining_0));
    local v202 = v17.useCallback(function(v199) --[[ Line: 527 ]]
        -- upvalues: v91 (copy), v92 (copy), v134 (copy), v128 (copy), v79 (copy), v25 (ref), v182 (copy), v41 (ref), v159 (copy)
        if v91 then
            return;
        else
            v92(true);
            if v199.eventName then
                v134(v199.eventName, v128, v79);
            end;
            if v199.actionEventParams and v79 then
                v25:DispatchEvent(v25.ToastEvents.UserAction, v79.notificationType, {
                    notificationData = v79, 
                    visualItem = v199, 
                    userActionType = "click", 
                    parameters = v199.actionEventParams
                });
            end;
            if v199.actions and #v199.actions > 0 then
                for _, v201 in ipairs(v199.actions) do
                    v182(v201, v79);
                    if v201.actionType == v41.ActionTypeEnum.Deeplink and v159() then
                        break;
                    end;
                end;
            end;
            v92(false);
            return;
        end;
    end, {
        v79, 
        v157, 
        v91, 
        v159
    });
    local function v211(v203, v204) --[[ Line: 569 ]]
        -- upvalues: l_GetFFlagFilterNotificationsForPCGDKEnabled_0 (ref), l_GetFStringPCGDKFilteredNotificationTypes_0 (ref), l_ThirdPartyUserService_0 (ref), l_default_1 (copy), v41 (ref), v55 (ref), l_default_0 (ref), v134 (copy), v128 (copy), v80 (copy), v42 (ref), v147 (ref), v198 (copy), l_game_EngineFeature_0 (ref), l_GuiService_0 (ref), v88 (copy)
        v203.displayTimestamp = DateTime.now().UnixTimestampMillis;
        if l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_GetFStringPCGDKFilteredNotificationTypes_0()[v203.notificationType] and l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_ThirdPartyUserService_0 and l_ThirdPartyUserService_0:IsChatRestrictionSupported() and l_ThirdPartyUserService_0.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted then
            local l_id_4 = v203.id;
            l_default_1:dismissNotification(l_id_4);
            return;
        else
            local v206 = if v204 == "update" then v41.ToastNotificationActionsEnum.Update else v41.ToastNotificationActionsEnum.Display;
            if v55 then
                if l_default_0:isSnoozedNotificationType(v203.notificationType) then
                    local l_id_5 = v203.id;
                    l_default_1:dismissNotification(l_id_5);
                    return;
                else
                    v134(v206, v128, v203);
                end;
            else
                v134(v206, v128, v203);
                if l_default_0:isSnoozedNotificationType(v203.notificationType) then
                    local l_id_6 = v203.id;
                    l_default_1:dismissNotification(l_id_6);
                    return;
                end;
            end;
            v80(v203);
            local v209 = v203.state and v203.state.timeOnScreenMs;
            if v209 then
                v209 = v209 / 1000;
            end;
            local v210 = (v209 or v42.DefaultNotificationDisplayTime) + 1;
            v147(v203.id, v210, v203);
            if v204 == "display" then
                v198(v203);
            end;
            if l_game_EngineFeature_0 and v203 and v203.luaNotifInfo then
                l_GuiService_0:OnNotificationDisplayed(v203.id);
            end;
            v88(nil);
            return;
        end;
    end;
    local function _(v212, v213) --[[ Line: 620 ]]
        -- upvalues: v87 (copy), v211 (copy), v25 (ref), v88 (copy)
        if v87 then
            task.cancel(v87);
        end;
        local v214 = task.delay(v213, function() --[[ Line: 624 ]]
            -- upvalues: v211 (ref), v212 (copy), v25 (ref)
            v211(v212, "display");
            v25:DispatchEvent(v25.ToastEvents.Display, v212.notificationType, v212);
        end);
        v88(v214);
    end;
    local v219 = v17.useCallback(function(v216) --[[ Line: 631 ]]
        -- upvalues: l_GuiService_0 (ref), v41 (ref), l_GetFFlagFilterSecurityAlertsVRToastEnabled_0 (ref), v106 (copy), l_GetFFlagEnableChatNewMessage_0 (ref), l_default_1 (copy), l_marshalNotificationData_0 (ref), v82 (copy), v25 (ref)
        if l_GuiService_0:IsTenFootInterface() and v216 and v216.notificationType ~= nil and v216.notificationType ~= v41.NotificationTypeEnum.ClientNotification then
            return;
        elseif l_GetFFlagFilterSecurityAlertsVRToastEnabled_0() and v106 and v216 and v216.notificationType ~= nil and v216.notificationType == v41.NotificationTypeEnum.SecurityAlert then
            return;
        elseif v216 and v216.notificationType == v41.NotificationTypeEnum.ChatNewMessage and not l_GetFFlagEnableChatNewMessage_0() and v216.content and v216.content.id then
            local l_id_7 = v216.content.id;
            l_default_1:dismissNotification(l_id_7);
            return;
        elseif v216 and v216.content and v216.content.id ~= nil then
            local v218 = l_marshalNotificationData_0(v216);
            v82(v218);
            v25:DispatchEvent(v25.ToastEvents.AttemptDisplay, v218.notificationType, v218);
            return;
        else
            v82(nil);
            return;
        end;
    end, {});
    v17.useEffect(function() --[[ Line: 683 ]]
        -- upvalues: v81 (copy), v79 (copy), v211 (copy), v25 (ref), v42 (ref), v56 (ref), v87 (copy), v88 (copy)
        if v81 then
            if v79 and v79.id == v81.id then
                v211(v81, "update");
                v25:DispatchEvent(v25.ToastEvents.Update, v81.notificationType, v81);
                return;
            else
                local l_DisplayNotificationDelay_0 = v42.DisplayNotificationDelay;
                if v81.luaNotifInfo ~= nil then
                    l_DisplayNotificationDelay_0 = if v79 then 1 / v56.frequency else 0;
                end;
                local l_v81_0 = v81;
                local l_l_DisplayNotificationDelay_0_0 = l_DisplayNotificationDelay_0;
                if v87 then
                    task.cancel(v87);
                end;
                local v223 = task.delay(l_l_DisplayNotificationDelay_0_0, function() --[[ Line: 624 ]]
                    -- upvalues: v211 (ref), l_v81_0 (copy), v25 (ref)
                    v211(l_v81_0, "display");
                    v25:DispatchEvent(v25.ToastEvents.Display, l_v81_0.notificationType, l_v81_0);
                end);
                v88(v223);
            end;
        end;
    end, {
        v81
    });
    v17.useEffect(function() --[[ Line: 714 ]]
        -- upvalues: v81 (copy), v79 (copy), v78 (copy), v108 (ref)
        local v224 = v81 and v79 and v81.id == v79.id or false;
        v78(v224);
        if v224 == false then
            v108(false);
        end;
    end, {
        v81, 
        v79
    });
    v17.useEffect(function() --[[ Line: 731 ]]
        -- upvalues: v77 (copy), v91 (copy), v98 (copy), v100 (copy), v102 (copy), v107 (ref), l_holding_0 (copy), v96 (copy), v49 (ref), v97 (copy)
        local v225 = v77 and (v91 or v98 or v100 or v102 or v107 or l_holding_0);
        v96(v225);
        if v49 then
            v97.current = v225;
        end;
    end, {
        v77, 
        v91, 
        v98, 
        v100, 
        v102, 
        v107, 
        l_holding_0
    });
    v17.useEffect(function() --[[ Line: 760 ]]
        -- upvalues: v49 (ref), v165 (ref), v95 (copy), v141 (copy), v164 (copy)
        if v49 then
            v165(v95);
            return;
        else
            v165(v95, v141, v164);
            return;
        end;
    end, {
        v95
    });
    local v226, v227 = v24.useAnimatedBinding(1, function() --[[ Line: 769 ]]
        -- upvalues: v77 (copy), v80 (copy), v176 (copy)
        if not v77 then
            v80(nil);
            v176();
        end;
    end);
    v17.useEffect(function() --[[ Line: 776 ]]
        -- upvalues: v227 (copy), v24 (ref), v77 (copy), v56 (ref)
        v227(v24.spring(v77 and 0 or 1, v56));
    end, l_dependencyArray_0(v77, v227));
    v17.useEffect(function() --[[ Line: 782 ]]
        -- upvalues: l_calculateToastPosition_0 (ref), v77 (copy), l_isToastToRight_0 (ref), v75 (copy), v66 (copy), v71 (copy), v84 (copy)
        local v228 = l_calculateToastPosition_0(v77, l_isToastToRight_0(v75), v66, v71);
        v84(v228);
    end, {
        v75, 
        v77, 
        v71
    });
    v17.useEffect(function() --[[ Line: 795 ]]
        -- upvalues: l_getDeviceOrientation_0 (ref), l_getNotificationSize_0 (ref), v64 (copy), v74 (copy), v90 (copy), v42 (ref), v76 (copy), v124 (copy)
        local l_ViewportSize_1 = workspace.CurrentCamera.ViewportSize;
        local v230 = l_getDeviceOrientation_0(l_ViewportSize_1);
        local v231 = l_getNotificationSize_0(v64, l_ViewportSize_1.X);
        v74(v231);
        v90(v64 and workspace.CurrentCamera.ViewportSize.X < v42.CompactCardThreashold);
        v76(v230);
        l_ViewportSize_1 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(v124);
        return function() --[[ Line: 801 ]]
            -- upvalues: l_ViewportSize_1 (copy)
            if l_ViewportSize_1 then
                l_ViewportSize_1:Disconnect();
            end;
        end;
    end, {});
    v17.useEffect(function() --[[ Line: 809 ]]
        -- upvalues: v87 (copy), v85 (copy), v118 (copy), v119 (copy)
        return function() --[[ Line: 810 ]]
            -- upvalues: v87 (ref), v85 (ref), v118 (ref), v119 (ref)
            if v87 then
                task.cancel(v87);
            end;
            if v85 then
                task.cancel(v85);
            end;
            if v118 then
                v119(nil);
                v118:Fire(false);
                v118:Destroy();
            end;
        end;
    end, {});
    v17.useEffect(function() --[[ Line: 826 ]]
        -- upvalues: v64 (copy), v41 (ref), v65 (copy), l_default_1 (copy)
        task.delay(0, function() --[[ Line: 827 ]]
            -- upvalues: v64 (ref), v41 (ref), v65 (ref), l_default_1 (ref)
            local v232 = if v64 then {
                v41.ChannelListEnum.Experience, 
                v41.ChannelListEnum.Dual
            } else {
                v41.ChannelListEnum.App, 
                v41.ChannelListEnum.Dual
            };
            if v65 then
                table.insert(v232, v41.ChannelListEnum.Desktop);
            end;
            l_default_1:setupNotifications(v232);
        end);
    end, {});
    v17.useEffect(function() --[[ Line: 847 ]]
        -- upvalues: l_default_1 (copy), v219 (copy)
        local v233 = l_default_1:listenToDisplayNotification(v219);
        return function() --[[ Line: 849 ]]
            -- upvalues: v233 (copy)
            if v233 then
                v233:Disconnect();
            end;
        end;
    end, {
        v219
    });
    local v234 = l_IsVRAppBuild_0();
    local v235 = v77 or not v234;
    local v236 = v127 and not l_TouchEnabled_0 and not v234 and v77;
    local v237 = v17.createElement("TextButton", {
        ZIndex = 2, 
        LayoutOrder = 1, 
        AnchorPoint = Vector2.new(0, 0), 
        Size = UDim2.new(0, v42.CardSizeDefault.closeButton, 0, v42.CardSizeDefault.closeButton), 
        Position = UDim2.new(0, -10, 0, -10), 
        BackgroundTransparency = v120.Theme.BackgroundUIDefault.Transparency, 
        BackgroundColor3 = v120.Theme.BackgroundUIDefault.Color, 
        Text = "", 
        [v17.Event.Activated] = v158, 
        [v17.Event.MouseEnter] = function() --[[ Line: 874 ]]
            -- upvalues: v101 (copy)
            v101(true);
        end, 
        [v17.Event.MouseLeave] = function() --[[ Line: 877 ]]
            -- upvalues: v101 (copy)
            v101(false);
        end
    }, {
        Border = v17.createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Color = v120.Theme.UIDefault.Color
        }), 
        UICorner = v17.createElement("UICorner", {
            CornerRadius = v42.DefaultCardCloseButtonCornerRadius
        }), 
        CloseButtonIcon = v17.createElement(l_ImageSetLabel_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, v42.CardSizeDefault.closeIcon, 0, v42.CardSizeDefault.closeIcon), 
            Image = v45, 
            ImageColor3 = v120.Theme.SystemPrimaryDefault.Color
        })
    });
    local v240 = v17.useMemo(function() --[[ Line: 900 ]]
        -- upvalues: v17 (ref), l_SpringAnimatedItem_0 (ref), v73 (copy), v235 (copy), v79 (copy), v134 (copy), v41 (ref), v128 (copy), v99 (copy), v83 (copy), v56 (ref), v234 (copy), v77 (copy), v80 (copy), v176 (copy), v37 (ref), v157 (copy), v101 (copy), l_game_EngineFeature_0 (ref), v39 (ref), v103 (copy), v48 (ref), v226 (copy), v236 (copy), v237 (copy), v33 (ref), v89 (copy), v202 (copy), v34 (ref), v127 (copy), v107 (ref), v109 (copy), l_holdProgress_0 (copy)
        return v17.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
            regularProps = {
                ClipsDescendants = false, 
                Size = v73, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Active = true, 
                Visible = v235 and v79 ~= nil, 
                [v17.Event.MouseEnter] = function() --[[ Line: 909 ]]
                    -- upvalues: v134 (ref), v41 (ref), v128 (ref), v79 (ref), v99 (ref)
                    v134(v41.ToastNotificationActionsEnum.Hover, v128, v79);
                    v99(true);
                end, 
                [v17.Event.MouseLeave] = function() --[[ Line: 917 ]]
                    -- upvalues: v99 (ref)
                    v99(false);
                end
            }, 
            animatedValues = v83, 
            springOptions = v56, 
            mapValuesToProps = function(v238) --[[ Line: 923 ]] --[[ Name: mapValuesToProps ]]
                -- upvalues: v234 (ref)
                return {
                    Position = if v234 then UDim2.new(0.5, 0, 0.5, 0) else UDim2.new(v238.positionX, v238.positionXOffset, v238.positionY, v238.positionYOffset), 
                    AnchorPoint = if v234 then Vector2.new(0.5, 0.5) else Vector2.new(v238.anchorX, v238.anchorY)
                };
            end, 
            onComplete = function() --[[ Line: 938 ]] --[[ Name: onComplete ]]
                -- upvalues: v77 (ref), v80 (ref), v176 (ref)
                if not v77 then
                    v80(nil);
                    v176();
                end;
            end
        }, {
            SwipeDetector = v17.createElement(v37, {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                swipeEnabled = v77, 
                swipeCallback = function(v239) --[[ Line: 949 ]] --[[ Name: swipeCallback ]]
                    -- upvalues: v134 (ref), v41 (ref), v128 (ref), v79 (ref), v157 (ref), v101 (ref)
                    if v239 == Enum.SwipeDirection.Up or v239 == Enum.SwipeDirection.Right then
                        v134(v41.ToastNotificationActionsEnum.Dismissed, v128, v79);
                        v157();
                        v101(false);
                    end;
                end
            }, {
                NotificationProvider = if l_game_EngineFeature_0 and v79 and v79.luaNotifInfo and v79.id then v17.createElement(v39, {
                    notificationInfo = v79.luaNotifInfo, 
                    notificationId = v79.id, 
                    onPause = v103, 
                    onHover = v99, 
                    transparency = if v48 then v226 else nil, 
                    width = v73.X
                }, {
                    ToastCloseButton = if v236 then v237 else nil
                }) else v17.createElement(v33, {
                    state = v79 and v79.state, 
                    isCompact = v89, 
                    handleActions = v202, 
                    notificationReceivedTimestampMs = v79 and v79.notificationReceivedTimestampMs, 
                    timers = v79 and v79.timers, 
                    displayTimestampMs = v79 and v79.displayTimestamp
                }, {
                    NotificationCardCanvasGroup = if v79 then v17.createElement("CanvasGroup", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = v73, 
                        BackgroundTransparency = 1, 
                        GroupTransparency = v226, 
                        LayoutOrder = 2
                    }, {
                        NotificationCard = v17.createElement(v34, {
                            isHover = v127, 
                            shouldAutoFocus = v107, 
                            showHoldButton = v109, 
                            holdProgress = l_holdProgress_0
                        })
                    }) else nil, 
                    ToastCloseButton = if v236 then v237 else nil
                })
            })
        });
    end, {
        v42, 
        v120, 
        v79, 
        v235, 
        v77, 
        v89, 
        v236, 
        v127, 
        v83, 
        v158, 
        v99, 
        v101, 
        v202
    });
    if v234 then
        return v17.createElement(v38, {
            isConfirmModalOpen = v93, 
            isToastOpen = v77, 
            isCoreScript = v64, 
            ToastComponent = v240, 
            ToastNotificationSnoozeMenu = v17.createElement(v35), 
            ConfirmationModalComponent = v17.createElement(l_DeeplinkConfirmationModal_0, {
                closeCallback = v140, 
                backgroundTransparency = 1
            })
        });
    else
        return v17.createElement("ScreenGui", {
            DisplayOrder = v63.displayOrder, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            IgnoreGuiInset = true
        }, {
            Toast = v240, 
            ToastNotificationSnoozeMenu = v17.createElement(v35), 
            DeeplinkConfirmationModal = v93 and v17.createElement(l_DeeplinkConfirmationModal_0, {
                closeCallback = v140
            })
        });
    end;
end;