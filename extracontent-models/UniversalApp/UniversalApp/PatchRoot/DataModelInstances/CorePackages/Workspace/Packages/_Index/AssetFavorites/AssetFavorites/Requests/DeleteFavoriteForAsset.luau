local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetFavorites");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v4, v5, v6) --[[ Line: 16 ]]
    -- upvalues: l_Url_0 (copy), l_HttpService_0 (copy)
    return v4(string.format("%s/v1/favorites/users/%s/assets/%s/favorite", l_Url_0.CATALOG_URL, v5, v6), "DELETE", {
        postBody = l_HttpService_0:JSONEncode({})
    });
end;