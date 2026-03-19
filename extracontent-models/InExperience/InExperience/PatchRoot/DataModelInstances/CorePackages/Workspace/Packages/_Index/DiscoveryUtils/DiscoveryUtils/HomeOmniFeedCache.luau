local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryUtils");
local v1 = require(l_script_FirstAncestor_0.DiscoveryClientAppStorage);
local v2 = require(l_script_FirstAncestor_0.Telemetry.DiscoveryEventErrorLogger);
local v3 = game:DefineFastString("LuaAppOmniRecommendationsTopicIdAndNumberOfItemsToCache", (("%*:20,%*:20,%*:20"):format(100000000, 100000001, 100000003)));
return {
    cacheOmniRecommendationsData = function(v4) --[[ Line: 20 ]] --[[ Name: cacheOmniRecommendationsData ]]
        -- upvalues: v3 (copy), v1 (copy), v2 (copy)
        assert(v4.pageType, "pageType is required");
        assert(v4.sorts, "sorts is required");
        assert(v4.contentMetadata, "contentMetadata is required");
        assert(v4.contentMetadata.Game, "contentMetadata.Game is required");
        task.spawn(function() --[[ Line: 26 ]]
            -- upvalues: v3 (ref), v4 (copy), v1 (ref), v2 (ref)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 27 ]]
                -- upvalues: v3 (ref), v4 (ref), v1 (ref)
                local v5 = {};
                for _, v7 in (string.split(v3, ",")) do
                    local v8 = string.split(v7, ":");
                    local v9 = tonumber(v8[1]);
                    local v10 = tonumber(v8[2]);
                    if v9 and v10 then
                        v5[v9] = {
                            cap = v10, 
                            count = 0
                        };
                    end;
                end;
                local v11 = {};
                for _, v13 in v4.sorts do
                    local v14 = v5[v13.topicId];
                    if v14 ~= nil and v13.recommendationList ~= nil then
                        local v15 = table.clone(v13);
                        if v14.count < v14.cap then
                            local v16 = {};
                            for _, v18 in v13.recommendationList do
                                if v14.count < v14.cap then
                                    table.insert(v16, v18);
                                    v14.count = v14.count + 1;
                                else
                                    break;
                                end;
                            end;
                            v15.recommendationList = v16;
                            table.insert(v11, v15);
                        end;
                    end;
                end;
                local v19 = {};
                for _, v21 in ipairs(v11) do
                    for _, v23 in ipairs(v21.recommendationList) do
                        if v23.contentType == "Game" then
                            local v24 = tostring(v23.contentId);
                            local v25 = v4.contentMetadata.Game[v24];
                            if v25 then
                                local v26 = table.clone(v25);
                                v26.playerCount = nil;
                                v19[v24] = v26;
                            end;
                        end;
                    end;
                end;
                v1.setJsonStorageData(v1.CacheKey.HomeOmniFeedCache, {
                    pageType = v4.pageType, 
                    sorts = v11, 
                    contentMetadata = {
                        Game = v19
                    }
                }, 2);
            end);
            if not l_status_0 then
                v2.reportError("HomeOmniFeedCacheError", l_result_0);
            end;
        end);
    end, 
    HOME_OMNI_FEED_CACHE_VERSION = 2
};