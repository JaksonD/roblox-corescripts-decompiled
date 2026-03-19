local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.AccountPinError);
local v3 = require(l_Modules_0.LuaApp.Http.Requests.PostUnlockAccountPin);
local v4 = require(l_Modules_0.LuaApp.Promise);
local l_Enum_0 = v2.Enum;
return function(v6, v7) --[[ Line: 10 ]]
    -- upvalues: v3 (copy), v4 (copy), l_Enum_0 (copy), l_HttpService_0 (copy)
    return function(_) --[[ Line: 11 ]]
        -- upvalues: v3 (ref), v6 (copy), v7 (copy), v4 (ref), l_Enum_0 (ref), l_HttpService_0 (ref)
        return v3(v6, v7):andThen(function(v9) --[[ Line: 13 ]]
            return v9.responseBody;
        end):catch(function(v10) --[[ Line: 16 ]]
            -- upvalues: v4 (ref), l_Enum_0 (ref), l_HttpService_0 (ref)
            if not v10.Body then
                return v4.reject(l_Enum_0.Default);
            else
                local l_code_0 = l_HttpService_0:JSONDecode(v10.Body).errors[1].code;
                local v12 = l_Enum_0.fromRawValue(l_code_0);
                return v4.reject(v12 or l_Enum_0.Default);
            end;
        end);
    end;
end;