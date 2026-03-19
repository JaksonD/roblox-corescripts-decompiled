local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.t);
local v2 = {
    validateJson = v1.interface({
        appType = v1.string, 
        type = v1.string, 
        userAccessToken = v1.string, 
        userOpenId = v1.string
    }), 
    new = function() --[[ Line: 20 ]] --[[ Name: new ]]
        return {};
    end
};
v2.mock = function() --[[ Line: 24 ]] --[[ Name: mock ]]
    -- upvalues: v2 (copy)
    local v3 = v2.new();
    v3.appType = "PlayerMobile";
    v3.type = "QQ";
    v3.userAccessToken = "userAccessTokenStringFromTencentMSDK";
    v3.userOpenId = "userOpenIDStringFromTencentMSDK";
    return v3;
end;
v2.fromJsonData = function(v4) --[[ Line: 33 ]] --[[ Name: fromJsonData ]]
    -- upvalues: v2 (copy)
    assert(v2.validateJson(v4), "Error: TencentAuthInfo JSON is not valid.");
    local v5 = v2.new();
    v5.appType = v4.appType;
    v5.type = v4.type;
    v5.userAccessToken = v4.userAccessToken;
    v5.userOpenId = v4.userOpenId;
    return v5;
end;
return v2;