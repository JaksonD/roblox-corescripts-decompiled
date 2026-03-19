local l_CorePackages_0 = game:GetService("CorePackages");
local l_OmniFeedService_0 = require(l_CorePackages_0.Workspace.Packages.OmniFeedService).OmniFeedService;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedItemMap);
return function() --[[ Line: 7 ]] --[[ Name: makeOmniFeedService ]]
    -- upvalues: l_OmniFeedService_0 (copy), v3 (copy)
    local v4 = l_OmniFeedService_0.get();
    v4:initialize(v3);
    return v4;
end;