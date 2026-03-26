local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UserProfiles);
local v4 = require(l_Parent_0.Dash);
local v5 = require(l_Parent_0.DataHydration);
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local v7 = require(l_Parent_0.Signals);
local v8 = require(script.Parent.FriendTile);
local v9 = require(l_script_FirstAncestor_0.Flags.FFlagAddFriendsTileTCIndicatorLabel);
local l_FFlagFriendsPageUserListEnabled_0 = require(l_Parent_0.SharedFlags).FFlagFriendsPageUserListEnabled;
local l_FFlagEnableBlackbirdCheckDev_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdCheckDev;
local l_useIsRobloxSubscriber_0 = v3.Hooks.useIsRobloxSubscriber;
local v13 = if v9 then v5.TrustedConnections.TrustedConnectionsStore.get() else nil;
return function(v14) --[[ Line: 22 ]] --[[ Name: FriendTileContainer ]]
    -- upvalues: l_FFlagFriendsPageUserListEnabled_0 (copy), v3 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy), l_useIsRobloxSubscriber_0 (copy), v9 (copy), v2 (copy), v7 (copy), v13 (copy), l_useSignalState_0 (copy), v8 (copy), v4 (copy)
    local v15 = if l_FFlagFriendsPageUserListEnabled_0 then nil else v3.Hooks.useUserProfilesFetch({
        userIds = {
            v14.user.id
        }, 
        query = v3.Queries.userProfilesFriendsLandingQueryByUserIds
    });
    local v16 = nil;
    if l_FFlagEnableBlackbirdCheckDev_0 then
        v16 = l_useIsRobloxSubscriber_0(if v14.user and v14.user.id then v14.user.id else nil);
    end;
    local v17 = nil;
    if v9 then
        local v19 = v2.useMemo(function() --[[ Line: 37 ]]
            -- upvalues: v7 (ref), v14 (copy), v13 (ref)
            return v7.createComputed(function(v18) --[[ Line: 38 ]]
                -- upvalues: v14 (ref), v13 (ref)
                if v14.user and v14.user.id and v14.user.id ~= "" then
                    return (v13.getIsTrustedConnection(v14.user.id).data(v18));
                else
                    return nil;
                end;
            end);
        end, {
            if v14.user then v14.user.id else nil
        });
        v17 = l_useSignalState_0(v19);
    end;
    return v2.createElement(v8, v4.join(v14, {
        userProfile = if l_FFlagFriendsPageUserListEnabled_0 then nil else if v15.data then v15.data.userProfiles[1] else nil, 
        trustedConnection = if v9 then v17 else nil, 
        isRobloxSubscriber = if l_FFlagEnableBlackbirdCheckDev_0 then v16 else nil
    }));
end;