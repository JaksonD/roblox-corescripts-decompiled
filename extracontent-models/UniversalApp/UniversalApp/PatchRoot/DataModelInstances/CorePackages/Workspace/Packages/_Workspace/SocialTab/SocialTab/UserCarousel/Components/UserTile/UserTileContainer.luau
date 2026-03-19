local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UserProfiles);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(script.Parent.UserTile);
local v6 = require(l_script_FirstAncestor_0.Flags.getSocialTabUserProfileApiEnabled);
return function(v7) --[[ Line: 29 ]] --[[ Name: UserTileContainer ]]
    -- upvalues: v6 (copy), v3 (copy), v2 (copy), v5 (copy), v4 (copy)
    local v8 = nil;
    local v9 = nil;
    local v10 = nil;
    if v6() then
        v8 = v3.Hooks.useUserProfilesFetch({
            userIds = {
                v7.user.id
            }, 
            query = v3.Queries.userProfilesCombinedNameAndUsernameByUserIds
        });
        v9 = not not v8.loading or v8.error and true or false;
        v10 = if v8.data then v3.Selectors.getCombinedNameFromId(v8.data, v7.user.id) else nil;
    end;
    return v2.createElement(v5, v4.Dictionary.join(v7, {
        combinedName = v10, 
        shouldShimmerName = v9
    }));
end;