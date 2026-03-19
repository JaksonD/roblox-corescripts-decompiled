local l_Packages_0 = game:GetService("CorePackages").Workspace.Packages;
local _ = require(l_Packages_0.Navigation);
local v2 = require(script.Parent.TabConfig);
local v3 = {};
for _, v5 in v2 do
    table.insert(v3, {
        [v5.id] = {
            getScreen = v5.getScreen
        }
    });
end;
return v3;