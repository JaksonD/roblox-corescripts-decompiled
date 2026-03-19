local l_script_FirstAncestor_0 = script:FindFirstAncestor("SongDetailRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_Parent_0.NextDataExpirationTimeRodux);
local l_ExpirationTimeNamespace_0 = v4.ExpirationTimeNamespace;
local l_NextDataExpirationTimeReducer_0 = v4.NextDataExpirationTimeReducer;
local l_SetNextDataExpirationTime_0 = v4.SetNextDataExpirationTime;
local v8 = require(l_Parent_0.SharedFlags);
local l_FFlagEnableTopSongsSort_0 = v8.FFlagEnableTopSongsSort;
local l_FIntSongDetailsRefreshIntervalSeconds_0 = v8.FIntSongDetailsRefreshIntervalSeconds;
local v11 = 0;
if l_FFlagEnableTopSongsSort_0 then
    v11 = tonumber(l_FIntSongDetailsRefreshIntervalSeconds_0) or 0;
end;
local l_AddGames_0 = require(l_Parent_0.GameInfosRodux).AddGames;
local l_GameInfoModel_0 = require(l_Parent_0.GameModels).GameInfoModel;
local v14 = require(l_script_FirstAncestor_0.Actions.AddSongExperiences);
local v15 = require(l_script_FirstAncestor_0.Requests.getSongExperiences);
local v16 = require(l_script_FirstAncestor_0.Reducers.SongExperiencesReducer);
return {
    KeyMapper = function(v17) --[[ Line: 34 ]]
        return (("luaapp.musicdiscovery.songexperiences.%*"):format(v17));
    end, 
    GetFetchingStatus = function(v18, v19) --[[ Line: 42 ]] --[[ Name: GetFetchingStatus ]]
        -- upvalues: l_PerformFetch_0 (copy)
        return l_PerformFetch_0.GetStatus(v18, (("luaapp.musicdiscovery.songexperiences.%*"):format(v19)));
    end, 
    Fetch = function(v20, v21) --[[ Line: 46 ]]
        -- upvalues: l_PerformFetch_0 (copy), l_ExpirationTimeNamespace_0 (copy), l_NextDataExpirationTimeReducer_0 (copy), v16 (copy), v3 (copy), v15 (copy), l_GameInfoModel_0 (copy), l_AddGames_0 (copy), v14 (copy), v11 (ref), l_SetNextDataExpirationTime_0 (copy)
        return l_PerformFetch_0.Single(("luaapp.musicdiscovery.songexperiences.%*"):format(v21), function(v22) --[[ Line: 47 ]]
            -- upvalues: v21 (copy), l_ExpirationTimeNamespace_0 (ref), l_NextDataExpirationTimeReducer_0 (ref), v16 (ref), v3 (ref), v15 (ref), v20 (copy), l_GameInfoModel_0 (ref), l_AddGames_0 (ref), v14 (ref), v11 (ref), l_SetNextDataExpirationTime_0 (ref)
            local v23 = v22:getState();
            local v24 = ("luaapp.musicdiscovery.songexperiences.%*"):format(v21);
            local l_SongDetailPage_0 = l_ExpirationTimeNamespace_0.SongDetailPage;
            local v26 = (v23.Personalization[l_NextDataExpirationTimeReducer_0.key][l_SongDetailPage_0] or {})[v24] or nil;
            local v27 = v23.Personalization[v16.key][v21] or nil;
            if v27 and v26 and tick() < v26 then
                return v3.resolve(v27);
            else
                return v15(v20, v21, 100):andThen(function(v28) --[[ Line: 59 ]]
                    -- upvalues: l_GameInfoModel_0 (ref), v22 (copy), l_AddGames_0 (ref), v14 (ref), v21 (ref), v11 (ref), l_SetNextDataExpirationTime_0 (ref), v24 (copy), l_SongDetailPage_0 (copy)
                    local v29 = v28 and v28.responseBody and v28.responseBody.experiences or {};
                    local v30 = {};
                    local v31 = {};
                    for _, v33 in ipairs(v29) do
                        l_GameInfoModel_0.fromMusicDiscoveryApi(v33):match(function(v34) --[[ Line: 66 ]]
                            -- upvalues: v31 (copy), v30 (copy)
                            v31[v34.universeId] = v34;
                            table.insert(v30, v34.universeId);
                        end):matchError(function(v35) --[[ Line: 70 ]]
                            warn((("ApiFetchSongExperiences could not parse experience: %*"):format(v35)));
                        end);
                    end;
                    if next(v31) then
                        v22:dispatch(l_AddGames_0(v31));
                    end;
                    v22:dispatch(v14({
                        [v21] = v30
                    }));
                    local v36 = math.floor(tick() + v11);
                    v22:dispatch(l_SetNextDataExpirationTime_0(v24, v36, l_SongDetailPage_0));
                end, function(_) --[[ Line: 82 ]]

                end);
            end;
        end);
    end
};