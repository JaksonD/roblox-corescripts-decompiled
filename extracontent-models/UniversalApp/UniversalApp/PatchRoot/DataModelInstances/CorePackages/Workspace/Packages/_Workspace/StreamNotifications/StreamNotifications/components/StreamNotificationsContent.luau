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
local function _() --[[ Line: 76 ]] --[[ Name: GetIsFriendCommunicationRestricted ]]
    -- upvalues: l_GetFFlagFilterNotificationsForPCGDKEnabled_0 (copy), l_ThirdPartyUserService_0 (copy)
    return l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_ThirdPartyUserService_0 and l_ThirdPartyUserService_0:IsChatRestrictionSupported() and l_ThirdPartyUserService_0.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted;
end;
local v54 = require(l_script_FirstAncestor_0.StreamNotificationDropdownExperimentation);
return function(v55) --[[ Line: 92 ]]
    -- upvalues: l_useStyle_0 (copy), v54 (copy), l_useDispatch_0 (copy), l_useDeviceType_0 (copy), v34 (copy), v17 (copy), v22 (copy), v23 (copy), l_UserInputService_0 (copy), v4 (copy), v35 (copy), v26 (copy), v40 (copy), l_GetFFlagFilterNotificationsForPCGDKEnabled_0 (copy), l_GetFStringPCGDKFilteredNotificationTypes_0 (copy), l_ThirdPartyUserService_0 (copy), v5 (copy), l_NotificationHelper_0 (copy), l_EventStream_0 (copy), v42 (copy), l_FFlagStreamNotificationsStandardizeClickEvents_0 (copy), v36 (copy), v38 (copy), l_FFlagFixNotificationReportsMobile_0 (copy), l_OpenDynamicAbuseReport_0 (copy), l_AbuseVector_0 (copy), l_CloseCentralOverlay_0 (copy), l_Players_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v47 (copy), l_type_0 (copy), l_JoinExperience_0 (copy), l_SessionService_0 (copy), v39 (copy), v8 (copy), v37 (copy), v18 (copy), v14 (copy), l_LoadingSpinner_0 (copy), v16 (copy), v15 (copy), v13 (copy), l_GuiService_0 (copy)
    local v56 = l_useStyle_0();
    local v57 = v54.getDropdownEnabled();
    local v58 = l_useDispatch_0();
    local v59 = l_useDeviceType_0();
    local v60 = v34();
    local v61, v62 = v17.useState({});
    local v63, v64 = v17.useState(nil);
    local v65, v66 = v17.useState(v22.Initializing);
    local v67 = nil;
    local v68 = nil;
    local v69 = nil;
    local v71 = v55.showOverlay or function(_) --[[ Line: 114 ]]

    end;
    local v72 = v17.useRef(v23.Loading);
    local v73, v74 = v17.useState(v23.Loading);
    local v75 = v17.useRef(0);
    local v76 = if l_UserInputService_0.StatusBarSize then l_UserInputService_0.StatusBarSize.Y else 0;
    local v77 = v4.Modal.HeaderHeight + v76;
    v17.useEffect(function() --[[ Line: 123 ]]
        -- upvalues: v67 (ref)
        v67();
    end, {});
    local function _(v78) --[[ Line: 127 ]]
        -- upvalues: v72 (copy), v74 (copy)
        v72.current = v78;
        v74(v78);
    end;
    v67 = function() --[[ Line: 132 ]]
        -- upvalues: v72 (copy), v23 (ref), v74 (copy), v35 (ref), v26 (ref), v4 (ref), v75 (copy), v40 (ref), l_GetFFlagFilterNotificationsForPCGDKEnabled_0 (ref), l_GetFStringPCGDKFilteredNotificationTypes_0 (ref), l_ThirdPartyUserService_0 (ref), v62 (copy), v5 (ref), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v42 (ref), l_FFlagStreamNotificationsStandardizeClickEvents_0 (ref), v66 (copy), v22 (ref), v36 (ref), v61 (copy), v67 (ref)
        if v72.current == v23.NoMoreNotifications then
            return;
        else
            local l_Loading_0 = v23.Loading;
            v72.current = l_Loading_0;
            v74(l_Loading_0);
            v35(v26, v4.DefaultMaxRows, v75.current):andThen(function(v81) --[[ Line: 140 ]]
                -- upvalues: v40 (ref), l_GetFFlagFilterNotificationsForPCGDKEnabled_0 (ref), l_GetFStringPCGDKFilteredNotificationTypes_0 (ref), l_ThirdPartyUserService_0 (ref), v62 (ref), v5 (ref), v23 (ref), v72 (ref), v74 (ref), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v42 (ref), v4 (ref), l_FFlagStreamNotificationsStandardizeClickEvents_0 (ref), v66 (ref), v22 (ref), v36 (ref), v26 (ref), v75 (ref), v61 (ref), v67 (ref)
                v81 = v40(v81);
                if l_GetFFlagFilterNotificationsForPCGDKEnabled_0() then
                    local v82 = l_GetFStringPCGDKFilteredNotificationTypes_0();
                    local v83 = {};
                    for _, v85 in ipairs(v81) do
                        if not v82[v85.content.notificationType] or not (l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_ThirdPartyUserService_0 and l_ThirdPartyUserService_0:IsChatRestrictionSupported() and l_ThirdPartyUserService_0.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted) then
                            table.insert(v83, v85);
                        end;
                    end;
                    v81 = v83;
                end;
                if v81 and #v81 > 0 then
                    v62(function(v86) --[[ Line: 166 ]]
                        -- upvalues: v5 (ref), v81 (ref)
                        return (v5.List.join(v86, v81));
                    end);
                    local l_Default_0 = v23.Default;
                    v72.current = l_Default_0;
                    v74(l_Default_0);
                    for _, v89 in ipairs(v81) do
                        l_NotificationHelper_0.fireEvent(l_EventStream_0, v42.Context.fetched, v42.EventNames.notificationRetrieved, v5.Dictionary.join(v89.content.clientEventsPayload or {}, {
                            sendrVersion = v4.SENDRVersion, 
                            notificationType = v89.content.notificationType or nil, 
                            notificationId = v89.id or nil, 
                            notificationState = if l_FFlagStreamNotificationsStandardizeClickEvents_0 then v89.content.currentState or nil else nil
                        }));
                    end;
                else
                    local l_NoMoreNotifications_0 = v23.NoMoreNotifications;
                    v72.current = l_NoMoreNotifications_0;
                    v74(l_NoMoreNotifications_0);
                end;
                v66(v22.Default);
                v36(v26);
                v75.current = (tonumber(v75.current) or 0) + v4.DefaultMaxRows;
                if v61 and #v61 < v4.DefaultMaxRows then
                    v67();
                end;
            end):catch(function(_) --[[ Line: 199 ]]
                -- upvalues: v66 (ref), v22 (ref)
                v66(v22.ErrorRetrieving);
            end);
            return;
        end;
    end;
    local function v99(v92, v93) --[[ Line: 204 ]]
        -- upvalues: v57 (copy), v55 (copy), v38 (ref), v26 (ref), v68 (ref), v66 (copy), v22 (ref), l_FFlagFixNotificationReportsMobile_0 (ref), v58 (copy), l_OpenDynamicAbuseReport_0 (ref), l_AbuseVector_0 (ref), l_CloseCentralOverlay_0 (ref), v59 (copy), l_Players_0 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        if v57 then
            v55.displayStream(false);
        end;
        local function v96() --[[ Line: 216 ]]
            -- upvalues: v38 (ref), v26 (ref), v93 (copy), v68 (ref), v92 (copy), v57 (ref), v55 (ref), v66 (ref), v22 (ref)
            v38(v26, v93.id):andThen(function(_) --[[ Line: 218 ]]

            end):catch(function(_) --[[ Line: 219 ]]

            end);
            v68(v92, v93);
            if v57 then
                v55.displayStream(true);
            else
                v55.setDisplayScreenGuiEnabled(true);
            end;
            v66(v22.Default);
        end;
        local function v97() --[[ Line: 232 ]]
            -- upvalues: v57 (ref), v55 (ref), v66 (ref), v22 (ref)
            if v57 then
                v55.displayStream(true);
            else
                v55.setDisplayScreenGuiEnabled(true);
            end;
            v66(v22.Default);
        end;
        if l_FFlagFixNotificationReportsMobile_0 then
            v58(l_OpenDynamicAbuseReport_0({
                abuseVector = l_AbuseVector_0.Notifications, 
                targetId = v93.id, 
                onSubmit = v96, 
                onClose = function() --[[ Line: 246 ]] --[[ Name: onClose ]]
                    -- upvalues: v58 (ref), l_CloseCentralOverlay_0 (ref), v57 (ref), v55 (ref), v66 (ref), v22 (ref)
                    v58(l_CloseCentralOverlay_0());
                    if v57 then
                        v55.displayStream(true);
                    else
                        v55.setDisplayScreenGuiEnabled(true);
                    end;
                    v66(v22.Default);
                end
            }));
            return;
        else
            v55.setDisplayScreenGuiEnabled(false);
            local v98 = {
                reportEntryPoint = "Notification", 
                assetId = v93.id, 
                reportSurface = string.lower(v59), 
                submissionEntryPoint = string.lower(v59), 
                submitterUserId = if l_Players_0.LocalPlayer then tostring(l_Players_0.LocalPlayer.UserId) else nil, 
                onSubmitReportCallback = v96, 
                onCloseCallback = v97
            };
            v58(l_NavigateDown_0({
                name = l_AppPage_0.ReportDialog, 
                reportData = v98
            }));
            return;
        end;
    end;
    local function _(v100) --[[ Line: 271 ]]
        -- upvalues: v69 (ref), v61 (copy), v5 (ref), v62 (copy)
        v69();
        if v61 and v100 then
            local v102 = v5.List.map(v61, function(v101) --[[ Line: 274 ]]
                -- upvalues: v100 (copy)
                if v101.id == v100 then
                    v101.dismiss = true;
                end;
                return v101;
            end);
            v62(v102);
        end;
    end;
    local v108 = v17.useCallback(function(v104) --[[ Line: 285 ]]
        -- upvalues: v61 (copy), v5 (ref), v62 (copy)
        if v61 and v104 then
            local v107 = v5.List.filter(v61, function(v105) --[[ Line: 287 ]]
                -- upvalues: v104 (copy)
                local v106 = false;
                if v105.id ~= v104 then
                    v106 = v105.dismiss ~= true;
                end;
                return v106;
            end);
            v62(v107);
        end;
    end);
    local v121 = v17.useCallback(function(v109, v110) --[[ Line: 297 ]]
        -- upvalues: v63 (copy), v64 (copy), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v42 (ref), v5 (ref), l_FFlagStreamNotificationsStandardizeClickEvents_0 (ref), v47 (ref), v4 (ref), l_type_0 (ref), l_JoinExperience_0 (ref), v55 (copy), l_SessionService_0 (ref), v39 (ref), v8 (ref), v37 (ref), v26 (ref), v68 (ref), v69 (ref), v66 (copy), v22 (ref), v99 (copy), v61 (copy), v62 (copy), v60 (copy)
        local v111 = v110 or v63;
        v64(v111);
        l_NotificationHelper_0.fireEvent(l_EventStream_0, v42.Context.click, v109.eventName or "", v5.Dictionary.join(v109.clientEventsPayload or {}, {
            notifType = if l_FFlagStreamNotificationsStandardizeClickEvents_0 then nil else if v47 then v111 and v111.content and v111.content.notificationType else nil, 
            notifId = if l_FFlagStreamNotificationsStandardizeClickEvents_0 then nil else if v47 then v111 and v111.id else nil, 
            notificationType = if l_FFlagStreamNotificationsStandardizeClickEvents_0 then v111 and v111.content and v111.content.notificationType else nil, 
            notificationId = if l_FFlagStreamNotificationsStandardizeClickEvents_0 then v111 and v111.id else nil, 
            notificationState = if l_FFlagStreamNotificationsStandardizeClickEvents_0 then v111 and v111.content and v111.content.currentState else nil, 
            visualItemType = v109.visualItemType or nil, 
            visualItemName = v109.visualItemName or nil, 
            sendrVersion = v4.SENDRVersion
        }));
        if v109.actions and #v109.actions > 0 and v111 then
            for _, v113 in ipairs(v109.actions) do
                if v113.actionType then
                    if v113.actionType == l_type_0.ActionTypeEnum.Deeplink then
                        if l_JoinExperience_0(v113.path, false) then
                            v55.displayStream(false);
                            l_SessionService_0:SetSession(v4.StreamSessionStructuralIdentifier.Level1, v4.StreamSessionStructuralIdentifier.StreamNotification, v4.StreamSessionStructuralIdentifier.StreamNotification);
                            l_SessionService_0:SetMetadata(v4.StreamSessionStructuralIdentifier.StreamNotification, v4.StreamSessionStructuralIdentifier.DeleteOnGameLeave, "True");
                            v39(v8, {
                                action_type = v113.actionType, 
                                delivery_channel = v4.DeliveryChannel, 
                                notification_type = v111.notificationSourceType, 
                                notification_id = v111.id
                            });
                        end;
                    elseif v113.actionType == l_type_0.ActionTypeEnum.NotificationApi then
                        local v114 = v111 and v111.id or nil;
                        local v115 = v113.path or nil;
                        v37(v26, v114, v115):andThen(function(_) --[[ Line: 370 ]]
                            -- upvalues: v113 (copy), v68 (ref), v111 (copy)
                            if v113.nextState ~= nil and v113.nextState ~= "" then
                                v68(v113.nextState, v111);
                            end;
                        end):catch(function(_) --[[ Line: 375 ]]

                        end);
                        v69();
                    elseif v113.actionType == l_type_0.ActionTypeEnum.Report then
                        v66(v22.AbuseReport);
                        v99(v113.nextState, v111);
                    elseif v113.actionType == l_type_0.ActionTypeEnum.Dismiss then
                        local l_id_0 = v111.id;
                        v69();
                        if v61 and l_id_0 then
                            local v120 = v5.List.map(v61, function(v119) --[[ Line: 274 ]]
                                -- upvalues: l_id_0 (copy)
                                if v119.id == l_id_0 then
                                    v119.dismiss = true;
                                end;
                                return v119;
                            end);
                            v62(v120);
                        end;
                    elseif v113.actionType == l_type_0.ActionTypeEnum.ClientTrigger then
                        v60(v113.path, {
                            clientEventsPayload = v111.content.clientEventsPayload, 
                            callback = function() --[[ Line: 393 ]] --[[ Name: callback ]]
                                -- upvalues: v68 (ref), v113 (copy), v111 (copy)
                                v68(v113.nextState, v111);
                            end
                        });
                    end;
                end;
            end;
        end;
    end);
    local function v123(v122) --[[ Line: 404 ]]
        -- upvalues: v64 (copy), v66 (copy), v22 (ref), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v42 (ref), v18 (ref), v4 (ref), l_FFlagStreamNotificationsStandardizeClickEvents_0 (ref)
        v64(v122);
        v66(v22.MetaActions);
        l_NotificationHelper_0.fireEvent(l_EventStream_0, v42.Context.click, v42.EventNames.openMetaActions, {
            visualItemType = v18.type.VisualItemTypeEnum.MetaAction, 
            sendrVersion = v4.SENDRVersion, 
            notificationState = if l_FFlagStreamNotificationsStandardizeClickEvents_0 then v122 and v122.content and v122.content.currentState or nil else nil
        });
    end;
    v69 = function() --[[ Line: 426 ]]
        -- upvalues: v71 (copy), v64 (copy), v65 (copy), v22 (ref), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v42 (ref), v18 (ref), v4 (ref), v66 (copy)
        v71(true);
        v64(nil);
        if v65 == v22.MetaActions then
            l_NotificationHelper_0.fireEvent(l_EventStream_0, v42.Context.click, v42.EventNames.closeMetaActions, {
                visualItemType = v18.type.VisualItemTypeEnum.MetaAction, 
                sendrVersion = v4.SENDRVersion
            });
        end;
        v66(v22.Default);
    end;
    v68 = function(v124, v125) --[[ Line: 443 ]]
        -- upvalues: v61 (copy), v62 (copy)
        local v126 = {};
        if v61 and v125 then
            for _, v128 in ipairs(v61) do
                if v128.id == v125.id then
                    v128.content.currentState = v124;
                end;
                table.insert(v126, v128);
            end;
        end;
        v62(v126);
    end;
    local v129 = v17.useMemo(function() --[[ Line: 459 ]]
        -- upvalues: v17 (ref), v14 (ref), v65 (copy), v63 (copy), v55 (copy), v121 (copy), v69 (ref)
        return v17.createElement(v14, {
            displayState = v65, 
            activeNotification = v63, 
            isSmallScreen = v55.isSmallScreen, 
            handleActions = v121, 
            closeNotificationDisplay = v69
        });
    end, {
        v65, 
        v63
    });
    local v139 = v17.useMemo(function() --[[ Line: 469 ]]
        -- upvalues: v65 (copy), v22 (ref), v17 (ref), l_LoadingSpinner_0 (ref), v4 (ref), v61 (copy), v57 (copy), v16 (ref), v108 (copy), v121 (copy), v123 (copy), v15 (ref), v72 (copy), v23 (ref), v77 (copy), v13 (ref)
        if v65 == v22.Initializing then
            return v17.createElement(l_LoadingSpinner_0, {
                size = UDim2.fromOffset(v4.InitializingNotifications.Size, v4.InitializingNotifications.Size), 
                position = UDim2.fromScale(0.5, 0.5), 
                anchorPoint = Vector2.new(0.5, 0.5)
            });
        else
            if v61 and #v61 > 0 then
                local v130 = {
                    UIListLayout = v17.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = if v57 then UDim.new(0, v4.Dropdown.CardGap) else nil
                    })
                };
                local v131 = false;
                local v132 = {};
                for _, v134 in ipairs(v61) do
                    if v134.notificationSourceType == "Sendr" then
                        v131 = true;
                        local l_bundleKey_0 = v134.content.bundleKey;
                        if l_bundleKey_0 and l_bundleKey_0 ~= "" then
                            if v132[l_bundleKey_0] then
                                table.insert(v132[l_bundleKey_0], v134);
                            else
                                v132[l_bundleKey_0] = {
                                    v134
                                };
                            end;
                        end;
                    end;
                end;
                for v136, v137 in ipairs(v61) do
                    if v137.notificationSourceType == "Sendr" then
                        local l_bundleKey_1 = v137.content.bundleKey;
                        if l_bundleKey_1 and l_bundleKey_1 ~= "" and #v132[l_bundleKey_1] > 1 then
                            if not v130[l_bundleKey_1] then
                                v130[l_bundleKey_1] = v17.createElement(v16, {
                                    layoutOrder = v136, 
                                    notifications = v132[l_bundleKey_1], 
                                    finishDismissNotification = v108, 
                                    handleActions = v121, 
                                    openMetaActions = v123
                                }, {});
                            end;
                        else
                            v130[v137.id] = v17.createElement(v15, {
                                layoutOrder = v136, 
                                notification = v137, 
                                finishDismissNotification = v108, 
                                handleActions = v121, 
                                openMetaActions = v123, 
                                collapsed = false
                            }, {});
                        end;
                    end;
                end;
                if v72.current == v23.Loading then
                    v130.LoadingMore = v17.createElement("Frame", {
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
                if v131 then
                    return v17.createElement("Frame", {
                        Size = if v57 then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 0, -v77), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1
                    }, v130);
                end;
            end;
            return v17.createElement(v13);
        end;
    end, {
        v61, 
        v65, 
        v73, 
        v57
    });
    local function v144(v140) --[[ Line: 596 ]]
        -- upvalues: v65 (copy), v22 (ref), v4 (ref), v72 (copy), v23 (ref), v67 (ref)
        local l_Y_0 = v140.AbsoluteCanvasSize.Y;
        local l_Y_1 = v140.AbsoluteWindowSize.Y;
        local l_Y_2 = v140.CanvasPosition.Y;
        if l_Y_1 == 0 or l_Y_0 == 0 or v65 ~= v22.Default then
            return;
        else
            if l_Y_0 - l_Y_1 - v4.LoadingMoreNotifications.TriggerDistance <= l_Y_2 and v72.current == v23.Default then
                v67();
            end;
            return;
        end;
    end;
    local v145 = if l_UserInputService_0.BottomBarSize then l_UserInputService_0.BottomBarSize.Y else 0;
    local v146 = if l_GuiService_0:GetSafeZoneOffsets() then l_GuiService_0:GetSafeZoneOffsets().bottom else 0;
    local v147 = if v55.isSmallScreen then math.max(v145, v146) else 0;
    if v57 then
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
                Visible = v65 == v22.MetaActions, 
                BackgroundTransparency = v56.Theme.Overlay.Transparency, 
                BackgroundColor3 = v56.Theme.Overlay.Color, 
                Text = "", 
                AutoButtonColor = false, 
                ZIndex = 2, 
                [v17.Event.Activated] = v69, 
                BorderSizePixel = 0, 
                Selectable = false
            }, {
                v129
            }), 
            NotificationsList = v17.createElement("ScrollingFrame", {
                Size = UDim2.new(1, 0, 0, v4.Dropdown.MaxHeight - v4.Dropdown.HeaderMinHeight - v4.Dropdown.HeaderBodyGap), 
                CanvasSize = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                ScrollBarThickness = 4, 
                BorderSizePixel = 0, 
                VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar, 
                VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right, 
                ScrollBarImageColor3 = v56.Theme.UIEmphasis.Color, 
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                ElasticBehavior = Enum.ElasticBehavior.Always, 
                ScrollingEnabled = v65 == v22.Default, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                [v17.Change.CanvasPosition] = v144, 
                Selectable = false
            }, v139)
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
                Visible = v65 == v22.MetaActions, 
                BackgroundTransparency = v56.Theme.Overlay.Transparency, 
                BackgroundColor3 = v56.Theme.Overlay.Color, 
                Text = "", 
                AutoButtonColor = false, 
                ZIndex = 2, 
                [v17.Event.Activated] = v69, 
                BorderSizePixel = 0, 
                Selectable = false
            }, {
                v129
            }), 
            NotificationsList = v17.createElement("ScrollingFrame", {
                Size = UDim2.new(1, 0, 1, -(v77 + v4.DefaultPadding + v147)), 
                CanvasSize = UDim2.new(1, 0, 1, -(v77 + v4.DefaultPadding + v147)), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, 0, 0, v77), 
                AnchorPoint = Vector2.new(0, 0), 
                ScrollBarThickness = 4, 
                BorderSizePixel = 0, 
                VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar, 
                VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right, 
                ScrollBarImageColor3 = v56.Theme.UIEmphasis.Color, 
                AutomaticCanvasSize = Enum.AutomaticSize.XY, 
                ElasticBehavior = Enum.ElasticBehavior.Always, 
                ScrollingEnabled = v65 == v22.Default, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                [v17.Change.CanvasPosition] = v144, 
                Selectable = false
            }, v139)
        });
    end;
end;