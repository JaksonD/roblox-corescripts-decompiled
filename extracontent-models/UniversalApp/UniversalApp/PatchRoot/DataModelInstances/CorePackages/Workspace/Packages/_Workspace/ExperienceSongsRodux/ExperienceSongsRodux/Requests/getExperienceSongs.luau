local l_Parent_0 = script:FindFirstAncestor("ExperienceSongsRodux").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v2, v3, v4) --[[ Line: 9 ]]
    -- upvalues: l_Url_0 (copy)
    if v3 == "" then
        error("GetExperienceSongs: universeId cannot be an empty string");
    end;
    local v5 = if v4 and v4 >= 0 and v4 <= 100 then v4 else 20;
    return v2(string.format("%smusic-discovery/v1/experience-songs?universe_id=%s&limit=%s", l_Url_0.APIS_URL, tostring(v3), (tostring(v5))), "GET");
end;