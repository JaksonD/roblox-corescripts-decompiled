local l_CorePackages_0 = game:GetService("CorePackages");
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.Http).Url;
return function(v2, v3, v4) --[[ Line: 18 ]]
    -- upvalues: l_Url_0 (copy)
    local v5 = l_Url_0:makeQueryString({
        gamePassIds = table.concat(v3, ","), 
        format = "png", 
        size = v4, 
        isCircular = true
    });
    return v2(string.format("%sv1/game-passes?%s", l_Url_0.THUMBNAILS_URL, v5), "GET");
end;