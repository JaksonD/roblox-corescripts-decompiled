local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExperienceSongsRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local v3 = require(l_Parent_0.Promise);
local l_AddSongs_0 = require(l_Parent_0.SongInfosRodux).AddSongs;
local v5 = require(l_Parent_0.NextDataExpirationTimeRodux);
local l_ExpirationTimeNamespace_0 = v5.ExpirationTimeNamespace;
local l_NextDataExpirationTimeReducer_0 = v5.NextDataExpirationTimeReducer;
local l_SetNextDataExpirationTime_0 = v5.SetNextDataExpirationTime;
local v9 = require(l_script_FirstAncestor_0.Actions.AddExperienceSongs);
local v10 = require(l_script_FirstAncestor_0.Reducers.ExperienceSongsReducer);
local v11 = require(l_script_FirstAncestor_0.Requests.getExperienceSongs);
local l_SongInfoModel_0 = require(l_Parent_0.SongModels).SongInfoModel;
local v13 = tonumber(settings():GetFVariable("LuaAppGameDetailsRefreshIntervalInSeconds")) or 0;
return {
    KeyMapper = function(v14) --[[ Line: 27 ]]
        return (("luaapp.musicdiscovery.experiencesongs.%*"):format(v14));
    end, 
    Fetch = function(v15, v16) --[[ Line: 35 ]]
        -- upvalues: l_PerformFetch_0 (copy), l_ExpirationTimeNamespace_0 (copy), l_NextDataExpirationTimeReducer_0 (copy), v10 (copy), v3 (copy), v11 (copy), l_SongInfoModel_0 (copy), l_AddSongs_0 (copy), v9 (copy), v13 (copy), l_SetNextDataExpirationTime_0 (copy)
        return l_PerformFetch_0.Single(("luaapp.musicdiscovery.experiencesongs.%*"):format(v16), function(v17) --[[ Line: 36 ]]
            -- upvalues: l_ExpirationTimeNamespace_0 (ref), l_NextDataExpirationTimeReducer_0 (ref), v16 (copy), v10 (ref), v3 (ref), v11 (ref), v15 (copy), l_SongInfoModel_0 (ref), l_AddSongs_0 (ref), v9 (ref), v13 (ref), l_SetNextDataExpirationTime_0 (ref)
            local v18 = v17:getState();
            local l_GameDetailPage_0 = l_ExpirationTimeNamespace_0.GameDetailPage;
            local v20 = (v18.Personalization[l_NextDataExpirationTimeReducer_0.key][l_GameDetailPage_0] or {})[v16];
            local v21 = v18.Personalization[v10.key][v16] or nil;
            if v21 ~= nil and v20 ~= nil and tick() < v20 then
                return v3.resolve(v21);
            else
                return v11(v15, v16, 100):andThen(function(v22) --[[ Line: 50 ]]
                    -- upvalues: l_SongInfoModel_0 (ref), v17 (copy), l_AddSongs_0 (ref), v9 (ref), v16 (ref), v13 (ref), l_SetNextDataExpirationTime_0 (ref), l_GameDetailPage_0 (copy)
                    local v23 = v22 and v22.responseBody and v22.responseBody.songs or {};
                    local v24 = {};
                    local v25 = {};
                    for _, v27 in v23 do
                        l_SongInfoModel_0.fromBaseJson(v27):match(function(v28) --[[ Line: 57 ]]
                            -- upvalues: v25 (copy), v24 (copy)
                            table.insert(v25, v28.assetId);
                            v24[v28.assetId] = v28;
                        end):matchError(function(v29) --[[ Line: 61 ]]
                            warn((("ApiFetchExperienceSongs could not parse song: %*"):format(v29)));
                        end);
                    end;
                    if next(v24) then
                        v17:dispatch(l_AddSongs_0(v24));
                    end;
                    v17:dispatch(v9({
                        [v16] = v25
                    }));
                    local v30 = math.floor(tick() + v13);
                    v17:dispatch(l_SetNextDataExpirationTime_0(v16, v30, l_GameDetailPage_0));
                end, function(_) --[[ Line: 76 ]]

                end);
            end;
        end);
    end
};