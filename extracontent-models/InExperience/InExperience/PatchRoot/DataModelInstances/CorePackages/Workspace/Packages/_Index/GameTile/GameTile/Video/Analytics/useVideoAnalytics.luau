local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.DiscoveryTypes);
local v3 = require(l_Parent_0.React);
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local _ = require(l_script_FirstAncestor_0.GameTileTypes);
local v6 = require(l_script_FirstAncestor_0.getGameTileLayoutData);
local l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportPrimaryMediaContentMetadata;
local v8 = require(l_script_FirstAncestor_0.Parent.DiscoveryAnalytics);
local l_discoveryVideoEndEvent_0 = v8.Events.discoveryVideoEndEvent;
local l_discoveryVideoLoadEvent_0 = v8.Events.discoveryVideoLoadEvent;
local l_discoveryVideoLoopEvent_0 = v8.Events.discoveryVideoLoopEvent;
local l_discoveryVideoPlayEvent_0 = v8.Events.discoveryVideoPlayEvent;
local function _(v13, v14) --[[ Line: 27 ]] --[[ Name: getGameSortId ]]
    if v13 ~= nil then
        if v14 then
            return v13.topicId;
        else
            return v13.gameSetTypeId;
        end;
    else
        return nil;
    end;
end;
local function _(v16, v17) --[[ Line: 39 ]] --[[ Name: getVideoAssetId ]]
    -- upvalues: l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 (copy), v6 (copy)
    if l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 and v16 and v16.primaryWideVideoAssetId then
        return v16.primaryWideVideoAssetId;
    else
        local v18 = v6(v16, v17);
        return v18 and v18.primaryMediaAsset and v18.primaryMediaAsset.wideVideoAssetId;
    end;
end;
return function(v20, v21, v22, v23, v24) --[[ Line: 52 ]] --[[ Name: useVideoAnalytics ]]
    -- upvalues: v3 (copy), l_mutedError_0 (copy), l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 (copy), v6 (copy), l_discoveryVideoPlayEvent_0 (copy), l_discoveryVideoLoadEvent_0 (copy), l_discoveryVideoLoopEvent_0 (copy), l_discoveryVideoEndEvent_0 (copy)
    local v25 = if v20 ~= nil then if v21 then v20.topicId else v20.gameSetTypeId else nil;
    local v32 = v3.useCallback(function(v26, v27) --[[ Line: 61 ]]
        -- upvalues: v24 (copy), l_mutedError_0 (ref), v25 (copy), l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 (ref), v6 (ref), l_discoveryVideoPlayEvent_0 (ref), v22 (copy), v23 (copy)
        if v26 ~= nil and v24 ~= nil then
            local v28 = v24[v26];
            if not v28 then
                l_mutedError_0("reportVideoPlay requires a valid entry");
            end;
            local l_v25_0 = v25;
            local v30;
            if l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 and v28 and v28.primaryWideVideoAssetId then
                v30 = v28.primaryWideVideoAssetId;
            else
                local v31 = v6(v28, l_v25_0);
                v30 = v31 and v31.primaryMediaAsset and v31.primaryMediaAsset.wideVideoAssetId;
            end;
            if not v30 then
                l_mutedError_0("reportVideoPlay requires a valid videoAssetId");
            end;
            l_discoveryVideoPlayEvent_0(v22, {
                videoAssetId = v30, 
                videoPlaybackSessionId = v27 or "INVALID_SESSION_ID", 
                universeId = v28.universeId, 
                rootPlaceId = v28.placeId, 
                gameSetTypeId = v25, 
                sortPos = v23
            });
        end;
    end, {
        v22, 
        v24, 
        v25, 
        v23
    });
    local v41 = v3.useCallback(function(v33, v34, v35, v36) --[[ Line: 85 ]]
        -- upvalues: v24 (copy), l_mutedError_0 (ref), v25 (copy), l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 (ref), v6 (ref), l_discoveryVideoLoadEvent_0 (ref), v22 (copy), v23 (copy)
        if v33 ~= nil and v24 ~= nil then
            local v37 = v24[v33];
            if not v37 then
                l_mutedError_0("reportVideoLoad requires a valid entry");
            end;
            local l_v25_1 = v25;
            local v39;
            if l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 and v37 and v37.primaryWideVideoAssetId then
                v39 = v37.primaryWideVideoAssetId;
            else
                local v40 = v6(v37, l_v25_1);
                v39 = v40 and v40.primaryMediaAsset and v40.primaryMediaAsset.wideVideoAssetId;
            end;
            if not v39 then
                l_mutedError_0("reportVideoLoad requires a valid videoAssetId");
            end;
            l_discoveryVideoLoadEvent_0(v22, {
                videoAssetId = v39, 
                videoPlaybackSessionId = v34 or "INVALID_SESSION_ID", 
                totalDuration = v35, 
                loadTime = v36, 
                universeId = v37.universeId, 
                rootPlaceId = v37.placeId, 
                gameSetTypeId = v25, 
                sortPos = v23
            });
        end;
    end, {
        v22, 
        v24, 
        v25, 
        v23
    });
    local v48 = v3.useCallback(function(v42, v43) --[[ Line: 112 ]]
        -- upvalues: v24 (copy), l_mutedError_0 (ref), v25 (copy), l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 (ref), v6 (ref), l_discoveryVideoLoopEvent_0 (ref), v22 (copy), v23 (copy)
        if v42 ~= nil and v24 ~= nil then
            local v44 = v24[v42];
            if not v44 then
                l_mutedError_0("reportVideoLoop requires a valid entry");
            end;
            local l_v25_2 = v25;
            local v46;
            if l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 and v44 and v44.primaryWideVideoAssetId then
                v46 = v44.primaryWideVideoAssetId;
            else
                local v47 = v6(v44, l_v25_2);
                v46 = v47 and v47.primaryMediaAsset and v47.primaryMediaAsset.wideVideoAssetId;
            end;
            if not v46 then
                l_mutedError_0("reportVideoLoop requires a valid videoAssetId");
            end;
            l_discoveryVideoLoopEvent_0(v22, {
                videoAssetId = v46, 
                videoPlaybackSessionId = v43 or "INVALID_SESSION_ID", 
                universeId = v44.universeId, 
                rootPlaceId = v44.placeId, 
                gameSetTypeId = v25, 
                sortPos = v23
            });
        end;
    end, {
        v22, 
        v24, 
        v25, 
        v23
    });
    local v58 = v3.useCallback(function(v49, v50, v51, v52, v53) --[[ Line: 136 ]]
        -- upvalues: v24 (copy), l_mutedError_0 (ref), v25 (copy), l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 (ref), v6 (ref), l_discoveryVideoEndEvent_0 (ref), v22 (copy), v23 (copy)
        if v49 ~= nil and v24 ~= nil then
            local v54 = v24[v49];
            if not v54 then
                l_mutedError_0("reportVideoEnd requires a valid entry");
            end;
            local l_v25_3 = v25;
            local v56;
            if l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 and v54 and v54.primaryWideVideoAssetId then
                v56 = v54.primaryWideVideoAssetId;
            else
                local v57 = v6(v54, l_v25_3);
                v56 = v57 and v57.primaryMediaAsset and v57.primaryMediaAsset.wideVideoAssetId;
            end;
            if not v56 then
                l_mutedError_0("reportVideoEnd requires a valid videoAssetId");
            end;
            l_discoveryVideoEndEvent_0(v22, {
                videoAssetId = v56, 
                videoPlaybackSessionId = v51 or "INVALID_SESSION_ID", 
                endReason = v50, 
                playbackTime = v52, 
                universeId = v54.universeId, 
                rootPlaceId = v54.placeId, 
                gameSetTypeId = v25, 
                sortPos = v23, 
                targetUniverseId = v53
            });
        end;
    end, {
        v22, 
        v24, 
        v25, 
        v23
    });
    return {
        reportVideoPlay = v32, 
        reportVideoLoad = v41, 
        reportVideoLoop = v48, 
        reportVideoEnd = v58
    };
end;