local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamNotifications");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.StreamNotifications);
local v4 = require(l_script_FirstAncestor_0.StreamNotificationStore);
local v5 = require(l_Parent_0.SharedFlags);
local l_ThirdPartyUserService_0 = game:GetService("ThirdPartyUserService");
local v7 = require(l_Parent_0.UIBlox);
local l_Badge_0 = v7.App.Indicator.Badge;
local l_IconButton_0 = v7.App.Button.IconButton;
local l_IconSize_0 = v7.App.Constant.IconSize;
local l_Images_0 = v7.App.ImageSet.Images;
local l_BadgeVariant_0 = v7.App.Indicator.Enum.BadgeVariant;
local l_UtilityActionIcon_0 = v7.App.Button.UtilityActionIcon;
local v14 = require(l_Parent_0.Foundation);
local l_EventStream_0 = require(l_script_FirstAncestor_0.analytics.analyticsService).EventStream;
local l_NotificationHelper_0 = require(l_Parent_0.NotificationsCommon).NotificationHelper;
local l_ixpHelper_0 = require(l_Parent_0.NotificationsCommon).ixpHelper;
local v18 = require(l_script_FirstAncestor_0.constants);
local v19 = require(l_script_FirstAncestor_0.analytics.analyticsConstants);
local l_GetFStringNotificationsStreamNotificationUXLayer_0 = require(l_Parent_0.SharedFlags).GetFStringNotificationsStreamNotificationUXLayer;
local l_isAppNavEnabled_0 = require(l_Parent_0.SharedFlags).isAppNavEnabled;
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local l_RoactAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).RoactAppPolicy;
local l_GetFFlagNotificationsComplianceShouldRestrictStream_0 = v5.GetFFlagNotificationsComplianceShouldRestrictStream;
local l_FFlagEnableNotificationsDeeplink_0 = v5.FFlagEnableNotificationsDeeplink;
local l_FFlagStreamNotificationBellEntryPoint_0 = v5.FFlagStreamNotificationBellEntryPoint;
local l_FFlagEnableHeaderBarButtonsUpdate_0 = v5.FFlagEnableHeaderBarButtonsUpdate;
local v28 = l_Images_0["icons/common/notificationOff"];
local l_GetFFlagFilterNotificationsForPCGDKEnabled_0 = v5.GetFFlagFilterNotificationsForPCGDKEnabled;
local function _() --[[ Line: 39 ]] --[[ Name: GetIsFriendCommunicationRestricted ]]
    -- upvalues: l_GetFFlagFilterNotificationsForPCGDKEnabled_0 (copy), l_ThirdPartyUserService_0 (copy)
    return l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_ThirdPartyUserService_0 and l_ThirdPartyUserService_0:IsChatRestrictionSupported() and l_ThirdPartyUserService_0.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted;
end;
local function v38(v31) --[[ Line: 56 ]]
    -- upvalues: v2 (copy), l_FFlagEnableNotificationsDeeplink_0 (copy), l_useSignalState_0 (copy), v4 (copy), l_NotificationHelper_0 (copy), l_EventStream_0 (copy), v19 (copy), v18 (copy), l_FFlagStreamNotificationBellEntryPoint_0 (copy), v3 (copy), l_GetFFlagNotificationsComplianceShouldRestrictStream_0 (copy), l_FFlagEnableHeaderBarButtonsUpdate_0 (copy), v14 (copy), l_ixpHelper_0 (copy), l_GetFStringNotificationsStreamNotificationUXLayer_0 (copy), l_GetFFlagFilterNotificationsForPCGDKEnabled_0 (copy), l_ThirdPartyUserService_0 (copy), l_isAppNavEnabled_0 (copy), l_UtilityActionIcon_0 (copy), v28 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Badge_0 (copy), l_BadgeVariant_0 (copy)
    local v32, v33 = v2.useState(false);
    if l_FFlagEnableNotificationsDeeplink_0 then
        v32 = l_useSignalState_0(v4.getStreamPresented);
    end;
    local v34 = v31.notificationCount and tonumber(v31.notificationCount) or 0;
    local l_layoutOrder_0 = v31.layoutOrder;
    local v36 = 44;
    if v31.compactWidth then
        v36 = 34;
    end;
    v2.useEffect(function() --[[ Line: 73 ]]
        -- upvalues: v34 (copy), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v19 (ref), v18 (ref), l_FFlagStreamNotificationBellEntryPoint_0 (ref), v31 (copy)
        if v34 > 0 then
            l_NotificationHelper_0.fireEvent(l_EventStream_0, v19.Context.seen, v19.EventNames.openCTAShown, {
                count = v34, 
                sendrVersion = v18.SENDRVersion, 
                entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then v31.entryPoint else nil
            });
        end;
    end, {
        v34
    });
    local v37 = v2.useMemo(function() --[[ Line: 88 ]]
        -- upvalues: v32 (ref), v2 (ref), v3 (ref), l_FFlagEnableNotificationsDeeplink_0 (ref), v4 (ref), v33 (copy)
        if v32 then
            return v2.createElement(v3, {
                displayStream = if l_FFlagEnableNotificationsDeeplink_0 then v4.setStreamPresented else v33
            });
        else
            return nil;
        end;
    end, {
        v32
    });
    if l_GetFFlagNotificationsComplianceShouldRestrictStream_0() and v31.shouldRestrictStream then
        return nil;
    elseif l_FFlagEnableHeaderBarButtonsUpdate_0 then
        return (v2.createElement(v14.View, {
            tag = "auto-xy radius-circle", 
            LayoutOrder = l_layoutOrder_0 or 3, 
            ref = v31.buttonRef, 
            testId = v31.testId
        }, {
            IconButton = v2.createElement(v14.IconButton, {
                ZIndex = 1, 
                isCircular = true, 
                icon = v14.Enums.IconName.Bell, 
                onActivated = function() --[[ Line: 119 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_FFlagEnableNotificationsDeeplink_0 (ref), v4 (ref), v33 (copy), l_ixpHelper_0 (ref), l_GetFStringNotificationsStreamNotificationUXLayer_0 (ref), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v19 (ref), v34 (copy), v18 (ref), l_FFlagStreamNotificationBellEntryPoint_0 (ref), v31 (copy)
                    if l_FFlagEnableNotificationsDeeplink_0 then
                        v4.setStreamPresented(true);
                    else
                        v33(true);
                    end;
                    l_ixpHelper_0.logUserLayerExposure(l_GetFStringNotificationsStreamNotificationUXLayer_0());
                    l_NotificationHelper_0.fireEvent(l_EventStream_0, v19.Context.click, v19.EventNames.openContent, {
                        countOfUnreadNotification = v34, 
                        sendrVersion = v18.SENDRVersion, 
                        entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then v31.entryPoint else nil
                    });
                end
            }), 
            Badge = if l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_ThirdPartyUserService_0 and l_ThirdPartyUserService_0:IsChatRestrictionSupported() and l_ThirdPartyUserService_0.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted then nil else if v34 > 0 then v2.createElement(v14.StatusIndicator, {
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.fromScale(0.5, 0.5), 
                ZIndex = 2, 
                variant = v14.Enums.StatusIndicatorVariant.Alert, 
                value = v34, 
                max = 99
            }) else nil, 
            DisplayStreamNotifications = v37
        }));
    elseif l_isAppNavEnabled_0() then
        return (v2.createElement(l_UtilityActionIcon_0, {
            icon = v28, 
            onActivated = function() --[[ Line: 160 ]] --[[ Name: onActivated ]]
                -- upvalues: l_FFlagEnableNotificationsDeeplink_0 (ref), v4 (ref), v33 (copy), l_ixpHelper_0 (ref), l_GetFStringNotificationsStreamNotificationUXLayer_0 (ref), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v19 (ref), v34 (copy), v18 (ref), l_FFlagStreamNotificationBellEntryPoint_0 (ref), v31 (copy)
                if l_FFlagEnableNotificationsDeeplink_0 then
                    v4.setStreamPresented(true);
                else
                    v33(true);
                end;
                l_ixpHelper_0.logUserLayerExposure(l_GetFStringNotificationsStreamNotificationUXLayer_0());
                l_NotificationHelper_0.fireEvent(l_EventStream_0, v19.Context.click, v19.EventNames.openContent, {
                    countOfUnreadNotification = v34, 
                    sendrVersion = v18.SENDRVersion, 
                    entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then v31.entryPoint else nil
                });
            end, 
            badgeValue = if l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_ThirdPartyUserService_0 and l_ThirdPartyUserService_0:IsChatRestrictionSupported() and l_ThirdPartyUserService_0.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted then nil else if v34 > 0 then v34 else nil, 
            buttonRef = v31.buttonRef
        }, {
            DisplayStreamNotifications = v37
        }));
    else
        return (v2.createElement(l_IconButton_0, {
            size = UDim2.new(0, v36, 1, 0), 
            icon = v28, 
            iconSize = l_IconSize_0.Medium, 
            layoutOrder = l_layoutOrder_0 or 3, 
            onActivated = function() --[[ Line: 194 ]] --[[ Name: onActivated ]]
                -- upvalues: l_FFlagEnableNotificationsDeeplink_0 (ref), v4 (ref), v33 (copy), l_ixpHelper_0 (ref), l_GetFStringNotificationsStreamNotificationUXLayer_0 (ref), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v19 (ref), v34 (copy), v18 (ref), l_FFlagStreamNotificationBellEntryPoint_0 (ref), v31 (copy)
                if l_FFlagEnableNotificationsDeeplink_0 then
                    v4.setStreamPresented(true);
                else
                    v33(true);
                end;
                l_ixpHelper_0.logUserLayerExposure(l_GetFStringNotificationsStreamNotificationUXLayer_0());
                l_NotificationHelper_0.fireEvent(l_EventStream_0, v19.Context.click, v19.EventNames.openContent, {
                    countOfUnreadNotification = v34, 
                    sendrVersion = v18.SENDRVersion, 
                    entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then v31.entryPoint else nil
                });
            end, 
            buttonRef = v31.buttonRef
        }, {
            notificationBadge = if l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_ThirdPartyUserService_0 and l_ThirdPartyUserService_0:IsChatRestrictionSupported() and l_ThirdPartyUserService_0.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted then nil else if v34 > 0 then v2.createElement(l_Badge_0, {
                position = UDim2.new(0.5, 0, 0.5, 0), 
                anchorPoint = Vector2.new(0, 1), 
                value = v34, 
                badgeVariant = l_BadgeVariant_0.Alert
            }) else nil
        }, {
            v37
        }));
    end;
end;
if l_GetFFlagNotificationsComplianceShouldRestrictStream_0() then
    v38 = l_RoactAppPolicy_0.connect(function(v39, _) --[[ Line: 228 ]]
        return {
            shouldRestrictStream = v39.getNotificationsCanReceiveStream() or false
        };
    end)(v38);
end;
return v38;