local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.LuauPolyfill);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Enum.Challenge.ErrorKind);
local v5 = {};
v5.__index = v5;
v5.new = function(_, v7, v8) --[[ Line: 12 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    local v9 = {};
    setmetatable(v9, v5);
    v9.kind = v7;
    v9.data = v8;
    return v9;
end;
v5.match = function(v10) --[[ Line: 20 ]] --[[ Name: match ]]
    -- upvalues: v2 (copy), v5 (copy)
    return v2.instanceof(v10, v5);
end;
v5.matchAbandoned = function(v11) --[[ Line: 24 ]] --[[ Name: matchAbandoned ]]
    -- upvalues: v5 (copy), v4 (copy)
    return v5.match(v11) and v11.kind == v4.Abandoned;
end;
v5.matchRateLimited = function(v12) --[[ Line: 28 ]] --[[ Name: matchRateLimited ]]
    -- upvalues: v5 (copy), v4 (copy)
    if not v5.match(v12) or v12.kind ~= v4.RateLimited or not v12.data or not v12.data.retryTime or not DateTime.fromIsoDate(v12.data.retryTime) then
        return nil;
    else
        return v12.data.retryTime;
    end;
end;
return v5;