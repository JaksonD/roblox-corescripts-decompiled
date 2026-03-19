local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_CoreGui_0 = v2.CoreGui;
local l_Roact_0 = v2.Roact;
local l_TextService_0 = v2.TextService;
local l_UIBlox_0 = v2.UIBlox;
local l_withLocalization_0 = v2.withLocalization;
local v8 = require(l_Parent_0.Foundation);
local l_Chip_0 = v8.Chip;
local l_Enums_0 = v8.Enums;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v12 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics.ImpressionEvents);
local l_Pill_0 = l_UIBlox_0.App.Control.Pill;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_withTooltip_0 = l_UIBlox_0.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = l_UIBlox_0.App.Dialog.Enum.TooltipOrientation;
local v17 = require(l_script_FirstAncestor_0.Friends.filterStates);
local v18 = require(l_script_FirstAncestor_0.Components.PillWithAlert);
local l_IconSize_0 = l_UIBlox_0.App.ImageSet.Enum.IconSize;
local l_getIconSize_0 = l_UIBlox_0.App.ImageSet.getIconSize;
local v21 = require(l_script_FirstAncestor_0.Flags.FFlagFixScalingOnFriendsLanding);
local v22 = l_Roact_0.PureComponent:extend("FilterByButton");
v22.defaultProps = {
    analytics = nil, 
    layoutOrder = 1, 
    onActivated = function() --[[ Line: 39 ]] --[[ Name: onActivated ]]

    end, 
    filter = v17.All, 
    friendCount = 0, 
    inactiveFriendCount = 0, 
    isDisabled = false, 
    showFriendPruningAlert = false, 
    initialShowFriendPruningTooltip = false, 
    onTooltipDismissal = function() --[[ Line: 46 ]] --[[ Name: onTooltipDismissal ]]

    end
};
v22.init = function(v23) --[[ Line: 49 ]] --[[ Name: init ]]
    -- upvalues: v17 (copy)
    v23.state = {
        showFriendPruningTooltip = v23.props.initialShowFriendPruningTooltip, 
        hasDismissedFriendPruningTooltip = false
    };
    v23.convertFilterToTranslation = function(v24, v25) --[[ Line: 55 ]]
        -- upvalues: v17 (ref)
        if v24 == v17.All then
            return v25.all;
        elseif v24 == v17.Online then
            return v25.online;
        elseif v24 == v17.InExperience then
            return v25.inExperience;
        elseif v24 == v17.Offline then
            return v25.offline;
        elseif v24 == v17.Inactive then
            return v25.inactive;
        else
            return nil;
        end;
    end;
    v23.buildFilterText = function(v26, v27, v28) --[[ Line: 71 ]]
        -- upvalues: v23 (copy)
        local v29 = v23.convertFilterToTranslation(v26, v27);
        if v28 == 0 then
            return v29;
        else
            return v29 .. " (" .. v28 .. ")";
        end;
    end;
    v23.isSelected = function(v30) --[[ Line: 80 ]]
        -- upvalues: v17 (ref)
        if v30 == v17.All then
            return false;
        else
            return true;
        end;
    end;
    v23.dismissFriendPruningTooltip = function() --[[ Line: 88 ]]
        -- upvalues: v23 (copy)
        v23:setState({
            showFriendPruningTooltip = false, 
            hasDismissedFriendPruningTooltip = true
        });
        v23.props.onTooltipDismissal();
    end;
end;
v22.didMount = function(v31) --[[ Line: 97 ]] --[[ Name: didMount ]]
    -- upvalues: v12 (copy)
    if v31.props.initialShowFriendPruningTooltip and v31.props.analytics then
        v31.props.analytics:impressionEvent(v12.FriendPruningTooltipSeen, {
            friendCount = tostring(v31.props.friendCount), 
            inactiveFriendCount = tostring(v31.props.inactiveFriendCount)
        });
    end;
end;
v22.didUpdate = function(v32) --[[ Line: 108 ]] --[[ Name: didUpdate ]]
    v32:setState({
        showFriendPruningTooltip = v32.props.initialShowFriendPruningTooltip and not v32.state.hasDismissedFriendPruningTooltip
    });
end;
v22.render = function(v33) --[[ Line: 116 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v21 (copy), l_Images_0 (copy), l_withLocalization_0 (copy), l_TooltipOrientation_0 (copy), l_CoreGui_0 (copy), l_Roact_0 (copy), l_withTooltip_0 (copy), l_getIconSize_0 (copy), l_IconSize_0 (copy), l_TextService_0 (copy), v18 (copy), l_Pill_0 (copy), l_Chip_0 (copy), l_Enums_0 (copy)
    return l_withStyle_0(function(_) --[[ Line: 117 ]]
        -- upvalues: v21 (ref), l_Images_0 (ref), l_withLocalization_0 (ref), v33 (copy), l_TooltipOrientation_0 (ref), l_CoreGui_0 (ref), l_Roact_0 (ref), l_withStyle_0 (ref), l_withTooltip_0 (ref), l_getIconSize_0 (ref), l_IconSize_0 (ref), l_TextService_0 (ref), v18 (ref), l_Pill_0 (ref), l_Chip_0 (ref), l_Enums_0 (ref)
        local v35 = v21 and "icons/actions/filter_small" or l_Images_0["icons/actions/filter"];
        return l_withLocalization_0({
            all = "Feature.Friends.Label.All", 
            inactive = "Feature.Friends.Label.FewestInteractions", 
            inExperience = "Feature.Friends.Label.InGame", 
            tooltipHeader = "Feature.Friends.Label.ManageFriendsList", 
            tooltipBody = "Feature.Friends.Label.ManageFriendsListCaption", 
            online = "Common.Presence.Label.Online", 
            offline = "Common.Presence.Label.Offline"
        })(function(v36) --[[ Line: 129 ]]
            -- upvalues: v33 (ref), l_TooltipOrientation_0 (ref), l_CoreGui_0 (ref), l_Roact_0 (ref), l_withStyle_0 (ref), l_withTooltip_0 (ref), l_getIconSize_0 (ref), l_IconSize_0 (ref), l_TextService_0 (ref), v18 (ref), v35 (copy), l_Pill_0 (ref), v21 (ref), l_Chip_0 (ref), l_Enums_0 (ref)
            local l_filter_0 = v33.props.filter;
            local l_friendCount_0 = v33.props.friendCount;
            local l_isDisabled_0 = v33.props.isDisabled;
            local l_onActivated_0 = v33.props.onActivated;
            local v41 = v33.buildFilterText(l_filter_0, v36, l_friendCount_0);
            local v42 = {
                headerText = v36.tooltipHeader, 
                bodyText = v36.tooltipBody
            };
            local v43 = {
                preferredOrientation = l_TooltipOrientation_0.Bottom, 
                guiTarget = l_CoreGui_0, 
                active = true, 
                DisplayOrder = 2
            };
            return l_Roact_0.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 36), 
                LayoutOrder = v33.props.layoutOrder, 
                BackgroundTransparency = 1
            }, {
                Button = if v33.state.showFriendPruningTooltip then l_withStyle_0(function(v44) --[[ Line: 154 ]]
                    -- upvalues: l_withTooltip_0 (ref), v42 (copy), v43 (copy), l_getIconSize_0 (ref), l_IconSize_0 (ref), l_TextService_0 (ref), v41 (copy), l_Roact_0 (ref), v33 (ref), l_CoreGui_0 (ref), v18 (ref), v35 (ref), l_isDisabled_0 (copy), l_filter_0 (copy), l_onActivated_0 (copy), l_Pill_0 (ref)
                    return l_withTooltip_0(v42, v43, function(v45) --[[ Line: 155 ]]
                        -- upvalues: v44 (copy), l_getIconSize_0 (ref), l_IconSize_0 (ref), l_TextService_0 (ref), v41 (ref), l_Roact_0 (ref), v33 (ref), l_CoreGui_0 (ref), v18 (ref), v35 (ref), l_isDisabled_0 (ref), l_filter_0 (ref), l_onActivated_0 (ref), l_Pill_0 (ref)
                        local l_Font_0 = v44.Font;
                        local v47 = l_getIconSize_0(l_IconSize_0.Small);
                        local l_BaseSize_0 = l_Font_0.BaseSize;
                        local v49 = l_Font_0.CaptionHeader.RelativeSize * l_BaseSize_0;
                        local v50 = l_TextService_0:GetTextSize(v41, v49, l_Font_0.CaptionHeader.Font, Vector2.new(10000, 10000)).X + 24;
                        return l_Roact_0.createElement("Frame", {
                            Size = UDim2.fromOffset(v50 + 4 + v47, 28), 
                            LayoutOrder = v33.props.layoutOrder, 
                            BackgroundTransparency = 1, 
                            [l_Roact_0.Change.AbsoluteSize] = v45, 
                            [l_Roact_0.Change.AbsolutePosition] = v45
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
                                        [l_Roact_0.Event.Activated] = v33.dismissFriendPruningTooltip, 
                                        [l_Roact_0.Event.TouchSwipe] = v33.dismissFriendPruningTooltip, 
                                        [l_Roact_0.Event.MouseWheelForward] = v33.dismissFriendPruningTooltip, 
                                        [l_Roact_0.Event.MouseWheelBackward] = v33.dismissFriendPruningTooltip
                                    })
                                })
                            }), 
                            FilterByButtonPillPossiblyWithAlert = if v33.props.showFriendPruningAlert then l_Roact_0.createElement(v18, {
                                icon = v35, 
                                text = v41, 
                                isDisabled = l_isDisabled_0, 
                                isSelected = v33.isSelected(l_filter_0), 
                                onActivated = l_onActivated_0
                            }) else l_Roact_0.createElement(l_Pill_0, {
                                icon = v35, 
                                text = v41, 
                                isDisabled = l_isDisabled_0, 
                                isSelected = v33.isSelected(l_filter_0), 
                                onActivated = l_onActivated_0
                            })
                        });
                    end);
                end) else if v33.props.showFriendPruningAlert then l_Roact_0.createElement(v18, {
                    icon = v35, 
                    text = v41, 
                    isDisabled = l_isDisabled_0, 
                    isSelected = v33.isSelected(l_filter_0), 
                    onActivated = l_onActivated_0
                }) else if v21 then l_Roact_0.createElement(l_Chip_0, {
                    leading = {
                        name = v35, 
                        iconName = l_Enums_0.IconName.ThreeBarsHorizontalNarrowing, 
                        position = l_Enums_0.IconPosition.Left
                    }, 
                    text = v41, 
                    isChecked = v33.isSelected(l_filter_0), 
                    onActivated = l_onActivated_0, 
                    isDisabled = l_isDisabled_0
                }) else l_Roact_0.createElement(l_Pill_0, {
                    icon = v35, 
                    text = v41, 
                    isDisabled = l_isDisabled_0, 
                    isSelected = v33.isSelected(l_filter_0), 
                    onActivated = l_onActivated_0
                })
            });
        end);
    end);
end;
return v22;