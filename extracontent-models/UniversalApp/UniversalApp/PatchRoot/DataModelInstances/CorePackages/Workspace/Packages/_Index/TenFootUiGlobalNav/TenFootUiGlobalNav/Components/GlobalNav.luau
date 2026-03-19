local l_Parent_0 = script:FindFirstAncestor("TenFootUiGlobalNav").Parent;
local l_isAppNavEnabled_0 = require(l_Parent_0.SharedFlags).isAppNavEnabled;
local v2 = require(script.GlobalNav);
local v3 = require(script.GlobalNavAppHeaderBar);
if l_isAppNavEnabled_0() then
    return v3;
else
    return v2;
end;