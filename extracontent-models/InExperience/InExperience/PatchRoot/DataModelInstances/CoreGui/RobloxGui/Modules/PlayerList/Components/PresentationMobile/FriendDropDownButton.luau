local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_useFocusGuiObject_0 = require(l_CorePackages_0.Packages.ReactFocusNavigation).useFocusGuiObject;
local v10 = require(script.Parent.DropDownButtonAnimator);
local l_Images_0 = v7.App.ImageSet.Images;
local v12 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_FFlagConnectionsToFriendsRename_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagConnectionsToFriendsRename;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v15 = {
    unfriend = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Action.Unfriend" or nil, 
    friendRequest = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Label.FriendRequest" or nil, 
    removeConnection = if l_FFlagConnectionsToFriendsRename_0 then nil else "CommonUI.Features.Label.RemoveConnection", 
    connectionRequest = if l_FFlagConnectionsToFriendsRename_0 then nil else "InGame.PlayerDropDown.Action.ConnectionRequest"
};
local v16 = v5.PureComponent:extend("FriendDropDownButton");
v16.validateProps = v6.strictInterface({
    layoutOrder = v6.integer, 
    playerRelationship = v6.strictInterface({
        isBlocked = v6.boolean, 
        friendStatus = v6.enum(Enum.FriendStatus), 
        isFollowing = v6.boolean, 
        isFollower = v6.boolean
    }), 
    selectedPlayer = v6.optional(v6.instanceIsA("Player")), 
    dropDownOpen = v6.boolean, 
    requestFriendship = v6.callback, 
    contentVisible = v6.boolean, 
    isUsingGamepad = v6.optional(v6.boolean), 
    focusGuiObject = v6.callback
});
local function v21(v17) --[[ Line: 55 ]] --[[ Name: getFriendTextAndIcon ]]
    -- upvalues: l_Images_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v15 (copy), v12 (copy)
    local v18 = l_Images_0["icons/actions/friends/friendAdd"];
    local v19 = l_Images_0["icons/actions/friends/friendRemove"];
    local v20 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    if v17 == Enum.FriendStatus.Friend then
        return v20:Format(if l_FFlagConnectionsToFriendsRename_0 then v15.unfriend else v15.removeConnection), v19;
    elseif v17 == Enum.FriendStatus.Unknown or v17 == Enum.FriendStatus.NotFriend then
        return v20:Format(if l_FFlagConnectionsToFriendsRename_0 then v15.friendRequest else v15.connectionRequest), v18;
    elseif v17 == Enum.FriendStatus.FriendRequestSent then
        return v12:FormatByKey("InGame.PlayerDropDown.CancelRequest"), v18;
    elseif v17 == Enum.FriendStatus.FriendRequestReceived then
        return v12:FormatByKey("InGame.PlayerDropDown.Accept"), v18;
    else
        return v20:Format(v15.connectionRequest), v18;
    end;
end;
v16.init = function(v22) --[[ Line: 81 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v22.state = {
        unfriendConfirm = false
    };
    v22.dropDownButtonAnimatorRef = v5.createRef();
    v22.onAnimationComplete = function() --[[ Line: 88 ]]
        -- upvalues: v22 (copy)
        if v22.props.isUsingGamepad then
            v22.props.focusGuiObject(v22.dropDownButtonAnimatorRef.current);
        end;
    end;
end;
v16.render = function(v23) --[[ Line: 95 ]] --[[ Name: render ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_RbxAnalyticsService_0 (copy), v21 (copy), v5 (copy), v10 (copy)
    local l_playerRelationship_0 = v23.props.playerRelationship;
    local l_selectedPlayer_0 = v23.props.selectedPlayer;
    local v26 = nil;
    v26 = (not (l_playerRelationship_0.friendStatus == Enum.FriendStatus.Friend) or v23.state.unfriendConfirm) and function() --[[ Line: 107 ]]
        -- upvalues: l_playerRelationship_0 (copy), l_LocalPlayer_0 (ref), l_selectedPlayer_0 (copy), v23 (copy), l_RbxAnalyticsService_0 (ref)
        if l_playerRelationship_0.friendStatus == Enum.FriendStatus.Friend then
            l_LocalPlayer_0:RevokeFriendship(l_selectedPlayer_0);
            return;
        elseif l_playerRelationship_0.friendStatus == Enum.FriendStatus.Unknown or l_playerRelationship_0.friendStatus == Enum.FriendStatus.NotFriend then
            v23.props.requestFriendship(l_selectedPlayer_0, false);
            return;
        elseif l_playerRelationship_0.friendStatus == Enum.FriendStatus.FriendRequestSent then
            l_RbxAnalyticsService_0:ReportCounter("PlayerDropDown-RevokeFriendship");
            l_RbxAnalyticsService_0:TrackEvent("Game", "RevokeFriendship", "PlayerDropDown");
            l_LocalPlayer_0:RevokeFriendship(l_selectedPlayer_0);
            return;
        else
            if l_playerRelationship_0.friendStatus == Enum.FriendStatus.FriendRequestReceived then
                l_RbxAnalyticsService_0:ReportCounter("PlayerDropDown-RequestFriendship");
                l_RbxAnalyticsService_0:TrackEvent("Game", "RequestFriendship", "PlayerDropDown");
                v23.props.requestFriendship(l_selectedPlayer_0, true);
            end;
            return;
        end;
    end or function() --[[ Line: 101 ]]
        -- upvalues: v23 (copy)
        v23:setState({
            unfriendConfirm = true
        });
    end;
    local v27 = nil;
    if l_playerRelationship_0.friendStatus == Enum.FriendStatus.FriendRequestReceived then
        v27 = function() --[[ Line: 129 ]]
            -- upvalues: l_LocalPlayer_0 (ref), l_selectedPlayer_0 (copy)
            l_LocalPlayer_0:RevokeFriendship(l_selectedPlayer_0);
        end;
    end;
    local v28 = nil;
    if v23.state.unfriendConfirm then
        v28 = function() --[[ Line: 135 ]]
            -- upvalues: v23 (copy)
            v23:setState({
                unfriendConfirm = false
            });
        end;
    end;
    local v29, v30 = v21(l_playerRelationship_0.friendStatus);
    return v5.createElement(v10, {
        layoutOrder = v23.props.layoutOrder, 
        text = v29, 
        icon = v30, 
        lastButton = false, 
        onActivated = v26, 
        forceShowOptions = v23.state.unfriendConfirm, 
        selectedPlayer = l_selectedPlayer_0, 
        onDecline = v27, 
        onDismiss = v28, 
        contentVisible = v23.props.contentVisible, 
        forwardRef = v23.dropDownButtonAnimatorRef, 
        onAnimationComplete = v23.onAnimationComplete
    });
end;
v16.didUpdate = function(v31, v32, v33) --[[ Line: 159 ]] --[[ Name: didUpdate ]]
    if v32.playerRelationship.friendStatus ~= v31.props.playerRelationship.friendStatus then
        v31:setState({
            unfriendConfirm = false
        });
    end;
    if v32.selectedPlayer ~= v31.props.selectedPlayer or v32.dropDownOpen ~= v31.props.dropDownOpen then
        v31:setState({
            unfriendConfirm = false
        });
    end;
    if v31.props.isUsingGamepad then
        local v34 = v31.state.unfriendConfirm or v31.props.playerRelationship.friendStatus == Enum.FriendStatus.FriendRequestReceived;
        local v35 = v33.unfriendConfirm or v32.playerRelationship.friendStatus == Enum.FriendStatus.FriendRequestReceived;
        if v34 and v34 ~= v35 then
            v31.props.focusGuiObject(v31.dropDownButtonAnimatorRef.current);
            return;
        end;
    elseif v32.isUsingGamepad ~= v31.props.isUsingGamepad then
        v31.props.focusGuiObject(nil);
    end;
end;
FriendDropDownButtonWrapper = function(v36) --[[ Line: 188 ]] --[[ Name: FriendDropDownButtonWrapper ]]
    -- upvalues: l_useFocusGuiObject_0 (copy), v5 (copy), v16 (copy), v4 (copy)
    local v37 = l_useFocusGuiObject_0();
    return v5.createElement(v16, v4.Dictionary.join(v36, {
        focusGuiObject = v37
    }));
end;
return FriendDropDownButtonWrapper;