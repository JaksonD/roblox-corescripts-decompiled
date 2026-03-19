local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UserSearchScreen_0 = require(l_Modules_0.LuaApp.Components.UserSearch.api).UserSearchScreen;
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.React);
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local v5 = require(script.Parent.Parent.Players.PlayerSearch);
local l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppSearchPeopleUnifiedSchemaFields;
return function() --[[ Line: 19 ]] --[[ Name: UserSearchScreenUniversalWrapper ]]
    -- upvalues: v3 (copy), v5 (copy), l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 (copy), l_AppPage_0 (copy), l_UserSearchScreen_0 (copy)
    local v11 = v3.useCallback(function(v7) --[[ Line: 21 ]]
        -- upvalues: v3 (ref), v5 (ref), l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 (ref), l_AppPage_0 (ref)
        local l_searchKeyword_0 = v7.searchKeyword;
        local l_shouldShowUserSearchLandingPage_0 = v7.shouldShowUserSearchLandingPage;
        local l_searchUuid_0 = v7.searchUuid;
        return v3.createElement(v5, {
            searchParameters = {
                searchKeyword = l_searchKeyword_0
            }, 
            shouldShowUserSearchLandingPage = l_shouldShowUserSearchLandingPage_0, 
            searchUuid = l_searchUuid_0, 
            appPage = if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then l_AppPage_0.UserSearch else nil
        });
    end, {});
    return v3.createElement(l_UserSearchScreen_0, {
        renderUserSearchResults = v11
    });
end;