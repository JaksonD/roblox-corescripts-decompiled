local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.DiscoveryTypes);
local v3 = require(l_Parent_0.React);
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local _ = require(l_script_FirstAncestor_0.GameTileTypes);
local v6 = require(l_script_FirstAncestor_0.getGameTileLayoutData);
local v7 = require(l_script_FirstAncestor_0.Parent.DiscoveryAnalytics);
local l_discoveryVideoEndEvent_0 = v7.Events.discoveryVideoEndEvent;
local l_discoveryVideoLoadEvent_0 = v7.Events.discoveryVideoLoadEvent;
local l_discoveryVideoLoopEvent_0 = v7.Events.discoveryVideoLoopEvent;
local l_discoveryVideoPlayEvent_0 = v7.Events.discoveryVideoPlayEvent;
local function _(v12, v13) --[[ Line: 24 ]] --[[ Name: getGameSortId ]]
    if v12 ~= nil then
        if v13 then
            return v12.topicId;
        else
            return v12.gameSetTypeId;
        end;
    else
        return nil;
    end;
end;
local function _(v15, v16) --[[ Line: 36 ]] --[[ Name: getVideoAssetId ]]
    -- upvalues: v6 (copy)
    local v17 = v6(v15, v16);
    return v17 and v17.primaryMediaAsset and v17.primaryMediaAsset.wideVideoAssetId;
end;
return function(v19, v20, v21, v22, v23) --[[ Line: 45 ]] --[[ Name: useVideoAnalytics ]]
    -- upvalues: v3 (copy), l_mutedError_0 (copy), v6 (copy), l_discoveryVideoPlayEvent_0 (copy), l_discoveryVideoLoadEvent_0 (copy), l_discoveryVideoLoopEvent_0 (copy), l_discoveryVideoEndEvent_0 (copy)
    local v24 = if v19 ~= nil then if v20 then v19.topicId else v19.gameSetTypeId else nil;
    local v30 = v3.useCallback(function(v25, v26) --[[ Line: 54 ]]
        -- upvalues: v23 (copy), l_mutedError_0 (ref), v24 (copy), v6 (ref), l_discoveryVideoPlayEvent_0 (ref), v21 (copy), v22 (copy)
        if v25 ~= nil and v23 ~= nil then
            local v27 = v23[v25];
            if not v27 then
                l_mutedError_0("reportVideoPlay requires a valid entry");
            end;
            local v28 = v6(v27, v24);
            local v29 = v28 and v28.primaryMediaAsset and v28.primaryMediaAsset.wideVideoAssetId;
            if not v29 then
                l_mutedError_0("reportVideoPlay requires a valid videoAssetId");
            end;
            l_discoveryVideoPlayEvent_0(v21, {
                videoAssetId = v29, 
                videoPlaybackSessionId = v26 or "INVALID_SESSION_ID", 
                universeId = v27.universeId, 
                rootPlaceId = v27.placeId, 
                gameSetTypeId = v24, 
                sortPos = v22
            });
        end;
    end, {
        v21, 
        v23, 
        v24, 
        v22
    });
    local v38 = v3.useCallback(function(v31, v32, v33, v34) --[[ Line: 78 ]]
        -- upvalues: v23 (copy), l_mutedError_0 (ref), v24 (copy), v6 (ref), l_discoveryVideoLoadEvent_0 (ref), v21 (copy), v22 (copy)
        if v31 ~= nil and v23 ~= nil then
            local v35 = v23[v31];
            if not v35 then
                l_mutedError_0("reportVideoLoad requires a valid entry");
            end;
            local v36 = v6(v35, v24);
            local v37 = v36 and v36.primaryMediaAsset and v36.primaryMediaAsset.wideVideoAssetId;
            if not v37 then
                l_mutedError_0("reportVideoLoad requires a valid videoAssetId");
            end;
            l_discoveryVideoLoadEvent_0(v21, {
                videoAssetId = v37, 
                videoPlaybackSessionId = v32 or "INVALID_SESSION_ID", 
                totalDuration = v33, 
                loadTime = v34, 
                universeId = v35.universeId, 
                rootPlaceId = v35.placeId, 
                gameSetTypeId = v24, 
                sortPos = v22
            });
        end;
    end, {
        v21, 
        v23, 
        v24, 
        v22
    });
    local v44 = v3.useCallback(function(v39, v40) --[[ Line: 105 ]]
        -- upvalues: v23 (copy), l_mutedError_0 (ref), v24 (copy), v6 (ref), l_discoveryVideoLoopEvent_0 (ref), v21 (copy), v22 (copy)
        if v39 ~= nil and v23 ~= nil then
            local v41 = v23[v39];
            if not v41 then
                l_mutedError_0("reportVideoLoop requires a valid entry");
            end;
            local v42 = v6(v41, v24);
            local v43 = v42 and v42.primaryMediaAsset and v42.primaryMediaAsset.wideVideoAssetId;
            if not v43 then
                l_mutedError_0("reportVideoLoop requires a valid videoAssetId");
            end;
            l_discoveryVideoLoopEvent_0(v21, {
                videoAssetId = v43, 
                videoPlaybackSessionId = v40 or "INVALID_SESSION_ID", 
                universeId = v41.universeId, 
                rootPlaceId = v41.placeId, 
                gameSetTypeId = v24, 
                sortPos = v22
            });
        end;
    end, {
        v21, 
        v23, 
        v24, 
        v22
    });
    local v53 = v3.useCallback(function(v45, v46, v47, v48, v49) --[[ Line: 129 ]]
        -- upvalues: v23 (copy), l_mutedError_0 (ref), v24 (copy), v6 (ref), l_discoveryVideoEndEvent_0 (ref), v21 (copy), v22 (copy)
        if v45 ~= nil and v23 ~= nil then
            local v50 = v23[v45];
            if not v50 then
                l_mutedError_0("reportVideoEnd requires a valid entry");
            end;
            local v51 = v6(v50, v24);
            local v52 = v51 and v51.primaryMediaAsset and v51.primaryMediaAsset.wideVideoAssetId;
            if not v52 then
                l_mutedError_0("reportVideoEnd requires a valid videoAssetId");
            end;
            l_discoveryVideoEndEvent_0(v21, {
                videoAssetId = v52, 
                videoPlaybackSessionId = v47 or "INVALID_SESSION_ID", 
                endReason = v46, 
                playbackTime = v48, 
                universeId = v50.universeId, 
                rootPlaceId = v50.placeId, 
                gameSetTypeId = v24, 
                sortPos = v22, 
                targetUniverseId = v49
            });
        end;
    end, {
        v21, 
        v23, 
        v24, 
        v22
    });
    return {
        reportVideoPlay = v30, 
        reportVideoLoad = v38, 
        reportVideoLoop = v44, 
        reportVideoEnd = v53
    };
end;