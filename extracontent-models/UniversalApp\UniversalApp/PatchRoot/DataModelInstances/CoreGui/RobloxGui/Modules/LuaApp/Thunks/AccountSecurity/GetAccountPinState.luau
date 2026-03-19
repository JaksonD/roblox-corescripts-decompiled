local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.AccountPinError);
local v3 = require(l_Modules_0.LuaApp.Promise);
local v4 = require(l_Modules_0.LuaApp.Http.Requests.GetAccountPinState);
local l_Enum_0 = v2.Enum;
return function(v6) --[[ Line: 10 ]]
    -- upvalues: v4 (copy), v3 (copy), l_Enum_0 (copy), l_HttpService_0 (copy)
    return function(_) --[[ Line: 11 ]]
        -- upvalues: v4 (ref), v6 (copy), v3 (ref), l_Enum_0 (ref), l_HttpService_0 (ref)
        return v4(v6):andThen(function(v8) --[[ Line: 13 ]]
            return v8.responseBody;
        end):catch(function(v9) --[[ Line: 16 ]]
            -- upvalues: v3 (ref), l_Enum_0 (ref), l_HttpService_0 (ref)
            if not v9.Body then
                return v3.reject(l_Enum_0.Default);
            else
                local l_code_0 = l_HttpService_0:JSONDecode(v9.Body).errors[1].code;
                local v11 = l_Enum_0.fromRawValue(l_code_0);
                return v3.reject(v11 or l_Enum_0.Default);
            end;
        end);
    end;
end;