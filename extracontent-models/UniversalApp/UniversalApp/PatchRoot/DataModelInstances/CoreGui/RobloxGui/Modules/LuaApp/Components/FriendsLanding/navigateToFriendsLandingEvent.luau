local l_CorePackages_0 = game:GetService("CorePackages");
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local l_Analytics_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).Analytics;
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = {
    homePage = game:DefineFastString("HomePageNavigationFriendsLandingCounter", "HomePageNavigationFriendsLanding"), 
    morePage = game:DefineFastString("MorePageNavigationFriendsLandingCounter", "MorePageNavigationFriendsLanding")
};
local v6 = v4.strictInterface({
    localUserId = v4.string, 
    context = v4.string, 
    analytics = v4.optional(v4.table)
});
return function(v7) --[[ Line: 20 ]]
    -- upvalues: v6 (copy), l_Analytics_0 (copy), l_RbxAnalyticsService_0 (copy), v5 (copy), l_Logger_0 (copy)
    assert(v6(v7));
    local v8 = v7.analytics or l_Analytics_0.new(l_RbxAnalyticsService_0);
    if v5[v7.context] then
        v8.EventStream:setRBXEventStream(v7.context, "buttonClick", {
            uid = v7.localUserId, 
            btn = "friendsLanding"
        });
        v8.Diag:reportCounter(v5[v7.context], 1);
        return;
    else
        l_Logger_0:error("Error from navigate: Invalid destination '{}'", v7.context);
        return;
    end;
end;