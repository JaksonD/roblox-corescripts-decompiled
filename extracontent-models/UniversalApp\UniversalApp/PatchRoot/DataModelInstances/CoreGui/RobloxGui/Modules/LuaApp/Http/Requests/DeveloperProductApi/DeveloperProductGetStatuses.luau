local l_CorePackages_0 = game:GetService("CorePackages");
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.Http).Url;
return function(v2, v3, v4) --[[ Line: 4 ]]
    -- upvalues: l_Url_0 (copy)
    local v5 = l_Url_0:makeQueryString({
        playerId = v3, 
        placeId = v4, 
        status = "pending", 
        locationType = "ExperienceDetailPage"
    });
    return v2(string.format("%sdeveloper-products/v1/game-transactions?%s", l_Url_0.APIS_URL, v5), "GET");
end;