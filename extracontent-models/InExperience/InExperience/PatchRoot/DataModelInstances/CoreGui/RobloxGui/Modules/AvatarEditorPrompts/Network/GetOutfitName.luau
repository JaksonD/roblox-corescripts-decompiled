local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v3 = require(l_RobloxGui_0.Modules.Common.httpRequest);
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.Http).Url;
local v5 = v3(l_HttpRbxApiService_0);
return function(v6) --[[ Line: 13 ]]
    -- upvalues: l_Url_0 (copy), v5 (copy)
    local v7 = string.format("%s/v3/outfits/%s/details", l_Url_0.AVATAR_URL, (tostring(v6)));
    return v5(v7, "GET"):andThen(function(v8) --[[ Line: 16 ]]
        return v8.responseBody.name;
    end);
end;