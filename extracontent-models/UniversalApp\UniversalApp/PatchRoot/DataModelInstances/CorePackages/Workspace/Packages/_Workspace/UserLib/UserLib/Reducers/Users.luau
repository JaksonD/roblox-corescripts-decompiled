local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserLib");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
local l_AddUser_0 = require(l_script_FirstAncestor_0.Actions).AddUser;
local l_AddUsers_0 = require(l_script_FirstAncestor_0.Actions).AddUsers;
local l_ReceivedUserPresence_0 = require(l_script_FirstAncestor_0.Actions).ReceivedUserPresence;
local l_RemoveUser_0 = require(l_script_FirstAncestor_0.Actions).RemoveUser;
local l_SetUserIsFriend_0 = require(l_script_FirstAncestor_0.Actions).SetUserIsFriend;
local l_SetUserMembershipType_0 = require(l_script_FirstAncestor_0.Actions).SetUserMembershipType;
local l_SetUserHasRobloxSubscription_0 = require(l_script_FirstAncestor_0.Actions).SetUserHasRobloxSubscription;
local l_SetUserPresence_0 = require(l_script_FirstAncestor_0.Actions).SetUserPresence;
local l_ReceivedDisplayName_0 = require(l_script_FirstAncestor_0.Actions).ReceivedDisplayName;
local l_FFlagEnableBlackbirdCheckDev_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdCheckDev;
return function(v13, v14) --[[ Line: 20 ]]
    -- upvalues: l_AddUser_0 (copy), l_Immutable_0 (copy), l_AddUsers_0 (copy), l_SetUserIsFriend_0 (copy), l_SetUserPresence_0 (copy), l_ReceivedUserPresence_0 (copy), l_SetUserMembershipType_0 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy), l_SetUserHasRobloxSubscription_0 (copy), l_RemoveUser_0 (copy), l_ReceivedDisplayName_0 (copy)
    v13 = v13 or {};
    assert(v13, "");
    if v14.type == l_AddUser_0.name then
        local l_user_0 = v14.user;
        return (l_Immutable_0.Set(v13, l_user_0.id, l_user_0));
    elseif v14.type == l_AddUsers_0.name then
        local l_users_0 = v14.users;
        local v17 = {};
        for v18, v19 in pairs(l_users_0) do
            local v20 = v13[v18];
            if v20 then
                v17[v18] = l_Immutable_0.JoinDictionaries(v20, v19);
            else
                v17[v18] = v19;
            end;
        end;
        return (l_Immutable_0.JoinDictionaries(v13, v17));
    elseif v14.type == l_SetUserIsFriend_0.name then
        local v21 = v13[v14.userId];
        if v21 then
            local v22 = l_Immutable_0.Set(v21, "isFriend", v14.isFriend);
            return (l_Immutable_0.Set(v13, v21.id, v22));
        else
            warn("Setting isFriend on user", v14.userId, "who doesn't exist yet");
            return v13;
        end;
    elseif v14.type == l_SetUserPresence_0.name then
        local v23 = v13[v14.userId];
        if v23 then
            local v24 = l_Immutable_0.JoinDictionaries(v23, {
                presence = v14.presence, 
                lastLocation = v14.lastLocation
            });
            return (l_Immutable_0.Set(v13, v23.id, v24));
        else
            warn("Setting presence on user", v14.userId, "who doesn't exist yet");
            return v13;
        end;
    else
        if v14.type == l_ReceivedUserPresence_0.name then
            local v25 = v13[v14.userId];
            if v25 then
                return (l_Immutable_0.JoinDictionaries(v13, {
                    [v14.userId] = l_Immutable_0.JoinDictionaries(v25, {
                        presence = v14.presence, 
                        lastLocation = v14.lastLocation, 
                        placeId = v14.placeId, 
                        rootPlaceId = v14.rootPlaceId, 
                        gameInstanceId = v14.gameInstanceId, 
                        lastOnline = v14.lastOnline, 
                        universeId = v14.universeId
                    })
                }));
            end;
        elseif v14.type == l_SetUserMembershipType_0.name then
            local v26 = v13[v14.userId];
            if v26 then
                return (l_Immutable_0.JoinDictionaries(v13, {
                    [v14.userId] = l_Immutable_0.JoinDictionaries(v26, {
                        membership = v14.membershipType
                    })
                }));
            end;
        elseif l_FFlagEnableBlackbirdCheckDev_0 and v14.type == l_SetUserHasRobloxSubscription_0.name then
            local v27 = v13[v14.userId];
            if v27 then
                return (l_Immutable_0.JoinDictionaries(v13, {
                    [v14.userId] = l_Immutable_0.JoinDictionaries(v27, {
                        hasRobloxSubscription = v14.hasRobloxSubscription
                    })
                }));
            end;
        elseif v14.type == l_RemoveUser_0.name then
            if v13[v14.userId] then
                return (l_Immutable_0.RemoveFromDictionary(v13, v14.userId));
            end;
        elseif v14.type == l_ReceivedDisplayName_0.name then
            local v28 = v13[v14.userId];
            if v28 then
                v13 = l_Immutable_0.JoinDictionaries(v13, {
                    [v14.userId] = l_Immutable_0.JoinDictionaries(v28, {
                        displayName = v14.displayName
                    })
                });
            end;
        end;
        return v13;
    end;
end;