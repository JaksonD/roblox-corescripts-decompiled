local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local v2 = {};
v2.__index = v2;
v2.new = function() --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v3 = {
        pageObjectMap = {}
    };
    setmetatable(v3, v2);
    return v3;
end;
v2.storePageObject = function(v4, v5, v6) --[[ Line: 28 ]] --[[ Name: storePageObject ]]
    v4.pageObjectMap[v5] = v6;
end;
v2.getPageObject = function(v7, v8) --[[ Line: 32 ]] --[[ Name: getPageObject ]]
    return v7.pageObjectMap[v8];
end;
return v2;