local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v4 = require(l_Modules_0.LuaApp.Analytics.Events.reportEphemeralCounter);
local l_UserAgreementsCounterNames_0 = require(l_CorePackages_0.Workspace.Packages.UserAgreements).UserAgreementsCounterNames;
game:DefineFastInt("LuaFetchUpdatedUserAgreementsErrorsThrottling", 10000);
return function(v6, v7) --[[ Line: 14 ]]
    -- upvalues: v2 (copy), l_Logging_0 (copy), v4 (copy), l_UserAgreementsCounterNames_0 (copy)
    local v8 = v2.fromString("apis:user-agreements/v1/agreements-resolution-signup/Web");
    return v6(v8(), "GET"):andThen(function(v9) --[[ Line: 16 ]]
        if v9.responseCode ~= 200 then
            return;
        else
            return v9.responseBody;
        end;
    end, function(v10) --[[ Line: 22 ]]
        -- upvalues: l_Logging_0 (ref), v8 (copy), v4 (ref), l_UserAgreementsCounterNames_0 (ref), v7 (copy)
        local v11 = tostring(v10.HttpError);
        local v12 = tostring(v10.isJSONValid);
        l_Logging_0.warn(string.format("Url: %s, Status: %s, isJSONValid: %s", v8, v11, v12));
        v4(l_UserAgreementsCounterNames_0.FetchAgreementsHttpRequestFailure, 1);
        if v7 ~= nil then
            local v13 = {
                url = v8, 
                statusCode = v10.StatusCode, 
                errorMessage = v10.Body
            };
            v7.InfluxDb:reportSeries(script.Name, v13, game:GetFastInt("LuaFetchUpdatedUserAgreementsErrorsThrottling"));
        end;
    end);
end;