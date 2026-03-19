local l_Parent_0 = script:FindFirstAncestor("ProfileQRCode").Parent;
local v1 = require(l_Parent_0.Http);
local function v3(v2) --[[ Line: 7 ]]
    -- upvalues: v1 (copy)
    return v2(v1.Url.APIS_URL .. "sharelinks"):path("v1"):path("get-or-create-link"):body({
        linkType = "Profile"
    });
end;
return {
    profileLinkType = "Profile", 
    buildUrl = v3, 
    setupRequest = function(v4) --[[ Line: 14 ]]
        -- upvalues: v3 (copy)
        return v4.POST(script.Name, v3);
    end
};