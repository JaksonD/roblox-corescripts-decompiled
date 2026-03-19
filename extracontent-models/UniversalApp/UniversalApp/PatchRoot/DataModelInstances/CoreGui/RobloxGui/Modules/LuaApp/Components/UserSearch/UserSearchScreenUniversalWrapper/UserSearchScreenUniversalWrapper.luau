local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UserSearchScreen_0 = require(l_Modules_0.LuaApp.Components.UserSearch.api).UserSearchScreen;
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(script.Parent.Parent.Players.PlayerSearch);
return function() --[[ Line: 15 ]] --[[ Name: UserSearchScreenUniversalWrapper ]]
    -- upvalues: v3 (copy), v4 (copy), l_UserSearchScreen_0 (copy)
    local v9 = v3.useCallback(function(v5) --[[ Line: 17 ]]
        -- upvalues: v3 (ref), v4 (ref)
        local l_searchKeyword_0 = v5.searchKeyword;
        local l_shouldShowUserSearchLandingPage_0 = v5.shouldShowUserSearchLandingPage;
        local l_searchUuid_0 = v5.searchUuid;
        return v3.createElement(v4, {
            searchParameters = {
                searchKeyword = l_searchKeyword_0
            }, 
            shouldShowUserSearchLandingPage = l_shouldShowUserSearchLandingPage_0, 
            searchUuid = l_searchUuid_0
        });
    end, {});
    return v3.createElement(l_UserSearchScreen_0, {
        renderUserSearchResults = v9
    });
end;