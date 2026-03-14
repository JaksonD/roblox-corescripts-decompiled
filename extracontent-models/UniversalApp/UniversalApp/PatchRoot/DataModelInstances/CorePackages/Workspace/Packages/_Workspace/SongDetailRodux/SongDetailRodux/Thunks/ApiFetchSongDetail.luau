local l_script_FirstAncestor_0 = script:FindFirstAncestor("SongDetailRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ArgCheck);
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local v4 = require(l_Parent_0.Promise);
local v5 = require(l_Parent_0.Result);
local v6 = require(l_Parent_0.NextDataExpirationTimeRodux);
local l_ExpirationTimeNamespace_0 = v6.ExpirationTimeNamespace;
local l_NextDataExpirationTimeReducer_0 = v6.NextDataExpirationTimeReducer;
local l_SetNextDataExpirationTime_0 = v6.SetNextDataExpirationTime;
local v10 = require(l_Parent_0.SharedFlags);
local l_FFlagEnableTopSongsSort_0 = v10.FFlagEnableTopSongsSort;
local l_FIntSongDetailsRefreshIntervalSeconds_0 = v10.FIntSongDetailsRefreshIntervalSeconds;
local v13 = require(l_script_FirstAncestor_0.Actions.AddSongDetail);
local v14 = require(l_script_FirstAncestor_0.Requests.batchGetSongDetail);
local v15 = require(l_script_FirstAncestor_0.SongDetailModel);
local v16 = require(l_script_FirstAncestor_0.Reducers.SongDetailReducer);
local v17 = {};
local v18 = 0;
if l_FFlagEnableTopSongsSort_0 then
    v18 = tonumber(l_FIntSongDetailsRefreshIntervalSeconds_0) or 0;
end;
local function v20(v19) --[[ Line: 32 ]]
    return (("luaapp.musicdiscovery.songdetails.%*"):format(v19));
end;
v17.KeyMapper = v20;
v17.GetFetchingStatus = function(v21, v22) --[[ Line: 38 ]] --[[ Name: GetFetchingStatus ]]
    -- upvalues: l_PerformFetch_0 (copy)
    return l_PerformFetch_0.GetStatus(v21, (("luaapp.musicdiscovery.songdetails.%*"):format(v22)));
end;
v17.Fetch = function(v23, v24) --[[ Line: 42 ]]
    -- upvalues: v2 (copy), l_PerformFetch_0 (copy), v20 (copy), l_ExpirationTimeNamespace_0 (copy), l_NextDataExpirationTimeReducer_0 (copy), v16 (copy), v5 (copy), v4 (copy), v14 (copy), v15 (copy), v18 (ref), l_SetNextDataExpirationTime_0 (copy), v13 (copy)
    v2.isType(v24, "table", "ApiFetchSongDetail: inputSongIds");
    local v25 = {};
    for _, v27 in v24 do
        if v27 ~= nil and v27 ~= "" and (type(v27) == "string" or type(v27) == "number") then
            table.insert(v25, (tostring(v27)));
        end;
    end;
    if #v25 == 0 then
        warn("ApiFetchSongDetail: No songIds provided");
    end;
    return l_PerformFetch_0.Batch(v25, v20, function(v28, v29) --[[ Line: 56 ]]
        -- upvalues: l_ExpirationTimeNamespace_0 (ref), l_NextDataExpirationTimeReducer_0 (ref), v16 (ref), v5 (ref), v4 (ref), v14 (ref), v23 (copy), v15 (ref), v18 (ref), l_SetNextDataExpirationTime_0 (ref), v13 (ref)
        local v30 = {};
        local v31 = tick();
        local v32 = {};
        local v33 = v28:getState();
        local l_SongDetailPage_0 = l_ExpirationTimeNamespace_0.SongDetailPage;
        local v35 = v33.Personalization[l_NextDataExpirationTimeReducer_0.key][l_SongDetailPage_0] or {};
        local v36 = v33.Personalization[v16.key] or {};
        for _, v38 in v29 do
            local v39 = v35[v38];
            if v36[v38] == nil or v39 == nil or v39 < v31 then
                table.insert(v32, v38);
            else
                v30[("luaapp.musicdiscovery.songdetails.%*"):format(v38)] = v5.new(true, nil);
            end;
        end;
        if #v32 == 0 then
            return v4.resolve(v30);
        else
            return v14(v23, v32):andThen(function(v40) --[[ Line: 83 ]]
                -- upvalues: v31 (ref), v15 (ref), v30 (copy), v5 (ref), v18 (ref), v28 (copy), l_SetNextDataExpirationTime_0 (ref), l_SongDetailPage_0 (copy), v13 (ref), v4 (ref)
                local v41 = {};
                local v42 = v40 and v40.responseBody and v40.responseBody.songDetails or nil;
                if v42 ~= nil then
                    v31 = tick();
                    for _, v44 in v42 do
                        v15.fromJsonData(v44):match(function(v45) --[[ Line: 92 ]]
                            -- upvalues: v30 (ref), v5 (ref), v41 (copy), v31 (ref), v18 (ref), v28 (ref), l_SetNextDataExpirationTime_0 (ref), l_SongDetailPage_0 (ref)
                            local l_assetId_0 = v45.assetId;
                            v30[("luaapp.musicdiscovery.songdetails.%*"):format(l_assetId_0)] = v5.new(true, nil);
                            v41[l_assetId_0] = v45;
                            local v47 = math.floor(v31 + v18);
                            v28:dispatch(l_SetNextDataExpirationTime_0(l_assetId_0, v47, l_SongDetailPage_0));
                        end):matchError(function(v48) --[[ Line: 99 ]]
                            warn((("ApiFetchSongDetail could not parse songDetail: %*"):format(v48)));
                        end);
                    end;
                    if next(v41) then
                        v28:dispatch(v13(v41));
                    end;
                end;
                return v4.resolve(v30);
            end, function(_) --[[ Line: 110 ]]
                -- upvalues: v4 (ref)
                return v4.resolve({});
            end);
        end;
    end);
end;
return v17;