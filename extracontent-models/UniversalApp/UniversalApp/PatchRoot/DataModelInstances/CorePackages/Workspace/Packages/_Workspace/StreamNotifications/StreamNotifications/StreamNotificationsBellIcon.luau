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
local l_useTokens_0 = v14.Hooks.useTokens;
local l_EventStream_0 = require(l_script_FirstAncestor_0.analytics.analyticsService).EventStream;
local l_NotificationHelper_0 = require(l_Parent_0.NotificationsCommon).NotificationHelper;
local l_ixpHelper_0 = require(l_Parent_0.NotificationsCommon).ixpHelper;
local v22 = require(l_script_FirstAncestor_0.constants);
local v23 = require(l_script_FirstAncestor_0.analytics.analyticsConstants);
local l_GetFStringNotificationsStreamNotificationUXLayer_0 = require(l_Parent_0.SharedFlags).GetFStringNotificationsStreamNotificationUXLayer;
local l_isAppNavEnabled_0 = require(l_Parent_0.SharedFlags).isAppNavEnabled;
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local v27 = require(l_script_FirstAncestor_0.StreamNotificationDropdownExperimentation);
local l_RoactAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).RoactAppPolicy;
local l_GetFFlagNotificationsComplianceShouldRestrictStream_0 = v5.GetFFlagNotificationsComplianceShouldRestrictStream;
local l_FFlagEnableNotificationsDeeplink_0 = v5.FFlagEnableNotificationsDeeplink;
local l_FFlagStreamNotificationBellEntryPoint_0 = v5.FFlagStreamNotificationBellEntryPoint;
local l_FFlagEnableHeaderBarButtonsUpdate_0 = v5.FFlagEnableHeaderBarButtonsUpdate;
local v33 = l_Images_0["icons/common/notificationOff"];
local l_GetFFlagFilterNotificationsForPCGDKEnabled_0 = v5.GetFFlagFilterNotificationsForPCGDKEnabled;
local function _() --[[ Line: 45 ]] --[[ Name: GetIsFriendCommunicationRestricted ]]
    -- upvalues: l_GetFFlagFilterNotificationsForPCGDKEnabled_0 (copy), l_ThirdPartyUserService_0 (copy)
    return l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_ThirdPartyUserService_0 and l_ThirdPartyUserService_0:IsChatRestrictionSupported() and l_ThirdPartyUserService_0.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted;
end;
local function v50(v36) --[[ Line: 62 ]]
    -- upvalues: v2 (copy), l_FFlagEnableNotificationsDeeplink_0 (copy), l_useSignalState_0 (copy), v4 (copy), v27 (copy), l_useTokens_0 (copy), l_NotificationHelper_0 (copy), l_EventStream_0 (copy), v23 (copy), v22 (copy), l_FFlagStreamNotificationBellEntryPoint_0 (copy), v3 (copy), l_GetFFlagNotificationsComplianceShouldRestrictStream_0 (copy), l_GetFFlagFilterNotificationsForPCGDKEnabled_0 (copy), l_ThirdPartyUserService_0 (copy), l_ixpHelper_0 (copy), l_GetFStringNotificationsStreamNotificationUXLayer_0 (copy), l_FFlagEnableHeaderBarButtonsUpdate_0 (copy), v14 (copy), l_isAppNavEnabled_0 (copy), l_Popover_0 (copy), l_PopoverSide_0 (copy), l_PopoverAlign_0 (copy), v33 (copy), l_UtilityActionIcon_0 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Badge_0 (copy), l_BadgeVariant_0 (copy)
    local v37, v38 = v2.useState(false);
    if l_FFlagEnableNotificationsDeeplink_0 then
        v37 = l_useSignalState_0(v4.getStreamPresented);
    end;
    local v39 = v27.getDropdownEnabled();
    local v40 = l_useTokens_0();
    local v41 = v36.notificationCount and tonumber(v36.notificationCount) or 0;
    local l_layoutOrder_0 = v36.layoutOrder;
    local v43 = 44;
    if v36.compactWidth then
        v43 = 34;
    end;
    v2.useEffect(function() --[[ Line: 82 ]]
        -- upvalues: v41 (copy), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v23 (ref), v22 (ref), l_FFlagStreamNotificationBellEntryPoint_0 (ref), v36 (copy)
        if v41 > 0 then
            l_NotificationHelper_0.fireEvent(l_EventStream_0, v23.Context.seen, v23.EventNames.openCTAShown, {
                count = v41, 
                sendrVersion = v22.SENDRVersion, 
                entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then v36.entryPoint else nil
            });
        end;
    end, {
        v41
    });
    local v44 = v2.useMemo(function() --[[ Line: 97 ]]
        -- upvalues: v37 (ref), v2 (ref), v3 (ref), l_FFlagEnableNotificationsDeeplink_0 (ref), v4 (ref), v38 (copy)
        if v37 then
            return v2.createElement(v3, {
                displayStream = if l_FFlagEnableNotificationsDeeplink_0 then v4.setStreamPresented else v38
            });
        else
            return nil;
        end;
    end, {
        v37
    });
    if l_GetFFlagNotificationsComplianceShouldRestrictStream_0() and v36.shouldRestrictStream then
        return nil;
    else
        local v45 = if l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_ThirdPartyUserService_0 and l_ThirdPartyUserService_0:IsChatRestrictionSupported() and l_ThirdPartyUserService_0.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted then nil else if v41 > 0 then v41 else nil;
        local function v46() --[[ Line: 122 ]] --[[ Name: onBellActivated ]]
            -- upvalues: v27 (ref), l_ixpHelper_0 (ref), l_GetFStringNotificationsStreamNotificationUXLayer_0 (ref), v39 (copy), l_FFlagEnableNotificationsDeeplink_0 (ref), v4 (ref), v37 (ref), v38 (copy), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v23 (ref), v41 (copy), v22 (ref), l_FFlagStreamNotificationBellEntryPoint_0 (ref), v36 (copy)
            v27.logExposure();
            l_ixpHelper_0.logUserLayerExposure(l_GetFStringNotificationsStreamNotificationUXLayer_0());
            if v39 then
                if l_FFlagEnableNotificationsDeeplink_0 then
                    v4.setStreamPresented(not v37);
                else
                    v38(not v37);
                end;
                if v37 then
                    l_NotificationHelper_0.fireEvent(l_EventStream_0, v23.Context.click, v23.EventNames.closeContent, {
                        closeMethod = v23.CloseMethod.bellIcon
                    });
                    return;
                else
                    l_NotificationHelper_0.fireEvent(l_EventStream_0, v23.Context.click, v23.EventNames.openContent, {
                        countOfUnreadNotification = v41, 
                        sendrVersion = v22.SENDRVersion, 
                        entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then v36.entryPoint else nil
                    });
                    return;
                end;
            else
                if l_FFlagEnableNotificationsDeeplink_0 then
                    v4.setStreamPresented(true);
                else
                    v38(true);
                end;
                l_NotificationHelper_0.fireEvent(l_EventStream_0, v23.Context.click, v23.EventNames.openContent, {
                    countOfUnreadNotification = v41, 
                    sendrVersion = v22.SENDRVersion, 
                    entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then v36.entryPoint else nil
                });
                return;
            end;
        end;
        local function v47() --[[ Line: 178 ]] --[[ Name: onPopoverDismiss ]]
            -- upvalues: l_FFlagEnableNotificationsDeeplink_0 (ref), v4 (ref), v38 (copy), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v23 (ref)
            if l_FFlagEnableNotificationsDeeplink_0 then
                v4.setStreamPresented(false);
            else
                v38(false);
            end;
            l_NotificationHelper_0.fireEvent(l_EventStream_0, v23.Context.click, v23.EventNames.closeContent, {
                closeMethod = v23.CloseMethod.backgroundOverlay
            });
        end;
        if l_FFlagEnableHeaderBarButtonsUpdate_0 then
            local v48 = v2.createElement(v14.View, {
                tag = "auto-xy radius-circle", 
                LayoutOrder = l_layoutOrder_0 or 3, 
                ref = v36.buttonRef, 
                testId = v36.testId
            }, {
                IconButton = v2.createElement(v14.IconButton, {
                    ZIndex = 1, 
                    isCircular = true, 
                    icon = v14.Enums.IconName.Bell, 
                    onActivated = v46
                }), 
                Badge = if l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_ThirdPartyUserService_0 and l_ThirdPartyUserService_0:IsChatRestrictionSupported() and l_ThirdPartyUserService_0.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted then nil else if v41 > 0 then v2.createElement(v14.StatusIndicator, {
                    AnchorPoint = Vector2.new(0, 1), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    ZIndex = 2, 
                    variant = v14.Enums.StatusIndicatorVariant.Alert, 
                    value = v41, 
                    max = 99
                }) else nil, 
                DisplayStreamNotifications = if not v39 then v44 else nil
            });
            if l_isAppNavEnabled_0() and v39 then
                return (v2.createElement(l_Popover_0.Root, {
                    isOpen = v37
                }, {
                    Anchor = v2.createElement(l_Popover_0.Anchor, nil, {
                        BellIcon = v48
                    }), 
                    Content = v2.createElement(l_Popover_0.Content, {
                        side = l_PopoverSide_0.Bottom, 
                        align = l_PopoverAlign_0.End, 
                        hasArrow = true, 
                        onPressedOutside = v47, 
                        backgroundStyle = v40.Color.Surface.Surface_200
                    }, {
                        DisplayStreamNotifications = v44
                    })
                }));
            else
                return v48;
            end;
        elseif l_isAppNavEnabled_0() then
            local v49 = if v39 and v37 then v22.Dropdown.BellIconOpen else v33;
            if v39 then
                return (v2.createElement(l_Popover_0.Root, {
                    isOpen = v37
                }, {
                    Anchor = v2.createElement(l_Popover_0.Anchor, nil, {
                        BellIcon = v2.createElement(l_UtilityActionIcon_0, {
                            icon = v49, 
                            onActivated = v46, 
                            badgeValue = v45, 
                            buttonRef = v36.buttonRef
                        })
                    }), 
                    Content = v2.createElement(l_Popover_0.Content, {
                        side = l_PopoverSide_0.Bottom, 
                        align = l_PopoverAlign_0.End, 
                        hasArrow = true, 
                        onPressedOutside = v47, 
                        backgroundStyle = v40.Color.Surface.Surface_200
                    }, {
                        DisplayStreamNotifications = v44
                    })
                }));
            else
                return (v2.createElement(l_UtilityActionIcon_0, {
                    icon = v49, 
                    onActivated = v46, 
                    badgeValue = v45, 
                    buttonRef = v36.buttonRef
                }, {
                    DisplayStreamNotifications = v44
                }));
            end;
        else
            return (v2.createElement(l_IconButton_0, {
                size = UDim2.new(0, v43, 1, 0), 
                icon = v33, 
                iconSize = l_IconSize_0.Medium, 
                layoutOrder = l_layoutOrder_0 or 3, 
                onActivated = v46, 
                buttonRef = v36.buttonRef
            }, {
                notificationBadge = if l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_GetFFlagFilterNotificationsForPCGDKEnabled_0() and l_ThirdPartyUserService_0 and l_ThirdPartyUserService_0:IsChatRestrictionSupported() and l_ThirdPartyUserService_0.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted then nil else if v41 > 0 then v2.createElement(l_Badge_0, {
                    position = UDim2.new(0.5, 0, 0.5, 0), 
                    anchorPoint = Vector2.new(0, 1), 
                    value = v41, 
                    badgeVariant = l_BadgeVariant_0.Alert
                }) else nil
            }, {
                v44
            }));
        end;
    end;
end;
if l_GetFFlagNotificationsComplianceShouldRestrictStream_0() then
    v50 = l_RoactAppPolicy_0.connect(function(v51, _) --[[ Line: 309 ]]
        return {
            shouldRestrictStream = v51.getNotificationsCanReceiveStream() or false
        };
    end)(v50);
end;
return v50;