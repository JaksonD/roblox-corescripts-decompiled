local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.Promise);
local v4 = require(l_Modules_0.LuaApp.Http.Requests.LoginRequests);
local v5 = require(l_Modules_0.LuaApp.Models.Authentication.LoginResult);
local v6 = require(l_Modules_0.LuaApp.Enum.LoginErrorCodeSSO);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v8 = require(l_Modules_0.LuaApp.Components.Authentication.Logger);
return function(v9) --[[ Line: 16 ]] --[[ Name: LoginSingleSignOn ]]
    -- upvalues: l_PerformFetch_0 (copy), v4 (copy), v5 (copy), v3 (copy), v8 (copy), v6 (copy), l_HttpService_0 (copy)
    return l_PerformFetch_0.Single(script.Name, function(_) --[[ Line: 17 ]]
        -- upvalues: v4 (ref), v9 (copy), v5 (ref), v3 (ref), v8 (ref), v6 (ref), l_HttpService_0 (ref)
        return v4.singleSignOnLogin(v9):andThen(function(v11) --[[ Line: 18 ]]
            -- upvalues: v5 (ref), v3 (ref), v8 (ref), v6 (ref)
            if v11 and v11[1] then
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 20 ]]
                    -- upvalues: v5 (ref), v11 (copy)
                    return v5.fromJsonData(v11[1]);
                end);
                if l_status_0 then
                    return v3.resolve(l_result_0);
                else
                    v8:warning(string.format("Single sign on loginResult error: %s", (tostring(l_result_0))));
                    return v3.reject({
                        errorCode = v6.AuthError
                    });
                end;
            else
                v8:warning(string.format("Single sign on result error: %s", (tostring(v11))));
                return v3.reject({
                    errorCode = v6.AuthError
                });
            end;
        end, function(v14) --[[ Line: 37 ]]
            -- upvalues: v8 (ref), l_HttpService_0 (ref), v6 (ref), v3 (ref)
            v8:warning(string.format("Single sign on login error: %s", (tostring(v14))));
            if v14 and v14.Body then
                local v15 = l_HttpService_0:JSONDecode(v14.Body);
                local v16 = if v15.errors[1] then v15.errors[1].code else v6.AuthError;
                local v17 = if v15.errors[1] then v15.errors[1].userFacingMessage else nil;
                return v3.reject({
                    errorCode = v16, 
                    userFacingMessage = v17
                });
            else
                return v3.reject(v14);
            end;
        end);
    end);
end;