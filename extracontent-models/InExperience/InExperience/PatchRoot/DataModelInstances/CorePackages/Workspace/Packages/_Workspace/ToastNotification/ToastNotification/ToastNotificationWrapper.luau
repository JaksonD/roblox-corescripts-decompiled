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
local l_FFlagRemoveDependencyArrayAntipattern_0 = v30.FFlagRemoveDependencyArrayAntipattern;
local v57 = {
    frequency = 4, 
    damping = 1
};
local l_getDeviceOrientation_0 = v13.getDeviceOrientation;
local l_getNotificationSize_0 = v13.getNotificationSize;
local l_marshalNotificationData_0 = v13.marshalNotificationData;
local l_calculateToastPosition_0 = v13.calculateToastPosition;
local l_isToastToRight_0 = v13.isToastToRight;
local l_calculateTimeRemaining_0 = v13.calculateTimeRemaining;
return function(v64) --[[ Line: 97 ]]
    -- upvalues: v41 (copy), v13 (copy), v42 (copy), l_ToastNotificationProtocol_0 (copy), v17 (copy), l_UserGameSettings_0 (copy), l_getNotificationSize_0 (copy), l_getDeviceOrientation_0 (copy), l_calculateToastPosition_0 (copy), l_isToastToRight_0 (copy), l_useIsSpatial_0 (copy), l_usePreferredInput_0 (copy), v21 (copy), l_UserInputService_0 (copy), v40 (copy), l_useStyle_0 (copy), l_Players_0 (copy), v12 (copy), v32 (copy), v14 (copy), v19 (copy), l_default_0 (copy), v49 (copy), l_game_EngineFeature_0 (copy), l_GuiService_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_JoinExperience_0 (copy), l_HttpService_0 (copy), l_calculateTimeRemaining_0 (copy), v25 (copy), l_GetFFlagFilterNotificationsForPCGDKEnabled_0 (copy), l_GetFStringPCGDKFilteredNotificationTypes_0 (copy), l_ThirdPartyUserService_0 (copy), v55 (copy), l_GetFFlagFilterSecurityAlertsVRToastEnabled_0 (copy), l_GetFFlagEnableChatNewMessage_0 (copy), l_marshalNotificationData_0 (copy), v57 (copy), v24 (copy), l_IsVRAppBuild_0 (copy), l_TouchEnabled_0 (copy), l_ImageSetLabel_0 (copy), v45 (copy), l_SpringAnimatedItem_0 (copy), v37 (copy), v39 (copy), v48 (copy), v33 (copy), v34 (copy), v38 (copy), v35 (copy), l_DeeplinkConfirmationModal_0 (copy)
    local v65 = v64.renderLocation == v41.RenderLocationEnum.CoreScript;
    local v66 = v13.isDesktopDevice();
    local v67 = if v65 then v42.CardTopMargin.Experience else v42.CardTopMargin.App;
    local l_default_1 = l_ToastNotificationProtocol_0.default;
    local function _() --[[ Line: 104 ]]
        return workspace.CurrentCamera.ViewportSize;
    end;
    local function _(v70) --[[ Line: 109 ]]
        -- upvalues: v42 (ref)
        return v70 and workspace.CurrentCamera.ViewportSize.X < v42.CompactCardThreashold;
    end;
    local v72, v73 = v17.useState(l_UserGameSettings_0.ReducedMotion);
    local v74, v75 = v17.useState(l_getNotificationSize_0(v65, workspace.CurrentCamera.ViewportSize.X));
    local v76, v77 = v17.useState(l_getDeviceOrientation_0(workspace.CurrentCamera.ViewportSize));
    local v78, v79 = v17.useState(false);
    local v80, v81 = v17.useState(nil);
    local v82, v83 = v17.useState(nil);
    local v84, v85 = v17.useState(l_calculateToastPosition_0(false, l_isToastToRight_0(v76), v67, v72));
    local v86, v87 = v17.useState(nil);
    local v88, v89 = v17.useState(nil);
    local v90, v91 = v17.useState(function() --[[ Line: 127 ]]
        -- upvalues: v65 (copy), v42 (ref)
        return v65 and workspace.CurrentCamera.ViewportSize.X < v42.CompactCardThreashold;
    end);
    local v92, v93 = v17.useState(false);
    local v94, v95 = v17.useState(false);
    local v96, v97 = v17.useState(false);
    local v98 = v17.useRef(false);
    local v99, v100 = v17.useState(false);
    local v101, v102 = v17.useState(false);
    local v103, v104 = v17.useState(false);
    local v105, v106 = v17.useState({});
    local v107 = l_useIsSpatial_0();
    local v108 = nil;
    local v109 = nil;
    local v110 = l_usePreferredInput_0() == v21.Input.Directional;
    local v111, v112 = v17.useState(false);
    v108 = v111;
    v109 = v112;
    v111 = v17.useMemo(function() --[[ Line: 146 ]]
        -- upvalues: v110 (copy), v108 (ref), v80 (copy)
        return not v110 or v108 or v80 == nil;
    end, {
        v110, 
        v108, 
        v80
    });
    v17.useEffect(function() --[[ Line: 151 ]]
        -- upvalues: v108 (ref), l_UserInputService_0 (ref), v109 (ref)
        if not v108 then
            return;
        else
            local v115 = l_UserInputService_0.InputBegan:Connect(function(v113, v114) --[[ Line: 156 ]]
                -- upvalues: v109 (ref)
                if v114 then
                    return;
                else
                    if v113.KeyCode == Enum.KeyCode.ButtonB then
                        v109(false);
                    end;
                    return;
                end;
            end);
            return function() --[[ Line: 166 ]]
                -- upvalues: v115 (copy)
                v115:Disconnect();
            end;
        end;
    end, {
        v108
    });
    v112 = v17.useCallback(function() --[[ Line: 172 ]]
        -- upvalues: v109 (ref)
        v109(true);
    end, {});
    local v116 = v40(Enum.KeyCode.ButtonSelect, v42.SIGNAL_HOLD_INTENT_SECONDS, v42.SIGNAL_HOLD_COMPLETE_SECONDS, v112, v111);
    local l_holdProgress_0 = v116.holdProgress;
    local l_holding_0 = v116.holding;
    local v119, v120 = v17.useState((Instance.new("BindableEvent")));
    local v121 = l_useStyle_0();
    local function v125() --[[ Line: 189 ]]
        -- upvalues: l_getDeviceOrientation_0 (ref), l_getNotificationSize_0 (ref), v65 (copy), v75 (copy), v91 (copy), v42 (ref), v77 (copy)
        local l_ViewportSize_0 = workspace.CurrentCamera.ViewportSize;
        local v123 = l_getDeviceOrientation_0(l_ViewportSize_0);
        local v124 = l_getNotificationSize_0(v65, l_ViewportSize_0.X);
        v75(v124);
        v91(v65 and workspace.CurrentCamera.ViewportSize.X < v42.CompactCardThreashold);
        v77(v123);
    end;
    local function _(v126) --[[ Line: 198 ]]
        -- upvalues: l_default_1 (copy)
        l_default_1:dismissNotification(v126);
    end;
    local v128 = v99 or v101;
    local v129 = l_Players_0 and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or nil;
    local function v135(v130, v131, v132) --[[ Line: 205 ]]
        -- upvalues: v12 (ref), v32 (ref), v14 (ref), v13 (ref), v19 (ref), v42 (ref), v65 (copy), l_default_0 (ref)
        if v132 == nil then
            return;
        else
            v12:info("NotificationType: {} with event: {}", v132.notificationType, v130);
            local l_EventStream_0 = v32.EventStream;
            v14(v130);
            local v134 = 0;
            if v132 and v132.displayTimestamp then
                v134 = DateTime.now().UnixTimestampMillis - v132.displayTimestamp;
            end;
            v13.fireEvent(l_EventStream_0, v19.Dictionary.join({
                action_type = v130, 
                delivery_channel = v42.DeliveryChannel, 
                notification_type = v132 and v132.notificationType or nil, 
                notification_id = v132 and v132.id or nil, 
                recipient_userid = v131 or nil, 
                recipient_universe_id = if v65 then game and game.GameId else nil, 
                client_destination = if v65 then v42.Destinations.Experience else v42.Destinations.App, 
                deliver_timestamp = v132 and v132.deliverTimestamp or nil, 
                snoozed = if v132 and v132.notificationType then l_default_0:isSnoozedNotificationType(v132.notificationType) else false, 
                time_to_action_timestamp = v134
            }, v132 and v132.clientEventsPayload or {}));
            return;
        end;
    end;
    v17.useEffect(function() --[[ Line: 247 ]]
        -- upvalues: l_UserGameSettings_0 (ref), v73 (copy)
        local v139 = l_UserGameSettings_0.Changed:Connect(function(v136) --[[ Line: 248 ]]
            -- upvalues: l_UserGameSettings_0 (ref), v73 (ref)
            if v136 == "ReducedMotion" then
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 250 ]]
                    -- upvalues: l_UserGameSettings_0 (ref), v136 (copy)
                    return l_UserGameSettings_0[v136];
                end);
                if l_status_0 then
                    v73(l_result_0);
                end;
            end;
        end);
        return function() --[[ Line: 260 ]]
            -- upvalues: v139 (copy)
            if v139 then
                v139:Disconnect();
            end;
        end;
    end, {
        v73, 
        l_UserGameSettings_0
    });
    local function v141(v140) --[[ Line: 267 ]]
        -- upvalues: v135 (copy), v41 (ref), v129 (copy), v80 (copy), v95 (copy), v119 (copy)
        if not v140 then
            v135(v41.ToastNotificationActionsEnum.ModalCancel, v129, v80);
            v95(false);
        end;
        if v119 then
            v135(v41.ToastNotificationActionsEnum.ModalConfirm, v129, v80);
            v119:Fire(v140);
        end;
    end;
    local v142 = v17.useCallback(function() --[[ Line: 278 ]]
        -- upvalues: v86 (copy), v87 (copy)
        if v86 then
            task.cancel(v86);
        end;
        v87(nil);
    end, {
        v86
    });
    local function _(v143) --[[ Line: 287 ]]
        -- upvalues: l_default_1 (copy), v83 (copy), v142 (copy)
        l_default_1:dismissNotification(v143);
        v83(nil);
        v142();
    end;
    local function _(v145) --[[ Line: 293 ]]
        -- upvalues: v42 (ref)
        local v146 = v145.state and v145.state.timeOnScreenMs;
        if v146 then
            v146 = v146 / 1000;
        end;
        return (v146 or v42.DefaultNotificationDisplayTime) + 1;
    end;
    local v148 = nil;
    v148 = v49 and function(v149, v150, v151) --[[ Line: 305 ]]
        -- upvalues: v142 (copy), v98 (copy), v135 (copy), v41 (ref), v129 (copy), l_game_EngineFeature_0 (ref), l_GuiService_0 (ref), l_default_1 (copy), v83 (copy), v87 (copy)
        v142();
        local v152 = task.delay(v150, function() --[[ Line: 311 ]]
            -- upvalues: v98 (ref), v142 (ref), v135 (ref), v41 (ref), v129 (ref), v151 (copy), l_game_EngineFeature_0 (ref), l_GuiService_0 (ref), v149 (copy), l_default_1 (ref), v83 (ref)
            if v98.current then
                v142();
                return;
            else
                v135(v41.ToastNotificationActionsEnum.Ignored, v129, v151);
                if l_game_EngineFeature_0 and v151 and v151.luaNotifInfo then
                    l_GuiService_0:DismissNotification(v149);
                    return;
                else
                    l_default_1:dismissNotification(v149);
                    v83(nil);
                    v142();
                    return;
                end;
            end;
        end);
        v87(v152);
    end or v17.useCallback(function(v153, v154, v155) --[[ Line: 331 ]]
        -- upvalues: v142 (copy), v96 (copy), v135 (copy), v41 (ref), v129 (copy), l_game_EngineFeature_0 (ref), l_GuiService_0 (ref), l_default_1 (copy), v83 (copy), v87 (copy)
        v142();
        local v156 = task.delay(v154, function() --[[ Line: 333 ]]
            -- upvalues: v96 (ref), v135 (ref), v41 (ref), v129 (ref), v155 (copy), l_game_EngineFeature_0 (ref), l_GuiService_0 (ref), v153 (copy), l_default_1 (ref), v83 (ref), v142 (ref)
            if not v96 then
                v135(v41.ToastNotificationActionsEnum.Ignored, v129, v155);
                if l_game_EngineFeature_0 and v155 and v155.luaNotifInfo then
                    l_GuiService_0:DismissNotification(v153);
                    return;
                else
                    l_default_1:dismissNotification(v153);
                    v83(nil);
                    v142();
                end;
            end;
        end);
        v87(v156);
    end, {
        v96
    });
    local v158 = v17.useCallback(function() --[[ Line: 354 ]]
        -- upvalues: v80 (copy), v82 (copy), l_game_EngineFeature_0 (ref), l_GuiService_0 (ref), l_default_1 (copy), v83 (copy), v142 (copy)
        if v80 and v82 and v82.id == v80.id then
            if l_game_EngineFeature_0 and v80.luaNotifInfo then
                l_GuiService_0:DismissNotification(v80.id);
                return;
            else
                local l_id_0 = v80.id;
                l_default_1:dismissNotification(l_id_0);
                v83(nil);
                v142();
            end;
        end;
    end, {
        v80, 
        v82
    });
    local function v159() --[[ Line: 371 ]]
        -- upvalues: v135 (copy), v41 (ref), v129 (copy), v80 (copy), v158 (copy), v102 (copy)
        v135(v41.ToastNotificationActionsEnum.Dismissed, v129, v80);
        v158();
        v102(false);
    end;
    local v160 = v17.useCallback(function() --[[ Line: 378 ]]
        -- upvalues: v65 (copy), v119 (copy), v95 (copy)
        if v65 and v119 then
            v95(true);
            return v119.Event:Wait();
        else
            return true;
        end;
    end, {
        v65, 
        v119
    });
    local function v165() --[[ Line: 392 ]]
        -- upvalues: v80 (copy), v82 (copy), v86 (copy), v148 (ref), v42 (ref)
        if v80 and v82 and not v86 then
            local l_v148_0 = v148;
            local l_id_1 = v80.id;
            local l_v80_0 = v80;
            local v164 = l_v80_0.state and l_v80_0.state.timeOnScreenMs;
            if v164 then
                v164 = v164 / 1000;
            end;
            l_v148_0(l_id_1, (v164 or v42.DefaultNotificationDisplayTime) + 1, v80);
        end;
    end;
    local v166 = nil;
    v166 = v49 and function(v167, ...) --[[ Line: 406 ]]
        -- upvalues: v142 (copy), v80 (copy), v82 (copy), v86 (copy), v148 (ref), v42 (ref)
        if v167 then
            v142();
            return;
        else
            if v80 and v82 and not v86 then
                local l_v148_1 = v148;
                local l_id_2 = v80.id;
                local l_v80_1 = v80;
                local v171 = l_v80_1.state and l_v80_1.state.timeOnScreenMs;
                if v171 then
                    v171 = v171 / 1000;
                end;
                l_v148_1(l_id_2, (v171 or v42.DefaultNotificationDisplayTime) + 1, v80);
            end;
            return;
        end;
    end or function(v172, v173, v174) --[[ Line: 415 ]]
        if v172 then
            v173();
            return;
        else
            v174();
            return;
        end;
    end;
    local v177 = v17.useCallback(function() --[[ Line: 425 ]]
        -- upvalues: v105 (copy)
        for _, v176 in ipairs(v105) do
            task.cancel(v176);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v105
    } else l_dependencyArray_0(v105));
    v17.useEffect(function() --[[ Line: 431 ]]
        -- upvalues: v177 (copy)
        return function() --[[ Line: 434 ]]
            -- upvalues: v177 (ref)
            v177();
        end;
    end, {
        v177
    });
    local v183 = v17.useCallback(function(v178, v179) --[[ Line: 440 ]]
        -- upvalues: v41 (ref), v158 (copy), v160 (copy), l_JoinExperience_0 (ref), v65 (copy), v95 (copy), l_default_1 (copy), v135 (copy), v129 (copy), l_HttpService_0 (ref), v12 (ref), l_ToastNotificationProtocol_0 (ref)
        if v178.actionType == v41.ActionTypeEnum.Dismiss then
            v158();
            return;
        else
            if v178.actionType == v41.ActionTypeEnum.Deeplink then
                if v160() then
                    if l_JoinExperience_0(v178.path or "", v65) then
                        v95(false);
                        if v179 then
                            local l_id_3 = v179.id;
                            l_default_1:dismissNotification(l_id_3);
                            return;
                        end;
                    else
                        v135(v41.ToastNotificationActionsEnum.DeeplinkFailed, v129, v179);
                        v158();
                        return;
                    end;
                end;
            elseif v178.actionType == v41.ActionTypeEnum.VoltronBroadcast then
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 467 ]]
                    -- upvalues: l_HttpService_0 (ref), v178 (copy)
                    return l_HttpService_0:JSONDecode(v178.parameters);
                end);
                if l_status_1 then
                    l_default_1:voltronBroadcast(v178.messageId, l_result_1);
                    return;
                else
                    v12:warning("Invalid decoded payload for voltronBroadcast");
                    return;
                end;
            elseif v178.actionType == v41.ActionTypeEnum.UpdateState and v178.nextState ~= nil and v178.nextState ~= "" and v179 and v179.id then
                l_ToastNotificationProtocol_0:updateNotification(v179.id, v178.nextState);
            end;
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v158, 
        v160
    } else l_dependencyArray_0(v158, v160));
    local v199 = v17.useCallback(function(v184) --[[ Line: 499 ]]
        -- upvalues: v183 (copy), v177 (copy), l_calculateTimeRemaining_0 (ref), v106 (copy)
        local _ = function(v185) --[[ Line: 500 ]] --[[ Name: executeAllActions ]]
            -- upvalues: v183 (ref), v184 (copy)
            for _, v187 in ipairs(v185) do
                v183(v187, v184);
            end;
        end;
        v177();
        if v184.timers then
            local v189 = {};
            for _, v191 in pairs(v184.timers) do
                local v192 = l_calculateTimeRemaining_0(v191, v184.notificationReceivedTimestampMs, v184.displayTimestamp);
                if v192 > 0 then
                    table.insert(v189, (task.delay(v192 / 1000, function() --[[ Line: 516 ]]
                        -- upvalues: v191 (copy), v183 (ref), v184 (copy)
                        local l_actions_0 = v191.actions;
                        for _, v195 in ipairs(l_actions_0) do
                            v183(v195, v184);
                        end;
                    end)));
                else
                    local l_actions_1 = v191.actions;
                    for _, v198 in ipairs(l_actions_1) do
                        v183(v198, v184);
                    end;
                end;
            end;
            if #v189 > 0 then
                v106(v189);
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v183, 
        v177, 
        l_calculateTimeRemaining_0
    } else l_dependencyArray_0(v183, v177, l_calculateTimeRemaining_0));
    local v203 = v17.useCallback(function(v200) --[[ Line: 536 ]]
        -- upvalues: v92 (copy), v93 (copy), v135 (copy), v129 (copy), v80 (copy), v25 (ref), v183 (copy), v41 (ref), v160 (copy)
        if v92 then
            return;
        else
            v93(true);
            if v200.eventName then
                v135(v200.eventName, v129, v80);
            end;
            if v200.actionEventParams and v80 then
                v25:DispatchEvent(v25.ToastEvents.UserAction, v80.notificationType, {
                    notificationData = v80, 
                    visualItem = v200, 
                    userActionType = "click", 
                    parameters = v200.actionEventParams
                });
            end;
            if v200.actions and #v200.actions > 0 then
                for _, v202 in ipairs(v200.actions) do
                    v183(v202, v80);
                    if v202.actionType == v41.ActionTypeEnum.Deeplink and v160() then
                        break;
                    end;
                end;
            end;
            v93(false);
            return;
        end;
    end, {
        v80, 
        v158, 
        v92, 
        v160
    });
    local function v212(v204, v205) --[[ Line: 578 ]]
        -- upvalues: l_GetFFlagFilterNotificationsForPCGDKEnabled_0 (ref), l_GetFStringPCGDKFilteredNotificationTypes_0 (ref), l_ThirdPartyUserService_0 (ref), l_default_1 (copy), v41 (ref), v55 (ref), l_default_0 (ref), v135 (copy), v129 (copy), v81 (copy), v42 (ref), v148 (ref), v199 (copy), l_game_EngineFeature_0 (ref), l_GuiService_0 (ref), v89 (copy)
        v204.displayTimestamp = DateTime.now().UnixTimestampMillis;
        if l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_GetFStringPCGDKFilteredNotificationTypes_0()[v204.notificationType] and l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_ThirdPartyUserService_0 and l_ThirdPartyUserService_0:IsChatRestrictionSupported() and l_ThirdPartyUserService_0.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted then
            local l_id_4 = v204.id;
            l_default_1:dismissNotification(l_id_4);
            return;
        else
            local v207 = if v205 == "update" then v41.ToastNotificationActionsEnum.Update else v41.ToastNotificationActionsEnum.Display;
            if v55 then
                if l_default_0:isSnoozedNotificationType(v204.notificationType) then
                    local l_id_5 = v204.id;
                    l_default_1:dismissNotification(l_id_5);
                    return;
                else
                    v135(v207, v129, v204);
                end;
            else
                v135(v207, v129, v204);
                if l_default_0:isSnoozedNotificationType(v204.notificationType) then
                    local l_id_6 = v204.id;
                    l_default_1:dismissNotification(l_id_6);
                    return;
                end;
            end;
            v81(v204);
            local v210 = v204.state and v204.state.timeOnScreenMs;
            if v210 then
                v210 = v210 / 1000;
            end;
            local v211 = (v210 or v42.DefaultNotificationDisplayTime) + 1;
            v148(v204.id, v211, v204);
            if v205 == "display" then
                v199(v204);
            end;
            if l_game_EngineFeature_0 and v204 and v204.luaNotifInfo then
                l_GuiService_0:OnNotificationDisplayed(v204.id);
            end;
            v89(nil);
            return;
        end;
    end;
    local function _(v213, v214) --[[ Line: 629 ]]
        -- upvalues: v88 (copy), v212 (copy), v25 (ref), v89 (copy)
        if v88 then
            task.cancel(v88);
        end;
        local v215 = task.delay(v214, function() --[[ Line: 633 ]]
            -- upvalues: v212 (ref), v213 (copy), v25 (ref)
            v212(v213, "display");
            v25:DispatchEvent(v25.ToastEvents.Display, v213.notificationType, v213);
        end);
        v89(v215);
    end;
    local v220 = v17.useCallback(function(v217) --[[ Line: 640 ]]
        -- upvalues: l_GuiService_0 (ref), v41 (ref), l_GetFFlagFilterSecurityAlertsVRToastEnabled_0 (ref), v107 (copy), l_GetFFlagEnableChatNewMessage_0 (ref), l_default_1 (copy), l_marshalNotificationData_0 (ref), v83 (copy), v25 (ref)
        if l_GuiService_0:IsTenFootInterface() and v217 and v217.notificationType ~= nil and v217.notificationType ~= v41.NotificationTypeEnum.ClientNotification then
            return;
        elseif l_GetFFlagFilterSecurityAlertsVRToastEnabled_0() and v107 and v217 and v217.notificationType ~= nil and v217.notificationType == v41.NotificationTypeEnum.SecurityAlert then
            return;
        elseif v217 and v217.notificationType == v41.NotificationTypeEnum.ChatNewMessage and not l_GetFFlagEnableChatNewMessage_0() and v217.content and v217.content.id then
            local l_id_7 = v217.content.id;
            l_default_1:dismissNotification(l_id_7);
            return;
        elseif v217 and v217.content and v217.content.id ~= nil then
            local v219 = l_marshalNotificationData_0(v217);
            v83(v219);
            v25:DispatchEvent(v25.ToastEvents.AttemptDisplay, v219.notificationType, v219);
            return;
        else
            v83(nil);
            return;
        end;
    end, {});
    v17.useEffect(function() --[[ Line: 692 ]]
        -- upvalues: v82 (copy), v80 (copy), v212 (copy), v25 (ref), v42 (ref), v57 (ref), v88 (copy), v89 (copy)
        if v82 then
            if v80 and v80.id == v82.id then
                v212(v82, "update");
                v25:DispatchEvent(v25.ToastEvents.Update, v82.notificationType, v82);
                return;
            else
                local l_DisplayNotificationDelay_0 = v42.DisplayNotificationDelay;
                if v82.luaNotifInfo ~= nil then
                    l_DisplayNotificationDelay_0 = if v80 then 1 / v57.frequency else 0;
                end;
                local l_v82_0 = v82;
                local l_l_DisplayNotificationDelay_0_0 = l_DisplayNotificationDelay_0;
                if v88 then
                    task.cancel(v88);
                end;
                local v224 = task.delay(l_l_DisplayNotificationDelay_0_0, function() --[[ Line: 633 ]]
                    -- upvalues: v212 (ref), l_v82_0 (copy), v25 (ref)
                    v212(l_v82_0, "display");
                    v25:DispatchEvent(v25.ToastEvents.Display, l_v82_0.notificationType, l_v82_0);
                end);
                v89(v224);
            end;
        end;
    end, {
        v82
    });
    v17.useEffect(function() --[[ Line: 723 ]]
        -- upvalues: v82 (copy), v80 (copy), v79 (copy), v109 (ref)
        local v225 = v82 and v80 and v82.id == v80.id or false;
        v79(v225);
        if v225 == false then
            v109(false);
        end;
    end, {
        v82, 
        v80
    });
    v17.useEffect(function() --[[ Line: 740 ]]
        -- upvalues: v78 (copy), v92 (copy), v99 (copy), v101 (copy), v103 (copy), v108 (ref), l_holding_0 (copy), v97 (copy), v49 (ref), v98 (copy)
        local v226 = v78 and (v92 or v99 or v101 or v103 or v108 or l_holding_0);
        v97(v226);
        if v49 then
            v98.current = v226;
        end;
    end, {
        v78, 
        v92, 
        v99, 
        v101, 
        v103, 
        v108, 
        l_holding_0
    });
    v17.useEffect(function() --[[ Line: 769 ]]
        -- upvalues: v49 (ref), v166 (ref), v96 (copy), v142 (copy), v165 (copy)
        if v49 then
            v166(v96);
            return;
        else
            v166(v96, v142, v165);
            return;
        end;
    end, {
        v96
    });
    local v227, v228 = v24.useAnimatedBinding(1, function() --[[ Line: 778 ]]
        -- upvalues: v78 (copy), v81 (copy), v177 (copy)
        if not v78 then
            v81(nil);
            v177();
        end;
    end);
    v17.useEffect(function() --[[ Line: 786 ]]
        -- upvalues: v228 (copy), v24 (ref), v78 (copy), v57 (ref)
        v228(v24.spring(v78 and 0 or 1, v57));
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v78, 
        v228
    } else l_dependencyArray_0(v78, v228));
    v17.useEffect(function() --[[ Line: 796 ]]
        -- upvalues: l_calculateToastPosition_0 (ref), v78 (copy), l_isToastToRight_0 (ref), v76 (copy), v67 (copy), v72 (copy), v85 (copy)
        local v229 = l_calculateToastPosition_0(v78, l_isToastToRight_0(v76), v67, v72);
        v85(v229);
    end, {
        v76, 
        v78, 
        v72
    });
    v17.useEffect(function() --[[ Line: 809 ]]
        -- upvalues: l_getDeviceOrientation_0 (ref), l_getNotificationSize_0 (ref), v65 (copy), v75 (copy), v91 (copy), v42 (ref), v77 (copy), v125 (copy)
        local l_ViewportSize_1 = workspace.CurrentCamera.ViewportSize;
        local v231 = l_getDeviceOrientation_0(l_ViewportSize_1);
        local v232 = l_getNotificationSize_0(v65, l_ViewportSize_1.X);
        v75(v232);
        v91(v65 and workspace.CurrentCamera.ViewportSize.X < v42.CompactCardThreashold);
        v77(v231);
        l_ViewportSize_1 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(v125);
        return function() --[[ Line: 815 ]]
            -- upvalues: l_ViewportSize_1 (copy)
            if l_ViewportSize_1 then
                l_ViewportSize_1:Disconnect();
            end;
        end;
    end, {});
    v17.useEffect(function() --[[ Line: 823 ]]
        -- upvalues: v88 (copy), v86 (copy), v119 (copy), v120 (copy)
        return function() --[[ Line: 824 ]]
            -- upvalues: v88 (ref), v86 (ref), v119 (ref), v120 (ref)
            if v88 then
                task.cancel(v88);
            end;
            if v86 then
                task.cancel(v86);
            end;
            if v119 then
                v120(nil);
                v119:Fire(false);
                v119:Destroy();
            end;
        end;
    end, {});
    v17.useEffect(function() --[[ Line: 840 ]]
        -- upvalues: v65 (copy), v41 (ref), v66 (copy), l_default_1 (copy)
        task.delay(0, function() --[[ Line: 841 ]]
            -- upvalues: v65 (ref), v41 (ref), v66 (ref), l_default_1 (ref)
            local v233 = if v65 then {
                v41.ChannelListEnum.Experience, 
                v41.ChannelListEnum.Dual
            } else {
                v41.ChannelListEnum.App, 
                v41.ChannelListEnum.Dual
            };
            if v66 then
                table.insert(v233, v41.ChannelListEnum.Desktop);
            end;
            l_default_1:setupNotifications(v233);
        end);
    end, {});
    v17.useEffect(function() --[[ Line: 861 ]]
        -- upvalues: l_default_1 (copy), v220 (copy)
        local v234 = l_default_1:listenToDisplayNotification(v220);
        return function() --[[ Line: 863 ]]
            -- upvalues: v234 (copy)
            if v234 then
                v234:Disconnect();
            end;
        end;
    end, {
        v220
    });
    local v235 = l_IsVRAppBuild_0();
    local v236 = v78 or not v235;
    local v237 = v128 and not l_TouchEnabled_0 and not v235 and v78;
    local v238 = v17.createElement("TextButton", {
        ZIndex = 2, 
        LayoutOrder = 1, 
        AnchorPoint = Vector2.new(0, 0), 
        Size = UDim2.new(0, v42.CardSizeDefault.closeButton, 0, v42.CardSizeDefault.closeButton), 
        Position = UDim2.new(0, -10, 0, -10), 
        BackgroundTransparency = v121.Theme.BackgroundUIDefault.Transparency, 
        BackgroundColor3 = v121.Theme.BackgroundUIDefault.Color, 
        Text = "", 
        [v17.Event.Activated] = v159, 
        [v17.Event.MouseEnter] = function() --[[ Line: 888 ]]
            -- upvalues: v102 (copy)
            v102(true);
        end, 
        [v17.Event.MouseLeave] = function() --[[ Line: 891 ]]
            -- upvalues: v102 (copy)
            v102(false);
        end
    }, {
        Border = v17.createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Color = v121.Theme.UIDefault.Color
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
            ImageColor3 = v121.Theme.SystemPrimaryDefault.Color
        })
    });
    local v241 = v17.useMemo(function() --[[ Line: 914 ]]
        -- upvalues: v17 (ref), l_SpringAnimatedItem_0 (ref), v74 (copy), v236 (copy), v80 (copy), v135 (copy), v41 (ref), v129 (copy), v100 (copy), v84 (copy), v57 (ref), v235 (copy), v78 (copy), v81 (copy), v177 (copy), v37 (ref), v158 (copy), v102 (copy), l_game_EngineFeature_0 (ref), v39 (ref), v104 (copy), v48 (ref), v227 (copy), v237 (copy), v238 (copy), v33 (ref), v90 (copy), v203 (copy), v34 (ref), v128 (copy), v108 (ref), v110 (copy), l_holdProgress_0 (copy)
        return v17.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
            regularProps = {
                ClipsDescendants = false, 
                Size = v74, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Active = true, 
                Visible = v236 and v80 ~= nil, 
                [v17.Event.MouseEnter] = function() --[[ Line: 923 ]]
                    -- upvalues: v135 (ref), v41 (ref), v129 (ref), v80 (ref), v100 (ref)
                    v135(v41.ToastNotificationActionsEnum.Hover, v129, v80);
                    v100(true);
                end, 
                [v17.Event.MouseLeave] = function() --[[ Line: 931 ]]
                    -- upvalues: v100 (ref)
                    v100(false);
                end
            }, 
            animatedValues = v84, 
            springOptions = v57, 
            mapValuesToProps = function(v239) --[[ Line: 937 ]] --[[ Name: mapValuesToProps ]]
                -- upvalues: v235 (ref)
                return {
                    Position = if v235 then UDim2.new(0.5, 0, 0.5, 0) else UDim2.new(v239.positionX, v239.positionXOffset, v239.positionY, v239.positionYOffset), 
                    AnchorPoint = if v235 then Vector2.new(0.5, 0.5) else Vector2.new(v239.anchorX, v239.anchorY)
                };
            end, 
            onComplete = function() --[[ Line: 952 ]] --[[ Name: onComplete ]]
                -- upvalues: v78 (ref), v81 (ref), v177 (ref)
                if not v78 then
                    v81(nil);
                    v177();
                end;
            end
        }, {
            SwipeDetector = v17.createElement(v37, {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                swipeEnabled = v78, 
                swipeCallback = function(v240) --[[ Line: 963 ]] --[[ Name: swipeCallback ]]
                    -- upvalues: v135 (ref), v41 (ref), v129 (ref), v80 (ref), v158 (ref), v102 (ref)
                    if v240 == Enum.SwipeDirection.Up or v240 == Enum.SwipeDirection.Right then
                        v135(v41.ToastNotificationActionsEnum.Dismissed, v129, v80);
                        v158();
                        v102(false);
                    end;
                end
            }, {
                NotificationProvider = if l_game_EngineFeature_0 and v80 and v80.luaNotifInfo and v80.id then v17.createElement(v39, {
                    notificationInfo = v80.luaNotifInfo, 
                    notificationId = v80.id, 
                    onPause = v104, 
                    onHover = v100, 
                    transparency = if v48 then v227 else nil, 
                    width = v74.X
                }, {
                    ToastCloseButton = if v237 then v238 else nil
                }) else v17.createElement(v33, {
                    state = v80 and v80.state, 
                    isCompact = v90, 
                    handleActions = v203, 
                    notificationReceivedTimestampMs = v80 and v80.notificationReceivedTimestampMs, 
                    timers = v80 and v80.timers, 
                    displayTimestampMs = v80 and v80.displayTimestamp
                }, {
                    NotificationCardCanvasGroup = if v80 then v17.createElement("CanvasGroup", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = v74, 
                        BackgroundTransparency = 1, 
                        GroupTransparency = v227, 
                        LayoutOrder = 2
                    }, {
                        NotificationCard = v17.createElement(v34, {
                            isHover = v128, 
                            shouldAutoFocus = v108, 
                            showHoldButton = v110, 
                            holdProgress = l_holdProgress_0
                        })
                    }) else nil, 
                    ToastCloseButton = if v237 then v238 else nil
                })
            })
        });
    end, {
        v42, 
        v121, 
        v80, 
        v236, 
        v78, 
        v90, 
        v237, 
        v128, 
        v84, 
        v159, 
        v100, 
        v102, 
        v203
    });
    if v235 then
        return v17.createElement(v38, {
            isConfirmModalOpen = v94, 
            isToastOpen = v78, 
            isCoreScript = v65, 
            ToastComponent = v241, 
            ToastNotificationSnoozeMenu = v17.createElement(v35), 
            ConfirmationModalComponent = v17.createElement(l_DeeplinkConfirmationModal_0, {
                closeCallback = v141, 
                backgroundTransparency = 1
            })
        });
    else
        return v17.createElement("ScreenGui", {
            DisplayOrder = v64.displayOrder, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            IgnoreGuiInset = true
        }, {
            Toast = v241, 
            ToastNotificationSnoozeMenu = v17.createElement(v35), 
            DeeplinkConfirmationModal = v94 and v17.createElement(l_DeeplinkConfirmationModal_0, {
                closeCallback = v141
            })
        });
    end;
end;