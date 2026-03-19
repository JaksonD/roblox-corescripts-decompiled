local l_Parent_0 = script:FindFirstAncestor("UserSearch").Parent;
local v1 = require(l_Parent_0.UserProfiles);
return function(v2) --[[ Line: 15 ]] --[[ Name: useProfileNames ]]
    -- upvalues: v1 (copy)
    local v3 = v1.Hooks.useUserProfilesFetch({
        userIds = {
            v2.userId
        }, 
        query = v1.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v4 = if v3.data then v1.Selectors.getUsernameFromId(v3.data, v2.userId) else nil;
    local v5 = if v4 then v1.Formatters.formatUsername(v4) else nil;
    local v6 = if v3.data then v1.Selectors.getCombinedNameFromId(v3.data, v2.userId) else nil;
    return {
        username = v5, 
        combinedName = v6
    };
end;