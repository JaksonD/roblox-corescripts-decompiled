local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_CorePackages_0.Workspace.Packages.Http);
local v4 = require(l_Modules_0.LuaApp.Http.Url);
local l_FFlagEnableLogoutV3_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLogoutV3;
local l_HttpService_0 = game:GetService("HttpService");
return function(v7, v8, v9, v10) --[[ Line: 10 ]]
    -- upvalues: v4 (copy), l_FFlagEnableLogoutV3_0 (copy), l_HttpService_0 (copy)
    local v11 = string.format("%sv1/logout", v4.AUTH_URL);
    if l_FFlagEnableLogoutV3_0 then
        v11 = string.format("%sv3/logout", v4.AUTH_URL);
        local v12 = {};
        if v8 then
            v12.logoutReason = v8;
        end;
        if v9 then
            v12.url = v9;
        end;
        if v10 then
            v12.userId = v10;
        end;
        return v7(v11, "POST", {
            postBody = l_HttpService_0:JSONEncode(v12), 
            maxRetryCount = 0
        });
    else
        return v7(v11, "POST", {
            postBody = "", 
            maxRetryCount = 0
        });
    end;
end;