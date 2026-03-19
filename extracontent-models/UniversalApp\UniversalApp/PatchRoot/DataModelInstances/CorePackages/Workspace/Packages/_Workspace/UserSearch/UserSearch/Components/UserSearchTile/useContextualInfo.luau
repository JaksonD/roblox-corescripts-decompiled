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
local v12 = l_Images_0["icons/status/player/friend"];
local v13 = l_Images_0["icons/status/player/following"];
local function v17(v14, v15) --[[ Line: 27 ]]
    if not v14 or #v14 == 0 then
        return false;
    else
        for v16 = 1, #v14 do
            if string.lower(v14[v16]) == string.lower(v15) then
                return v14[v16];
            end;
        end;
        return false;
    end;
end;
return function(v18) --[[ Line: 55 ]]
    -- upvalues: v3 (copy), l_useLocalization_0 (copy), l_FFlagUserSearchUseThisIsYou_0 (copy), l_useMutualFriendsText_0 (copy), l_ContextualInfoTypes_0 (copy), v17 (copy), l_PresenceType_0 (copy), v12 (copy), v13 (copy)
    local v19 = v3(v18.userId);
    local l_shouldUseCompactTiles_0 = v18.shouldUseCompactTiles;
    local l_shouldUseCompactTiles_1 = v18.shouldUseCompactTiles;
    local v22 = l_useLocalization_0({
        youAreFriends = if l_shouldUseCompactTiles_0 then nil else "Feature.PlayerSearchResults.Label.YouAreConnections", 
        youAreFollowing = if l_shouldUseCompactTiles_0 then nil else "Feature.PlayerSearchResults.Label.YouAreFollowing", 
        thisIsYou = l_FFlagUserSearchUseThisIsYou_0 and "Feature.PlayerSearchResults.Label.ThisIsYou" or if l_shouldUseCompactTiles_0 then nil else "Feature.PlayerSearchResults.Label.ThisIsYou", 
        friend = l_shouldUseCompactTiles_0 and "CommonUI.Features.Label.Connection" or nil, 
        following = l_shouldUseCompactTiles_0 and "Feature.Friends.Label.Following" or nil, 
        you = l_shouldUseCompactTiles_0 and "Feature.PlayerSearchResults.Label.You" or nil, 
        newUsername = "Feature.PlayerSearchResults.Label.NewUsername", 
        frequents = "Feature.Friends.Label.Frequent"
    });
    local l_profileInsight_0 = v18.profileInsight;
    local v24 = l_profileInsight_0 and l_profileInsight_0.mutualFriends and #l_profileInsight_0.mutualFriends or 0;
    local v25 = l_useMutualFriendsText_0(v24);
    if v19.isMyself then
        return {
            text = if l_FFlagUserSearchUseThisIsYou_0 then v22.thisIsYou else if l_shouldUseCompactTiles_0 then v22.you else v22.thisIsYou
        }, l_ContextualInfoTypes_0.IsMyself;
    elseif v17(v18.previousUsernames, v18.searchKeyword) then
        return {
            text = v22.newUsername
        }, l_ContextualInfoTypes_0.PreviousUsername;
    elseif v19.status == Enum.FriendStatus.Friend then
        if v18.shouldUseCompactTiles and v18.userPresence and v18.userPresence.userPresenceType == l_PresenceType_0.InGame and v18.userPresence.lastLocation and v18.userPresence.universeId then
            return {
                text = v18.userPresence.lastLocation
            }, l_ContextualInfoTypes_0.ExperienceLastLocation;
        else
            return {
                text = if l_shouldUseCompactTiles_0 then v22.friend else v22.youAreFriends, 
                icon = if l_shouldUseCompactTiles_1 then nil else v12
            }, l_ContextualInfoTypes_0.Friend;
        end;
    elseif v19.following == true then
        return {
            text = if l_shouldUseCompactTiles_0 then v22.following else v22.youAreFollowing, 
            icon = if l_shouldUseCompactTiles_1 then nil else v13
        }, l_ContextualInfoTypes_0.Following;
    else
        if l_profileInsight_0 then
            if v24 > 0 then
                return {
                    text = v25, 
                    icon = if l_shouldUseCompactTiles_1 then nil else v12
                }, l_ContextualInfoTypes_0.MutualFriends;
            elseif l_profileInsight_0.isOfflineFrequents then
                return {
                    text = v22.frequents
                }, l_ContextualInfoTypes_0.Frequents;
            end;
        end;
        return nil, nil;
    end;
end;