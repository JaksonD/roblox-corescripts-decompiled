local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_AddSongs_0 = require(l_Parent_0.SongInfosRodux).AddSongs;
local _ = require(l_Parent_0.DiscoveryTypes);
local v3 = require(l_Parent_0.TopicContentsRodux);
local l_TopicContentsEntryModel_0 = v3.TopicContentsEntryModel;
local l_TopicContentsModel_0 = v3.TopicContentsModel;
local l_AddTopicContents_0 = v3.AddTopicContents;
local l_SongInfoModel_0 = require(l_Parent_0.SongModels).SongInfoModel;
local l_FFlagEnableTopSongsSort_0 = require(l_Parent_0.SharedFlags).FFlagEnableTopSongsSort;
return function(v9, v10, v11, _) --[[ Line: 12 ]]
    -- upvalues: l_FFlagEnableTopSongsSort_0 (copy), l_TopicContentsEntryModel_0 (copy), l_SongInfoModel_0 (copy), l_AddSongs_0 (copy), l_TopicContentsModel_0 (copy), l_AddTopicContents_0 (copy)
    assert(l_FFlagEnableTopSongsSort_0, "Songs sort is not enabled");
    local v13 = {};
    local v14 = {};
    local l_songs_0 = v10.songs;
    if #l_songs_0 == 0 then
        warn((("Found no songs in this sort: %*"):format(v10.sortDisplayName)));
    end;
    local function v21(v16) --[[ Line: 22 ]] --[[ Name: forEachSongInfo ]]
        -- upvalues: l_TopicContentsEntryModel_0 (ref), v13 (copy), l_SongInfoModel_0 (ref), v14 (copy)
        l_TopicContentsEntryModel_0.songFromExploreApiData(v16):match(function(v17) --[[ Line: 24 ]]
            -- upvalues: v13 (ref)
            table.insert(v13, v17);
        end):matchError(function(v18) --[[ Line: 27 ]]
            warn(v18);
        end);
        l_SongInfoModel_0.fromExploreApi(v16):match(function(v19) --[[ Line: 32 ]]
            -- upvalues: v14 (ref)
            v14[v19.assetId] = v19;
        end):matchError(function(v20) --[[ Line: 35 ]]
            warn(v20);
        end);
    end;
    for _, v23 in ipairs(l_songs_0) do
        v21(v23);
    end;
    v9:dispatch(l_AddSongs_0(v14));
    local v24 = {
        entries = v13
    };
    local v25 = false;
    if v10.nextPageToken ~= nil then
        v25 = v10.nextPageToken ~= "";
    end;
    v24.hasMoreRows = v25;
    v24.nextPageToken = v10.nextPageToken;
    v24.nextPageExclusiveStartId = 0;
    v24.rowsRequested = 0;
    if not v11 then
        v24.updatedTimestamp = tick();
    end;
    v25 = l_TopicContentsModel_0.fromData(v24);
    v9:dispatch(l_AddTopicContents_0(v10.sortId, v25, v11));
end;