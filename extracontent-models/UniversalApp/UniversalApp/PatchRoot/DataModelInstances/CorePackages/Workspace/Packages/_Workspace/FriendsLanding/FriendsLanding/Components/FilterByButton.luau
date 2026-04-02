local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local v3 = require(l_Parent_0.RoactRodux);
local l_RoactAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).RoactAppPolicy;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_CoreGui_0 = v2.CoreGui;
local l_Roact_0 = v2.Roact;
local l_TextService_0 = v2.TextService;
local l_UIBlox_0 = v2.UIBlox;
local l_withLocalization_0 = v2.withLocalization;
local v12 = require(l_Parent_0.Foundation);
local l_Chip_0 = v12.Chip;
local l_Enums_0 = v12.Enums;
local l_View_0 = v12.View;
local l_Text_0 = v12.Text;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v18 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics.ImpressionEvents);
local l_Pill_0 = l_UIBlox_0.App.Control.Pill;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_withTooltip_0 = l_UIBlox_0.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = l_UIBlox_0.App.Dialog.Enum.TooltipOrientation;
local v23 = require(l_script_FirstAncestor_0.Friends.filterStates);
local v24 = require(l_script_FirstAncestor_0.Components.PillWithAlert);
local v25 = require(l_script_FirstAncestor_0.Components.ChipFilterGroup);
local l_IconSize_0 = l_UIBlox_0.App.ImageSet.Enum.IconSize;
local l_getIconSize_0 = l_UIBlox_0.App.ImageSet.getIconSize;
local v28 = require(l_script_FirstAncestor_0.Flags.FFlagFixScalingOnFriendsLanding);
local l_FFlagConnectionManagementChips_0 = require(l_Parent_0.SharedFlags).FFlagConnectionManagementChips;
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local l_FFlagFriendsPageUserListEnabled_0 = require(l_Parent_0.SharedFlags).FFlagFriendsPageUserListEnabled;
local v32 = l_Roact_0.PureComponent:extend("FilterByButton");
v32.defaultProps = {
    analytics = nil, 
    layoutOrder = 1, 
    onActivated = function() --[[ Line: 51 ]] --[[ Name: onActivated ]]

    end, 
    filter = v23.All, 
    friendCount = 0, 
    inactiveFriendCount = 0, 
    isDisabled = false, 
    showFriendPruningAlert = false, 
    initialShowFriendPruningTooltip = false, 
    onTooltipDismissal = function() --[[ Line: 58 ]] --[[ Name: onTooltipDismissal ]]

    end
};
v32.init = function(v33) --[[ Line: 61 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagConnectionManagementChips_0 (copy), v23 (copy), l_AppPage_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy)
    v33.state = {
        showFriendPruningTooltip = v33.props.initialShowFriendPruningTooltip, 
        hasDismissedFriendPruningTooltip = false
    };
    if l_FFlagConnectionManagementChips_0 then
        v33.state.canAccessTrustedContacts = v33.props.canAccessTrustedContacts;
    end;
    v33.convertFilterToTranslation = function(v34, v35) --[[ Line: 71 ]]
        -- upvalues: v23 (ref), l_FFlagConnectionManagementChips_0 (ref)
        if v34 == v23.All then
            return v35.all;
        elseif v34 == v23.Online then
            return v35.online;
        elseif v34 == v23.InExperience then
            return v35.inExperience;
        elseif v34 == v23.Offline then
            return v35.offline;
        elseif v34 == v23.Inactive then
            return v35.inactive;
        elseif l_FFlagConnectionManagementChips_0 and v34 == v23.Trusted then
            return v35.trusted;
        else
            return nil;
        end;
    end;
    v33.buildFilterText = function(v36, v37, v38) --[[ Line: 89 ]]
        -- upvalues: v33 (copy)
        local v39 = v33.convertFilterToTranslation(v36, v37);
        if v38 == 0 then
            return v39;
        else
            return v39 .. " (" .. v38 .. ")";
        end;
    end;
    v33.isSelected = function(v40) --[[ Line: 98 ]]
        -- upvalues: v23 (ref)
        if v40 == v23.All then
            return false;
        else
            return true;
        end;
    end;
    v33.dismissFriendPruningTooltip = function() --[[ Line: 106 ]]
        -- upvalues: v33 (copy)
        v33:setState({
            showFriendPruningTooltip = false, 
            hasDismissedFriendPruningTooltip = true
        });
        v33.props.onTooltipDismissal();
    end;
    if l_FFlagConnectionManagementChips_0 then
        v33.onLearnMoreClicked = function() --[[ Line: 115 ]]
            -- upvalues: v33 (copy), l_AppPage_0 (ref)
            v33.props.navigateDown({
                name = l_AppPage_0.GenericWebPage, 
                detail = "https://en.help.roblox.com/hc/articles/46158344285204", 
                extraProps = {
                    title = ""
                }
            });
        end;
    end;
    if l_FFlagConnectionManagementChips_0 then
        v33.getTrustedFilterText = function(v41) --[[ Line: 125 ]]
            -- upvalues: l_FFlagConnectionsToFriendsRename_0 (ref), v33 (copy)
            if l_FFlagConnectionsToFriendsRename_0 then
                if v33.props.canAccessTrustedContacts then
                    return v41.doMoreWithTrustedFriends;
                else
                    return v41.trustedFriendsUnavailable;
                end;
            elseif v33.props.canAccessTrustedContacts then
                return v41.doMoreWithTrustedConnections;
            else
                return v41.trustedConnectionsUnavailable;
            end;
        end;
    end;
end;
v32.didMount = function(v42) --[[ Line: 138 ]] --[[ Name: didMount ]]
    -- upvalues: v18 (copy)
    if v42.props.initialShowFriendPruningTooltip and v42.props.analytics then
        v42.props.analytics:impressionEvent(v18.FriendPruningTooltipSeen, {
            friendCount = tostring(v42.props.friendCount), 
            inactiveFriendCount = tostring(v42.props.inactiveFriendCount)
        });
    end;
end;
v32.didUpdate = function(v43) --[[ Line: 149 ]] --[[ Name: didUpdate ]]
    v43:setState({
        showFriendPruningTooltip = v43.props.initialShowFriendPruningTooltip and not v43.state.hasDismissedFriendPruningTooltip
    });
end;
v32.render = function(v44) --[[ Line: 157 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v28 (copy), l_Images_0 (copy), l_FFlagConnectionManagementChips_0 (copy), l_withLocalization_0 (copy), l_TooltipOrientation_0 (copy), l_CoreGui_0 (copy), l_Roact_0 (copy), l_withTooltip_0 (copy), l_getIconSize_0 (copy), l_IconSize_0 (copy), l_TextService_0 (copy), v24 (copy), l_Pill_0 (copy), l_View_0 (copy), l_FFlagFriendsPageUserListEnabled_0 (copy), v25 (copy), v23 (copy), l_Text_0 (copy), l_Chip_0 (copy), l_Enums_0 (copy)
    return l_withStyle_0(function(_) --[[ Line: 158 ]]
        -- upvalues: v28 (ref), l_Images_0 (ref), l_FFlagConnectionManagementChips_0 (ref), l_withLocalization_0 (ref), v44 (copy), l_TooltipOrientation_0 (ref), l_CoreGui_0 (ref), l_Roact_0 (ref), l_withStyle_0 (ref), l_withTooltip_0 (ref), l_getIconSize_0 (ref), l_IconSize_0 (ref), l_TextService_0 (ref), v24 (ref), l_Pill_0 (ref), l_View_0 (ref), l_FFlagFriendsPageUserListEnabled_0 (ref), v25 (ref), v23 (ref), l_Text_0 (ref), l_Chip_0 (ref), l_Enums_0 (ref)
        local v46 = v28 and "icons/actions/filter_small" or l_Images_0["icons/actions/filter"];
        local v47 = {
            all = "Feature.Friends.Label.All", 
            inactive = "Feature.Friends.Label.FewestInteractions", 
            inExperience = "Feature.Friends.Label.InGame", 
            tooltipHeader = "Feature.Friends.Label.ManageFriendsList", 
            tooltipBody = "Feature.Friends.Label.ManageFriendsListCaption", 
            online = "Common.Presence.Label.Online", 
            offline = "Common.Presence.Label.Offline"
        };
        if l_FFlagConnectionManagementChips_0 then
            v47.trusted = "Feature.Friends.TrustedConnection.Label.Trusted";
            v47.learnMore = "Feature.Chat.Action.LearnMore";
            v47.doMoreWithTrustedConnections = "Feature.Friends.Description.DoMoreWithTrustedConnections";
            v47.doMoreWithTrustedFriends = "Feature.Friends.Description.DoMoreWithTrustedFriends";
            v47.trustedConnectionsUnavailable = "Feature.Friends.Description.TrustedConnectionsUnavailable";
            v47.trustedFriendsUnavailable = "Feature.Friends.Description.TrustedFriendsUnavailable";
        end;
        return l_withLocalization_0(v47)(function(v48) --[[ Line: 179 ]]
            -- upvalues: v44 (ref), l_FFlagConnectionManagementChips_0 (ref), l_TooltipOrientation_0 (ref), l_CoreGui_0 (ref), l_Roact_0 (ref), l_withStyle_0 (ref), l_withTooltip_0 (ref), l_getIconSize_0 (ref), l_IconSize_0 (ref), l_TextService_0 (ref), v24 (ref), v46 (copy), l_Pill_0 (ref), l_View_0 (ref), l_FFlagFriendsPageUserListEnabled_0 (ref), v25 (ref), v23 (ref), l_Text_0 (ref), v28 (ref), l_Chip_0 (ref), l_Enums_0 (ref)
            local l_filter_0 = v44.props.filter;
            local l_friendCount_0 = v44.props.friendCount;
            local l_isDisabled_0 = v44.props.isDisabled;
            local l_onActivated_0 = v44.props.onActivated;
            local v53 = v44.buildFilterText(l_filter_0, v48, l_friendCount_0);
            local v54 = nil;
            local v55 = nil;
            if l_FFlagConnectionManagementChips_0 then
                v54 = v44.props.maxWidth;
                v55 = v44.props.webViewSupported;
            end;
            local v56 = {
                headerText = v48.tooltipHeader, 
                bodyText = v48.tooltipBody
            };
            local v57 = {
                preferredOrientation = l_TooltipOrientation_0.Bottom, 
                guiTarget = l_CoreGui_0, 
                active = true, 
                DisplayOrder = 2
            };
            return l_Roact_0.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 36), 
                LayoutOrder = v44.props.layoutOrder, 
                BackgroundTransparency = 1
            }, {
                Button = if v44.state.showFriendPruningTooltip then l_withStyle_0(function(v58) --[[ Line: 209 ]]
                    -- upvalues: l_withTooltip_0 (ref), v56 (copy), v57 (copy), l_getIconSize_0 (ref), l_IconSize_0 (ref), l_TextService_0 (ref), v53 (copy), l_Roact_0 (ref), v44 (ref), l_CoreGui_0 (ref), v24 (ref), v46 (ref), l_isDisabled_0 (copy), l_filter_0 (copy), l_onActivated_0 (copy), l_Pill_0 (ref)
                    return l_withTooltip_0(v56, v57, function(v59) --[[ Line: 210 ]]
                        -- upvalues: v58 (copy), l_getIconSize_0 (ref), l_IconSize_0 (ref), l_TextService_0 (ref), v53 (ref), l_Roact_0 (ref), v44 (ref), l_CoreGui_0 (ref), v24 (ref), v46 (ref), l_isDisabled_0 (ref), l_filter_0 (ref), l_onActivated_0 (ref), l_Pill_0 (ref)
                        local l_Font_0 = v58.Font;
                        local v61 = l_getIconSize_0(l_IconSize_0.Small);
                        local l_BaseSize_0 = l_Font_0.BaseSize;
                        local v63 = l_Font_0.CaptionHeader.RelativeSize * l_BaseSize_0;
                        local v64 = l_TextService_0:GetTextSize(v53, v63, l_Font_0.CaptionHeader.Font, Vector2.new(10000, 10000)).X + 24;
                        return l_Roact_0.createElement("Frame", {
                            Size = UDim2.fromOffset(v64 + 4 + v61, 28), 
                            LayoutOrder = v44.props.layoutOrder, 
                            BackgroundTransparency = 1, 
                            [l_Roact_0.Change.AbsoluteSize] = v59, 
                            [l_Roact_0.Change.AbsolutePosition] = v59
                        }, {
                            PortalToCoreGui = l_Roact_0.createElement(l_Roact_0.Portal, {
                                target = l_CoreGui_0
                            }, {
                                ScreenGui = l_Roact_0.createElement("ScreenGui", {
                                    ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                                    DisplayOrder = 1
                                }, {
                                    DismissFriendPruningTooltipButton = l_Roact_0.createElement("TextButton", {
                                        ZIndex = 0, 
                                        BackgroundTransparency = 1, 
                                        Size = UDim2.fromScale(1, 1), 
                                        Text = "", 
                                        [l_Roact_0.Event.Activated] = v44.dismissFriendPruningTooltip, 
                                        [l_Roact_0.Event.TouchSwipe] = v44.dismissFriendPruningTooltip, 
                                        [l_Roact_0.Event.MouseWheelForward] = v44.dismissFriendPruningTooltip, 
                                        [l_Roact_0.Event.MouseWheelBackward] = v44.dismissFriendPruningTooltip
                                    })
                                })
                            }), 
                            FilterByButtonPillPossiblyWithAlert = if v44.props.showFriendPruningAlert then l_Roact_0.createElement(v24, {
                                icon = v46, 
                                text = v53, 
                                isDisabled = l_isDisabled_0, 
                                isSelected = v44.isSelected(l_filter_0), 
                                onActivated = l_onActivated_0
                            }) else l_Roact_0.createElement(l_Pill_0, {
                                icon = v46, 
                                text = v53, 
                                isDisabled = l_isDisabled_0, 
                                isSelected = v44.isSelected(l_filter_0), 
                                onActivated = l_onActivated_0
                            })
                        });
                    end);
                end) else if v44.props.showFriendPruningAlert then l_Roact_0.createElement(v24, {
                    icon = v46, 
                    text = v53, 
                    isDisabled = l_isDisabled_0, 
                    isSelected = v44.isSelected(l_filter_0), 
                    onActivated = l_onActivated_0
                }) else if l_FFlagConnectionManagementChips_0 then l_Roact_0.createElement(l_View_0, {
                    tag = l_FFlagFriendsPageUserListEnabled_0 and "auto-y size-full-0 flex-between gap-large padding-top-large" or "auto-y size-full-0 flex-between gap-large padding-top-large padding-bottom-large"
                }, {
                    UISizeConstraint = if v54 then l_Roact_0.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(v54, 1e999)
                    }) else nil, 
                    Layout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    FilterGroup = l_Roact_0.createElement(v25, {
                        onActivated = l_onActivated_0, 
                        isDisabled = l_isDisabled_0, 
                        LayoutOrder = 1
                    }), 
                    EducationText = if v23.Trusted == l_filter_0 then l_Roact_0.createElement(l_View_0, {
                        tag = "auto-y size-full-0", 
                        LayoutOrder = 2
                    }, {
                        Layout = l_Roact_0.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            VerticalAlignment = Enum.VerticalAlignment.Top
                        }), 
                        Content = l_Roact_0.createElement(l_Text_0, {
                            LayoutOrder = 1, 
                            tag = "auto-y size-full-0 text-caption-medium text-align-x-left text-align-y-top text-wrap", 
                            Text = v44.getTrustedFilterText(v48)
                        }), 
                        LearnMore = if v55 and v44.props.canAccessTrustedContacts then l_Roact_0.createElement(l_View_0, {
                            LayoutOrder = 2, 
                            tag = "auto-y size-full-0 padding-top-xsmall"
                        }, {
                            Text = l_Roact_0.createElement(l_Text_0, {
                                tag = "auto-xy text-caption-medium text-align-x-left text-align-y-top", 
                                RichText = true, 
                                Text = ("<u>%*</u>"):format(v48.learnMore), 
                                onActivated = v44.onLearnMoreClicked
                            })
                        }) else nil
                    }) else nil
                }) else if v28 then l_Roact_0.createElement(l_Chip_0, {
                    leading = {
                        name = v46, 
                        iconName = l_Enums_0.IconName.ThreeBarsHorizontalNarrowing, 
                        position = l_Enums_0.IconPosition.Left
                    }, 
                    text = v53, 
                    isChecked = v44.isSelected(l_filter_0), 
                    onActivated = l_onActivated_0, 
                    isDisabled = l_isDisabled_0
                }) else l_Roact_0.createElement(l_Pill_0, {
                    icon = v46, 
                    text = v53, 
                    isDisabled = l_isDisabled_0, 
                    isSelected = v44.isSelected(l_filter_0), 
                    onActivated = l_onActivated_0
                })
            });
        end);
    end);
end;
if l_FFlagConnectionManagementChips_0 then
    v32 = v3.connect(function(_, _) --[[ Line: 354 ]]
        return {};
    end, function(v67) --[[ Line: 356 ]]
        -- upvalues: l_NavigateDown_0 (copy)
        return {
            navigateDown = function(v68) --[[ Line: 358 ]] --[[ Name: navigateDown ]]
                -- upvalues: v67 (copy), l_NavigateDown_0 (ref)
                return v67(l_NavigateDown_0(v68));
            end
        };
    end)(v32);
    return l_RoactAppPolicy_0.connect(function(v69) --[[ Line: 364 ]]
        return {
            webViewSupported = v69.getWebViewSupport()
        };
    end)(v32);
else
    return v32;
end;