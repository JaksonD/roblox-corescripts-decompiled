local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local v1 = require(l_script_FirstAncestor_0.Networking.myRoduxNetworking);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Http);
return v1.GET({
    Name = "CheckQRSession"
}, function(v4, v5) --[[ Line: 6 ]] --[[ Name: buildUrl ]]
    -- upvalues: v3 (copy)
    return v4(v3.Url.FRIEND_URL):path("my"):path("friends"):path((tostring(v5))):path("check-qr-session");
end);