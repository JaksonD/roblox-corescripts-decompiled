local l_Players_0 = game:GetService("Players");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = script:FindFirstAncestor("DiscoveryAnalytics").Parent;
local v3 = require(l_Parent_0.ArgCheck);
return function(v4, v5, v6, v7, v8) --[[ Line: 7 ]]
    -- upvalues: v3 (copy), l_Players_0 (copy), l_LocalizationService_0 (copy)
    v3.isType(v5, "string", "eventName");
    v3.isType(v6, "string", "universeId");
    v3.isType(v7, "string", "source");
    v3.isType(v8, "number", "index");
    if l_Players_0.LocalPlayer then
        local v9 = tostring(l_Players_0.LocalPlayer.UserId);
        local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
        v4:setRBXEventStream("GameDetailsPeekView", v5, {
            uid = v9, 
            locale = l_RobloxLocaleId_0, 
            universeId = v6, 
            source = v7, 
            index = v8
        });
    end;
end;