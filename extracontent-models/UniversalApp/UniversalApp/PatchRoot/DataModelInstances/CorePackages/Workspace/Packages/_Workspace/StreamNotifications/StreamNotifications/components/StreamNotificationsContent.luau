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
return function(v54) --[[ Line: 90 ]]
    -- upvalues: l_useStyle_0 (copy), l_useDispatch_0 (copy), l_useDeviceType_0 (copy), v34 (copy), v17 (copy), v22 (copy), v23 (copy), l_UserInputService_0 (copy), v4 (copy), v35 (copy), v26 (copy), v40 (copy), l_GetFFlagFilterNotificationsForPCGDKEnabled_0 (copy), l_GetFStringPCGDKFilteredNotificationTypes_0 (copy), l_ThirdPartyUserService_0 (copy), v5 (copy), l_NotificationHelper_0 (copy), l_EventStream_0 (copy), v42 (copy), l_FFlagStreamNotificationsStandardizeClickEvents_0 (copy), v36 (copy), v38 (copy), l_FFlagFixNotificationReportsMobile_0 (copy), l_OpenDynamicAbuseReport_0 (copy), l_AbuseVector_0 (copy), l_CloseCentralOverlay_0 (copy), l_Players_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v47 (copy), l_type_0 (copy), l_JoinExperience_0 (copy), l_SessionService_0 (copy), v39 (copy), v8 (copy), v37 (copy), v18 (copy), v14 (copy), l_LoadingSpinner_0 (copy), v16 (copy), v15 (copy), v13 (copy), l_GuiService_0 (copy)
    local v55 = l_useStyle_0();
    local v56 = l_useDispatch_0();
    local v57 = l_useDeviceType_0();
    local v58 = v34();
    local v59, v60 = v17.useState({});
    local v61, v62 = v17.useState(nil);
    local v63, v64 = v17.useState(v22.Initializing);
    local v65 = nil;
    local v66 = nil;
    local v67 = nil;
    local v69 = v54.showOverlay or function(_) --[[ Line: 111 ]]

    end;
    local v70 = v17.useRef(v23.Loading);
    local v71, v72 = v17.useState(v23.Loading);
    local v73 = v17.useRef(0);
    local v74 = if l_UserInputService_0.StatusBarSize then l_UserInputService_0.StatusBarSize.Y else 0;
    local v75 = v4.Modal.HeaderHeight + v74;
    v17.useEffect(function() --[[ Line: 120 ]]
        -- upvalues: v65 (ref)
        v65();
    end, {});
    local function _(v76) --[[ Line: 124 ]]
        -- upvalues: v70 (copy), v72 (copy)
        v70.current = v76;
        v72(v76);
    end;
    v65 = function() --[[ Line: 129 ]]
        -- upvalues: v70 (copy), v23 (ref), v72 (copy), v35 (ref), v26 (ref), v4 (ref), v73 (copy), v40 (ref), l_GetFFlagFilterNotificationsForPCGDKEnabled_0 (ref), l_GetFStringPCGDKFilteredNotificationTypes_0 (ref), l_ThirdPartyUserService_0 (ref), v60 (copy), v5 (ref), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v42 (ref), l_FFlagStreamNotificationsStandardizeClickEvents_0 (ref), v64 (copy), v22 (ref), v36 (ref), v59 (copy), v65 (ref)
        if v70.current == v23.NoMoreNotifications then
            return;
        else
            local l_Loading_0 = v23.Loading;
            v70.current = l_Loading_0;
            v72(l_Loading_0);
            v35(v26, v4.DefaultMaxRows, v73.current):andThen(function(v79) --[[ Line: 137 ]]
                -- upvalues: v40 (ref), l_GetFFlagFilterNotificationsForPCGDKEnabled_0 (ref), l_GetFStringPCGDKFilteredNotificationTypes_0 (ref), l_ThirdPartyUserService_0 (ref), v60 (ref), v5 (ref), v23 (ref), v70 (ref), v72 (ref), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v42 (ref), v4 (ref), l_FFlagStreamNotificationsStandardizeClickEvents_0 (ref), v64 (ref), v22 (ref), v36 (ref), v26 (ref), v73 (ref), v59 (ref), v65 (ref)
                v79 = v40(v79);
                if l_GetFFlagFilterNotificationsForPCGDKEnabled_0() then
                    local v80 = l_GetFStringPCGDKFilteredNotificationTypes_0();
                    local v81 = {};
                    for _, v83 in ipairs(v79) do
                        if not v80[v83.content.notificationType] or not (l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_ThirdPartyUserService_0 and l_ThirdPartyUserService_0:IsChatRestrictionSupported() and l_ThirdPartyUserService_0.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted) then
                            table.insert(v81, v83);
                        end;
                    end;
                    v79 = v81;
                end;
                if v79 and #v79 > 0 then
                    v60(function(v84) --[[ Line: 163 ]]
                        -- upvalues: v5 (ref), v79 (ref)
                        return (v5.List.join(v84, v79));
                    end);
                    local l_Default_0 = v23.Default;
                    v70.current = l_Default_0;
                    v72(l_Default_0);
                    for _, v87 in ipairs(v79) do
                        l_NotificationHelper_0.fireEvent(l_EventStream_0, v42.Context.fetched, v42.EventNames.notificationRetrieved, v5.Dictionary.join(v87.content.clientEventsPayload or {}, {
                            sendrVersion = v4.SENDRVersion, 
                            notificationType = v87.content.notificationType or nil, 
                            notificationId = v87.id or nil, 
                            notificationState = if l_FFlagStreamNotificationsStandardizeClickEvents_0 then v87.content.currentState or nil else nil
                        }));
                    end;
                else
                    local l_NoMoreNotifications_0 = v23.NoMoreNotifications;
                    v70.current = l_NoMoreNotifications_0;
                    v72(l_NoMoreNotifications_0);
                end;
                v64(v22.Default);
                v36(v26);
                v73.current = (tonumber(v73.current) or 0) + v4.DefaultMaxRows;
                if v59 and #v59 < v4.DefaultMaxRows then
                    v65();
                end;
            end):catch(function(_) --[[ Line: 196 ]]
                -- upvalues: v64 (ref), v22 (ref)
                v64(v22.ErrorRetrieving);
            end);
            return;
        end;
    end;
    local function v97(v90, v91) --[[ Line: 201 ]]
        -- upvalues: v38 (ref), v26 (ref), v66 (ref), v54 (copy), v64 (copy), v22 (ref), l_FFlagFixNotificationReportsMobile_0 (ref), v56 (copy), l_OpenDynamicAbuseReport_0 (ref), l_AbuseVector_0 (ref), l_CloseCentralOverlay_0 (ref), v57 (copy), l_Players_0 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        local function v94() --[[ Line: 205 ]]
            -- upvalues: v38 (ref), v26 (ref), v91 (copy), v66 (ref), v90 (copy), v54 (ref), v64 (ref), v22 (ref)
            v38(v26, v91.id):andThen(function(_) --[[ Line: 207 ]]

            end):catch(function(_) --[[ Line: 208 ]]

            end);
            v66(v90, v91);
            v54.setDisplayScreenGuiEnabled(true);
            v64(v22.Default);
        end;
        local function v95() --[[ Line: 217 ]]
            -- upvalues: v54 (ref), v64 (ref), v22 (ref)
            v54.setDisplayScreenGuiEnabled(true);
            v64(v22.Default);
        end;
        if l_FFlagFixNotificationReportsMobile_0 then
            v56(l_OpenDynamicAbuseReport_0({
                abuseVector = l_AbuseVector_0.Notifications, 
                targetId = v91.id, 
                onSubmit = v94, 
                onClose = function() --[[ Line: 227 ]] --[[ Name: onClose ]]
                    -- upvalues: v56 (ref), l_CloseCentralOverlay_0 (ref), v54 (ref), v64 (ref), v22 (ref)
                    v56(l_CloseCentralOverlay_0());
                    v54.setDisplayScreenGuiEnabled(true);
                    v64(v22.Default);
                end
            }));
            return;
        else
            v54.setDisplayScreenGuiEnabled(false);
            local v96 = {
                reportEntryPoint = "Notification", 
                assetId = v91.id, 
                reportSurface = string.lower(v57), 
                submissionEntryPoint = string.lower(v57), 
                submitterUserId = if l_Players_0.LocalPlayer then tostring(l_Players_0.LocalPlayer.UserId) else nil, 
                onSubmitReportCallback = v94, 
                onCloseCallback = v95
            };
            v56(l_NavigateDown_0({
                name = l_AppPage_0.ReportDialog, 
                reportData = v96
            }));
            return;
        end;
    end;
    local function _(v98) --[[ Line: 252 ]]
        -- upvalues: v67 (ref), v59 (copy), v5 (ref), v60 (copy)
        v67();
        if v59 and v98 then
            local v100 = v5.List.map(v59, function(v99) --[[ Line: 255 ]]
                -- upvalues: v98 (copy)
                if v99.id == v98 then
                    v99.dismiss = true;
                end;
                return v99;
            end);
            v60(v100);
        end;
    end;
    local v106 = v17.useCallback(function(v102) --[[ Line: 266 ]]
        -- upvalues: v59 (copy), v5 (ref), v60 (copy)
        if v59 and v102 then
            local v105 = v5.List.filter(v59, function(v103) --[[ Line: 268 ]]
                -- upvalues: v102 (copy)
                local v104 = false;
                if v103.id ~= v102 then
                    v104 = v103.dismiss ~= true;
                end;
                return v104;
            end);
            v60(v105);
        end;
    end);
    local v119 = v17.useCallback(function(v107, v108) --[[ Line: 278 ]]
        -- upvalues: v61 (copy), v62 (copy), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v42 (ref), v5 (ref), l_FFlagStreamNotificationsStandardizeClickEvents_0 (ref), v47 (ref), v4 (ref), l_type_0 (ref), l_JoinExperience_0 (ref), v54 (copy), l_SessionService_0 (ref), v39 (ref), v8 (ref), v37 (ref), v26 (ref), v66 (ref), v67 (ref), v64 (copy), v22 (ref), v97 (copy), v59 (copy), v60 (copy), v58 (copy)
        local v109 = v108 or v61;
        v62(v109);
        l_NotificationHelper_0.fireEvent(l_EventStream_0, v42.Context.click, v107.eventName or "", v5.Dictionary.join(v107.clientEventsPayload or {}, {
            notifType = if l_FFlagStreamNotificationsStandardizeClickEvents_0 then nil else if v47 then v109 and v109.content and v109.content.notificationType else nil, 
            notifId = if l_FFlagStreamNotificationsStandardizeClickEvents_0 then nil else if v47 then v109 and v109.id else nil, 
            notificationType = if l_FFlagStreamNotificationsStandardizeClickEvents_0 then v109 and v109.content and v109.content.notificationType else nil, 
            notificationId = if l_FFlagStreamNotificationsStandardizeClickEvents_0 then v109 and v109.id else nil, 
            notificationState = if l_FFlagStreamNotificationsStandardizeClickEvents_0 then v109 and v109.content and v109.content.currentState else nil, 
            visualItemType = v107.visualItemType or nil, 
            visualItemName = v107.visualItemName or nil, 
            sendrVersion = v4.SENDRVersion
        }));
        if v107.actions and #v107.actions > 0 and v109 then
            for _, v111 in ipairs(v107.actions) do
                if v111.actionType then
                    if v111.actionType == l_type_0.ActionTypeEnum.Deeplink then
                        if l_JoinExperience_0(v111.path, false) then
                            v54.displayStream(false);
                            l_SessionService_0:SetSession(v4.StreamSessionStructuralIdentifier.Level1, v4.StreamSessionStructuralIdentifier.StreamNotification, v4.StreamSessionStructuralIdentifier.StreamNotification);
                            l_SessionService_0:SetMetadata(v4.StreamSessionStructuralIdentifier.StreamNotification, v4.StreamSessionStructuralIdentifier.DeleteOnGameLeave, "True");
                            v39(v8, {
                                action_type = v111.actionType, 
                                delivery_channel = v4.DeliveryChannel, 
                                notification_type = v109.notificationSourceType, 
                                notification_id = v109.id
                            });
                        end;
                    elseif v111.actionType == l_type_0.ActionTypeEnum.NotificationApi then
                        local v112 = v109 and v109.id or nil;
                        local v113 = v111.path or nil;
                        v37(v26, v112, v113):andThen(function(_) --[[ Line: 351 ]]
                            -- upvalues: v111 (copy), v66 (ref), v109 (copy)
                            if v111.nextState ~= nil and v111.nextState ~= "" then
                                v66(v111.nextState, v109);
                            end;
                        end):catch(function(_) --[[ Line: 356 ]]

                        end);
                        v67();
                    elseif v111.actionType == l_type_0.ActionTypeEnum.Report then
                        v64(v22.AbuseReport);
                        v97(v111.nextState, v109);
                    elseif v111.actionType == l_type_0.ActionTypeEnum.Dismiss then
                        local l_id_0 = v109.id;
                        v67();
                        if v59 and l_id_0 then
                            local v118 = v5.List.map(v59, function(v117) --[[ Line: 255 ]]
                                -- upvalues: l_id_0 (copy)
                                if v117.id == l_id_0 then
                                    v117.dismiss = true;
                                end;
                                return v117;
                            end);
                            v60(v118);
                        end;
                    elseif v111.actionType == l_type_0.ActionTypeEnum.ClientTrigger then
                        v58(v111.path, {
                            clientEventsPayload = v109.content.clientEventsPayload, 
                            callback = function() --[[ Line: 374 ]] --[[ Name: callback ]]
                                -- upvalues: v66 (ref), v111 (copy), v109 (copy)
                                v66(v111.nextState, v109);
                            end
                        });
                    end;
                end;
            end;
        end;
    end);
    local function v121(v120) --[[ Line: 385 ]]
        -- upvalues: v62 (copy), v64 (copy), v22 (ref), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v42 (ref), v18 (ref), v4 (ref), l_FFlagStreamNotificationsStandardizeClickEvents_0 (ref)
        v62(v120);
        v64(v22.MetaActions);
        l_NotificationHelper_0.fireEvent(l_EventStream_0, v42.Context.click, v42.EventNames.openMetaActions, {
            visualItemType = v18.type.VisualItemTypeEnum.MetaAction, 
            sendrVersion = v4.SENDRVersion, 
            notificationState = if l_FFlagStreamNotificationsStandardizeClickEvents_0 then v120 and v120.content and v120.content.currentState or nil else nil
        });
    end;
    v67 = function() --[[ Line: 407 ]]
        -- upvalues: v69 (copy), v62 (copy), v63 (copy), v22 (ref), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v42 (ref), v18 (ref), v4 (ref), v64 (copy)
        v69(true);
        v62(nil);
        if v63 == v22.MetaActions then
            l_NotificationHelper_0.fireEvent(l_EventStream_0, v42.Context.click, v42.EventNames.closeMetaActions, {
                visualItemType = v18.type.VisualItemTypeEnum.MetaAction, 
                sendrVersion = v4.SENDRVersion
            });
        end;
        v64(v22.Default);
    end;
    v66 = function(v122, v123) --[[ Line: 424 ]]
        -- upvalues: v59 (copy), v60 (copy)
        local v124 = {};
        if v59 and v123 then
            for _, v126 in ipairs(v59) do
                if v126.id == v123.id then
                    v126.content.currentState = v122;
                end;
                table.insert(v124, v126);
            end;
        end;
        v60(v124);
    end;
    local v127 = v17.useMemo(function() --[[ Line: 440 ]]
        -- upvalues: v17 (ref), v14 (ref), v63 (copy), v61 (copy), v54 (copy), v119 (copy), v67 (ref)
        return v17.createElement(v14, {
            displayState = v63, 
            activeNotification = v61, 
            isSmallScreen = v54.isSmallScreen, 
            handleActions = v119, 
            closeNotificationDisplay = v67
        });
    end, {
        v63, 
        v61
    });
    local v137 = v17.useMemo(function() --[[ Line: 450 ]]
        -- upvalues: v63 (copy), v22 (ref), v17 (ref), l_LoadingSpinner_0 (ref), v4 (ref), v59 (copy), v16 (ref), v106 (copy), v119 (copy), v121 (copy), v15 (ref), v70 (copy), v23 (ref), v75 (copy), v13 (ref)
        if v63 == v22.Initializing then
            return v17.createElement(l_LoadingSpinner_0, {
                size = UDim2.fromOffset(v4.InitializingNotifications.Size, v4.InitializingNotifications.Size), 
                position = UDim2.fromScale(0.5, 0.5), 
                anchorPoint = Vector2.new(0.5, 0.5)
            });
        else
            if v59 and #v59 > 0 then
                local v128 = {
                    UIListLayout = v17.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    })
                };
                local v129 = false;
                local v130 = {};
                for _, v132 in ipairs(v59) do
                    if v132.notificationSourceType == "Sendr" then
                        v129 = true;
                        local l_bundleKey_0 = v132.content.bundleKey;
                        if l_bundleKey_0 and l_bundleKey_0 ~= "" then
                            if v130[l_bundleKey_0] then
                                table.insert(v130[l_bundleKey_0], v132);
                            else
                                v130[l_bundleKey_0] = {
                                    v132
                                };
                            end;
                        end;
                    end;
                end;
                for v134, v135 in ipairs(v59) do
                    if v135.notificationSourceType == "Sendr" then
                        local l_bundleKey_1 = v135.content.bundleKey;
                        if l_bundleKey_1 and l_bundleKey_1 ~= "" and #v130[l_bundleKey_1] > 1 then
                            if not v128[l_bundleKey_1] then
                                v128[l_bundleKey_1] = v17.createElement(v16, {
                                    layoutOrder = v134, 
                                    notifications = v130[l_bundleKey_1], 
                                    finishDismissNotification = v106, 
                                    handleActions = v119, 
                                    openMetaActions = v121
                                }, {});
                            end;
                        else
                            v128[v135.id] = v17.createElement(v15, {
                                layoutOrder = v134, 
                                notification = v135, 
                                finishDismissNotification = v106, 
                                handleActions = v119, 
                                openMetaActions = v121, 
                                collapsed = false
                            }, {});
                        end;
                    end;
                end;
                if v70.current == v23.Loading then
                    v128.LoadingMore = v17.createElement("Frame", {
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
                if v129 then
                    return v17.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, -v75), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1
                    }, v128);
                end;
            end;
            return v17.createElement(v13);
        end;
    end, {
        v59, 
        v63, 
        v71
    });
    local function v142(v138) --[[ Line: 576 ]]
        -- upvalues: v63 (copy), v22 (ref), v4 (ref), v70 (copy), v23 (ref), v65 (ref)
        local l_Y_0 = v138.AbsoluteCanvasSize.Y;
        local l_Y_1 = v138.AbsoluteWindowSize.Y;
        local l_Y_2 = v138.CanvasPosition.Y;
        if l_Y_1 == 0 or l_Y_0 == 0 or v63 ~= v22.Default then
            return;
        else
            if l_Y_0 - l_Y_1 - v4.LoadingMoreNotifications.TriggerDistance <= l_Y_2 and v70.current == v23.Default then
                v65();
            end;
            return;
        end;
    end;
    local v143 = if l_UserInputService_0.BottomBarSize then l_UserInputService_0.BottomBarSize.Y else 0;
    local v144 = if l_GuiService_0:GetSafeZoneOffsets() then l_GuiService_0:GetSafeZoneOffsets().bottom else 0;
    local v145 = if v54.isSmallScreen then math.max(v143, v144) else 0;
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
            Visible = v63 == v22.MetaActions, 
            BackgroundTransparency = v55.Theme.Overlay.Transparency, 
            BackgroundColor3 = v55.Theme.Overlay.Color, 
            Text = "", 
            AutoButtonColor = false, 
            ZIndex = 2, 
            [v17.Event.Activated] = v67, 
            BorderSizePixel = 0, 
            Selectable = false
        }, {
            v127
        }), 
        NotificationsList = v17.createElement("ScrollingFrame", {
            Size = UDim2.new(1, 0, 1, -(v75 + v4.DefaultPadding + v145)), 
            CanvasSize = UDim2.new(1, 0, 1, -(v75 + v4.DefaultPadding + v145)), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 0, v75), 
            AnchorPoint = Vector2.new(0, 0), 
            ScrollBarThickness = 4, 
            BorderSizePixel = 0, 
            VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar, 
            VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right, 
            ScrollBarImageColor3 = v55.Theme.UIEmphasis.Color, 
            AutomaticCanvasSize = Enum.AutomaticSize.XY, 
            ElasticBehavior = Enum.ElasticBehavior.Always, 
            ScrollingEnabled = v63 == v22.Default, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            [v17.Change.CanvasPosition] = v142, 
            Selectable = false
        }, v137)
    });
end;