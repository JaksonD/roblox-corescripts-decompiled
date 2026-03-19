local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Packages_0 = l_CorePackages_0.Workspace.Packages;
local l_AppPage_0 = require(l_Packages_0.RobloxAppEnums).AppPage;
return {
    {
        id = l_AppPage_0.CoHubAddConnections, 
        textKey = "Feature.AddFriends.Heading.FindPeople", 
        getScreen = function() --[[ Line: 13 ]] --[[ Name: getScreen ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.AddFriends.AddFriendsUniversalAppWrapper);
        end
    }, 
    {
        id = l_AppPage_0.CoHubMyConnections, 
        textKey = "Feature.Friends.Heading.MyConnections", 
        getScreen = function() --[[ Line: 20 ]] --[[ Name: getScreen ]]
            -- upvalues: l_Modules_0 (copy)
            return require(l_Modules_0.LuaApp.Components.FriendsLanding.FriendsLandingUniversalAppWrapper.Container);
        end
    }
};