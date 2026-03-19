local l_HttpService_0 = game:GetService("HttpService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.LocalizationContext);
local v4 = require(l_Modules_0.LuaApp.Http.Url);
local v5 = require(l_Modules_0.AvatarExperience.Flags.GetAXAutocompleteUseCDN);
local v6 = require(l_Modules_0.LuaApp.Flags.GetFStringApisCdnUrl);
return function(v7, v8) --[[ Line: 22 ]]
    -- upvalues: v5 (copy), v6 (copy), v4 (copy), l_LocalizationService_0 (copy), v3 (copy), l_HttpService_0 (copy)
    local v9 = if v5() then v6() else v4.APIS_URL;
    local v10 = string.format("%sautocomplete-avatar/v2/suggest", v9);
    local v11 = nil;
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    if l_RobloxLocaleId_0 ~= nil then
        v11 = v3.getBaseLanguage(l_RobloxLocaleId_0);
    end;
    if v11 == nil then
        v11 = "en";
    elseif v11 ~= "en" then
        v11 = v11 .. ",en";
    end;
    return v7(v10 .. "?limit=10&prefix=" .. l_HttpService_0:UrlEncode(v8) .. "&lang=" .. l_HttpService_0:UrlEncode(v11), "GET", {
        timeout = 5000
    });
end;