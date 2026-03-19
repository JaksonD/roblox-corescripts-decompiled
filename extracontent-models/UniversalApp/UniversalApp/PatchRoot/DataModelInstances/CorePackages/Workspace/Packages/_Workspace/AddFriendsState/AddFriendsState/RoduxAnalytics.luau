local l_script_FirstAncestor_0 = script:FindFirstAncestor("AddFriendsState");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.SocialLuaAnalytics);
local v3 = require(l_script_FirstAncestor_0.RODUX_KEY);
return v2.Analytics.RoduxAnalytics.config({
    keyPath = ("%*.Analytics"):format(v3)
});