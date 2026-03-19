local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local v3 = require(l_CorePackages_0.Workspace.Packages.DiscoveryAnalytics);
local l_discoveryVideoPlayEvent_0 = v3.Events.discoveryVideoPlayEvent;
local l_discoveryVideoEndEvent_0 = v3.Events.discoveryVideoEndEvent;
local v6 = require(l_CorePackages_0.Workspace.Packages.VideoUtils);
local l_VideoActions_0 = v6.AnalyticsEnums.VideoActions;
local l_VideoLogger_0 = v6.VideoLogger;
local l_reportWarning_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryAnalytics).Points.reportWarning;
return function(v10, v11, v12) --[[ Line: 26 ]] --[[ Name: useMediaGalleryVideoAnalytics ]]
    -- upvalues: v1 (copy), l_reportWarning_0 (copy), v2 (copy), l_discoveryVideoPlayEvent_0 (copy), l_VideoLogger_0 (copy), l_VideoActions_0 (copy), l_discoveryVideoEndEvent_0 (copy)
    local v16 = v1.useCallback(function(v13, v14) --[[ Line: 27 ]]
        -- upvalues: v12 (copy), l_reportWarning_0 (ref), v2 (ref), l_discoveryVideoPlayEvent_0 (ref), v10 (copy), v11 (copy)
        if not v13 or not v12 then
            return;
        else
            local v15 = v12[v13];
            if not v15 then
                l_reportWarning_0(v2.default, "EventLogging", "reportVideoPlay requires a valid entry");
            end;
            if not v15.videoId then
                l_reportWarning_0(v2.default, "EventLogging", "reportVideoPlay requires a valid videoAssetId");
            end;
            l_discoveryVideoPlayEvent_0("GameDetails", {
                videoAssetId = v15.videoId, 
                videoPlaybackSessionId = v14 or "INVALID_SESSION_ID", 
                universeId = v10, 
                rootPlaceId = v11
            });
            return;
        end;
    end, {
        v10, 
        v11, 
        v12
    });
    local v22 = v1.useCallback(function(v17, v18, _, v20) --[[ Line: 50 ]]
        -- upvalues: v12 (copy), l_reportWarning_0 (ref), v2 (ref), l_VideoLogger_0 (ref), l_VideoActions_0 (ref), v10 (copy)
        if not v17 or not v12 then
            return;
        else
            local v21 = v12[v17];
            if not v21 then
                l_reportWarning_0(v2.default, "EventLogging", "reportVideoLoad requires a valid entry");
            end;
            if not v21.videoId then
                l_reportWarning_0(v2.default, "EventLogging", "reportVideoLoad requires a valid videoAssetId");
            end;
            l_VideoLogger_0.reportVideoAction(l_VideoActions_0.load, "GameDetails", {
                videoAssetId = v21.videoId, 
                source = "MediaGallery", 
                sourceId = v10, 
                playbackSessionId = v18 or "INVALID_SESSION_ID"
            }, {
                loadTime = v20
            });
            return;
        end;
    end, {
        v10, 
        v12
    });
    local v29 = v1.useCallback(function(v23, v24, v25, v26, v27) --[[ Line: 77 ]]
        -- upvalues: v12 (copy), l_reportWarning_0 (ref), v2 (ref), l_discoveryVideoEndEvent_0 (ref), v10 (copy), v11 (copy)
        if not v23 or not v12 then
            return;
        else
            local v28 = v12[v23];
            if not v28 then
                l_reportWarning_0(v2.default, "EventLogging", "reportVideoEnd requires a valid entry");
            end;
            if not v28.videoId then
                l_reportWarning_0(v2.default, "EventLogging", "reportVideoEnd requires a valid videoAssetId");
            end;
            l_discoveryVideoEndEvent_0("GameDetails", {
                videoAssetId = v28.videoId, 
                videoPlaybackSessionId = v25 or "INVALID_SESSION_ID", 
                endReason = v24, 
                playbackTime = v26, 
                universeId = v10, 
                rootPlaceId = v11, 
                targetUniverseId = v27
            });
            return;
        end;
    end, {
        v10, 
        v11, 
        v12
    });
    return (v1.useMemo(function() --[[ Line: 110 ]]
        -- upvalues: v16 (copy), v22 (copy), v29 (copy)
        return {
            reportVideoPlay = v16, 
            reportVideoLoad = v22, 
            reportVideoEnd = v29
        };
    end, {
        v16, 
        v22, 
        v29
    }));
end;