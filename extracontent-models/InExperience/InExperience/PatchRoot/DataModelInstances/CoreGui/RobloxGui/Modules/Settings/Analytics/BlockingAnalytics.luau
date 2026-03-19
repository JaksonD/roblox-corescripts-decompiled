local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = {};
v4.__index = v4;
local v5 = nil;
v5 = l_Players_0.LocalPlayer;
while not v5 do
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
    v5 = l_Players_0.LocalPlayer;
end;
v4.new = function(v6, v7) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v5 (ref), l_RbxAnalyticsService_0 (copy), v4 (copy)
    v6 = v6 or v5.UserId;
    assert(v6, "BlockingAnalytics must be passed the ID of the local user");
    local v8 = {
        _eventStreamImpl = v7 and v7.EventStream or l_RbxAnalyticsService_0, 
        localUserId = v6
    };
    setmetatable(v8, v4);
    return v8;
end;
v4.action = function(v9, v10, v11, v12) --[[ Line: 37 ]] --[[ Name: action ]]
    -- upvalues: v3 (copy)
    v12 = v3.Dictionary.join(v12 or {}, {
        blockerUserId = v9.localUserId
    });
    v9._eventStreamImpl:SendEventDeferred("AccountSettingsApi", v10, v11, v12);
end;
return v4;