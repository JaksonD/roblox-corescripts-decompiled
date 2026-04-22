local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local v1 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v2 = require(l_script_FirstAncestor_0.Common.Enums);
local v3 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformFixAnalyticsPrimaryAction);
local v4 = require(l_script_FirstAncestor_0.Analytics.FriendStatus);
local v5 = game:DefineFastFlag("ProfilePlatformFixSelfAnalytics", false);
return function(v6) --[[ Line: 12 ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy), v4 (copy), v5 (copy)
    local v7 = nil;
    if v3 then
        local v8 = v1(v6, (("responseBody.components.%*.buttons"):format(v2.Components.Actions)));
        v7 = if v8 and v8[1] then v8[1].type else nil;
    else
        v7 = v1(v6, (("responseBody.components.%*.primary"):format(v2.Components.Actions)));
    end;
    if not v7 then
        return v4.Unknown;
    elseif v7 == v2.ProfileActions.PendingFriendRequest then
        return v4.RequestSent;
    elseif v7 == v2.ProfileActions.AcceptFriendRequest then
        return v4.RequestReceived;
    elseif v7 == v2.ProfileActions.Chat or v7 == v2.ProfileActions.JoinExperience or v7 == v2.ProfileActions.EditAlias then
        return v4.Friends;
    elseif v7 == v2.ProfileActions.EditProfile or v5 and v7 == v2.ProfileActions.EditAvatar or v5 and v7 == v2.ProfileActions.EditAppearance then
        return v4.Self;
    elseif v7 == v2.ProfileActions.Unfriend then
        return v4.Ineligible;
    else
        return v4.NotFriends;
    end;
end;