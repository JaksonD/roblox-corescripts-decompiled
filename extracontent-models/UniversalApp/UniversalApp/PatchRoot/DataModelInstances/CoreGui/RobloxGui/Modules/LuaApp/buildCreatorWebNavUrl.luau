local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v2 = require(script.Parent.buildRobloxWebNavQueryParams);
return function(v3) --[[ Line: 11 ]] --[[ Name: buildCreatorWebNavUrl ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.addQueryString(v1.static.creatorHub(), v2(v3));
end;