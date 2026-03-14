local v0 = {
    new = function() --[[ Line: 16 ]] --[[ Name: new ]]
        return {};
    end
};
v0.fromGameCache = function(v1) --[[ Line: 21 ]] --[[ Name: fromGameCache ]]
    -- upvalues: v0 (copy)
    local v2 = v0.new();
    v2.universeId = v1.UniverseId;
    v2.placeId = v1.PlaceId;
    v2.name = v1.Name;
    v2.playerCount = v1.PlayerCount;
    v2.imageToken = v1.ImageToken;
    v2.totalUpVotes = v1.VoteData.UpVotes;
    v2.totalDownVotes = v1.VoteData.DownVotes;
    return v2;
end;
v0.fromJsonData = function(v3) --[[ Line: 33 ]] --[[ Name: fromJsonData ]]
    -- upvalues: v0 (copy)
    local v4 = v0.new();
    v4.universeId = v3.universeId;
    v4.placeId = v3.placeId;
    v4.name = v3.name;
    v4.playerCount = v3.playerCount;
    v4.imageToken = v3.imageToken;
    v4.totalUpVotes = v3.totalUpVotes;
    v4.totalDownVotes = v3.totalDownVotes;
    return v4;
end;
return v0;