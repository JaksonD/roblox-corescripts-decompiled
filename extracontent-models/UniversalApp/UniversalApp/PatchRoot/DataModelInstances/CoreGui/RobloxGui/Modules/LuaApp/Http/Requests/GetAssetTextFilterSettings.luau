local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
local v2 = require(l_Modules_0.LuaApp.Http.UrlBuilder).new({
    base = v1.APIS_URL, 
    path = "asset-text-filter-settings/public/universe/{universeId}"
});
return function(v3, v4) --[[ Line: 22 ]]
    -- upvalues: v2 (copy)
    assert(type(v4) == "string", "GetAssetTextFilterSettings request expects universeId to be a string");
    return v3(v2({
        universeId = v4
    }), "GET");
end;