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
local l_Popover_0 = v14.Popover;
local l_PopoverSide_0 = v14.Enums.PopoverSide;
local l_PopoverAlign_0 = v14.Enums.PopoverAlign;
local l_EventStream_0 = require(l_script_FirstAncestor_0.analytics.analyticsService).EventStream;
local l_NotificationHelper_0 = require(l_Parent_0.NotificationsCommon).NotificationHelper;
local l_ixpHelper_0 = require(l_Parent_0.NotificationsCommon).ixpHelper;
local v21 = require(l_script_FirstAncestor_0.constants);
local v22 = require(l_script_FirstAncestor_0.analytics.analyticsConstants);
local l_GetFStringNotificationsStreamNotificationUXLayer_0 = require(l_Parent_0.SharedFlags).GetFStringNotificationsStreamNotificationUXLayer;
local l_isAppNavEnabled_0 = require(l_Parent_0.SharedFlags).isAppNavEnabled;
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local v26 = require(l_script_FirstAncestor_0.StreamNotificationDropdownExperimentation);
local l_RoactAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).RoactAppPolicy;
local l_GetFFlagNotificationsComplianceShouldRestrictStream_0 = v5.GetFFlagNotificationsComplianceShouldRestrictStream;
local l_FFlagEnableNotificationsDeeplink_0 = v5.FFlagEnableNotificationsDeeplink;
local l_FFlagStreamNotificationBellEntryPoint_0 = v5.FFlagStreamNotificationBellEntryPoint;
local l_FFlagEnableHeaderBarButtonsUpdate_0 = v5.FFlagEnableHeaderBarButtonsUpdate;
local v32 = l_Images_0["icons/common/notificationOff"];
local l_GetFFlagFilterNotificationsForPCGDKEnabled_0 = v5.GetFFlagFilterNotificationsForPCGDKEnabled;
local function _() --[[ Line: 44 ]] --[[ Name: GetIsFriendCommunicationRestricted ]]
    -- upvalues: l_GetFFlagFilterNotificationsForPCGDKEnabled_0 (copy), l_ThirdPartyUserService_0 (copy)
    return l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_ThirdPartyUserService_0 and l_ThirdPartyUserService_0:IsChatRestrictionSupported() and l_ThirdPartyUserService_0.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted;
end;
local function v48(v35) --[[ Line: 61 ]]
    -- upvalues: v2 (copy), l_FFlagEnableNotificationsDeeplink_0 (copy), l_useSignalState_0 (copy), v4 (copy), v26 (copy), l_NotificationHelper_0 (copy), l_EventStream_0 (copy), v22 (copy), v21 (copy), l_FFlagStreamNotificationBellEntryPoint_0 (copy), v3 (copy), l_GetFFlagNotificationsComplianceShouldRestrictStream_0 (copy), l_GetFFlagFilterNotificationsForPCGDKEnabled_0 (copy), l_ThirdPartyUserService_0 (copy), l_ixpHelper_0 (copy), l_GetFStringNotificationsStreamNotificationUXLayer_0 (copy), l_FFlagEnableHeaderBarButtonsUpdate_0 (copy), v14 (copy), l_isAppNavEnabled_0 (copy), l_Popover_0 (copy), l_PopoverSide_0 (copy), l_PopoverAlign_0 (copy), v32 (copy), l_UtilityActionIcon_0 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Badge_0 (copy), l_BadgeVariant_0 (copy)
    local v36, v37 = v2.useState(false);
    if l_FFlagEnableNotificationsDeeplink_0 then
        v36 = l_useSignalState_0(v4.getStreamPresented);
    end;
    local v38 = v26.getDropdownEnabled();
    local v39 = v35.notificationCount and tonumber(v35.notificationCount) or 0;
    local l_layoutOrder_0 = v35.layoutOrder;
    local v41 = 44;
    if v35.compactWidth then
        v41 = 34;
    end;
    v2.useEffect(function() --[[ Line: 80 ]]
        -- upvalues: v39 (copy), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v22 (ref), v21 (ref), l_FFlagStreamNotificationBellEntryPoint_0 (ref), v35 (copy)
        if v39 > 0 then
            l_NotificationHelper_0.fireEvent(l_EventStream_0, v22.Context.seen, v22.EventNames.openCTAShown, {
                count = v39, 
                sendrVersion = v21.SENDRVersion, 
                entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then v35.entryPoint else nil
            });
        end;
    end, {
        v39
    });
    local v42 = v2.useMemo(function() --[[ Line: 95 ]]
        -- upvalues: v36 (ref), v2 (ref), v3 (ref), l_FFlagEnableNotificationsDeeplink_0 (ref), v4 (ref), v37 (copy)
        if v36 then
            return v2.createElement(v3, {
                displayStream = if l_FFlagEnableNotificationsDeeplink_0 then v4.setStreamPresented else v37
            });
        else
            return nil;
        end;
    end, {
        v36
    });
    if l_GetFFlagNotificationsComplianceShouldRestrictStream_0() and v35.shouldRestrictStream then
        return nil;
    else
        local v43 = if l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_ThirdPartyUserService_0 and l_ThirdPartyUserService_0:IsChatRestrictionSupported() and l_ThirdPartyUserService_0.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted then nil else if v39 > 0 then v39 else nil;
        local function v44() --[[ Line: 120 ]] --[[ Name: onBellActivated ]]
            -- upvalues: v38 (copy), l_FFlagEnableNotificationsDeeplink_0 (ref), v4 (ref), v36 (ref), v37 (copy), v26 (ref), l_ixpHelper_0 (ref), l_GetFStringNotificationsStreamNotificationUXLayer_0 (ref), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v22 (ref), v39 (copy), v21 (ref), l_FFlagStreamNotificationBellEntryPoint_0 (ref), v35 (copy)
            if v38 then
                if l_FFlagEnableNotificationsDeeplink_0 then
                    v4.setStreamPresented(not v36);
                else
                    v37(not v36);
                end;
                v26.logExposure();
                l_ixpHelper_0.logUserLayerExposure(l_GetFStringNotificationsStreamNotificationUXLayer_0());
                if v36 then
                    l_NotificationHelper_0.fireEvent(l_EventStream_0, v22.Context.click, v22.EventNames.closeContent, {
                        closeMethod = v22.CloseMethod.bellIcon
                    });
                    return;
                else
                    l_NotificationHelper_0.fireEvent(l_EventStream_0, v22.Context.click, v22.EventNames.openContent, {
                        countOfUnreadNotification = v39, 
                        sendrVersion = v21.SENDRVersion, 
                        entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then v35.entryPoint else nil
                    });
                    return;
                end;
            else
                if l_FFlagEnableNotificationsDeeplink_0 then
                    v4.setStreamPresented(true);
                else
                    v37(true);
                end;
                l_ixpHelper_0.logUserLayerExposure(l_GetFStringNotificationsStreamNotificationUXLayer_0());
                l_NotificationHelper_0.fireEvent(l_EventStream_0, v22.Context.click, v22.EventNames.openContent, {
                    countOfUnreadNotification = v39, 
                    sendrVersion = v21.SENDRVersion, 
                    entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then v35.entryPoint else nil
                });
                return;
            end;
        end;
        local function v45() --[[ Line: 177 ]] --[[ Name: onPopoverDismiss ]]
            -- upvalues: l_FFlagEnableNotificationsDeeplink_0 (ref), v4 (ref), v37 (copy), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v22 (ref)
            if l_FFlagEnableNotificationsDeeplink_0 then
                v4.setStreamPresented(false);
            else
                v37(false);
            end;
            l_NotificationHelper_0.fireEvent(l_EventStream_0, v22.Context.click, v22.EventNames.closeContent, {
                closeMethod = v22.CloseMethod.backgroundOverlay
            });
        end;
        if l_FFlagEnableHeaderBarButtonsUpdate_0 then
            local v46 = v2.createElement(v14.View, {
                tag = "auto-xy radius-circle", 
                LayoutOrder = l_layoutOrder_0 or 3, 
                ref = v35.buttonRef, 
                testId = v35.testId
            }, {
                IconButton = v2.createElement(v14.IconButton, {
                    ZIndex = 1, 
                    isCircular = true, 
                    icon = v14.Enums.IconName.Bell, 
                    onActivated = v44
                }), 
                Badge = if l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_ThirdPartyUserService_0 and l_ThirdPartyUserService_0:IsChatRestrictionSupported() and l_ThirdPartyUserService_0.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted then nil else if v39 > 0 then v2.createElement(v14.StatusIndicator, {
                    AnchorPoint = Vector2.new(0, 1), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    ZIndex = 2, 
                    variant = v14.Enums.StatusIndicatorVariant.Alert, 
                    value = v39, 
                    max = 99
                }) else nil, 
                DisplayStreamNotifications = if not v38 then v42 else nil
            });
            if l_isAppNavEnabled_0() and v38 then
                return (v2.createElement(l_Popover_0.Root, {
                    isOpen = v36
                }, {
                    Anchor = v2.createElement(l_Popover_0.Anchor, nil, {
                        BellIcon = v46
                    }), 
                    Content = v2.createElement(l_Popover_0.Content, {
                        side = l_PopoverSide_0.Bottom, 
                        align = l_PopoverAlign_0.End, 
                        hasArrow = true, 
                        onPressedOutside = v45
                    }, {
                        DisplayStreamNotifications = v42
                    })
                }));
            else
                return v46;
            end;
        elseif l_isAppNavEnabled_0() then
            local v47 = if v38 and v36 then v21.Dropdown.BellIconOpen else v32;
            if v38 then
                return (v2.createElement(l_Popover_0.Root, {
                    isOpen = v36
                }, {
                    Anchor = v2.createElement(l_Popover_0.Anchor, nil, {
                        BellIcon = v2.createElement(l_UtilityActionIcon_0, {
                            icon = v47, 
                            onActivated = v44, 
                            badgeValue = v43, 
                            buttonRef = v35.buttonRef
                        })
                    }), 
                    Content = v2.createElement(l_Popover_0.Content, {
                        side = l_PopoverSide_0.Bottom, 
                        align = l_PopoverAlign_0.End, 
                        hasArrow = true, 
                        onPressedOutside = v45
                    }, {
                        DisplayStreamNotifications = v42
                    })
                }));
            else
                return (v2.createElement(l_UtilityActionIcon_0, {
                    icon = v47, 
                    onActivated = v44, 
                    badgeValue = v43, 
                    buttonRef = v35.buttonRef
                }, {
                    DisplayStreamNotifications = v42
                }));
            end;
        else
            return (v2.createElement(l_IconButton_0, {
                size = UDim2.new(0, v41, 1, 0), 
                icon = v32, 
                iconSize = l_IconSize_0.Medium, 
                layoutOrder = l_layoutOrder_0 or 3, 
                onActivated = v44, 
                buttonRef = v35.buttonRef
            }, {
                notificationBadge = if l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_ThirdPartyUserService_0 and l_ThirdPartyUserService_0:IsChatRestrictionSupported() and l_ThirdPartyUserService_0.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted then nil else if v39 > 0 then v2.createElement(l_Badge_0, {
                    position = UDim2.new(0.5, 0, 0.5, 0), 
                    anchorPoint = Vector2.new(0, 1), 
                    value = v39, 
                    badgeVariant = l_BadgeVariant_0.Alert
                }) else nil
            }, {
                v42
            }));
        end;
    end;
end;
if l_GetFFlagNotificationsComplianceShouldRestrictStream_0() then
    v48 = l_RoactAppPolicy_0.connect(function(v49, _) --[[ Line: 306 ]]
        return {
            shouldRestrictStream = v49.getNotificationsCanReceiveStream() or false
        };
    end)(v48);
end;
return v48;