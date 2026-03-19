local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local v1 = require(l_Parent_0.Cryo);
local l_GameInfoModel_0 = require(l_Parent_0.GameModels).GameInfoModel;
local l_parseAndAddGameInfos_0 = require(l_Parent_0.GameInfosRodux).parseAndAddGameInfos;
local v4 = require(l_Parent_0.TopicContentsRodux);
local l_TopicContentsEntryModel_0 = v4.TopicContentsEntryModel;
local l_TopicContentsModel_0 = v4.TopicContentsModel;
local l_AddTopicContents_0 = v4.AddTopicContents;
return function(v8, v9, v10, v11) --[[ Line: 12 ]]
    -- upvalues: l_TopicContentsEntryModel_0 (copy), v1 (copy), l_parseAndAddGameInfos_0 (copy), l_GameInfoModel_0 (copy), l_TopicContentsModel_0 (copy), l_AddTopicContents_0 (copy)
    local v12 = {};
    local l_games_0 = v10.games;
    if #l_games_0 == 0 then
        warn("Found no games in this sort:", v10.sortDisplayName);
    end;
    local function v19(v14, v15) --[[ Line: 21 ]] --[[ Name: forEachGameInfo ]]
        -- upvalues: l_TopicContentsEntryModel_0 (ref), v1 (ref), v12 (copy)
        l_TopicContentsEntryModel_0.fromExploreApiData(v14):match(function(v16) --[[ Line: 25 ]]
            -- upvalues: v1 (ref), v15 (copy), v12 (ref)
            local v17 = v1.Dictionary.join(v15, v16);
            table.insert(v12, v17);
        end):matchError(function(v18) --[[ Line: 29 ]]
            warn(v18);
        end);
    end;
    l_parseAndAddGameInfos_0(v8, v9, l_games_0, l_GameInfoModel_0.fromOmniApi, v19);
    local v20 = {
        entries = v12
    };
    local v21 = false;
    if v10.nextPageToken ~= nil then
        v21 = v10.nextPageToken ~= "";
    end;
    v20.hasMoreRows = v21;
    v20.nextPageToken = v10.nextPageToken;
    v20.nextPageExclusiveStartId = 0;
    v20.rowsRequested = 0;
    if not v11 then
        v20.updatedTimestamp = tick();
    end;
    v21 = l_TopicContentsModel_0.fromData(v20);
    v9:dispatch(l_AddTopicContents_0(v10.sortId, v21, v11));
end;