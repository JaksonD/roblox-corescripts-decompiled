local l_CorePackages_0 = game:GetService("CorePackages");
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.Http).Url;
local v2 = require(l_CorePackages_0.Packages.UrlBuilder).UrlBuilder.new({
    base = l_Url_0.AUTH_URL, 
    path = "v1/validators/recommendedUsernameFromDisplayName", 
    query = "DisplayName={displayName}&BirthDay={birthday}"
});
return function(v3, v4, v5) --[[ Line: 16 ]]
    -- upvalues: v2 (copy)
    return v3(v2({
        displayName = v4, 
        birthday = v5
    }), "GET", {
        maxRetryCount = 0
    });
end;