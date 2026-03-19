local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_Modules_0.LuaApp.Http.Url);
local v5 = require(l_Modules_0.LuaApp.Flags.GetFStringApisCdnUrl);
local v6 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppAutocompleteIXPConfig);
local v7 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppDisableACGetSuggestionCDN);
local function _(v8) --[[ Line: 14 ]]
    -- upvalues: v3 (copy)
    return v3.Dictionary.join(v8, {
        autocompleteUseCDN = v3.None, 
        autocompleteUseGetMethodCDN = v3.None, 
        autocompletePreloadedCache = v3.None, 
        isAvatarAutocompleteEnabled = v3.None
    });
end;
return function(v10, v11, v12) --[[ Line: 47 ]]
    -- upvalues: v6 (copy), v3 (copy), l_HttpService_0 (copy), v5 (copy), v7 (copy), v4 (copy)
    local v13 = nil;
    if v6() then
        local v14 = v12 or {};
        v14 = v3.Dictionary.join(v14, {
            autocompleteUseCDN = v3.None, 
            autocompleteUseGetMethodCDN = v3.None, 
            autocompletePreloadedCache = v3.None, 
            isAvatarAutocompleteEnabled = v3.None
        });
        v13 = l_HttpService_0:JSONEncode(v14);
        v13 = if v13 ~= "[]" then l_HttpService_0:UrlEncode(v13) else "";
    end;
    local v15 = v5();
    if v7() then
        v15 = v4.APIS_URL;
    end;
    local v16 = l_HttpService_0:UrlEncode(v11);
    local v17 = string.format("%sgames-autocomplete/v1/get-suggestion/%s", v15, v16);
    local _ = nil;
    local v19 = v17 .. if v13 ~= nil and v13 ~= "" then "?args=" .. v13 else "";
    if string.len(v19) > 2000 then
        warn("AutocompleteGameGetSuggestion URL max length exceeded", v19);
        v19 = v17;
    end;
    return v10(v19, "GET", {
        timeout = 5000
    });
end;