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
local l_InputLabel_0 = v12.InputLabel;
local l_InputLabelSize_0 = v12.Enums.InputLabelSize;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v20 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics.ImpressionEvents);
local l_Pill_0 = l_UIBlox_0.App.Control.Pill;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_withTooltip_0 = l_UIBlox_0.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = l_UIBlox_0.App.Dialog.Enum.TooltipOrientation;
local v25 = require(l_script_FirstAncestor_0.Friends.filterStates);
local v26 = require(l_script_FirstAncestor_0.Components.PillWithAlert);
local v27 = require(l_script_FirstAncestor_0.Components.ChipFilterGroup);
local l_IconSize_0 = l_UIBlox_0.App.ImageSet.Enum.IconSize;
local l_getIconSize_0 = l_UIBlox_0.App.ImageSet.getIconSize;
local v30 = require(l_script_FirstAncestor_0.Flags.FFlagFixScalingOnFriendsLanding);
local l_FFlagConnectionManagementChips_0 = require(l_Parent_0.SharedFlags).FFlagConnectionManagementChips;
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local l_FFlagFriendsPageUserListEnabled_0 = require(l_Parent_0.SharedFlags).FFlagFriendsPageUserListEnabled;
local v34 = l_Roact_0.PureComponent:extend("FilterByButton");
v34.defaultProps = {
    analytics = nil, 
    layoutOrder = 1, 
    onActivated = function() --[[ Line: 53 ]] --[[ Name: onActivated ]]

    end, 
    filter = v25.All, 
    friendCount = 0, 
    inactiveFriendCount = 0, 
    isDisabled = false, 
    showFriendPruningAlert = false, 
    initialShowFriendPruningTooltip = false, 
    onTooltipDismissal = function() --[[ Line: 60 ]] --[[ Name: onTooltipDismissal ]]

    end
};
v34.init = function(v35) --[[ Line: 63 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagConnectionManagementChips_0 (copy), v25 (copy), l_AppPage_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy)
    v35.state = {
        showFriendPruningTooltip = v35.props.initialShowFriendPruningTooltip, 
        hasDismissedFriendPruningTooltip = false
    };
    if l_FFlagConnectionManagementChips_0 then
        v35.state.canAccessTrustedContacts = v35.props.canAccessTrustedContacts;
    end;
    v35.convertFilterToTranslation = function(v36, v37) --[[ Line: 73 ]]
        -- upvalues: v25 (ref), l_FFlagConnectionManagementChips_0 (ref)
        if v36 == v25.All then
            return v37.all;
        elseif v36 == v25.Online then
            return v37.online;
        elseif v36 == v25.InExperience then
            return v37.inExperience;
        elseif v36 == v25.Offline then
            return v37.offline;
        elseif v36 == v25.Inactive then
            return v37.inactive;
        elseif l_FFlagConnectionManagementChips_0 and v36 == v25.Trusted then
            return v37.trusted;
        else
            return nil;
        end;
    end;
    v35.buildFilterText = function(v38, v39, v40) --[[ Line: 91 ]]
        -- upvalues: v35 (copy)
        local v41 = v35.convertFilterToTranslation(v38, v39);
        if v40 == 0 then
            return v41;
        else
            return v41 .. " (" .. v40 .. ")";
        end;
    end;
    v35.isSelected = function(v42) --[[ Line: 100 ]]
        -- upvalues: v25 (ref)
        if v42 == v25.All then
            return false;
        else
            return true;
        end;
    end;
    v35.dismissFriendPruningTooltip = function() --[[ Line: 108 ]]
        -- upvalues: v35 (copy)
        v35:setState({
            showFriendPruningTooltip = false, 
            hasDismissedFriendPruningTooltip = true
        });
        v35.props.onTooltipDismissal();
    end;
    if l_FFlagConnectionManagementChips_0 then
        v35.onLearnMoreClicked = function() --[[ Line: 117 ]]
            -- upvalues: v35 (copy), l_AppPage_0 (ref)
            v35.props.navigateDown({
                name = l_AppPage_0.GenericWebPage, 
                detail = "https://en.help.roblox.com/hc/articles/46158344285204", 
                extraProps = {
                    title = ""
                }
            });
        end;
    end;
    if l_FFlagConnectionManagementChips_0 then
        v35.getTrustedFilterText = function(v43) --[[ Line: 127 ]]
            -- upvalues: v35 (copy), l_FFlagConnectionsToFriendsRename_0 (ref)
            local l_webViewSupported_0 = v35.props.webViewSupported;
            local v45 = if l_FFlagConnectionsToFriendsRename_0 then if v35.props.canAccessTrustedContacts then v43.doMoreWithTrustedFriends else v43.trustedFriendsUnavailable else if v35.props.canAccessTrustedContacts then v43.doMoreWithTrustedConnections else v43.trustedConnectionsUnavailable;
            if l_webViewSupported_0 and v35.props.canAccessTrustedContacts then
                return v45 .. " <u>" .. v43.learnMore .. "</u>";
            else
                return v45;
            end;
        end;
    end;
end;
v34.didMount = function(v46) --[[ Line: 145 ]] --[[ Name: didMount ]]
    -- upvalues: v20 (copy)
    if v46.props.initialShowFriendPruningTooltip and v46.props.analytics then
        v46.props.analytics:impressionEvent(v20.FriendPruningTooltipSeen, {
            friendCount = tostring(v46.props.friendCount), 
            inactiveFriendCount = tostring(v46.props.inactiveFriendCount)
        });
    end;
end;
v34.didUpdate = function(v47) --[[ Line: 156 ]] --[[ Name: didUpdate ]]
    v47:setState({
        showFriendPruningTooltip = v47.props.initialShowFriendPruningTooltip and not v47.state.hasDismissedFriendPruningTooltip
    });
end;
v34.render = function(v48) --[[ Line: 164 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v30 (copy), l_Images_0 (copy), l_FFlagConnectionManagementChips_0 (copy), l_withLocalization_0 (copy), l_TooltipOrientation_0 (copy), l_CoreGui_0 (copy), l_Roact_0 (copy), l_withTooltip_0 (copy), l_getIconSize_0 (copy), l_IconSize_0 (copy), l_TextService_0 (copy), v26 (copy), l_Pill_0 (copy), l_View_0 (copy), l_FFlagFriendsPageUserListEnabled_0 (copy), v27 (copy), v25 (copy), l_InputLabel_0 (copy), l_InputLabelSize_0 (copy), l_Text_0 (copy), l_Chip_0 (copy), l_Enums_0 (copy)
    return l_withStyle_0(function(_) --[[ Line: 165 ]]
        -- upvalues: v30 (ref), l_Images_0 (ref), l_FFlagConnectionManagementChips_0 (ref), l_withLocalization_0 (ref), v48 (copy), l_TooltipOrientation_0 (ref), l_CoreGui_0 (ref), l_Roact_0 (ref), l_withStyle_0 (ref), l_withTooltip_0 (ref), l_getIconSize_0 (ref), l_IconSize_0 (ref), l_TextService_0 (ref), v26 (ref), l_Pill_0 (ref), l_View_0 (ref), l_FFlagFriendsPageUserListEnabled_0 (ref), v27 (ref), v25 (ref), l_InputLabel_0 (ref), l_InputLabelSize_0 (ref), l_Text_0 (ref), l_Chip_0 (ref), l_Enums_0 (ref)
        local v50 = v30 and "icons/actions/filter_small" or l_Images_0["icons/actions/filter"];
        local v51 = {
            all = "Feature.Friends.Label.All", 
            inactive = "Feature.Friends.Label.FewestInteractions", 
            inExperience = "Feature.Friends.Label.InGame", 
            tooltipHeader = "Feature.Friends.Label.ManageFriendsList", 
            tooltipBody = "Feature.Friends.Label.ManageFriendsListCaption", 
            online = "Common.Presence.Label.Online", 
            offline = "Common.Presence.Label.Offline"
        };
        if l_FFlagConnectionManagementChips_0 then
            v51.trusted = "Feature.Friends.TrustedConnection.Label.Trusted";
            v51.learnMore = "Feature.Chat.Action.LearnMore";
            v51.doMoreWithTrustedConnections = "Feature.Friends.Description.DoMoreWithTrustedConnections";
            v51.doMoreWithTrustedFriends = "Feature.Friends.Description.DoMoreWithTrustedFriends";
            v51.trustedConnectionsUnavailable = "Feature.Friends.Description.TrustedConnectionsUnavailable";
            v51.trustedFriendsUnavailable = "Feature.Friends.Description.TrustedFriendsUnavailable";
        end;
        return l_withLocalization_0(v51)(function(v52) --[[ Line: 186 ]]
            -- upvalues: v48 (ref), l_FFlagConnectionManagementChips_0 (ref), l_TooltipOrientation_0 (ref), l_CoreGui_0 (ref), l_Roact_0 (ref), l_withStyle_0 (ref), l_withTooltip_0 (ref), l_getIconSize_0 (ref), l_IconSize_0 (ref), l_TextService_0 (ref), v26 (ref), v50 (copy), l_Pill_0 (ref), l_View_0 (ref), l_FFlagFriendsPageUserListEnabled_0 (ref), v27 (ref), v25 (ref), l_InputLabel_0 (ref), l_InputLabelSize_0 (ref), l_Text_0 (ref), v30 (ref), l_Chip_0 (ref), l_Enums_0 (ref)
            local l_filter_0 = v48.props.filter;
            local l_friendCount_0 = v48.props.friendCount;
            local l_isDisabled_0 = v48.props.isDisabled;
            local l_onActivated_0 = v48.props.onActivated;
            local v57 = v48.buildFilterText(l_filter_0, v52, l_friendCount_0);
            local v58 = nil;
            local v59 = nil;
            if l_FFlagConnectionManagementChips_0 then
                v58 = v48.props.maxWidth;
                v59 = v48.props.webViewSupported;
            end;
            local v60 = {
                headerText = v52.tooltipHeader, 
                bodyText = v52.tooltipBody
            };
            local v61 = {
                preferredOrientation = l_TooltipOrientation_0.Bottom, 
                guiTarget = l_CoreGui_0, 
                active = true, 
                DisplayOrder = 2
            };
            return l_Roact_0.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 36), 
                LayoutOrder = v48.props.layoutOrder, 
                BackgroundTransparency = 1
            }, {
                Button = if v48.state.showFriendPruningTooltip then l_withStyle_0(function(v62) --[[ Line: 216 ]]
                    -- upvalues: l_withTooltip_0 (ref), v60 (copy), v61 (copy), l_getIconSize_0 (ref), l_IconSize_0 (ref), l_TextService_0 (ref), v57 (copy), l_Roact_0 (ref), v48 (ref), l_CoreGui_0 (ref), v26 (ref), v50 (ref), l_isDisabled_0 (copy), l_filter_0 (copy), l_onActivated_0 (copy), l_Pill_0 (ref)
                    return l_withTooltip_0(v60, v61, function(v63) --[[ Line: 217 ]]
                        -- upvalues: v62 (copy), l_getIconSize_0 (ref), l_IconSize_0 (ref), l_TextService_0 (ref), v57 (ref), l_Roact_0 (ref), v48 (ref), l_CoreGui_0 (ref), v26 (ref), v50 (ref), l_isDisabled_0 (ref), l_filter_0 (ref), l_onActivated_0 (ref), l_Pill_0 (ref)
                        local l_Font_0 = v62.Font;
                        local v65 = l_getIconSize_0(l_IconSize_0.Small);
                        local l_BaseSize_0 = l_Font_0.BaseSize;
                        local v67 = l_Font_0.CaptionHeader.RelativeSize * l_BaseSize_0;
                        local v68 = l_TextService_0:GetTextSize(v57, v67, l_Font_0.CaptionHeader.Font, Vector2.new(10000, 10000)).X + 24;
                        return l_Roact_0.createElement("Frame", {
                            Size = UDim2.fromOffset(v68 + 4 + v65, 28), 
                            LayoutOrder = v48.props.layoutOrder, 
                            BackgroundTransparency = 1, 
                            [l_Roact_0.Change.AbsoluteSize] = v63, 
                            [l_Roact_0.Change.AbsolutePosition] = v63
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
                                        [l_Roact_0.Event.Activated] = v48.dismissFriendPruningTooltip, 
                                        [l_Roact_0.Event.TouchSwipe] = v48.dismissFriendPruningTooltip, 
                                        [l_Roact_0.Event.MouseWheelForward] = v48.dismissFriendPruningTooltip, 
                                        [l_Roact_0.Event.MouseWheelBackward] = v48.dismissFriendPruningTooltip
                                    })
                                })
                            }), 
                            FilterByButtonPillPossiblyWithAlert = if v48.props.showFriendPruningAlert then l_Roact_0.createElement(v26, {
                                icon = v50, 
                                text = v57, 
                                isDisabled = l_isDisabled_0, 
                                isSelected = v48.isSelected(l_filter_0), 
                                onActivated = l_onActivated_0
                            }) else l_Roact_0.createElement(l_Pill_0, {
                                icon = v50, 
                                text = v57, 
                                isDisabled = l_isDisabled_0, 
                                isSelected = v48.isSelected(l_filter_0), 
                                onActivated = l_onActivated_0
                            })
                        });
                    end);
                end) else if v48.props.showFriendPruningAlert then l_Roact_0.createElement(v26, {
                    icon = v50, 
                    text = v57, 
                    isDisabled = l_isDisabled_0, 
                    isSelected = v48.isSelected(l_filter_0), 
                    onActivated = l_onActivated_0
                }) else if l_FFlagConnectionManagementChips_0 then l_Roact_0.createElement(l_View_0, {
                    tag = l_FFlagFriendsPageUserListEnabled_0 and "auto-y size-full-0 flex-between gap-large padding-top-large" or "auto-y size-full-0 flex-between gap-large padding-top-large padding-bottom-large"
                }, {
                    UISizeConstraint = if v58 then l_Roact_0.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(v58, 1e999)
                    }) else nil, 
                    Layout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    FilterGroup = l_Roact_0.createElement(v27, {
                        onActivated = l_onActivated_0, 
                        isDisabled = l_isDisabled_0, 
                        LayoutOrder = 1
                    }), 
                    EducationText = if v25.Trusted == l_filter_0 then l_Roact_0.createElement(l_View_0, {
                        tag = "auto-y size-full-0", 
                        LayoutOrder = 2
                    }, {
                        Layout = l_Roact_0.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            VerticalAlignment = Enum.VerticalAlignment.Top
                        }), 
                        Content = if v59 then l_Roact_0.createElement(l_InputLabel_0, {
                            LayoutOrder = 1, 
                            tag = "auto-y size-full-0 text-caption-small text-align-x-left text-align-y-top text-wrap", 
                            RichText = true, 
                            Text = v48.getTrustedFilterText(v52), 
                            size = l_InputLabelSize_0.Small, 
                            onActivated = v48.onLearnMoreClicked
                        }) else l_Roact_0.createElement(l_Text_0, {
                            LayoutOrder = 1, 
                            Text = v48.getTrustedFilterText(v52), 
                            tag = "auto-y size-full-0 text-caption-small text-align-x-left text-align-y-top text-wrap"
                        })
                    }) else nil
                }) else if v30 then l_Roact_0.createElement(l_Chip_0, {
                    leading = {
                        name = v50, 
                        iconName = l_Enums_0.IconName.ThreeBarsHorizontalNarrowing, 
                        position = l_Enums_0.IconPosition.Left
                    }, 
                    text = v57, 
                    isChecked = v48.isSelected(l_filter_0), 
                    onActivated = l_onActivated_0, 
                    isDisabled = l_isDisabled_0
                }) else l_Roact_0.createElement(l_Pill_0, {
                    icon = v50, 
                    text = v57, 
                    isDisabled = l_isDisabled_0, 
                    isSelected = v48.isSelected(l_filter_0), 
                    onActivated = l_onActivated_0
                })
            });
        end);
    end);
end;
if l_FFlagConnectionManagementChips_0 then
    v34 = v3.connect(function(_, _) --[[ Line: 357 ]]
        return {};
    end, function(v71) --[[ Line: 359 ]]
        -- upvalues: l_NavigateDown_0 (copy)
        return {
            navigateDown = function(v72) --[[ Line: 361 ]] --[[ Name: navigateDown ]]
                -- upvalues: v71 (copy), l_NavigateDown_0 (ref)
                return v71(l_NavigateDown_0(v72));
            end
        };
    end)(v34);
    return l_RoactAppPolicy_0.connect(function(v73) --[[ Line: 367 ]]
        return {
            webViewSupported = v73.getWebViewSupport()
        };
    end)(v34);
else
    return v34;
end;