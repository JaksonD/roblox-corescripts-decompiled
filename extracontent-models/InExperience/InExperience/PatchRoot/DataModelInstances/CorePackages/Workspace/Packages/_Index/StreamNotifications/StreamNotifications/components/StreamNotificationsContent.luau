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
local function _() --[[ Line: 77 ]] --[[ Name: GetIsFriendCommunicationRestricted ]]
    -- upvalues: l_GetFFlagFilterNotificationsForPCGDKEnabled_0 (copy), l_ThirdPartyUserService_0 (copy)
    return l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_ThirdPartyUserService_0 and l_ThirdPartyUserService_0:IsChatRestrictionSupported() and l_ThirdPartyUserService_0.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted;
end;
local v55 = require(l_script_FirstAncestor_0.StreamNotificationDropdownExperimentation);
return function(v56) --[[ Line: 93 ]]
    -- upvalues: l_useStyle_0 (copy), v55 (copy), l_useDispatch_0 (copy), l_useDeviceType_0 (copy), v34 (copy), v17 (copy), v22 (copy), v23 (copy), l_UserInputService_0 (copy), v4 (copy), v35 (copy), v26 (copy), v40 (copy), l_GetFFlagFilterNotificationsForPCGDKEnabled_0 (copy), l_GetFStringPCGDKFilteredNotificationTypes_0 (copy), l_ThirdPartyUserService_0 (copy), v5 (copy), l_NotificationHelper_0 (copy), l_EventStream_0 (copy), v42 (copy), l_FFlagStreamNotificationsStandardizeClickEvents_0 (copy), v36 (copy), v38 (copy), l_FFlagFixNotificationReportsMobile_0 (copy), l_OpenDynamicAbuseReport_0 (copy), l_AbuseVector_0 (copy), l_CloseCentralOverlay_0 (copy), l_Players_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v47 (copy), l_type_0 (copy), l_JoinExperience_0 (copy), l_SessionService_0 (copy), v39 (copy), v8 (copy), v37 (copy), l_FFlagTCVerifiedParentalControl_0 (copy), v18 (copy), v14 (copy), l_LoadingSpinner_0 (copy), v16 (copy), v15 (copy), v13 (copy), l_GuiService_0 (copy)
    local v57 = l_useStyle_0();
    local v58 = v55.getDropdownEnabled();
    local v59 = l_useDispatch_0();
    local v60 = l_useDeviceType_0();
    local v61 = v34();
    local v62, v63 = v17.useState({});
    local v64, v65 = v17.useState(nil);
    local v66, v67 = v17.useState(v22.Initializing);
    local v68 = nil;
    local v69 = nil;
    local v70 = nil;
    local v72 = v56.showOverlay or function(_) --[[ Line: 115 ]]

    end;
    local v73 = v17.useRef(v23.Loading);
    local v74, v75 = v17.useState(v23.Loading);
    local v76 = v17.useRef(0);
    local v77 = if l_UserInputService_0.StatusBarSize then l_UserInputService_0.StatusBarSize.Y else 0;
    local v78 = v4.Modal.HeaderHeight + v77;
    v17.useEffect(function() --[[ Line: 124 ]]
        -- upvalues: v68 (ref)
        v68();
    end, {});
    local function _(v79) --[[ Line: 128 ]]
        -- upvalues: v73 (copy), v75 (copy)
        v73.current = v79;
        v75(v79);
    end;
    v68 = function() --[[ Line: 133 ]]
        -- upvalues: v73 (copy), v23 (ref), v75 (copy), v35 (ref), v26 (ref), v4 (ref), v76 (copy), v40 (ref), l_GetFFlagFilterNotificationsForPCGDKEnabled_0 (ref), l_GetFStringPCGDKFilteredNotificationTypes_0 (ref), l_ThirdPartyUserService_0 (ref), v63 (copy), v5 (ref), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v42 (ref), l_FFlagStreamNotificationsStandardizeClickEvents_0 (ref), v67 (copy), v22 (ref), v36 (ref), v62 (copy), v68 (ref)
        if v73.current == v23.NoMoreNotifications then
            return;
        else
            local l_Loading_0 = v23.Loading;
            v73.current = l_Loading_0;
            v75(l_Loading_0);
            v35(v26, v4.DefaultMaxRows, v76.current):andThen(function(v82) --[[ Line: 141 ]]
                -- upvalues: v40 (ref), l_GetFFlagFilterNotificationsForPCGDKEnabled_0 (ref), l_GetFStringPCGDKFilteredNotificationTypes_0 (ref), l_ThirdPartyUserService_0 (ref), v63 (ref), v5 (ref), v23 (ref), v73 (ref), v75 (ref), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v42 (ref), v4 (ref), l_FFlagStreamNotificationsStandardizeClickEvents_0 (ref), v67 (ref), v22 (ref), v36 (ref), v26 (ref), v76 (ref), v62 (ref), v68 (ref)
                v82 = v40(v82);
                if l_GetFFlagFilterNotificationsForPCGDKEnabled_0() then
                    local v83 = l_GetFStringPCGDKFilteredNotificationTypes_0();
                    local v84 = {};
                    for _, v86 in ipairs(v82) do
                        if not v83[v86.content.notificationType] or not (l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_ThirdPartyUserService_0 and l_ThirdPartyUserService_0:IsChatRestrictionSupported() and l_ThirdPartyUserService_0.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted) then
                            table.insert(v84, v86);
                        end;
                    end;
                    v82 = v84;
                end;
                if v82 and #v82 > 0 then
                    v63(function(v87) --[[ Line: 167 ]]
                        -- upvalues: v5 (ref), v82 (ref)
                        return (v5.List.join(v87, v82));
                    end);
                    local l_Default_0 = v23.Default;
                    v73.current = l_Default_0;
                    v75(l_Default_0);
                    for _, v90 in ipairs(v82) do
                        l_NotificationHelper_0.fireEvent(l_EventStream_0, v42.Context.fetched, v42.EventNames.notificationRetrieved, v5.Dictionary.join(v90.content.clientEventsPayload or {}, {
                            sendrVersion = v4.SENDRVersion, 
                            notificationType = v90.content.notificationType or nil, 
                            notificationId = v90.id or nil, 
                            notificationState = if l_FFlagStreamNotificationsStandardizeClickEvents_0 then v90.content.currentState or nil else nil
                        }));
                    end;
                else
                    local l_NoMoreNotifications_0 = v23.NoMoreNotifications;
                    v73.current = l_NoMoreNotifications_0;
                    v75(l_NoMoreNotifications_0);
                end;
                v67(v22.Default);
                v36(v26);
                v76.current = (tonumber(v76.current) or 0) + v4.DefaultMaxRows;
                if v62 and #v62 < v4.DefaultMaxRows then
                    v68();
                end;
            end):catch(function(_) --[[ Line: 200 ]]
                -- upvalues: v67 (ref), v22 (ref)
                v67(v22.ErrorRetrieving);
            end);
            return;
        end;
    end;
    local function v100(v93, v94) --[[ Line: 205 ]]
        -- upvalues: v58 (copy), v56 (copy), v38 (ref), v26 (ref), v69 (ref), v67 (copy), v22 (ref), l_FFlagFixNotificationReportsMobile_0 (ref), v59 (copy), l_OpenDynamicAbuseReport_0 (ref), l_AbuseVector_0 (ref), l_CloseCentralOverlay_0 (ref), v60 (copy), l_Players_0 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        if v58 then
            v56.displayStream(false);
        end;
        local function v97() --[[ Line: 217 ]]
            -- upvalues: v38 (ref), v26 (ref), v94 (copy), v69 (ref), v93 (copy), v58 (ref), v56 (ref), v67 (ref), v22 (ref)
            v38(v26, v94.id):andThen(function(_) --[[ Line: 219 ]]

            end):catch(function(_) --[[ Line: 220 ]]

            end);
            v69(v93, v94);
            if v58 then
                v56.displayStream(true);
            else
                v56.setDisplayScreenGuiEnabled(true);
            end;
            v67(v22.Default);
        end;
        local function v98() --[[ Line: 233 ]]
            -- upvalues: v58 (ref), v56 (ref), v67 (ref), v22 (ref)
            if v58 then
                v56.displayStream(true);
            else
                v56.setDisplayScreenGuiEnabled(true);
            end;
            v67(v22.Default);
        end;
        if l_FFlagFixNotificationReportsMobile_0 then
            v59(l_OpenDynamicAbuseReport_0({
                abuseVector = l_AbuseVector_0.Notifications, 
                targetId = v94.id, 
                onSubmit = v97, 
                onClose = function() --[[ Line: 247 ]] --[[ Name: onClose ]]
                    -- upvalues: v59 (ref), l_CloseCentralOverlay_0 (ref), v58 (ref), v56 (ref), v67 (ref), v22 (ref)
                    v59(l_CloseCentralOverlay_0());
                    if v58 then
                        v56.displayStream(true);
                    else
                        v56.setDisplayScreenGuiEnabled(true);
                    end;
                    v67(v22.Default);
                end
            }));
            return;
        else
            v56.setDisplayScreenGuiEnabled(false);
            local v99 = {
                reportEntryPoint = "Notification", 
                assetId = v94.id, 
                reportSurface = string.lower(v60), 
                submissionEntryPoint = string.lower(v60), 
                submitterUserId = if l_Players_0.LocalPlayer then tostring(l_Players_0.LocalPlayer.UserId) else nil, 
                onSubmitReportCallback = v97, 
                onCloseCallback = v98
            };
            v59(l_NavigateDown_0({
                name = l_AppPage_0.ReportDialog, 
                reportData = v99
            }));
            return;
        end;
    end;
    local function _(v101) --[[ Line: 272 ]]
        -- upvalues: v70 (ref), v62 (copy), v5 (ref), v63 (copy)
        v70();
        if v62 and v101 then
            local v103 = v5.List.map(v62, function(v102) --[[ Line: 275 ]]
                -- upvalues: v101 (copy)
                if v102.id == v101 then
                    v102.dismiss = true;
                end;
                return v102;
            end);
            v63(v103);
        end;
    end;
    local v109 = v17.useCallback(function(v105) --[[ Line: 286 ]]
        -- upvalues: v62 (copy), v5 (ref), v63 (copy)
        if v62 and v105 then
            local v108 = v5.List.filter(v62, function(v106) --[[ Line: 288 ]]
                -- upvalues: v105 (copy)
                local v107 = false;
                if v106.id ~= v105 then
                    v107 = v106.dismiss ~= true;
                end;
                return v107;
            end);
            v63(v108);
        end;
    end);
    local v122 = v17.useCallback(function(v110, v111) --[[ Line: 298 ]]
        -- upvalues: v64 (copy), v65 (copy), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v42 (ref), v5 (ref), l_FFlagStreamNotificationsStandardizeClickEvents_0 (ref), v47 (ref), v4 (ref), l_type_0 (ref), l_JoinExperience_0 (ref), v56 (copy), l_SessionService_0 (ref), v39 (ref), v8 (ref), v37 (ref), v26 (ref), v69 (ref), v70 (ref), v67 (copy), v22 (ref), v100 (copy), v62 (copy), v63 (copy), l_FFlagTCVerifiedParentalControl_0 (ref), v61 (copy)
        local v112 = v111 or v64;
        v65(v112);
        l_NotificationHelper_0.fireEvent(l_EventStream_0, v42.Context.click, v110.eventName or "", v5.Dictionary.join(v110.clientEventsPayload or {}, {
            notifType = if l_FFlagStreamNotificationsStandardizeClickEvents_0 then nil else if v47 then v112 and v112.content and v112.content.notificationType else nil, 
            notifId = if l_FFlagStreamNotificationsStandardizeClickEvents_0 then nil else if v47 then v112 and v112.id else nil, 
            notificationType = if l_FFlagStreamNotificationsStandardizeClickEvents_0 then v112 and v112.content and v112.content.notificationType else nil, 
            notificationId = if l_FFlagStreamNotificationsStandardizeClickEvents_0 then v112 and v112.id else nil, 
            notificationState = if l_FFlagStreamNotificationsStandardizeClickEvents_0 then v112 and v112.content and v112.content.currentState else nil, 
            visualItemType = v110.visualItemType or nil, 
            visualItemName = v110.visualItemName or nil, 
            sendrVersion = v4.SENDRVersion
        }));
        if v110.actions and #v110.actions > 0 and v112 then
            for _, v114 in ipairs(v110.actions) do
                if v114.actionType then
                    if v114.actionType == l_type_0.ActionTypeEnum.Deeplink then
                        if l_JoinExperience_0(v114.path, false) then
                            v56.displayStream(false);
                            l_SessionService_0:SetSession(v4.StreamSessionStructuralIdentifier.Level1, v4.StreamSessionStructuralIdentifier.StreamNotification, v4.StreamSessionStructuralIdentifier.StreamNotification);
                            l_SessionService_0:SetMetadata(v4.StreamSessionStructuralIdentifier.StreamNotification, v4.StreamSessionStructuralIdentifier.DeleteOnGameLeave, "True");
                            v39(v8, {
                                action_type = v114.actionType, 
                                delivery_channel = v4.DeliveryChannel, 
                                notification_type = v112.notificationSourceType, 
                                notification_id = v112.id
                            });
                        end;
                    elseif v114.actionType == l_type_0.ActionTypeEnum.NotificationApi then
                        local v115 = v112 and v112.id or nil;
                        local v116 = v114.path or nil;
                        v37(v26, v115, v116):andThen(function(_) --[[ Line: 371 ]]
                            -- upvalues: v114 (copy), v69 (ref), v112 (copy)
                            if v114.nextState ~= nil and v114.nextState ~= "" then
                                v69(v114.nextState, v112);
                            end;
                        end):catch(function(_) --[[ Line: 376 ]]

                        end);
                        v70();
                    elseif v114.actionType == l_type_0.ActionTypeEnum.Report then
                        v67(v22.AbuseReport);
                        v100(v114.nextState, v112);
                    elseif v114.actionType == l_type_0.ActionTypeEnum.Dismiss then
                        local l_id_0 = v112.id;
                        v70();
                        if v62 and l_id_0 then
                            local v121 = v5.List.map(v62, function(v120) --[[ Line: 275 ]]
                                -- upvalues: l_id_0 (copy)
                                if v120.id == l_id_0 then
                                    v120.dismiss = true;
                                end;
                                return v120;
                            end);
                            v63(v121);
                        end;
                    elseif v114.actionType == l_type_0.ActionTypeEnum.ClientTrigger then
                        if l_FFlagTCVerifiedParentalControl_0 and v114.path == "TrustedContactsDoubleOptInModal" then
                            v56.displayStream(false);
                        end;
                        v61(v114.path, {
                            clientEventsPayload = v112.content.clientEventsPayload, 
                            callback = function() --[[ Line: 397 ]] --[[ Name: callback ]]
                                -- upvalues: v69 (ref), v114 (copy), v112 (copy)
                                v69(v114.nextState, v112);
                            end
                        });
                    end;
                end;
            end;
        end;
    end);
    local function v124(v123) --[[ Line: 408 ]]
        -- upvalues: v65 (copy), v67 (copy), v22 (ref), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v42 (ref), v18 (ref), v4 (ref), l_FFlagStreamNotificationsStandardizeClickEvents_0 (ref)
        v65(v123);
        v67(v22.MetaActions);
        l_NotificationHelper_0.fireEvent(l_EventStream_0, v42.Context.click, v42.EventNames.openMetaActions, {
            visualItemType = v18.type.VisualItemTypeEnum.MetaAction, 
            sendrVersion = v4.SENDRVersion, 
            notificationState = if l_FFlagStreamNotificationsStandardizeClickEvents_0 then v123 and v123.content and v123.content.currentState or nil else nil
        });
    end;
    v70 = function() --[[ Line: 430 ]]
        -- upvalues: v72 (copy), v65 (copy), v66 (copy), v22 (ref), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v42 (ref), v18 (ref), v4 (ref), v67 (copy)
        v72(true);
        v65(nil);
        if v66 == v22.MetaActions then
            l_NotificationHelper_0.fireEvent(l_EventStream_0, v42.Context.click, v42.EventNames.closeMetaActions, {
                visualItemType = v18.type.VisualItemTypeEnum.MetaAction, 
                sendrVersion = v4.SENDRVersion
            });
        end;
        v67(v22.Default);
    end;
    v69 = function(v125, v126) --[[ Line: 447 ]]
        -- upvalues: v62 (copy), v63 (copy)
        local v127 = {};
        if v62 and v126 then
            for _, v129 in ipairs(v62) do
                if v129.id == v126.id then
                    v129.content.currentState = v125;
                end;
                table.insert(v127, v129);
            end;
        end;
        v63(v127);
    end;
    local v130 = v17.useMemo(function() --[[ Line: 463 ]]
        -- upvalues: v17 (ref), v14 (ref), v66 (copy), v64 (copy), v56 (copy), v122 (copy), v70 (ref)
        return v17.createElement(v14, {
            displayState = v66, 
            activeNotification = v64, 
            isSmallScreen = v56.isSmallScreen, 
            handleActions = v122, 
            closeNotificationDisplay = v70
        });
    end, {
        v66, 
        v64
    });
    local v140 = v17.useMemo(function() --[[ Line: 473 ]]
        -- upvalues: v66 (copy), v22 (ref), v17 (ref), l_LoadingSpinner_0 (ref), v4 (ref), v62 (copy), v58 (copy), v16 (ref), v109 (copy), v122 (copy), v124 (copy), v15 (ref), v73 (copy), v23 (ref), v78 (copy), v13 (ref)
        if v66 == v22.Initializing then
            return v17.createElement(l_LoadingSpinner_0, {
                size = UDim2.fromOffset(v4.InitializingNotifications.Size, v4.InitializingNotifications.Size), 
                position = UDim2.fromScale(0.5, 0.5), 
                anchorPoint = Vector2.new(0.5, 0.5)
            });
        else
            if v62 and #v62 > 0 then
                local v131 = {
                    UIListLayout = v17.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = if v58 then UDim.new(0, v4.Dropdown.CardGap) else nil
                    })
                };
                local v132 = false;
                local v133 = {};
                for _, v135 in ipairs(v62) do
                    if v135.notificationSourceType == "Sendr" then
                        v132 = true;
                        local l_bundleKey_0 = v135.content.bundleKey;
                        if l_bundleKey_0 and l_bundleKey_0 ~= "" then
                            if v133[l_bundleKey_0] then
                                table.insert(v133[l_bundleKey_0], v135);
                            else
                                v133[l_bundleKey_0] = {
                                    v135
                                };
                            end;
                        end;
                    end;
                end;
                for v137, v138 in ipairs(v62) do
                    if v138.notificationSourceType == "Sendr" then
                        local l_bundleKey_1 = v138.content.bundleKey;
                        if l_bundleKey_1 and l_bundleKey_1 ~= "" and #v133[l_bundleKey_1] > 1 then
                            if not v131[l_bundleKey_1] then
                                v131[l_bundleKey_1] = v17.createElement(v16, {
                                    layoutOrder = v137, 
                                    notifications = v133[l_bundleKey_1], 
                                    finishDismissNotification = v109, 
                                    handleActions = v122, 
                                    openMetaActions = v124
                                }, {});
                            end;
                        else
                            v131[v138.id] = v17.createElement(v15, {
                                layoutOrder = v137, 
                                notification = v138, 
                                finishDismissNotification = v109, 
                                handleActions = v122, 
                                openMetaActions = v124, 
                                collapsed = false
                            }, {});
                        end;
                    end;
                end;
                if v73.current == v23.Loading then
                    v131.LoadingMore = v17.createElement("Frame", {
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
                if v132 then
                    return v17.createElement("Frame", {
                        Size = if v58 then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 0, -v78), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1
                    }, v131);
                end;
            end;
            return v17.createElement(v13);
        end;
    end, {
        v62, 
        v66, 
        v74, 
        v58
    });
    local function v145(v141) --[[ Line: 600 ]]
        -- upvalues: v66 (copy), v22 (ref), v4 (ref), v73 (copy), v23 (ref), v68 (ref)
        local l_Y_0 = v141.AbsoluteCanvasSize.Y;
        local l_Y_1 = v141.AbsoluteWindowSize.Y;
        local l_Y_2 = v141.CanvasPosition.Y;
        if l_Y_1 == 0 or l_Y_0 == 0 or v66 ~= v22.Default then
            return;
        else
            if l_Y_0 - l_Y_1 - v4.LoadingMoreNotifications.TriggerDistance <= l_Y_2 and v73.current == v23.Default then
                v68();
            end;
            return;
        end;
    end;
    local v146 = if l_UserInputService_0.BottomBarSize then l_UserInputService_0.BottomBarSize.Y else 0;
    local v147 = if l_GuiService_0:GetSafeZoneOffsets() then l_GuiService_0:GetSafeZoneOffsets().bottom else 0;
    local v148 = if v56.isSmallScreen then math.max(v146, v147) else 0;
    if v58 then
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
                Visible = v66 == v22.MetaActions, 
                BackgroundTransparency = v57.Theme.Overlay.Transparency, 
                BackgroundColor3 = v57.Theme.Overlay.Color, 
                Text = "", 
                AutoButtonColor = false, 
                ZIndex = 2, 
                [v17.Event.Activated] = v70, 
                BorderSizePixel = 0, 
                Selectable = false
            }, {
                v130
            }), 
            NotificationsList = v17.createElement("ScrollingFrame", {
                Size = UDim2.new(1, 0, 0, v4.Dropdown.MaxHeight - v4.Dropdown.HeaderMinHeight - v4.Dropdown.HeaderBodyGap), 
                CanvasSize = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                ScrollBarThickness = 4, 
                BorderSizePixel = 0, 
                VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar, 
                VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right, 
                ScrollBarImageColor3 = v57.Theme.UIEmphasis.Color, 
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                ElasticBehavior = Enum.ElasticBehavior.Always, 
                ScrollingEnabled = v66 == v22.Default, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                [v17.Change.CanvasPosition] = v145, 
                Selectable = false
            }, v140)
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
                Visible = v66 == v22.MetaActions, 
                BackgroundTransparency = v57.Theme.Overlay.Transparency, 
                BackgroundColor3 = v57.Theme.Overlay.Color, 
                Text = "", 
                AutoButtonColor = false, 
                ZIndex = 2, 
                [v17.Event.Activated] = v70, 
                BorderSizePixel = 0, 
                Selectable = false
            }, {
                v130
            }), 
            NotificationsList = v17.createElement("ScrollingFrame", {
                Size = UDim2.new(1, 0, 1, -(v78 + v4.DefaultPadding + v148)), 
                CanvasSize = UDim2.new(1, 0, 1, -(v78 + v4.DefaultPadding + v148)), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, 0, 0, v78), 
                AnchorPoint = Vector2.new(0, 0), 
                ScrollBarThickness = 4, 
                BorderSizePixel = 0, 
                VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar, 
                VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right, 
                ScrollBarImageColor3 = v57.Theme.UIEmphasis.Color, 
                AutomaticCanvasSize = Enum.AutomaticSize.XY, 
                ElasticBehavior = Enum.ElasticBehavior.Always, 
                ScrollingEnabled = v66 == v22.Default, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                [v17.Change.CanvasPosition] = v145, 
                Selectable = false
            }, v140)
        });
    end;
end;