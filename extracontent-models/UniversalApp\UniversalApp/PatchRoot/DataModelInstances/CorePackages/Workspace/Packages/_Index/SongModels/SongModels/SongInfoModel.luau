local l_Parent_0 = script:FindFirstAncestor("SongModels").Parent;
local v1 = require(l_Parent_0.Result);
local _ = require(l_Parent_0.DiscoveryTypes);
local v5 = {
    fromBaseJson = function(v3) --[[ Line: 10 ]] --[[ Name: fromBaseJson ]]
        -- upvalues: v1 (copy)
        if type(v3.assetId) ~= "number" and type(v3.assetId) ~= "string" then
            return v1.error("SongInfoModel expects assetId to be a number or a string");
        elseif type(v3.title) ~= "string" or v3.title == "" then
            return v1.error("SongInfoModel expects title to be a non-empty string");
        elseif type(v3.artist) ~= "string" or v3.artist == "" then
            return v1.error("SongInfoModel expects artist to be a non-empty string");
        else
            local v4 = {
                assetId = tostring(v3.assetId), 
                title = v3.title, 
                artist = v3.artist
            };
            if type(v3.albumArtAssetId) == "number" or type(v3.albumArtAssetId) == "string" then
                v4.albumArtAssetId = tostring(v3.albumArtAssetId);
            end;
            if type(v3.duration) == "number" then
                v4.duration = v3.duration;
            end;
            if type(v3.album) == "string" and v3.album ~= "" then
                v4.album = v3.album;
            end;
            if type(v3.isPrivate) == "boolean" then
                v4.isPrivate = v3.isPrivate;
            end;
            return v1.success(v4);
        end;
    end
};
v5.fromExploreApi = function(v6) --[[ Line: 46 ]] --[[ Name: fromExploreApi ]]
    -- upvalues: v5 (copy)
    return v5.fromBaseJson(v6);
end;
return v5;