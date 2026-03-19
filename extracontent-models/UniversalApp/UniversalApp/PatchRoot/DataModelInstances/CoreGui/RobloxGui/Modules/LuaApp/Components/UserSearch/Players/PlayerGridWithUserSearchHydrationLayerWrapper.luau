local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local l_UserSearchHydrationLayer_0 = require(l_Modules_0.LuaApp.Components.UserSearch.api).UserSearchHydrationLayer;
local v5 = require(script.Parent.PlayerGrid);
local _ = require(script.Parent.Parent.UserSearchTileUniversalWrapper.UserSearchTileUniversalWrapper);
local _ = require(l_CorePackages_0.Workspace.Packages.GraphQLServer);
local l_FFlagPlayerSearchEnableOnlineFrequents_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagPlayerSearchEnableOnlineFrequents;
local l_FFlagPlayerSearchEnableOnlineFrequentsForAll_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagPlayerSearchEnableOnlineFrequentsForAll;
return function(v10) --[[ Line: 39 ]]
    -- upvalues: v2 (copy), l_UserSearchHydrationLayer_0 (copy), l_FFlagPlayerSearchEnableOnlineFrequents_0 (copy), l_FFlagPlayerSearchEnableOnlineFrequentsForAll_0 (copy), v5 (copy), v3 (copy)
    return v2.createElement(l_UserSearchHydrationLayer_0, {
        users = v10.entries, 
        searchParameters = v10.searchParameters, 
        enableOnlineFrequents = if not l_FFlagPlayerSearchEnableOnlineFrequents_0 or l_FFlagPlayerSearchEnableOnlineFrequentsForAll_0 then nil else v10.enableOnlineFrequents, 
        renderComponent = function(v11) --[[ Line: 47 ]] --[[ Name: renderComponent ]]
            -- upvalues: v2 (ref), v5 (ref), v3 (ref), v10 (copy)
            return v2.createElement(v5, v3.Dictionary.join(v10, {
                mappedProfilesInsights = v11.mappedProfilesInsights
            }));
        end
    });
end;