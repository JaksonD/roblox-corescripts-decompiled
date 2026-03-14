local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v3 = require(l_Modules_0.LuaApp.Enum.UsernameValidationContext);
if require(l_Modules_0.LuaApp.Flags.GetFFlagUsePackageUsernameValidation)() then
    local l_CorePackages_0 = game:GetService("CorePackages");
    return require(l_CorePackages_0.Workspace.Packages.AuthCommon).Http.Requests.PostUsernameValid;
else
    return function(v5, v6, v7, v8) --[[ Line: 17 ]]
        -- upvalues: v3 (copy), v2 (copy), l_HttpService_0 (copy)
        if not v8 then
            v8 = v3.Unknown;
        end;
        assert(type(v6) == "string", "invalid username");
        assert(type(v7) == "string", "invalid birthday");
        local v9 = v2.fromString("auth:v2/usernames/validate");
        local v10 = l_HttpService_0:JSONEncode({
            username = v6, 
            birthday = v7, 
            context = v8
        });
        return v5(v9(), "POST", {
            postBody = v10
        });
    end;
end;