local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamNotifications");
local l_components_0 = l_script_FirstAncestor_0.components;
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_script_FirstAncestor_0.constants);
local v5 = require(l_Parent_0.Cryo);
local l_EventIngest_0 = require(l_Parent_0.Analytics).AnalyticsReporters.EventIngest;
local l_EventIngestService_0 = game:GetService("EventIngestService");
local v8 = l_EventIngest_0.new(l_EventIngestService_0);
local l_SessionService_0 = game:GetService("SessionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_ThirdPartyUserService_0 = game:GetService("ThirdPartyUserService");
local v13 = require(l_components_0.EmptyNotifications);
local v14 = require(l_components_0.MetaActionsMenu);
local v15 = require(l_components_0.StreamNotificationAnimationWrapper);
local v16 = require(l_components_0.StreamNotificationBundleWrapper);
local v17 = require(l_Parent_0.React);
local v18 = require(l_Parent_0.NotificationsCommon);
local l_JoinExperience_0 = v18.JoinExperience;
local l_type_0 = v18.type;
local l_NotificationHelper_0 = v18.NotificationHelper;
local v22 = require(l_script_FirstAncestor_0.EnumStreamNotificationsDisplayState);
local v23 = require(l_script_FirstAncestor_0.EnumStreamNotificationsLoadingMoreState);
local v24 = require(l_Parent_0.HttpRequest);
local l_FFlagLuaAppDefaultHttpRetry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppDefaultHttpRetry;
local v26 = v24.config({
    requestFunction = v24.requestFunctions.HttpRbxApi, 
    maxRetryCount = if l_FFlagLuaAppDefaultHttpRetry_0 then game:DefineFastInt("StreamNotificationsContentHttpRetryCount", 4) else nil
});
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useDeviceType_0 = require(l_Parent_0.RobloxAppHooks).useDeviceType;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v30 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v30.Core.Style.useStyle;
local l_LoadingSpinner_0 = v30.App.Loading.LoadingSpinner;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v34 = require(l_script_FirstAncestor_0.eventHandler.useClientTriggerEventHandler);
local v35 = require(l_script_FirstAncestor_0.utils.getStreamNotifications);
local v36 = require(l_script_FirstAncestor_0.utils.clearUnreadNotifications);
local v37 = require(l_script_FirstAncestor_0.utils.postNotificationsApi);
local v38 = require(l_script_FirstAncestor_0.utils.postReportNotification);
local v39 = require(l_script_FirstAncestor_0.utils.reportEvent);
local v40 = require(l_script_FirstAncestor_0.utils.sortNotifications);
local l_EventStream_0 = require(l_script_FirstAncestor_0.analytics.analyticsService).EventStream;
local v42 = require(l_script_FirstAncestor_0.analytics.analyticsConstants);
local l_CloseCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
local v44 = require(l_Parent_0.GenericAbuseReporting);
local l_AbuseVector_0 = v44.Enums.AbuseVector;
local l_OpenDynamicAbuseReport_0 = v44.Thunks.OpenDynamicAbuseReport;
local v47 = game:DefineFastFlag("LuaAppNewStreamNotificationsLogFix", false);
local v48 = require(l_Parent_0.SharedFlags);
local l_GetFFlagFilterNotificationsForPCGDKEnabled_0 = v48.GetFFlagFilterNotificationsForPCGDKEnabled;
local l_GetFStringPCGDKFilteredNotificationTypes_0 = v48.GetFStringPCGDKFilteredNotificationTypes;
local l_FFlagFixNotificationReportsMobile_0 = v48.FFlagFixNotificationReportsMobile;
local l_FFlagStreamNotificationsStandardizeClickEvents_0 = v48.FFlagStreamNotificationsStandardizeClickEvents;
local l_FFlagTCVerifiedParentalControl_0 = v48.FFlagTCVerifiedParentalControl;
local l_FFlagStreamNotificationImpressionLogging_0 = v48.FFlagStreamNotificationImpressionLogging;
local l_FrameBoundsImpressionsTracker_0 = require(l_Parent_0.Impressions).FrameBoundsImpressionsTracker;
local function _() --[[ Line: 84 ]] --[[ Name: GetIsFriendCommunicationRestricted ]]
    -- upvalues: l_GetFFlagFilterNotificationsForPCGDKEnabled_0 (copy), l_ThirdPartyUserService_0 (copy)
    return l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_ThirdPartyUserService_0 and l_ThirdPartyUserService_0:IsChatRestrictionSupported() and l_ThirdPartyUserService_0.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted;
end;
local v57 = require(l_script_FirstAncestor_0.StreamNotificationDropdownExperimentation);
local function v61() --[[ Line: 121 ]] --[[ Name: createImpressionSignal ]]
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    return {
        connect = function(_, v60) --[[ Line: 124 ]] --[[ Name: connect ]]
            -- upvalues: l_BindableEvent_0 (copy)
            return l_BindableEvent_0.Event:Connect(v60);
        end, 
        fire = function() --[[ Line: 127 ]] --[[ Name: fire ]]
            -- upvalues: l_BindableEvent_0 (copy)
            l_BindableEvent_0:Fire();
        end, 
        destroy = function() --[[ Line: 130 ]] --[[ Name: destroy ]]
            -- upvalues: l_BindableEvent_0 (copy)
            l_BindableEvent_0:Destroy();
        end
    };
end;
return function(v62) --[[ Line: 136 ]]
    -- upvalues: l_useStyle_0 (copy), v57 (copy), l_useDispatch_0 (copy), l_useDeviceType_0 (copy), v34 (copy), v17 (copy), v22 (copy), v23 (copy), l_FFlagStreamNotificationImpressionLogging_0 (copy), v61 (copy), l_UserInputService_0 (copy), v4 (copy), v35 (copy), v26 (copy), v40 (copy), l_GetFFlagFilterNotificationsForPCGDKEnabled_0 (copy), l_GetFStringPCGDKFilteredNotificationTypes_0 (copy), l_ThirdPartyUserService_0 (copy), v5 (copy), l_NotificationHelper_0 (copy), l_EventStream_0 (copy), v42 (copy), l_FFlagStreamNotificationsStandardizeClickEvents_0 (copy), v36 (copy), v38 (copy), l_FFlagFixNotificationReportsMobile_0 (copy), l_OpenDynamicAbuseReport_0 (copy), l_AbuseVector_0 (copy), l_CloseCentralOverlay_0 (copy), l_Players_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v47 (copy), l_type_0 (copy), l_JoinExperience_0 (copy), l_SessionService_0 (copy), v39 (copy), v8 (copy), v37 (copy), l_FFlagTCVerifiedParentalControl_0 (copy), v18 (copy), v14 (copy), l_LoadingSpinner_0 (copy), v16 (copy), v15 (copy), v13 (copy), l_GuiService_0 (copy), l_FrameBoundsImpressionsTracker_0 (copy)
    local v63 = l_useStyle_0();
    local v64 = v57.getDropdownEnabled();
    local v65 = l_useDispatch_0();
    local v66 = l_useDeviceType_0();
    local v67 = v34();
    local v68, v69 = v17.useState({});
    local v70, v71 = v17.useState(nil);
    local v72, v73 = v17.useState(v22.Initializing);
    local v74 = nil;
    local v75 = nil;
    local v76 = nil;
    local v78 = v62.showOverlay or function(_) --[[ Line: 158 ]]

    end;
    local v79 = v17.useRef(v23.Loading);
    local v80, v81 = v17.useState(v23.Loading);
    local v82 = v17.useRef(0);
    local v83 = v17.useRef(nil);
    local v84 = v17.useRef(if l_FFlagStreamNotificationImpressionLogging_0 then v61() else nil);
    local v85 = if l_UserInputService_0.StatusBarSize then l_UserInputService_0.StatusBarSize.Y else 0;
    local v86 = v4.Modal.HeaderHeight + v85;
    local v95 = v17.useMemo(function() --[[ Line: 174 ]]
        -- upvalues: l_FFlagStreamNotificationImpressionLogging_0 (ref), v68 (copy)
        if not l_FFlagStreamNotificationImpressionLogging_0 then
            return {
                byNotificationId = {}, 
                byIndex = {}
            };
        else
            local v87 = {};
            local v88 = {};
            local v89 = {};
            for v90, v91 in ipairs(v68) do
                if v91.notificationSourceType == "Sendr" then
                    local l_bundleKey_0 = v91.content.bundleKey;
                    local v93 = nil;
                    if l_bundleKey_0 and l_bundleKey_0 ~= "" then
                        v93 = (v89[l_bundleKey_0] or 0) + 1;
                        v89[l_bundleKey_0] = v93;
                    end;
                    local v94 = {
                        impressionIndex = v90, 
                        bundlePosition = v93, 
                        notification = v91
                    };
                    v88[v90] = v94;
                    if v91.id then
                        v87[v91.id] = v94;
                    end;
                end;
            end;
            return {
                byNotificationId = v87, 
                byIndex = v88
            };
        end;
    end, {
        v68
    });
    v17.useEffect(function() --[[ Line: 211 ]]
        -- upvalues: v74 (ref)
        v74();
    end, {});
    v17.useEffect(function() --[[ Line: 215 ]]
        -- upvalues: l_FFlagStreamNotificationImpressionLogging_0 (ref), v84 (copy)
        if not l_FFlagStreamNotificationImpressionLogging_0 then
            return;
        else
            return function() --[[ Line: 219 ]]
                -- upvalues: v84 (ref)
                if v84.current then
                    v84.current:destroy();
                end;
            end;
        end;
    end, {});
    local function _(v96) --[[ Line: 226 ]]
        -- upvalues: v79 (copy), v81 (copy)
        v79.current = v96;
        v81(v96);
    end;
    v74 = function() --[[ Line: 231 ]]
        -- upvalues: v79 (copy), v23 (ref), v81 (copy), v35 (ref), v26 (ref), v4 (ref), v82 (copy), v40 (ref), l_GetFFlagFilterNotificationsForPCGDKEnabled_0 (ref), l_GetFStringPCGDKFilteredNotificationTypes_0 (ref), l_ThirdPartyUserService_0 (ref), v69 (copy), v5 (ref), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v42 (ref), l_FFlagStreamNotificationsStandardizeClickEvents_0 (ref), v73 (copy), v22 (ref), v36 (ref), v68 (copy), v74 (ref)
        if v79.current == v23.NoMoreNotifications then
            return;
        else
            local l_Loading_0 = v23.Loading;
            v79.current = l_Loading_0;
            v81(l_Loading_0);
            v35(v26, v4.DefaultMaxRows, v82.current):andThen(function(v99) --[[ Line: 239 ]]
                -- upvalues: v40 (ref), l_GetFFlagFilterNotificationsForPCGDKEnabled_0 (ref), l_GetFStringPCGDKFilteredNotificationTypes_0 (ref), l_ThirdPartyUserService_0 (ref), v69 (ref), v5 (ref), v23 (ref), v79 (ref), v81 (ref), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v42 (ref), v4 (ref), l_FFlagStreamNotificationsStandardizeClickEvents_0 (ref), v73 (ref), v22 (ref), v36 (ref), v26 (ref), v82 (ref), v68 (ref), v74 (ref)
                v99 = v40(v99);
                if l_GetFFlagFilterNotificationsForPCGDKEnabled_0() then
                    local v100 = l_GetFStringPCGDKFilteredNotificationTypes_0();
                    local v101 = {};
                    for _, v103 in ipairs(v99) do
                        if not v100[v103.content.notificationType] or not (l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_ThirdPartyUserService_0 and l_ThirdPartyUserService_0:IsChatRestrictionSupported() and l_ThirdPartyUserService_0.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted) then
                            table.insert(v101, v103);
                        end;
                    end;
                    v99 = v101;
                end;
                if v99 and #v99 > 0 then
                    v69(function(v104) --[[ Line: 265 ]]
                        -- upvalues: v5 (ref), v99 (ref)
                        return (v5.List.join(v104, v99));
                    end);
                    local l_Default_0 = v23.Default;
                    v79.current = l_Default_0;
                    v81(l_Default_0);
                    for _, v107 in ipairs(v99) do
                        l_NotificationHelper_0.fireEvent(l_EventStream_0, v42.Context.fetched, v42.EventNames.notificationRetrieved, v5.Dictionary.join(v107.content.clientEventsPayload or {}, {
                            sendrVersion = v4.SENDRVersion, 
                            notificationType = v107.content.notificationType or nil, 
                            notificationId = v107.id or nil, 
                            notificationState = if l_FFlagStreamNotificationsStandardizeClickEvents_0 then v107.content.currentState or nil else nil
                        }));
                    end;
                else
                    local l_NoMoreNotifications_0 = v23.NoMoreNotifications;
                    v79.current = l_NoMoreNotifications_0;
                    v81(l_NoMoreNotifications_0);
                end;
                v73(v22.Default);
                v36(v26);
                v82.current = (tonumber(v82.current) or 0) + v4.DefaultMaxRows;
                if v68 and #v68 < v4.DefaultMaxRows then
                    v74();
                end;
            end):catch(function(_) --[[ Line: 298 ]]
                -- upvalues: v73 (ref), v22 (ref)
                v73(v22.ErrorRetrieving);
            end);
            return;
        end;
    end;
    local function v117(v110, v111) --[[ Line: 303 ]]
        -- upvalues: v64 (copy), v62 (copy), v38 (ref), v26 (ref), v75 (ref), v73 (copy), v22 (ref), l_FFlagFixNotificationReportsMobile_0 (ref), v65 (copy), l_OpenDynamicAbuseReport_0 (ref), l_AbuseVector_0 (ref), l_CloseCentralOverlay_0 (ref), v66 (copy), l_Players_0 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        if v64 then
            v62.displayStream(false);
        end;
        local function v114() --[[ Line: 315 ]]
            -- upvalues: v38 (ref), v26 (ref), v111 (copy), v75 (ref), v110 (copy), v64 (ref), v62 (ref), v73 (ref), v22 (ref)
            v38(v26, v111.id):andThen(function(_) --[[ Line: 317 ]]

            end):catch(function(_) --[[ Line: 318 ]]

            end);
            v75(v110, v111);
            if not v64 then
                v62.setDisplayScreenGuiEnabled(true);
            end;
            v73(v22.Default);
        end;
        local function v115() --[[ Line: 329 ]]
            -- upvalues: v64 (ref), v62 (ref), v73 (ref), v22 (ref)
            if v64 then
                v62.displayStream(true);
            else
                v62.setDisplayScreenGuiEnabled(true);
            end;
            v73(v22.Default);
        end;
        if l_FFlagFixNotificationReportsMobile_0 then
            v65(l_OpenDynamicAbuseReport_0({
                abuseVector = l_AbuseVector_0.Notifications, 
                targetId = v111.id, 
                onSubmit = v114, 
                onClose = function() --[[ Line: 343 ]] --[[ Name: onClose ]]
                    -- upvalues: v65 (ref), l_CloseCentralOverlay_0 (ref), v64 (ref), v62 (ref), v73 (ref), v22 (ref)
                    v65(l_CloseCentralOverlay_0());
                    if v64 then
                        v62.displayStream(true);
                    else
                        v62.setDisplayScreenGuiEnabled(true);
                    end;
                    v73(v22.Default);
                end
            }));
            return;
        else
            v62.setDisplayScreenGuiEnabled(false);
            local v116 = {
                reportEntryPoint = "Notification", 
                assetId = v111.id, 
                reportSurface = string.lower(v66), 
                submissionEntryPoint = string.lower(v66), 
                submitterUserId = if l_Players_0.LocalPlayer then tostring(l_Players_0.LocalPlayer.UserId) else nil, 
                onSubmitReportCallback = v114, 
                onCloseCallback = v115
            };
            v65(l_NavigateDown_0({
                name = l_AppPage_0.ReportDialog, 
                reportData = v116
            }));
            return;
        end;
    end;
    local function _(v118) --[[ Line: 368 ]]
        -- upvalues: v76 (ref), v68 (copy), v5 (ref), v69 (copy)
        v76();
        if v68 and v118 then
            local v120 = v5.List.map(v68, function(v119) --[[ Line: 371 ]]
                -- upvalues: v118 (copy)
                if v119.id == v118 then
                    v119.dismiss = true;
                end;
                return v119;
            end);
            v69(v120);
        end;
    end;
    local v126 = v17.useCallback(function(v122) --[[ Line: 382 ]]
        -- upvalues: v68 (copy), v5 (ref), v69 (copy)
        if v68 and v122 then
            local v125 = v5.List.filter(v68, function(v123) --[[ Line: 384 ]]
                -- upvalues: v122 (copy)
                local v124 = false;
                if v123.id ~= v122 then
                    v124 = v123.dismiss ~= true;
                end;
                return v124;
            end);
            v69(v125);
        end;
    end);
    local v132 = v17.useCallback(function(v127) --[[ Line: 393 ]]
        -- upvalues: l_FFlagStreamNotificationImpressionLogging_0 (ref), v95 (copy), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v42 (ref), v5 (ref), v4 (ref), l_FFlagStreamNotificationsStandardizeClickEvents_0 (ref)
        if not l_FFlagStreamNotificationImpressionLogging_0 then
            return;
        else
            for _, v129 in ipairs(v127) do
                local v130 = v95.byIndex[v129];
                local v131 = if v130 then v130.notification else nil;
                if v131 then
                    l_NotificationHelper_0.fireEvent(l_EventStream_0, v42.Context.impression, v42.EventNames.notificationImpression, v5.Dictionary.join(v131.content.clientEventsPayload or {}, {
                        sendrVersion = v4.SENDRVersion, 
                        notificationType = v131.content.notificationType or nil, 
                        notificationId = v131.id or nil, 
                        notificationState = if l_FFlagStreamNotificationsStandardizeClickEvents_0 then v131.content.currentState or nil else nil, 
                        bundlePosition = v130.bundlePosition or nil, 
                        bundleKey = v131.content.bundleKey or nil
                    }));
                end;
            end;
            return;
        end;
    end, {
        v95
    });
    local v145 = v17.useCallback(function(v133, v134) --[[ Line: 423 ]]
        -- upvalues: v70 (copy), v71 (copy), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v42 (ref), v5 (ref), l_FFlagStreamNotificationsStandardizeClickEvents_0 (ref), v47 (ref), v4 (ref), l_type_0 (ref), l_JoinExperience_0 (ref), v62 (copy), l_SessionService_0 (ref), v39 (ref), v8 (ref), v37 (ref), v26 (ref), v75 (ref), v76 (ref), v73 (copy), v22 (ref), v117 (copy), v68 (copy), v69 (copy), l_FFlagTCVerifiedParentalControl_0 (ref), v67 (copy)
        local v135 = v134 or v70;
        v71(v135);
        l_NotificationHelper_0.fireEvent(l_EventStream_0, v42.Context.click, v133.eventName or "", v5.Dictionary.join(v133.clientEventsPayload or {}, {
            notifType = if l_FFlagStreamNotificationsStandardizeClickEvents_0 then nil else if v47 then v135 and v135.content and v135.content.notificationType else nil, 
            notifId = if l_FFlagStreamNotificationsStandardizeClickEvents_0 then nil else if v47 then v135 and v135.id else nil, 
            notificationType = if l_FFlagStreamNotificationsStandardizeClickEvents_0 then v135 and v135.content and v135.content.notificationType else nil, 
            notificationId = if l_FFlagStreamNotificationsStandardizeClickEvents_0 then v135 and v135.id else nil, 
            notificationState = if l_FFlagStreamNotificationsStandardizeClickEvents_0 then v135 and v135.content and v135.content.currentState else nil, 
            visualItemType = v133.visualItemType or nil, 
            visualItemName = v133.visualItemName or nil, 
            sendrVersion = v4.SENDRVersion
        }));
        if v133.actions and #v133.actions > 0 and v135 then
            for _, v137 in ipairs(v133.actions) do
                if v137.actionType then
                    if v137.actionType == l_type_0.ActionTypeEnum.Deeplink then
                        if l_JoinExperience_0(v137.path, false) then
                            v62.displayStream(false);
                            l_SessionService_0:SetSession(v4.StreamSessionStructuralIdentifier.Level1, v4.StreamSessionStructuralIdentifier.StreamNotification, v4.StreamSessionStructuralIdentifier.StreamNotification);
                            l_SessionService_0:SetMetadata(v4.StreamSessionStructuralIdentifier.StreamNotification, v4.StreamSessionStructuralIdentifier.DeleteOnGameLeave, "True");
                            v39(v8, {
                                action_type = v137.actionType, 
                                delivery_channel = v4.DeliveryChannel, 
                                notification_type = v135.notificationSourceType, 
                                notification_id = v135.id
                            });
                        end;
                    elseif v137.actionType == l_type_0.ActionTypeEnum.NotificationApi then
                        local v138 = v135 and v135.id or nil;
                        local v139 = v137.path or nil;
                        v37(v26, v138, v139):andThen(function(_) --[[ Line: 496 ]]
                            -- upvalues: v137 (copy), v75 (ref), v135 (copy)
                            if v137.nextState ~= nil and v137.nextState ~= "" then
                                v75(v137.nextState, v135);
                            end;
                        end):catch(function(_) --[[ Line: 501 ]]

                        end);
                        v76();
                    elseif v137.actionType == l_type_0.ActionTypeEnum.Report then
                        v73(v22.AbuseReport);
                        v117(v137.nextState, v135);
                    elseif v137.actionType == l_type_0.ActionTypeEnum.Dismiss then
                        local l_id_0 = v135.id;
                        v76();
                        if v68 and l_id_0 then
                            local v144 = v5.List.map(v68, function(v143) --[[ Line: 371 ]]
                                -- upvalues: l_id_0 (copy)
                                if v143.id == l_id_0 then
                                    v143.dismiss = true;
                                end;
                                return v143;
                            end);
                            v69(v144);
                        end;
                    elseif v137.actionType == l_type_0.ActionTypeEnum.ClientTrigger then
                        if l_FFlagTCVerifiedParentalControl_0 and v137.path == "TrustedContactsDoubleOptInModal" then
                            v62.displayStream(false);
                        end;
                        v67(v137.path, {
                            clientEventsPayload = v135.content.clientEventsPayload, 
                            callback = function() --[[ Line: 522 ]] --[[ Name: callback ]]
                                -- upvalues: v75 (ref), v137 (copy), v135 (copy)
                                v75(v137.nextState, v135);
                            end
                        });
                    end;
                end;
            end;
        end;
    end);
    local function v147(v146) --[[ Line: 533 ]]
        -- upvalues: v71 (copy), v73 (copy), v22 (ref), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v42 (ref), v18 (ref), v4 (ref), l_FFlagStreamNotificationsStandardizeClickEvents_0 (ref)
        v71(v146);
        v73(v22.MetaActions);
        l_NotificationHelper_0.fireEvent(l_EventStream_0, v42.Context.click, v42.EventNames.openMetaActions, {
            visualItemType = v18.type.VisualItemTypeEnum.MetaAction, 
            sendrVersion = v4.SENDRVersion, 
            notificationState = if l_FFlagStreamNotificationsStandardizeClickEvents_0 then v146 and v146.content and v146.content.currentState or nil else nil
        });
    end;
    v76 = function() --[[ Line: 555 ]]
        -- upvalues: v78 (copy), v71 (copy), v72 (copy), v22 (ref), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v42 (ref), v18 (ref), v4 (ref), v73 (copy)
        v78(true);
        v71(nil);
        if v72 == v22.MetaActions then
            l_NotificationHelper_0.fireEvent(l_EventStream_0, v42.Context.click, v42.EventNames.closeMetaActions, {
                visualItemType = v18.type.VisualItemTypeEnum.MetaAction, 
                sendrVersion = v4.SENDRVersion
            });
        end;
        v73(v22.Default);
    end;
    v75 = function(v148, v149) --[[ Line: 572 ]]
        -- upvalues: v68 (copy), v69 (copy)
        local v150 = {};
        if v68 and v149 then
            for _, v152 in ipairs(v68) do
                if v152.id == v149.id then
                    v152.content.currentState = v148;
                end;
                table.insert(v150, v152);
            end;
        end;
        v69(v150);
    end;
    local v153 = v17.useMemo(function() --[[ Line: 588 ]]
        -- upvalues: v17 (ref), v14 (ref), v72 (copy), v70 (copy), v62 (copy), v145 (copy), v76 (ref)
        return v17.createElement(v14, {
            displayState = v72, 
            activeNotification = v70, 
            isSmallScreen = v62.isSmallScreen, 
            handleActions = v145, 
            closeNotificationDisplay = v76
        });
    end, {
        v72, 
        v70
    });
    local v164 = v17.useMemo(function() --[[ Line: 598 ]]
        -- upvalues: v72 (copy), v22 (ref), v17 (ref), l_LoadingSpinner_0 (ref), v4 (ref), v68 (copy), v64 (copy), v16 (ref), v126 (copy), v145 (copy), v147 (copy), l_FFlagStreamNotificationImpressionLogging_0 (ref), v95 (copy), v15 (ref), v79 (copy), v23 (ref), v86 (copy), v13 (ref)
        if v72 == v22.Initializing then
            return v17.createElement(l_LoadingSpinner_0, {
                size = UDim2.fromOffset(v4.InitializingNotifications.Size, v4.InitializingNotifications.Size), 
                position = UDim2.fromScale(0.5, 0.5), 
                anchorPoint = Vector2.new(0.5, 0.5)
            });
        else
            if v68 and #v68 > 0 then
                local v154 = {
                    UIListLayout = v17.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = if v64 then UDim.new(0, v4.Dropdown.CardGap) else nil
                    })
                };
                if v64 then
                    v154.UIPadding = v17.createElement("UIPadding", {
                        PaddingRight = UDim.new(0, v4.Dropdown.ScrollBarThickness)
                    });
                end;
                local v155 = false;
                local v156 = {};
                for _, v158 in ipairs(v68) do
                    if v158.notificationSourceType == "Sendr" then
                        v155 = true;
                        local l_bundleKey_1 = v158.content.bundleKey;
                        if l_bundleKey_1 and l_bundleKey_1 ~= "" then
                            if v156[l_bundleKey_1] then
                                table.insert(v156[l_bundleKey_1], v158);
                            else
                                v156[l_bundleKey_1] = {
                                    v158
                                };
                            end;
                        end;
                    end;
                end;
                for v160, v161 in ipairs(v68) do
                    if v161.notificationSourceType == "Sendr" then
                        local l_bundleKey_2 = v161.content.bundleKey;
                        if l_bundleKey_2 and l_bundleKey_2 ~= "" and #v156[l_bundleKey_2] > 1 then
                            if not v154[l_bundleKey_2] then
                                v154[l_bundleKey_2] = v17.createElement(v16, {
                                    layoutOrder = v160, 
                                    notifications = v156[l_bundleKey_2], 
                                    finishDismissNotification = v126, 
                                    handleActions = v145, 
                                    openMetaActions = v147, 
                                    impressionsTag = l_FFlagStreamNotificationImpressionLogging_0 and "StreamNotificationImpression" or nil, 
                                    impressionMetadataByNotificationId = if l_FFlagStreamNotificationImpressionLogging_0 then v95.byNotificationId else nil
                                }, {});
                            end;
                        else
                            local v163 = if l_FFlagStreamNotificationImpressionLogging_0 then v95.byNotificationId[v161.id] else nil;
                            v154[v161.id] = v17.createElement(v15, {
                                layoutOrder = v160, 
                                notification = v161, 
                                finishDismissNotification = v126, 
                                handleActions = v145, 
                                openMetaActions = v147, 
                                collapsed = false, 
                                impressionsTag = l_FFlagStreamNotificationImpressionLogging_0 and "StreamNotificationImpression" or nil, 
                                impressionIndex = if l_FFlagStreamNotificationImpressionLogging_0 then v163 and v163.impressionIndex or nil else nil
                            }, {});
                        end;
                    end;
                end;
                if v79.current == v23.Loading then
                    v154.LoadingMore = v17.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, v4.LoadingMoreNotifications.Size), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1e999
                    }, {
                        LoadingMoreSpinner = v17.createElement(l_LoadingSpinner_0, {
                            size = UDim2.fromOffset(v4.LoadingMoreNotifications.Size, v4.LoadingMoreNotifications.Size), 
                            position = UDim2.fromScale(0.5, 0.5), 
                            anchorPoint = Vector2.new(0.5, 0.5)
                        })
                    });
                end;
                if v155 then
                    return v17.createElement("Frame", {
                        Size = if v64 then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 0, -v86), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1
                    }, v154);
                end;
            end;
            return v17.createElement(v13);
        end;
    end, {
        v68, 
        v72, 
        v80, 
        v64, 
        v95
    });
    local function v169(v165) --[[ Line: 745 ]]
        -- upvalues: v72 (copy), v22 (ref), l_FFlagStreamNotificationImpressionLogging_0 (ref), v84 (copy), v4 (ref), v79 (copy), v23 (ref), v74 (ref)
        local l_Y_0 = v165.AbsoluteCanvasSize.Y;
        local l_Y_1 = v165.AbsoluteWindowSize.Y;
        local l_Y_2 = v165.CanvasPosition.Y;
        if l_Y_1 == 0 or l_Y_0 == 0 or v72 ~= v22.Default then
            return;
        else
            if l_FFlagStreamNotificationImpressionLogging_0 and v84.current then
                v84.current:fire();
            end;
            if l_Y_0 - l_Y_1 - v4.LoadingMoreNotifications.TriggerDistance <= l_Y_2 and v79.current == v23.Default then
                v74();
            end;
            return;
        end;
    end;
    local v170 = if l_UserInputService_0.BottomBarSize then l_UserInputService_0.BottomBarSize.Y else 0;
    local v171 = if l_GuiService_0:GetSafeZoneOffsets() then l_GuiService_0:GetSafeZoneOffsets().bottom else 0;
    local v172 = if v62.isSmallScreen then math.max(v170, v171) else 0;
    if v64 then
        return v17.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            ClipsDescendants = true
        }, {
            MetaActionsOpen = v17.createElement("TextButton", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Visible = v72 == v22.MetaActions, 
                BackgroundTransparency = v63.Theme.Overlay.Transparency, 
                BackgroundColor3 = v63.Theme.Overlay.Color, 
                Text = "", 
                AutoButtonColor = false, 
                ZIndex = 2, 
                [v17.Event.Activated] = v76, 
                BorderSizePixel = 0, 
                Selectable = false
            }, {
                v153
            }), 
            NotificationsList = v17.createElement("ScrollingFrame", {
                Size = UDim2.new(1, 0, 0, (v62.dropdownHeight or v4.Dropdown.MaxHeight) - v4.Dropdown.HeaderMinHeight - v4.Dropdown.HeaderBodyGap), 
                CanvasSize = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                ScrollBarThickness = v4.Dropdown.ScrollBarThickness, 
                BorderSizePixel = 0, 
                VerticalScrollBarInset = Enum.ScrollBarInset.None, 
                VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right, 
                ScrollBarImageColor3 = v63.Theme.UIEmphasis.Color, 
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                ElasticBehavior = Enum.ElasticBehavior.Always, 
                ScrollingEnabled = v72 == v22.Default, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                [v17.Change.CanvasPosition] = v169, 
                Selectable = false
            }, v164)
        });
    else
        return v17.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1
        }, {
            MetaActionsOpen = v17.createElement("TextButton", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Visible = v72 == v22.MetaActions, 
                BackgroundTransparency = v63.Theme.Overlay.Transparency, 
                BackgroundColor3 = v63.Theme.Overlay.Color, 
                Text = "", 
                AutoButtonColor = false, 
                ZIndex = 2, 
                [v17.Event.Activated] = v76, 
                BorderSizePixel = 0, 
                Selectable = false
            }, {
                v153
            }), 
            NotificationsList = v17.createElement("ScrollingFrame", {
                ref = if l_FFlagStreamNotificationImpressionLogging_0 then v83 else nil, 
                Size = UDim2.new(1, 0, 1, -(v86 + v4.DefaultPadding + v172)), 
                CanvasSize = UDim2.new(1, 0, 1, -(v86 + v4.DefaultPadding + v172)), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, 0, 0, v86), 
                AnchorPoint = Vector2.new(0, 0), 
                ScrollBarThickness = 4, 
                BorderSizePixel = 0, 
                VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar, 
                VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right, 
                ScrollBarImageColor3 = v63.Theme.UIEmphasis.Color, 
                AutomaticCanvasSize = Enum.AutomaticSize.XY, 
                ElasticBehavior = Enum.ElasticBehavior.Always, 
                ScrollingEnabled = v72 == v22.Default, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                [v17.Change.CanvasPosition] = v169, 
                Selectable = false
            }, v164), 
            ImpressionTracker = if l_FFlagStreamNotificationImpressionLogging_0 then v17.createElement(l_FrameBoundsImpressionsTracker_0, {
                parentRef = v83, 
                pageContext = nil, 
                impressionsTag = "StreamNotificationImpression", 
                scrollViewPositionChangedSignal = v84.current, 
                sendImpressions = v132
            }) else nil
        });
    end;
end;