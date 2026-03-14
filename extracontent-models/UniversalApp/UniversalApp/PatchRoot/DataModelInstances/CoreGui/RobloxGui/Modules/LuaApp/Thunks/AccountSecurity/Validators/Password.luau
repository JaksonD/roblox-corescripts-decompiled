local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Requests.PostPasswordValid);
local v2 = {
    [1] = "Feature.AccountSecurityPrompt.Message.Error.PasswordValidation.WeakPassword", 
    [2] = "Feature.AccountSecurityPrompt.Message.Error.PasswordValidation.ShortPassword", 
    [3] = "Feature.AccountSecurityPrompt.Message.Error.PasswordValidation.PasswordSameAsUsername", 
    [4] = "Feature.AccountSecurityPrompt.Message.Error.PasswordValidation.ForbiddenPassword", 
    [5] = "Feature.AccountSecurityPrompt.Message.Error.PasswordValidation.DumbStrings"
};
local v3 = {};
for _, v5 in pairs(v2) do
    v3[v5] = v5;
end;
return {
    localizationKeys = v3, 
    validator = function(v6, v7, v8) --[[ Line: 20 ]]
        -- upvalues: v1 (copy), v2 (copy)
        return function(v9) --[[ Line: 21 ]]
            -- upvalues: v1 (ref), v6 (copy), v8 (copy), v2 (ref), v7 (copy)
            return v1(v6, v8, v9):andThen(function(v10) --[[ Line: 23 ]]
                -- upvalues: v2 (ref), v7 (ref)
                local v11 = v2[v10 and v10.responseBody and v10.responseBody.code];
                if v11 ~= nil then
                    return v7[v11];
                else
                    return nil;
                end;
            end):catch(function(_) --[[ Line: 34 ]]
                return nil;
            end);
        end;
    end
};