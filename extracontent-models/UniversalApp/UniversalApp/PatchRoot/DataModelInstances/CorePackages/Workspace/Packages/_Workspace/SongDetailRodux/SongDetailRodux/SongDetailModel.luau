local l_Parent_0 = script:FindFirstAncestor("SongDetailRodux").Parent;
local _ = require(l_Parent_0.DiscoveryTypes);
local v2 = {};
local v3 = require(l_Parent_0.Result);
v2.fromJsonData = function(v4) --[[ Line: 29 ]] --[[ Name: fromJsonData ]]
    -- upvalues: v3 (copy)
    if type(v4.assetId) ~= "number" and type(v4.assetId) ~= "string" then
        return v3.error("SongDetailModel.fromJsonData expects assetId to be a number or a string");
    elseif type(v4.name) ~= "string" or v4.name == "" then
        return v3.error("SongDetailModel.fromJsonData expects name to be a non-empty string");
    elseif type(v4.artistName) ~= "string" or v4.artistName == "" then
        return v3.error("SongDetailModel.fromJsonData expects artistName to be a non-empty string");
    elseif type(v4.creatorName) ~= "string" or v4.creatorName == "" then
        return v3.error("SongDetailModel.fromJsonData expects creatorName to be a non-empty string");
    elseif type(v4.creatorId) ~= "number" and type(v4.creatorId) ~= "string" then
        return v3.error("SongDetailModel.fromJsonData expects creatorId to be a number or a string");
    else
        local v5 = {
            assetId = tostring(v4.assetId), 
            artistName = v4.artistName, 
            creatorId = tostring(v4.creatorId), 
            creatorName = v4.creatorName, 
            name = v4.name
        };
        if typeof(v4.description) == "string" and v4.description ~= "" then
            v5.description = v4.description;
        end;
        if type(v4.genre) == "string" and v4.genre ~= "" then
            v5.genre = v4.genre;
        end;
        if type(v4.durationSeconds) == "number" then
            v5.durationSeconds = v4.durationSeconds;
        end;
        if type(v4.uploadedTime) == "string" and v4.uploadedTime ~= "" then
            v5.uploadedTime = v4.uploadedTime;
        end;
        if type(v4.songMetrics) == "table" then
            v5.songMetrics = {
                artistSongsCount = if type(v4.songMetrics.artistSongsCount) == "number" then v4.songMetrics.artistSongsCount else nil, 
                experiencesPlayed = if type(v4.songMetrics.experiencesPlayed) == "number" then v4.songMetrics.experiencesPlayed else nil, 
                monthlyListeners = if type(v4.songMetrics.monthlyListeners) == "number" then v4.songMetrics.monthlyListeners else nil
            };
        end;
        return v3.success(v5);
    end;
end;
return v2;