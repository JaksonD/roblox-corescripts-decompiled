local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local v8 = require(script.Parent.DropDownButtonAnimator);
local l_Images_0 = v6.App.ImageSet.Images;
local v10 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_FFlagConnectionsToFriendsRename_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagConnectionsToFriendsRename;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v13 = {
    unfriend = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Action.Unfriend" or nil, 
    friendRequest = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Label.FriendRequest" or nil, 
    removeConnection = if l_FFlagConnectionsToFriendsRename_0 then nil else "CommonUI.Features.Label.RemoveConnection", 
    connectionRequest = if l_FFlagConnectionsToFriendsRename_0 then nil else "InGame.PlayerDropDown.Action.ConnectionRequest"
};
local v14 = v4.PureComponent:extend("FriendDropDownButton");
v14.validateProps = v5.strictInterface({
    layoutOrder = v5.integer, 
    playerRelationship = v5.strictInterface({
        isBlocked = v5.boolean, 
        friendStatus = v5.enum(Enum.FriendStatus), 
        isFollowing = v5.boolean, 
        isFollower = v5.boolean
    }), 
    selectedPlayer = v5.optional(v5.instanceIsA("Player")), 
    dropDownOpen = v5.boolean, 
    requestFriendship = v5.callback
});
local function v19(v15) --[[ Line: 49 ]] --[[ Name: getFriendTextAndIcon ]]
    -- upvalues: l_Images_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v13 (copy), v10 (copy)
    local v16 = l_Images_0["icons/actions/friends/friendAdd"];
    local v17 = l_Images_0["icons/actions/friends/friendRemove"];
    local v18 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    if v15 == Enum.FriendStatus.Friend then
        return v18:Format(if l_FFlagConnectionsToFriendsRename_0 then v13.unfriend else v13.removeConnection), v17;
    elseif v15 == Enum.FriendStatus.Unknown or v15 == Enum.FriendStatus.NotFriend then
        return v18:Format(if l_FFlagConnectionsToFriendsRename_0 then v13.friendRequest else v13.connectionRequest), v16;
    elseif v15 == Enum.FriendStatus.FriendRequestSent then
        return v10:FormatByKey("InGame.PlayerDropDown.CancelRequest"), v16;
    elseif v15 == Enum.FriendStatus.FriendRequestReceived then
        return v10:FormatByKey("InGame.PlayerDropDown.Accept"), v16;
    else
        return v18:Format(v13.connectionRequest), v16;
    end;
end;
v14.init = function(v20) --[[ Line: 75 ]] --[[ Name: init ]]
    v20.state = {
        unfriendConfirm = false
    };
end;
v14.render = function(v21) --[[ Line: 81 ]] --[[ Name: render ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_RbxAnalyticsService_0 (copy), v19 (copy), v4 (copy), v8 (copy)
    local l_playerRelationship_0 = v21.props.playerRelationship;
    local l_selectedPlayer_0 = v21.props.selectedPlayer;
    local v24 = nil;
    v24 = (not (l_playerRelationship_0.friendStatus == Enum.FriendStatus.Friend) or v21.state.unfriendConfirm) and function() --[[ Line: 92 ]]
        -- upvalues: l_playerRelationship_0 (copy), l_LocalPlayer_0 (ref), l_selectedPlayer_0 (copy), v21 (copy), l_RbxAnalyticsService_0 (ref)
        if l_playerRelationship_0.friendStatus == Enum.FriendStatus.Friend then
            l_LocalPlayer_0:RevokeFriendship(l_selectedPlayer_0);
            return;
        elseif l_playerRelationship_0.friendStatus == Enum.FriendStatus.Unknown or l_playerRelationship_0.friendStatus == Enum.FriendStatus.NotFriend then
            v21.props.requestFriendship(l_selectedPlayer_0, false);
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
                v21.props.requestFriendship(l_selectedPlayer_0, true);
            end;
            return;
        end;
    end or function() --[[ Line: 86 ]]
        -- upvalues: v21 (copy)
        v21:setState({
            unfriendConfirm = true
        });
    end;
    local v25 = nil;
    if l_playerRelationship_0.friendStatus == Enum.FriendStatus.FriendRequestReceived then
        v25 = function() --[[ Line: 114 ]]
            -- upvalues: l_LocalPlayer_0 (ref), l_selectedPlayer_0 (copy)
            l_LocalPlayer_0:RevokeFriendship(l_selectedPlayer_0);
        end;
    end;
    local v26 = nil;
    if v21.state.unfriendConfirm then
        v26 = function() --[[ Line: 120 ]]
            -- upvalues: v21 (copy)
            v21:setState({
                unfriendConfirm = false
            });
        end;
    end;
    local v27, v28 = v19(l_playerRelationship_0.friendStatus);
    return v4.createElement(v8, {
        layoutOrder = v21.props.layoutOrder, 
        text = v27, 
        icon = v28, 
        lastButton = false, 
        onActivated = v24, 
        forceShowOptions = v21.state.unfriendConfirm, 
        selectedPlayer = l_selectedPlayer_0, 
        onDecline = v25, 
        onDismiss = v26
    });
end;
v14.didUpdate = function(v29, v30, _) --[[ Line: 141 ]] --[[ Name: didUpdate ]]
    if v30.playerRelationship.friendStatus ~= v29.props.playerRelationship.friendStatus then
        v29:setState({
            unfriendConfirm = false
        });
    end;
    if v30.selectedPlayer ~= v29.props.selectedPlayer or v30.dropDownOpen ~= v29.props.dropDownOpen then
        v29:setState({
            unfriendConfirm = false
        });
    end;
end;
return v14;