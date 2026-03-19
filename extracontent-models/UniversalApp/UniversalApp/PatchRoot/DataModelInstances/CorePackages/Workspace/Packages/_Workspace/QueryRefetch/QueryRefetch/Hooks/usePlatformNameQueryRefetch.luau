local l_Parent_0 = script:FindFirstAncestor("QueryRefetch").Parent;
local v1 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_LoginStatus_0 = require(l_Parent_0.RobloxAppEnums).LoginStatus;
local v4 = require(l_Parent_0.UserProfiles);
local l_UserProfileStore_0 = v4.Stores.UserProfileStore;
local l_FFlagUserProfileStoreQueryRefetch_0 = require(l_Parent_0.SharedFlags).FFlagUserProfileStoreQueryRefetch;
local function v8(v7) --[[ Line: 12 ]] --[[ Name: selectAuthenticationStatus ]]
    return {
        authenticationStatus = v7.AuthenticationStatus.status
    };
end;
return function(v9) --[[ Line: 20 ]] --[[ Name: usePlatformNameQueryRefetch ]]
    -- upvalues: l_useSelector_0 (copy), v8 (copy), l_LoginStatus_0 (copy), v1 (copy), v4 (copy), l_FFlagUserProfileStoreQueryRefetch_0 (copy), l_UserProfileStore_0 (copy)
    local v10 = l_useSelector_0(v8).authenticationStatus == l_LoginStatus_0.LOGGED_IN;
    local v11, v12 = v1.useState({});
    local v13 = v4.Hooks.useUserProfilesFetch({
        userIds = v11, 
        query = v4.Queries.userProfilesDisplayUserPlatformNamesByUserIds
    });
    local v14 = v4.Hooks.useUserProfilesFetch({
        userIds = v11, 
        query = v4.Queries.userProfilesCombinedAndPlatformByUserIds
    });
    v1.useEffect(function() --[[ Line: 37 ]]
        -- upvalues: v10 (copy), v9 (copy), v12 (copy)
        local v15 = nil;
        if v10 and v9 then
            v15 = v9:observeEvent("UserProfileNotifications", function(v16) --[[ Line: 40 ]]
                -- upvalues: v12 (ref)
                if v16.Type == "PlatformName" then
                    v12({
                        (tostring(v16.VieweeUserId))
                    });
                end;
            end);
        end;
        return function() --[[ Line: 47 ]]
            -- upvalues: v15 (ref)
            if v15 and v15.disconnect then
                v15:disconnect();
            end;
        end;
    end, {
        v10, 
        v9
    });
    v1.useEffect(function() --[[ Line: 55 ]]
        -- upvalues: v13 (copy), v11 (copy), v14 (copy), l_FFlagUserProfileStoreQueryRefetch_0 (ref), l_UserProfileStore_0 (ref)
        v13.refetch({
            userIds = v11
        });
        if v14 then
            v14.refetch({
                userIds = v11
            });
        end;
        if l_FFlagUserProfileStoreQueryRefetch_0 then
            l_UserProfileStore_0.get().invalidateCachedNamesForUserIds(v11);
        end;
    end, {
        v11, 
        v13.refetch, 
        if v14 then v14.refetch else nil
    });
end;