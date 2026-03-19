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
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v12 = {
    removeConnection = "CommonUI.Features.Label.RemoveConnection", 
    connectionRequest = "InGame.PlayerDropDown.Action.ConnectionRequest"
};
local v13 = v4.PureComponent:extend("FriendDropDownButton");
v13.validateProps = v5.strictInterface({
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
local function v18(v14) --[[ Line: 41 ]] --[[ Name: getFriendTextAndIcon ]]
    -- upvalues: l_Images_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v12 (copy), v10 (copy)
    local v15 = l_Images_0["icons/actions/friends/friendAdd"];
    local v16 = l_Images_0["icons/actions/friends/friendRemove"];
    local v17 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    if v14 == Enum.FriendStatus.Friend then
        return v17:Format(v12.removeConnection), v16;
    elseif v14 == Enum.FriendStatus.Unknown or v14 == Enum.FriendStatus.NotFriend then
        return v17:Format(v12.connectionRequest), v15;
    elseif v14 == Enum.FriendStatus.FriendRequestSent then
        return v10:FormatByKey("InGame.PlayerDropDown.CancelRequest"), v15;
    elseif v14 == Enum.FriendStatus.FriendRequestReceived then
        return v10:FormatByKey("InGame.PlayerDropDown.Accept"), v15;
    else
        return v17:Format(v12.connectionRequest), v15;
    end;
end;
v13.init = function(v19) --[[ Line: 59 ]] --[[ Name: init ]]
    v19.state = {
        unfriendConfirm = false
    };
end;
v13.render = function(v20) --[[ Line: 65 ]] --[[ Name: render ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_RbxAnalyticsService_0 (copy), v18 (copy), v4 (copy), v8 (copy)
    local l_playerRelationship_0 = v20.props.playerRelationship;
    local l_selectedPlayer_0 = v20.props.selectedPlayer;
    local v23 = nil;
    v23 = (not (l_playerRelationship_0.friendStatus == Enum.FriendStatus.Friend) or v20.state.unfriendConfirm) and function() --[[ Line: 76 ]]
        -- upvalues: l_playerRelationship_0 (copy), l_LocalPlayer_0 (ref), l_selectedPlayer_0 (copy), v20 (copy), l_RbxAnalyticsService_0 (ref)
        if l_playerRelationship_0.friendStatus == Enum.FriendStatus.Friend then
            l_LocalPlayer_0:RevokeFriendship(l_selectedPlayer_0);
            return;
        elseif l_playerRelationship_0.friendStatus == Enum.FriendStatus.Unknown or l_playerRelationship_0.friendStatus == Enum.FriendStatus.NotFriend then
            v20.props.requestFriendship(l_selectedPlayer_0, false);
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
                v20.props.requestFriendship(l_selectedPlayer_0, true);
            end;
            return;
        end;
    end or function() --[[ Line: 70 ]]
        -- upvalues: v20 (copy)
        v20:setState({
            unfriendConfirm = true
        });
    end;
    local v24 = nil;
    if l_playerRelationship_0.friendStatus == Enum.FriendStatus.FriendRequestReceived then
        v24 = function() --[[ Line: 98 ]]
            -- upvalues: l_LocalPlayer_0 (ref), l_selectedPlayer_0 (copy)
            l_LocalPlayer_0:RevokeFriendship(l_selectedPlayer_0);
        end;
    end;
    local v25 = nil;
    if v20.state.unfriendConfirm then
        v25 = function() --[[ Line: 104 ]]
            -- upvalues: v20 (copy)
            v20:setState({
                unfriendConfirm = false
            });
        end;
    end;
    local v26, v27 = v18(l_playerRelationship_0.friendStatus);
    return v4.createElement(v8, {
        layoutOrder = v20.props.layoutOrder, 
        text = v26, 
        icon = v27, 
        lastButton = false, 
        onActivated = v23, 
        forceShowOptions = v20.state.unfriendConfirm, 
        selectedPlayer = l_selectedPlayer_0, 
        onDecline = v24, 
        onDismiss = v25
    });
end;
v13.didUpdate = function(v28, v29, _) --[[ Line: 125 ]] --[[ Name: didUpdate ]]
    if v29.playerRelationship.friendStatus ~= v28.props.playerRelationship.friendStatus then
        v28:setState({
            unfriendConfirm = false
        });
    end;
    if v29.selectedPlayer ~= v28.props.selectedPlayer or v29.dropDownOpen ~= v28.props.dropDownOpen then
        v28:setState({
            unfriendConfirm = false
        });
    end;
end;
return v13;