local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v3 = require(script.Parent.useRelationshipSelector);
local _ = require(l_script_FirstAncestor_0.Common.LocalTypes);
local _ = require(l_Parent_0.GraphQLServer);
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
local v7 = require(l_Parent_0.SocialCommon);
local l_useMutualFriendsText_0 = v7.Hooks.useMutualFriendsText;
local l_ContextualInfoTypes_0 = v7.Enums.ContextualInfoTypes;
local l_PresenceType_0 = require(l_script_FirstAncestor_0.Rodux.RoduxPresence).Enums.PresenceType;
local l_FFlagUserSearchUseThisIsYou_0 = require(l_Parent_0.SharedFlags).FFlagUserSearchUseThisIsYou;
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local v13 = l_Images_0["icons/status/player/friend"];
local v14 = l_Images_0["icons/status/player/following"];
local function v18(v15, v16) --[[ Line: 28 ]]
    if not v15 or #v15 == 0 then
        return false;
    else
        for v17 = 1, #v15 do
            if string.lower(v15[v17]) == string.lower(v16) then
                return v15[v17];
            end;
        end;
        return false;
    end;
end;
return function(v19) --[[ Line: 56 ]]
    -- upvalues: v3 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_FFlagUserSearchUseThisIsYou_0 (copy), l_useMutualFriendsText_0 (copy), l_ContextualInfoTypes_0 (copy), v18 (copy), l_PresenceType_0 (copy), v13 (copy), v14 (copy)
    local v20 = v3(v19.userId);
    local l_shouldUseCompactTiles_0 = v19.shouldUseCompactTiles;
    local l_shouldUseCompactTiles_1 = v19.shouldUseCompactTiles;
    local v23 = l_useLocalization_0({
        youAreFriends = if l_shouldUseCompactTiles_0 then nil else l_FFlagConnectionsToFriendsRename_0 and "Feature.PlayerSearchResults.Label.YouAreFriends" or "Feature.PlayerSearchResults.Label.YouAreConnections", 
        youAreFollowing = if l_shouldUseCompactTiles_0 then nil else "Feature.PlayerSearchResults.Label.YouAreFollowing", 
        thisIsYou = l_FFlagUserSearchUseThisIsYou_0 and "Feature.PlayerSearchResults.Label.ThisIsYou" or if l_shouldUseCompactTiles_0 then nil else "Feature.PlayerSearchResults.Label.ThisIsYou", 
        friend = if l_shouldUseCompactTiles_0 then l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Label.Friend" or "CommonUI.Features.Label.Connection" else nil, 
        following = l_shouldUseCompactTiles_0 and "Feature.Friends.Label.Following" or nil, 
        you = l_shouldUseCompactTiles_0 and "Feature.PlayerSearchResults.Label.You" or nil, 
        newUsername = "Feature.PlayerSearchResults.Label.NewUsername", 
        frequents = "Feature.Friends.Label.Frequent"
    });
    local l_profileInsight_0 = v19.profileInsight;
    local v25 = l_profileInsight_0 and l_profileInsight_0.mutualFriends and #l_profileInsight_0.mutualFriends or 0;
    local v26 = l_useMutualFriendsText_0(v25);
    if v20.isMyself then
        return {
            text = if l_FFlagUserSearchUseThisIsYou_0 then v23.thisIsYou else if l_shouldUseCompactTiles_0 then v23.you else v23.thisIsYou
        }, l_ContextualInfoTypes_0.IsMyself;
    elseif v18(v19.previousUsernames, v19.searchKeyword) then
        return {
            text = v23.newUsername
        }, l_ContextualInfoTypes_0.PreviousUsername;
    elseif v20.status == Enum.FriendStatus.Friend then
        if v19.shouldUseCompactTiles and v19.userPresence and v19.userPresence.userPresenceType == l_PresenceType_0.InGame and v19.userPresence.lastLocation and v19.userPresence.universeId then
            return {
                text = v19.userPresence.lastLocation
            }, l_ContextualInfoTypes_0.ExperienceLastLocation;
        else
            return {
                text = if l_shouldUseCompactTiles_0 then v23.friend else v23.youAreFriends, 
                icon = if l_shouldUseCompactTiles_1 then nil else v13
            }, l_ContextualInfoTypes_0.Friend;
        end;
    elseif v20.following == true then
        return {
            text = if l_shouldUseCompactTiles_0 then v23.following else v23.youAreFollowing, 
            icon = if l_shouldUseCompactTiles_1 then nil else v14
        }, l_ContextualInfoTypes_0.Following;
    else
        if l_profileInsight_0 then
            if v25 > 0 then
                return {
                    text = v26, 
                    icon = if l_shouldUseCompactTiles_1 then nil else v13
                }, l_ContextualInfoTypes_0.MutualFriends;
            elseif l_profileInsight_0.isOfflineFrequents then
                return {
                    text = v23.frequents
                }, l_ContextualInfoTypes_0.Frequents;
            end;
        end;
        return nil, nil;
    end;
end;