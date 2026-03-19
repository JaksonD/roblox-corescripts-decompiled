local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("VideoUtils");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_script_FirstAncestor_0.Analytics.VideoLogger);
local v6 = require(l_Parent_0.LoggingProtocol);
local l_reportWarning_0 = require(l_Parent_0.DiscoveryAnalytics).Points.reportWarning;
local v8 = require(l_Parent_0.AppCommonLib);
local v9 = require(l_Parent_0.ArgCheck);
local l_Signal_0 = v8.Signal;
local _ = require(l_script_FirstAncestor_0.Analytics.VideoAnalyticsTypes);
local l_VideoActions_0 = require(l_script_FirstAncestor_0.Analytics.Enums).VideoActions;
local v13 = require(l_script_FirstAncestor_0.getIsInstanceVisible);
local l_FFlagLuaAppEdpMediaGalleryFullScreen_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen;
local l_FFlagBrandVideosEnableActionAnalytics_0 = require(l_Parent_0.SharedFlags).FFlagBrandVideosEnableActionAnalytics;
local l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixVideoFramerateThrottlePolicy;
local v17 = {};
v17.__index = v17;
if l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 then
    v17.preferredFramerateThrottling = false;
    v17.isSettingFramerateThrottleAllowedByPolicy = false;
end;
v17.new = function() --[[ Line: 84 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 (copy), l_FFlagBrandVideosEnableActionAnalytics_0 (copy), v17 (copy)
    local v18 = {
        changed = l_Signal_0.new(), 
        playingVideoKey = nil, 
        currentPlaybackSessionId = nil, 
        currentplaybackSessionStartTime = nil, 
        videoAnalytics = nil, 
        playingVideoItemIndex = nil, 
        videoDwellTaskHandles = {}, 
        preferredFramerateThrottling = not l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 or nil, 
        videoMetadata = if l_FFlagBrandVideosEnableActionAnalytics_0 then {} else nil
    };
    setmetatable(v18, v17);
    return v18;
end;
if l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 then
    v17.__setRunServiceThrottleFramerateEnabled = function(_, v20) --[[ Line: 104 ]] --[[ Name: __setRunServiceThrottleFramerateEnabled ]]
        -- upvalues: v17 (copy), l_RunService_0 (copy)
        if not v17.isSettingFramerateThrottleAllowedByPolicy then
            return;
        else
            l_RunService_0:setThrottleFramerateEnabled(v20);
            return;
        end;
    end;
end;
v17.isPlaybackCandidate = function(_, v22, v23, v24, v25, v26) --[[ Line: 116 ]] --[[ Name: isPlaybackCandidate ]]
    -- upvalues: l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (copy), v13 (copy)
    if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 and v23 or not v22 then
        return false;
    else
        return v13(v24.current, v25, v26);
    end;
end;
v17.requestPlayback = function(v27, v28, v29, v30, v31, v32) --[[ Line: 132 ]] --[[ Name: requestPlayback ]]
    if v27.playingVideoKey == v28 then
        return;
    elseif v27.videoDwellTaskHandles[v28] ~= nil then
        return;
    elseif v29 then
        local v33 = task.delay(v30, function() --[[ Line: 151 ]]
            -- upvalues: v27 (copy), v28 (copy), v31 (copy), v32 (copy)
            v27.videoDwellTaskHandles[v28] = nil;
            v27:__startPlayback(v28, v31, v32);
        end);
        v27.videoDwellTaskHandles[v28] = v33;
        return;
    else
        v27:__startPlayback(v28, v31, v32);
        return;
    end;
end;
v17.__startPlayback = function(v34, v35, v36, v37) --[[ Line: 162 ]] --[[ Name: __startPlayback ]]
    -- upvalues: l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 (copy), l_RunService_0 (copy), l_FFlagBrandVideosEnableActionAnalytics_0 (copy), l_HttpService_0 (copy)
    if l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 then
        v34:__setRunServiceThrottleFramerateEnabled(false);
    else
        l_RunService_0:setThrottleFramerateEnabled(false);
    end;
    v34.playingVideoKey = v35;
    local v38 = nil;
    if l_FFlagBrandVideosEnableActionAnalytics_0 then
        v38 = v34:getVideoMetadata(v35);
        if not v38.playbackSessionId then
            v34.videoMetadata[v35].playbackSessionId = l_HttpService_0:GenerateGUID(false);
            v34.videoMetadata[v35].playbackSessionStartTime = tick();
        end;
    else
        v34.currentPlaybackSessionId = l_HttpService_0:GenerateGUID(false);
        v34.currentPlaybackSessionStartTime = tick();
    end;
    v34.videoAnalytics = v37;
    v34.playingVideoItemIndex = v36;
    if v37 then
        v37.reportVideoPlay(v36, if l_FFlagBrandVideosEnableActionAnalytics_0 then v38.playbackSessionId else v34.currentPlaybackSessionId);
    end;
    v34.changed:fire(v35);
end;
v17.cancelPlayback = function(v39, v40, v41, v42, v43, v44) --[[ Line: 202 ]] --[[ Name: cancelPlayback ]]
    -- upvalues: l_FFlagBrandVideosEnableActionAnalytics_0 (copy), l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 (copy), v17 (copy), l_RunService_0 (copy)
    if v39.playingVideoKey == v40 then
        v39:__cancelCurrentPlayback(v41, v42, nil, v43, if l_FFlagBrandVideosEnableActionAnalytics_0 then v44 else nil);
    elseif v39.videoDwellTaskHandles[v40] ~= nil then
        local v45 = v39.videoDwellTaskHandles[v40];
        task.cancel(v45);
        v39.videoDwellTaskHandles[v40] = nil;
    end;
    if v39.playingVideoKey == nil then
        if l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 then
            v39:__setRunServiceThrottleFramerateEnabled(v17.preferredFramerateThrottling);
            return;
        else
            l_RunService_0:setThrottleFramerateEnabled(v39.preferredFramerateThrottling);
        end;
    end;
end;
v17.reset = function(v46, v47, _, v49, _) --[[ Line: 235 ]] --[[ Name: reset ]]
    -- upvalues: l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 (copy), v17 (copy), l_RunService_0 (copy)
    if v46.playingVideoKey ~= nil then
        v46:__cancelCurrentPlayback(v47, v46.playingVideoItemIndex, v49, v46.videoAnalytics);
    end;
    for _, v52 in v46.videoDwellTaskHandles do
        if v52 ~= nil then
            task.cancel(v52);
        end;
    end;
    v46.videoDwellTaskHandles = {};
    if l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 then
        v46:__setRunServiceThrottleFramerateEnabled(v17.preferredFramerateThrottling);
        return;
    else
        l_RunService_0:setThrottleFramerateEnabled(v46.preferredFramerateThrottling);
        return;
    end;
end;
v17.__cancelCurrentPlayback = function(v53, v54, v55, v56, v57, v58) --[[ Line: 262 ]] --[[ Name: __cancelCurrentPlayback ]]
    -- upvalues: l_FFlagBrandVideosEnableActionAnalytics_0 (copy), v9 (copy), v5 (copy), l_VideoActions_0 (copy), v4 (copy)
    local v59 = if l_FFlagBrandVideosEnableActionAnalytics_0 and v53.playingVideoKey then v53:getVideoMetadata(v53.playingVideoKey) else nil;
    local v60 = if l_FFlagBrandVideosEnableActionAnalytics_0 then v59.playbackSessionStartTime else v53.currentPlaybackSessionStartTime;
    if v57 then
        local v61 = tick();
        v9.assert(v60 and v60 <= v61);
        local v62 = if v60 and v60 <= v61 then v61 - v60 else -1;
        v57.reportVideoEnd(v55, v54, if l_FFlagBrandVideosEnableActionAnalytics_0 then v59.playbackSessionId else v53.currentPlaybackSessionId, v62, v56);
    end;
    if l_FFlagBrandVideosEnableActionAnalytics_0 and not v59.keepSessionOnPlaybackCancel then
        if v58 then
            v5.reportVideoAction(l_VideoActions_0.ended, nil, v4.Dictionary.join(v58, {
                playbackSessionId = v59 and v59.playbackSessionId
            }));
        end;
        if v53.playingVideoKey then
            v53:clearPlaybackSession(v53.playingVideoKey);
        end;
        v53.playingVideoKey = nil;
    else
        v53.playingVideoKey = nil;
        v53.currentPlaybackSessionId = nil;
        v53.currentPlaybackSessionStartTime = nil;
    end;
    v53.videoAnalytics = nil;
    v53.playingVideoItemIndex = nil;
    v53.changed:fire(nil);
end;
if l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 then
    v17.setIsSettingFramerateThrottleAllowedByPolicy = function(_, v64) --[[ Line: 322 ]] --[[ Name: setIsSettingFramerateThrottleAllowedByPolicy ]]
        -- upvalues: v17 (copy)
        v17.isSettingFramerateThrottleAllowedByPolicy = v64;
    end;
end;
v17.setPreferredFramerateThrottling = function(v65, v66) --[[ Line: 330 ]] --[[ Name: setPreferredFramerateThrottling ]]
    -- upvalues: l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 (copy), v17 (copy)
    if l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 then
        v17.preferredFramerateThrottling = v66;
        return;
    else
        v65.preferredFramerateThrottling = v66;
        return;
    end;
end;
if l_FFlagBrandVideosEnableActionAnalytics_0 then
    v17.getVideoMetadata = function(v67, v68) --[[ Line: 342 ]] --[[ Name: getVideoMetadata ]]
        -- upvalues: l_HttpService_0 (copy)
        if v67.videoMetadata[v68] == nil then
            v67.videoMetadata[v68] = {
                impressionId = l_HttpService_0:GenerateGUID(false), 
                playbackSessionId = nil, 
                keepSessionOnPlaybackCancel = false
            };
        end;
        return v67.videoMetadata[v68];
    end;
    v17.setVideoKeepSessionOnPlaybackCancel = function(v69, v70, v71) --[[ Line: 354 ]] --[[ Name: setVideoKeepSessionOnPlaybackCancel ]]
        -- upvalues: l_reportWarning_0 (copy), v6 (copy)
        if v69.videoMetadata[v70] == nil then
            l_reportWarning_0(v6.default, "EventLogging", (("Error setting keepSessionOnPlaybackCancel for videoKey: %*, VideoMetadata is nil"):format(v70)));
            return;
        else
            v69.videoMetadata[v70].keepSessionOnPlaybackCancel = v71;
            return;
        end;
    end;
    v17.setVideoMetadata = function(v72, v73, v74) --[[ Line: 370 ]] --[[ Name: setVideoMetadata ]]
        v72.videoMetadata[v73] = v74;
    end;
    v17.clearPlaybackSession = function(v75, v76) --[[ Line: 378 ]] --[[ Name: clearPlaybackSession ]]
        -- upvalues: l_reportWarning_0 (copy), v6 (copy)
        if v75.videoMetadata[v76] == nil then
            l_reportWarning_0(v6.default, "EventLogging", (("Error clearing playback session for videoKey: %*, VideoMetadata is nil"):format(v76)));
            return;
        else
            v75.videoMetadata[v76].playbackSessionId = nil;
            v75.videoMetadata[v76].playbackSessionStartTime = nil;
            return;
        end;
    end;
end;
v17.default = v17.new();
return v17;