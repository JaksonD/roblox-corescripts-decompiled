local l_Parent_0 = script:FindFirstAncestor("SongDetailRodux").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local function v6(v2) --[[ Line: 9 ]] --[[ Name: generateQueryParams ]]
    local v3 = {};
    for _, v5 in ipairs(v2) do
        table.insert(v3, "asset_ids=" .. v5);
    end;
    return "?" .. table.concat(v3, "&");
end;
return function(v7, v8) --[[ Line: 17 ]]
    -- upvalues: v6 (copy), l_Url_0 (copy)
    assert(type(v8) == "table", "BatchGetSongDetail request expects songIds to be a table");
    if #v8 == 0 or #v8 > 20 then
        error((("BatchGetSongDetail request expects songIds count between 1-%*"):format(20)));
    end;
    local v9 = v6(v8);
    return v7(string.format("%smusic-discovery/v1/batch-song-details%s", l_Url_0.APIS_URL, v9), "GET");
end;