local l_Parent_0 = script:FindFirstAncestor("DiscoveryUtils").Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v2 = {
    PAGE_TYPE_HOME = "Home"
};
return {
    toAppPage = function(v3) --[[ Line: 9 ]] --[[ Name: toAppPage ]]
        -- upvalues: v2 (copy), l_AppPage_0 (copy)
        if v3 == v2.PAGE_TYPE_HOME then
            return l_AppPage_0.Home;
        else
            return nil;
        end;
    end, 
    fromAppPage = function(v4) --[[ Line: 16 ]] --[[ Name: fromAppPage ]]
        -- upvalues: l_AppPage_0 (copy), v2 (copy)
        if v4 == l_AppPage_0.Home then
            return v2.PAGE_TYPE_HOME;
        else
            return nil;
        end;
    end, 
    OmniRecommendationsPageType = v2
};