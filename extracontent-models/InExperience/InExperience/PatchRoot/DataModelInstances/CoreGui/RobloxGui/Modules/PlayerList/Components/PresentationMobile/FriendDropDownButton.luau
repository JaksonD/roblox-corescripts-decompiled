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
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v14 = {
    removeConnection = "CommonUI.Features.Label.RemoveConnection", 
    connectionRequest = "InGame.PlayerDropDown.Action.ConnectionRequest"
};
local v15 = v5.PureComponent:extend("FriendDropDownButton");
v15.validateProps = v6.strictInterface({
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
local function v20(v16) --[[ Line: 47 ]] --[[ Name: getFriendTextAndIcon ]]
    -- upvalues: l_Images_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v14 (copy), v12 (copy)
    local v17 = l_Images_0["icons/actions/friends/friendAdd"];
    local v18 = l_Images_0["icons/actions/friends/friendRemove"];
    local v19 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    if v16 == Enum.FriendStatus.Friend then
        return v19:Format(v14.removeConnection), v18;
    elseif v16 == Enum.FriendStatus.Unknown or v16 == Enum.FriendStatus.NotFriend then
        return v19:Format(v14.connectionRequest), v17;
    elseif v16 == Enum.FriendStatus.FriendRequestSent then
        return v12:FormatByKey("InGame.PlayerDropDown.CancelRequest"), v17;
    elseif v16 == Enum.FriendStatus.FriendRequestReceived then
        return v12:FormatByKey("InGame.PlayerDropDown.Accept"), v17;
    else
        return v19:Format(v14.connectionRequest), v17;
    end;
end;
v15.init = function(v21) --[[ Line: 65 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v21.state = {
        unfriendConfirm = false
    };
    v21.dropDownButtonAnimatorRef = v5.createRef();
    v21.onAnimationComplete = function() --[[ Line: 72 ]]
        -- upvalues: v21 (copy)
        if v21.props.isUsingGamepad then
            v21.props.focusGuiObject(v21.dropDownButtonAnimatorRef.current);
        end;
    end;
end;
v15.render = function(v22) --[[ Line: 79 ]] --[[ Name: render ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_RbxAnalyticsService_0 (copy), v20 (copy), v5 (copy), v10 (copy)
    local l_playerRelationship_0 = v22.props.playerRelationship;
    local l_selectedPlayer_0 = v22.props.selectedPlayer;
    local v25 = nil;
    v25 = (not (l_playerRelationship_0.friendStatus == Enum.FriendStatus.Friend) or v22.state.unfriendConfirm) and function() --[[ Line: 91 ]]
        -- upvalues: l_playerRelationship_0 (copy), l_LocalPlayer_0 (ref), l_selectedPlayer_0 (copy), v22 (copy), l_RbxAnalyticsService_0 (ref)
        if l_playerRelationship_0.friendStatus == Enum.FriendStatus.Friend then
            l_LocalPlayer_0:RevokeFriendship(l_selectedPlayer_0);
            return;
        elseif l_playerRelationship_0.friendStatus == Enum.FriendStatus.Unknown or l_playerRelationship_0.friendStatus == Enum.FriendStatus.NotFriend then
            v22.props.requestFriendship(l_selectedPlayer_0, false);
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
                v22.props.requestFriendship(l_selectedPlayer_0, true);
            end;
            return;
        end;
    end or function() --[[ Line: 85 ]]
        -- upvalues: v22 (copy)
        v22:setState({
            unfriendConfirm = true
        });
    end;
    local v26 = nil;
    if l_playerRelationship_0.friendStatus == Enum.FriendStatus.FriendRequestReceived then
        v26 = function() --[[ Line: 113 ]]
            -- upvalues: l_LocalPlayer_0 (ref), l_selectedPlayer_0 (copy)
            l_LocalPlayer_0:RevokeFriendship(l_selectedPlayer_0);
        end;
    end;
    local v27 = nil;
    if v22.state.unfriendConfirm then
        v27 = function() --[[ Line: 119 ]]
            -- upvalues: v22 (copy)
            v22:setState({
                unfriendConfirm = false
            });
        end;
    end;
    local v28, v29 = v20(l_playerRelationship_0.friendStatus);
    return v5.createElement(v10, {
        layoutOrder = v22.props.layoutOrder, 
        text = v28, 
        icon = v29, 
        lastButton = false, 
        onActivated = v25, 
        forceShowOptions = v22.state.unfriendConfirm, 
        selectedPlayer = l_selectedPlayer_0, 
        onDecline = v26, 
        onDismiss = v27, 
        contentVisible = v22.props.contentVisible, 
        forwardRef = v22.dropDownButtonAnimatorRef, 
        onAnimationComplete = v22.onAnimationComplete
    });
end;
v15.didUpdate = function(v30, v31, v32) --[[ Line: 143 ]] --[[ Name: didUpdate ]]
    if v31.playerRelationship.friendStatus ~= v30.props.playerRelationship.friendStatus then
        v30:setState({
            unfriendConfirm = false
        });
    end;
    if v31.selectedPlayer ~= v30.props.selectedPlayer or v31.dropDownOpen ~= v30.props.dropDownOpen then
        v30:setState({
            unfriendConfirm = false
        });
    end;
    if v30.props.isUsingGamepad then
        local v33 = v30.state.unfriendConfirm or v30.props.playerRelationship.friendStatus == Enum.FriendStatus.FriendRequestReceived;
        local v34 = v32.unfriendConfirm or v31.playerRelationship.friendStatus == Enum.FriendStatus.FriendRequestReceived;
        if v33 and v33 ~= v34 then
            v30.props.focusGuiObject(v30.dropDownButtonAnimatorRef.current);
            return;
        end;
    elseif v31.isUsingGamepad ~= v30.props.isUsingGamepad then
        v30.props.focusGuiObject(nil);
    end;
end;
FriendDropDownButtonWrapper = function(v35) --[[ Line: 170 ]] --[[ Name: FriendDropDownButtonWrapper ]]
    -- upvalues: l_useFocusGuiObject_0 (copy), v5 (copy), v15 (copy), v4 (copy)
    local v36 = l_useFocusGuiObject_0();
    return v5.createElement(v15, v4.Dictionary.join(v35, {
        focusGuiObject = v36
    }));
end;
return FriendDropDownButtonWrapper;