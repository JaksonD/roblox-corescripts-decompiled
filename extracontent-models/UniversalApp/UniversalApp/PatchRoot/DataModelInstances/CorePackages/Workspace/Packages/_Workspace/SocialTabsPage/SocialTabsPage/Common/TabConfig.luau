local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTabsPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v3 = {
    id = l_AppPage_0.SocialTabsFriends, 
    tabLabelKey = "CommonUI.Features.Label.Friends", 
    getScreen = function() --[[ Line: 10 ]] --[[ Name: getScreen ]]
        -- upvalues: l_script_FirstAncestor_0 (copy)
        return require(l_script_FirstAncestor_0.Components.TabContent.FriendsTabContent);
    end
};
local v4 = {
    id = l_AppPage_0.SocialTabsMutuals, 
    tabLabelKey = "Feature.Friends.Mutuals", 
    getScreen = function() --[[ Line: 18 ]] --[[ Name: getScreen ]]
        -- upvalues: l_script_FirstAncestor_0 (copy)
        return require(l_script_FirstAncestor_0.Components.TabContent.MutualsTabContent);
    end
};
return {
    Friends = v3, 
    Mutuals = v4, 
    routeOrder = {
        v3, 
        v4
    }
};