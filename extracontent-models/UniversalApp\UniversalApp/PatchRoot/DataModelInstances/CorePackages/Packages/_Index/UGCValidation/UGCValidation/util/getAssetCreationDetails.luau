local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.util.APIUtil);
local l_HttpService_0 = game:GetService("HttpService");
local v3 = v1.getBaseDomain();
local v4 = string.format("https://itemconfiguration.%s", v3) .. "v1/creations/get-asset-details";
return function(v5) --[[ Line: 13 ]] --[[ Name: getAssetCreationDetails ]]
    -- upvalues: v1 (copy), v4 (copy), l_HttpService_0 (copy)
    local v6, v7 = v1.requestAndRetryPost(v4, l_HttpService_0:JSONEncode({
        assetIds = v5
    }));
    if v6 then
        return true, l_HttpService_0:JSONDecode(v7);
    else
        return false, v7;
    end;
end;