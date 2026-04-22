local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTabsPage");
local v1 = require(l_script_FirstAncestor_0.Common.TabConfig);
local v2 = {};
for _, v4 in v1.routeOrder do
    table.insert(v2, {
        [v4.id] = {
            getScreen = v4.getScreen
        }
    });
end;
return v2;