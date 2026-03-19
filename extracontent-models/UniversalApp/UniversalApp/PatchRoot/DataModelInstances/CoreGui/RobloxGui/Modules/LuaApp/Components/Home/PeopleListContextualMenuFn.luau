local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Packages_0 = l_CorePackages_0.Workspace.Packages;
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_Packages_0.UserProfiles);
local v6 = require(l_Modules_0.LuaApp.Components.Home.PeopleListContextualMenu);
return function(v7) --[[ Line: 15 ]] --[[ Name: PeopleListContextualMenuFn ]]
    -- upvalues: v5 (copy), v4 (copy), v6 (copy), v1 (copy)
    local v8 = v5.Hooks.useUserProfilesFetch({
        userIds = {
            v7.user.id
        }, 
        query = v5.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v9 = if v8.data then v5.Selectors.getCombinedNameFromId(v8.data, v7.user.id) else nil;
    return v4.createElement(v6, v1.Dictionary.join(v7, {
        combinedName = v9
    }));
end;