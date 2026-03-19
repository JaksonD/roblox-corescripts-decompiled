local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v2, v3) --[[ Line: 6 ]]
    -- upvalues: l_Url_0 (copy)
    return v2(string.format("%sv1/sponsored-games/click", l_Url_0.ADS_URL), "POST", {
        postBody = "\"" .. v3 .. "\""
    });
end;