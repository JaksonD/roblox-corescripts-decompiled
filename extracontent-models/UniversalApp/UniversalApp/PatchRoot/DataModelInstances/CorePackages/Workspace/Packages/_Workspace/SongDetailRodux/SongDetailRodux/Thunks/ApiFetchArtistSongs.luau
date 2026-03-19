local l_script_FirstAncestor_0 = script:FindFirstAncestor("SongDetailRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local v3 = require(l_Parent_0.Promise);
local l_AddSongs_0 = require(l_Parent_0.SongInfosRodux).AddSongs;
local v5 = require(l_Parent_0.NextDataExpirationTimeRodux);
local l_ExpirationTimeNamespace_0 = v5.ExpirationTimeNamespace;
local l_NextDataExpirationTimeReducer_0 = v5.NextDataExpirationTimeReducer;
local l_SetNextDataExpirationTime_0 = v5.SetNextDataExpirationTime;
local v9 = require(l_script_FirstAncestor_0.Actions.AddArtistSongs);
local v10 = require(l_script_FirstAncestor_0.Reducers.ArtistSongReducer);
local v11 = require(l_script_FirstAncestor_0.Requests.getArtistSongs);
local l_SongInfoModel_0 = require(l_Parent_0.SongModels).SongInfoModel;
local v13 = require(l_Parent_0.SharedFlags);
local l_FFlagEnableTopSongsSort_0 = v13.FFlagEnableTopSongsSort;
local l_FIntSongDetailsRefreshIntervalSeconds_0 = v13.FIntSongDetailsRefreshIntervalSeconds;
local v16 = 0;
if l_FFlagEnableTopSongsSort_0 then
    v16 = tonumber(l_FIntSongDetailsRefreshIntervalSeconds_0) or 0;
end;
return {
    KeyMapper = function(v17) --[[ Line: 34 ]]
        return (("luaapp.musicdiscovery.artistsongs.%*"):format(v17));
    end, 
    GetFetchingStatus = function(v18, v19) --[[ Line: 42 ]] --[[ Name: GetFetchingStatus ]]
        -- upvalues: l_PerformFetch_0 (copy)
        return l_PerformFetch_0.GetStatus(v18, (("luaapp.musicdiscovery.artistsongs.%*"):format(v19)));
    end, 
    Fetch = function(v20, v21) --[[ Line: 46 ]]
        -- upvalues: l_PerformFetch_0 (copy), l_ExpirationTimeNamespace_0 (copy), l_NextDataExpirationTimeReducer_0 (copy), v10 (copy), v3 (copy), v11 (copy), l_SongInfoModel_0 (copy), l_AddSongs_0 (copy), v9 (copy), v16 (ref), l_SetNextDataExpirationTime_0 (copy)
        local v22 = ("luaapp.musicdiscovery.artistsongs.%*"):format(v21);
        return l_PerformFetch_0.Single(v22, function(v23) --[[ Line: 48 ]]
            -- upvalues: l_ExpirationTimeNamespace_0 (ref), l_NextDataExpirationTimeReducer_0 (ref), v22 (copy), v10 (ref), v21 (copy), v3 (ref), v11 (ref), v20 (copy), l_SongInfoModel_0 (ref), l_AddSongs_0 (ref), v9 (ref), v16 (ref), l_SetNextDataExpirationTime_0 (ref)
            local v24 = v23:getState();
            local l_SongDetailPage_0 = l_ExpirationTimeNamespace_0.SongDetailPage;
            local v26 = (v24.Personalization[l_NextDataExpirationTimeReducer_0.key][l_SongDetailPage_0] or {})[v22];
            local v27 = v24.Personalization[v10.key][v21] or nil;
            if v27 ~= nil and v26 ~= nil and tick() < v26 then
                return v3.resolve(v27);
            else
                return v11(v20, v21, 100):andThen(function(v28) --[[ Line: 58 ]]
                    -- upvalues: l_SongInfoModel_0 (ref), v23 (copy), l_AddSongs_0 (ref), v9 (ref), v21 (ref), v16 (ref), l_SetNextDataExpirationTime_0 (ref), v22 (ref), l_SongDetailPage_0 (copy)
                    local v29 = v28 and v28.responseBody and v28.responseBody.songs or {};
                    local v30 = {};
                    local v31 = {};
                    for _, v33 in v29 do
                        l_SongInfoModel_0.fromBaseJson(v33):match(function(v34) --[[ Line: 65 ]]
                            -- upvalues: v31 (copy), v30 (copy)
                            table.insert(v31, v34.assetId);
                            v30[v34.assetId] = v34;
                        end):matchError(function(v35) --[[ Line: 69 ]]
                            warn((("ApiFetchArtistSongs could not parse song: %*"):format(v35)));
                        end);
                    end;
                    if next(v30) then
                        v23:dispatch(l_AddSongs_0(v30));
                    end;
                    v23:dispatch(v9({
                        [v21] = v31
                    }));
                    local v36 = math.floor(tick() + v16);
                    v23:dispatch(l_SetNextDataExpirationTime_0(v22, v36, l_SongDetailPage_0));
                end, function(_) --[[ Line: 81 ]]

                end);
            end;
        end);
    end
};