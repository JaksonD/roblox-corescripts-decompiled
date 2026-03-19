local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local v1 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v2 = require(l_script_FirstAncestor_0.Common.Enums);
local v3 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformFixAnalyticsPrimaryAction);
local v4 = require(l_script_FirstAncestor_0.Analytics.FriendStatus);
return function(v5) --[[ Line: 10 ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy), v4 (copy)
    local v6 = nil;
    if v3 then
        local v7 = v1(v5, (("responseBody.components.%*.buttons"):format(v2.Components.Actions)));
        v6 = if v7 and v7[1] then v7[1].type else nil;
    else
        v6 = v1(v5, (("responseBody.components.%*.primary"):format(v2.Components.Actions)));
    end;
    if not v6 then
        return v4.Unknown;
    elseif v6 == v2.ProfileActions.PendingFriendRequest then
        return v4.RequestSent;
    elseif v6 == v2.ProfileActions.AcceptFriendRequest then
        return v4.RequestReceived;
    elseif v6 == v2.ProfileActions.Chat or v6 == v2.ProfileActions.JoinExperience or v6 == v2.ProfileActions.EditAlias then
        return v4.Friends;
    elseif v6 == v2.ProfileActions.EditProfile then
        return v4.Self;
    elseif v6 == v2.ProfileActions.Unfriend then
        return v4.Ineligible;
    else
        return v4.NotFriends;
    end;
end;