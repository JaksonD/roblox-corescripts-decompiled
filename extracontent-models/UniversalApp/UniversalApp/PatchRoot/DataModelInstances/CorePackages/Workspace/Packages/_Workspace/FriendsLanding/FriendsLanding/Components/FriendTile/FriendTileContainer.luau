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
local v11 = if v9 then v5.TrustedConnections.TrustedConnectionsStore.get() else nil;
return function(v12) --[[ Line: 20 ]] --[[ Name: FriendTileContainer ]]
    -- upvalues: l_FFlagFriendsPageUserListEnabled_0 (copy), v3 (copy), v9 (copy), v2 (copy), v7 (copy), v11 (copy), l_useSignalState_0 (copy), v8 (copy), v4 (copy)
    local v13 = if l_FFlagFriendsPageUserListEnabled_0 then nil else v3.Hooks.useUserProfilesFetch({
        userIds = {
            v12.user.id
        }, 
        query = v3.Queries.userProfilesFriendsLandingQueryByUserIds
    });
    local v14 = nil;
    if v9 then
        local v16 = v2.useMemo(function() --[[ Line: 30 ]]
            -- upvalues: v7 (ref), v12 (copy), v11 (ref)
            return v7.createComputed(function(v15) --[[ Line: 31 ]]
                -- upvalues: v12 (ref), v11 (ref)
                if v12.user and v12.user.id and v12.user.id ~= "" then
                    return (v11.getIsTrustedConnection(v12.user.id).data(v15));
                else
                    return nil;
                end;
            end);
        end, {
            if v12.user then v12.user.id else nil
        });
        v14 = l_useSignalState_0(v16);
    end;
    return v2.createElement(v8, v4.join(v12, {
        userProfile = if l_FFlagFriendsPageUserListEnabled_0 then nil else if v13.data then v13.data.userProfiles[1] else nil, 
        trustedConnection = if v9 then v14 else nil
    }));
end;