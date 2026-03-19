local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_Parent_0.ArgCheck);
local l_Url_0 = require(l_Parent_0.Http).Url;
local _ = require(l_script_FirstAncestor_0.Enums.AbuseVector);
return function(v6, v7, v8) --[[ Line: 12 ]]
    -- upvalues: v3 (copy), l_LocalizationService_0 (copy), l_Url_0 (copy)
    v3.assert(v7, "abuseVector is required");
    v3.isType(v7, "string", "fetchBeduiData expects abuseVector as a string");
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    return v6(("%*abuse-reporting/v1/dynamic-config?abuseVector=%*&locale=%*&entryPoint=ua&targetId=%*"):format(l_Url_0.APIS_URL, v7, l_RobloxLocaleId_0, v8), "GET");
end;