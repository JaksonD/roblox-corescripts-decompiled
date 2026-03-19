local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.ArgCheck);
local v2 = require(script.Parent.filterForLinks);
local v3 = {
    "roblox.com", 
    "sitetest%d%.robloxlabs.com", 
    "gametest%d%.robloxlabs.com", 
    "roblox.cn", 
    "roblox.qq.com", 
    "roblox%-cn.com"
};
return function(v4) --[[ Line: 18 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    v1.isType(v4, "table", "filterForLinks.text");
    return v2(v4, v3);
end;