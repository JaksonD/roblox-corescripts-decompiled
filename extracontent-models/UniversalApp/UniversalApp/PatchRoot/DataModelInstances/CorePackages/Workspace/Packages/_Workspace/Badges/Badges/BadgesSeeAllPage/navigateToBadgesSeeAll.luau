local l_script_FirstAncestor_0 = script:FindFirstAncestor("Badges");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_SduiLoadTimer_0 = require(l_Parent_0.SduiSharedUtilities).SduiLoadTimer;
local v4 = require(l_script_FirstAncestor_0.BadgesSeeAllPage.fetchBadgesSeeAllPageIfNeeded);
return function(v5, v6) --[[ Line: 9 ]] --[[ Name: navigateToBadgesSeeAll ]]
    -- upvalues: l_SduiLoadTimer_0 (copy), l_AppPage_0 (copy), v4 (copy)
    local v7 = l_SduiLoadTimer_0.createLoadTimer(l_AppPage_0.BadgesSeeAll);
    v7.start("navigate");
    local v8 = v4(v6, v7);
    v5.navigate(l_AppPage_0.BadgesSeeAll, {
        universeId = v6, 
        pageTimer = v7, 
        url = v8
    });
end;