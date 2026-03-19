local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
return function(v3, v4, v5) --[[ Line: 5 ]]
    -- upvalues: v2 (copy), l_HttpService_0 (copy)
    local v6 = v2.fromString("apis:sharelinks/v1/get-metadata");
    local v7 = l_HttpService_0:JSONEncode({
        linkId = v4, 
        linkType = v5
    });
    return v3(v6(), "POST", {
        postBody = v7
    });
end;