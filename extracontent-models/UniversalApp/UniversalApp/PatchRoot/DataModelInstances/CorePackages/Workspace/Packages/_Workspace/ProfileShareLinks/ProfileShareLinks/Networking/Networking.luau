local l_Parent_0 = script:FindFirstAncestor("ProfileShareLinks").Parent;
local v1 = require(l_Parent_0.ShareLinksNetworking);
local v2 = require(script.Parent.configuredRoduxNetworking);
return {
    ShareLinksNetworking = v1.config({
        roduxNetworking = v2
    })
};