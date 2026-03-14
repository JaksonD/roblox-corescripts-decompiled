local _ = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.Http).Url;
return function(v3, v4) --[[ Line: 11 ]]
    -- upvalues: l_Url_0 (copy)
    return v3(string.format("%s/v1/%s/metadata?appType=PlayerApplication", l_Url_0.AUTH_URL, v4), "GET", {
        headers = {
            Referer = "https://roblox.cn/"
        }
    });
end;