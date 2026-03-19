local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Requests.GetLocale);
return function(v2) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    return v1(v2):andThen(function(v3) --[[ Line: 7 ]]
        local v4 = v3[1];
        local v5 = nil;
        local v6 = nil;
        local v7 = nil;
        if v4 then
            v6 = v4.generalExperience and v4.generalExperience.locale;
            v5 = v4.signupAndLogin.locale;
            v7 = v4.ugc.locale;
        end;
        return {
            signupAndLoginLocale = v5, 
            generalExperienceLocale = v6, 
            ugcLocale = v7
        };
    end);
end;