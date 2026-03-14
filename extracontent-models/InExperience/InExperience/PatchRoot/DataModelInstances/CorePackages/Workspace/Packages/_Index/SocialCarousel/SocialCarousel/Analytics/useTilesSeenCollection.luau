local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Analytics.useSocialCarouselAnalytics);
local l_Tile_0 = require(l_script_FirstAncestor_0.Common.Enums).Tile;
local v5 = game:DefineFastInt("UserSeenCollectionBatchTimeMs", 200);
local v6 = {
    Friend = "Friend", 
    NotFriend = "NotFriend"
};
return function() --[[ Line: 42 ]] --[[ Name: useTilesSeenCollection ]]
    -- upvalues: v3 (copy), v2 (copy), l_Tile_0 (copy), v6 (copy), v5 (copy)
    local v7 = v3();
    local v8 = v2.useRef({});
    local v9 = v2.useRef(nil);
    local v10 = v2.useRef({});
    local v11 = v2.useRef({});
    local v12 = v2.useRef(0);
    local v24 = v2.useCallback(function() --[[ Line: 52 ]]
        -- upvalues: v8 (copy), v10 (copy), v7 (copy), v12 (copy), v11 (copy)
        local l_current_0 = v8.current;
        if #l_current_0 == 0 then
            return;
        else
            local v14 = {};
            local v15 = {};
            local v16 = {};
            local v17 = {};
            local v18 = {};
            local v19 = {};
            local v20 = {};
            local v21 = {};
            for _, v23 in l_current_0 do
                if v23 and v23.userId and v23.index then
                    v10.current[v23.userId] = true;
                    table.insert(v14, (tostring(v23.userId)));
                    table.insert(v15, (tostring(v23.index)));
                    table.insert(v18, v23.friendStatus);
                    table.insert(v20, (tostring(v23.isRecommendation)));
                    table.insert(v16, (tostring(v23.presence)));
                    table.insert(v21, (tostring(v23.universeId)));
                    table.insert(v19, (tostring(v23.recommendationContextType)));
                    table.insert(v17, (tostring(v23.recommendationRank)));
                end;
            end;
            if v7.tilesSeenCollection then
                v12.current = v12.current + 1;
                v7.tilesSeenCollection({
                    userIds = table.concat(v14, ","), 
                    absolutePositions = table.concat(v15, ","), 
                    presences = table.concat(v16, ","), 
                    recommendationRanks = table.concat(v17, ","), 
                    friendStatuses = table.concat(v18, ","), 
                    recommendationContextTypes = table.concat(v19, ","), 
                    isRecommendations = table.concat(v20, ","), 
                    universeIds = table.concat(v21, ","), 
                    tileCount = #v14, 
                    sessionEventCount = v12.current
                });
            end;
            v8.current = {};
            v11.current = {};
            return;
        end;
    end, {
        v7
    });
    local v28 = v2.useCallback(function(v25, v26, v27) --[[ Line: 108 ]]
        -- upvalues: v10 (copy), v11 (copy), v8 (copy), l_Tile_0 (ref), v6 (ref), v9 (copy), v5 (ref), v24 (copy)
        if not v25 or not v26 or v10.current[v25] or v11.current[v25] then
            return;
        else
            v11.current[v25] = true;
            table.insert(v8.current, {
                userId = v25, 
                index = v26, 
                presence = if v27 and v27.presence then v27.presence.userPresenceType else "Offline", 
                friendStatus = if v27 and v27.tileType == l_Tile_0.Friend then v6.Friend else v6.NotFriend, 
                recommendationContextType = if v27 and v27.recommendationContextType then v27.recommendationContextType else "None", 
                recommendationRank = if v27 and v27.recommendationRank then v27.recommendationRank else -1, 
                isRecommendation = v27 and v27.tileType == l_Tile_0.Recommendation, 
                universeId = if v27 and v27.presence and v27.presence.universeId and v27.presence.universeId ~= "" then v27.presence.universeId else -1
            });
            if v9.current then
                pcall(task.cancel, v9.current);
            end;
            v9.current = task.delay(v5 * 0.001, v24);
            return;
        end;
    end, {
        v24
    });
    v2.useEffect(function() --[[ Line: 148 ]]
        -- upvalues: v9 (copy), v24 (copy)
        return function() --[[ Line: 149 ]]
            -- upvalues: v9 (ref), v24 (ref)
            if v9.current then
                pcall(task.cancel, v9.current);
            end;
            v9.current = nil;
            v24();
        end;
    end, {});
    return {
        addTileToCollection = v28
    };
end;