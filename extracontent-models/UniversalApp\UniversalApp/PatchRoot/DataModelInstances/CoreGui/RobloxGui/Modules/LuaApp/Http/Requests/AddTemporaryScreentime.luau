local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Modules_0.LuaApp.Http.Url);
return function(v3, v4) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), l_HttpService_0 (copy)
    return v3(v2.APIS_URL .. "parental-controls-api/v1/parental-controls/add-temporary-screentime", "POST", {
        postBody = l_HttpService_0:JSONEncode({
            minutes = v4
        })
    });
end;