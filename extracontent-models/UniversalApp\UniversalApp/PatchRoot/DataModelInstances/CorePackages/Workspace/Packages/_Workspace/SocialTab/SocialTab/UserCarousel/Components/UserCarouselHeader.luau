local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_t_0 = v1.t;
local l_Mock_0 = v1.Mock;
local l_Badge_0 = l_UIBlox_0.App.Indicator.Badge;
local l_BadgeStates_0 = l_UIBlox_0.App.Indicator.Enum.BadgeStates;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_IconButton_0 = l_UIBlox_0.App.Button.IconButton;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local v11 = require(l_script_FirstAncestor_0.Enums.LocalizedKeys);
local l_withLocalization_0 = v1.withLocalization;
local v13 = l_Roact_0.PureComponent:extend("UserCarouselHeader");
v13.defaultProps = {
    friendCount = 0, 
    hasFriendRequests = false, 
    layoutOrder = 0, 
    goToFriendRequestsPage = function() --[[ Line: 30 ]] --[[ Name: goToFriendRequestsPage ]]

    end, 
    goToFriendsPage = function() --[[ Line: 31 ]] --[[ Name: goToFriendsPage ]]

    end
};
v13.validateProps = l_t_0.interface({
    friendCount = l_t_0.number, 
    hasFriendRequests = l_t_0.boolean, 
    layoutOrder = l_t_0.optional(l_t_0.number), 
    goToFriendRequestsPage = l_t_0.union(l_t_0.callback, l_Mock_0.MagicMock.is), 
    goToFriendsPage = l_t_0.union(l_t_0.callback, l_Mock_0.MagicMock.is)
});
v13.init = function(v14) --[[ Line: 42 ]] --[[ Name: init ]]
    v14.goToFriendRequestsPage = function(...) --[[ Line: 43 ]]
        -- upvalues: v14 (copy)
        return v14.props.goToFriendRequestsPage(...);
    end;
end;
v13.render = function(v15) --[[ Line: 48 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), l_withLocalization_0 (copy), l_withStyle_0 (copy), l_Roact_0 (copy), l_Badge_0 (copy), l_BadgeStates_0 (copy), l_IconButton_0 (copy), l_Images_0 (copy)
    local v16 = v15.props.friendCount ~= 0 and {
        v11.FriendsHeaderWithCount.rawValue(); 
        friendCount = v15.props.friendCount
    } or v11.FriendsHeader.rawValue();
    return l_withLocalization_0({
        headerText = v16
    })(function(v17) --[[ Line: 58 ]]
        -- upvalues: l_withStyle_0 (ref), l_Roact_0 (ref), l_Badge_0 (ref), l_BadgeStates_0 (ref), v15 (copy), l_IconButton_0 (ref), l_Images_0 (ref)
        return l_withStyle_0(function(v18) --[[ Line: 59 ]]
            -- upvalues: l_Roact_0 (ref), l_Badge_0 (ref), l_BadgeStates_0 (ref), v15 (ref), v17 (copy), l_IconButton_0 (ref), l_Images_0 (ref)
            local v19 = l_Roact_0.createElement(l_Badge_0, {
                position = UDim2.new(0.6, 2, 0, 6), 
                anchorPoint = Vector2.new(0, 0.5), 
                value = l_BadgeStates_0.isEmpty
            }) or l_Roact_0.createElement(l_Badge_0, {
                position = UDim2.new(0.6, 0, 0, 0), 
                anchorPoint = Vector2.new(0, 0.5), 
                value = ""
            });
            return l_Roact_0.createElement("Frame", {
                LayoutOrder = v15.props.layoutOrder, 
                Size = UDim2.new(1, 0, 0, 50), 
                BackgroundTransparency = 1
            }, {
                Title = l_Roact_0.createElement("TextButton", {
                    AutomaticSize = Enum.AutomaticSize.X, 
                    BackgroundTransparency = 1, 
                    Font = v18.Font.Header1.Font, 
                    Size = UDim2.new(0, 0, 0, 50), 
                    Text = v17.headerText, 
                    TextColor3 = v18.Theme.TextEmphasis.Color, 
                    TextSize = v18.Font.Header1.RelativeSize * v18.Font.BaseSize, 
                    TextTransparency = v18.Theme.TextEmphasis.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    [l_Roact_0.Event.Activated] = v15.props.goToFriendsPage
                }), 
                FriendRequests = l_Roact_0.createElement(l_IconButton_0, {
                    size = UDim2.fromOffset(28, 28), 
                    icon = l_Images_0["icons/actions/friends/friendAdd"], 
                    position = UDim2.new(1, 0, 0.5, 0), 
                    anchorPoint = Vector2.new(1, 0.5), 
                    onActivated = v15.goToFriendRequestsPage
                }, {
                    FriendRequestsBadge = v15.props.hasFriendRequests and v19 or nil
                })
            });
        end);
    end);
end;
return v13;