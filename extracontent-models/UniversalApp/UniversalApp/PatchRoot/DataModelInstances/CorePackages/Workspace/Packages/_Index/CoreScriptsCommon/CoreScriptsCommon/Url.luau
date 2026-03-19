local v0 = {};
local l_ContentProvider_0 = game:GetService("ContentProvider");
local _ = function(v2) --[[ Line: 7 ]] --[[ Name: getBaseDomain ]]
    local _, v4 = v2:find("%.");
    local v5 = v2:sub(v4 + 1);
    if v5:sub(-1) ~= "/" then
        v5 = v5 .. "/";
    end;
    return v5;
end;
local l_BaseUrl_0 = l_ContentProvider_0.BaseUrl;
local v8, v9 = l_BaseUrl_0:find("%.");
local v10 = l_BaseUrl_0:sub(v9 + 1);
if v10:sub(-1) ~= "/" then
    v10 = v10 .. "/";
end;
local l_v10_0 = v10;
v8 = string.format("https://games.%s", l_v10_0);
v9 = string.format("https://apis.rcs.%s", l_v10_0);
v10 = string.format("https://apis.%s", l_v10_0);
local v12 = string.format("https://accountsettings.%s", l_v10_0);
local v13 = string.format("https://gameinternationalization.%s", l_v10_0);
local v14 = string.format("https://locale.%s", l_v10_0);
local v15 = string.format("https://users.%s", l_v10_0);
local v16 = string.format("https://catalog.%s", l_v10_0);
local v17 = {
    GAME_URL = v8, 
    RCS_URL = v9, 
    APIS_URL = v10, 
    ACCOUNT_SETTINGS_URL = v12, 
    GAME_INTERNATIONALIZATION_URL = v13, 
    LOCALE_URL = v14, 
    ROLES_URL = v15, 
    CATALOG_URL = v16
};
setmetatable(v0, {
    __newindex = function(_, _, _) --[[ Line: 41 ]] --[[ Name: __newindex ]]

    end, 
    __index = function(_, v22) --[[ Line: 42 ]] --[[ Name: __index ]]
        -- upvalues: v17 (copy)
        return v17[v22];
    end
});
return v0;