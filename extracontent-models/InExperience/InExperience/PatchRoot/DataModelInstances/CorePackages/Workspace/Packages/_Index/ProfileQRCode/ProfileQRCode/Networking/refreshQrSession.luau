local l_Parent_0 = script:FindFirstAncestor("ProfileQRCode").Parent;
local v1 = require(l_Parent_0.Http);
local v2 = require(script.Parent.configuredRoduxNetworking);
local function v4(v3) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    return v3(v1.Url.FRIEND_URL):path("my"):path("friends"):path("refresh-qr-session"):body({});
end;
return (function(v5) --[[ Line: 10 ]]
    -- upvalues: v4 (copy)
    return v5.POST(script.Name, v4);
end)(v2);