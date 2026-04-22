local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("VideoUtils");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.AppCommonLib);
local v5 = require(l_Parent_0.ArgCheck);
local l_Signal_0 = v4.Signal;
local _ = require(l_script_FirstAncestor_0.Analytics.VideoAnalyticsTypes);
local v8 = require(l_script_FirstAncestor_0.getIsInstanceVisible);
local l_FFlagLuaAppEdpMediaGalleryFullScreen_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen;
local l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixVideoFramerateThrottlePolicy;
local v11 = {};
v11.__index = v11;
if l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 then
    v11.preferredFramerateThrottling = false;
    v11.isSettingFramerateThrottleAllowedByPolicy = false;
end;
v11.new = function() --[[ Line: 65 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 (copy), v11 (copy)
    local v12 = {
        changed = l_Signal_0.new(), 
        playingVideoKey = nil, 
        currentPlaybackSessionId = nil, 
        currentplaybackSessionStartTime = nil, 
        videoAnalytics = nil, 
        playingVideoItemIndex = nil, 
        videoDwellTaskHandles = {}, 
        preferredFramerateThrottling = not l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 or nil
    };
    setmetatable(v12, v11);
    return v12;
end;
if l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 then
    v11.__setRunServiceThrottleFramerateEnabled = function(_, v14) --[[ Line: 84 ]] --[[ Name: __setRunServiceThrottleFramerateEnabled ]]
        -- upvalues: v11 (copy), l_RunService_0 (copy)
        if not v11.isSettingFramerateThrottleAllowedByPolicy then
            return;
        else
            l_RunService_0:setThrottleFramerateEnabled(v14);
            return;
        end;
    end;
end;
v11.isPlaybackCandidate = function(_, v16, v17, v18, v19, v20) --[[ Line: 96 ]] --[[ Name: isPlaybackCandidate ]]
    -- upvalues: l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (copy), v8 (copy)
    if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 and v17 or not v16 then
        return false;
    else
        return v8(v18.current, v19, v20);
    end;
end;
v11.requestPlayback = function(v21, v22, v23, v24, v25, v26) --[[ Line: 112 ]] --[[ Name: requestPlayback ]]
    if v21.playingVideoKey == v22 then
        return;
    elseif v21.videoDwellTaskHandles[v22] ~= nil then
        return;
    elseif v23 then
        local v27 = task.delay(v24, function() --[[ Line: 131 ]]
            -- upvalues: v21 (copy), v22 (copy), v25 (copy), v26 (copy)
            v21.videoDwellTaskHandles[v22] = nil;
            v21:__startPlayback(v22, v25, v26);
        end);
        v21.videoDwellTaskHandles[v22] = v27;
        return;
    else
        v21:__startPlayback(v22, v25, v26);
        return;
    end;
end;
v11.__startPlayback = function(v28, v29, v30, v31) --[[ Line: 142 ]] --[[ Name: __startPlayback ]]
    -- upvalues: l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 (copy), l_RunService_0 (copy), l_HttpService_0 (copy)
    if l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 then
        v28:__setRunServiceThrottleFramerateEnabled(false);
    else
        l_RunService_0:setThrottleFramerateEnabled(false);
    end;
    v28.playingVideoKey = v29;
    v28.currentPlaybackSessionId = l_HttpService_0:GenerateGUID(false);
    v28.currentPlaybackSessionStartTime = tick();
    v28.videoAnalytics = v31;
    v28.playingVideoItemIndex = v30;
    if v31 then
        v31.reportVideoPlay(v30, v28.currentPlaybackSessionId);
    end;
    v28.changed:fire(v29);
end;
v11.cancelPlayback = function(v32, v33, v34, v35, v36) --[[ Line: 168 ]] --[[ Name: cancelPlayback ]]
    -- upvalues: l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 (copy), v11 (copy), l_RunService_0 (copy)
    if v32.playingVideoKey == v33 then
        v32:__cancelCurrentPlayback(v34, v35, nil, v36);
    elseif v32.videoDwellTaskHandles[v33] ~= nil then
        local v37 = v32.videoDwellTaskHandles[v33];
        task.cancel(v37);
        v32.videoDwellTaskHandles[v33] = nil;
    end;
    if v32.playingVideoKey == nil then
        if l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 then
            v32:__setRunServiceThrottleFramerateEnabled(v11.preferredFramerateThrottling);
            return;
        else
            l_RunService_0:setThrottleFramerateEnabled(v32.preferredFramerateThrottling);
        end;
    end;
end;
v11.reset = function(v38, v39, _, v41, _) --[[ Line: 194 ]] --[[ Name: reset ]]
    -- upvalues: l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 (copy), v11 (copy), l_RunService_0 (copy)
    if v38.playingVideoKey ~= nil then
        v38:__cancelCurrentPlayback(v39, v38.playingVideoItemIndex, v41, v38.videoAnalytics);
    end;
    for _, v44 in v38.videoDwellTaskHandles do
        if v44 ~= nil then
            task.cancel(v44);
        end;
    end;
    v38.videoDwellTaskHandles = {};
    if l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 then
        v38:__setRunServiceThrottleFramerateEnabled(v11.preferredFramerateThrottling);
        return;
    else
        l_RunService_0:setThrottleFramerateEnabled(v38.preferredFramerateThrottling);
        return;
    end;
end;
v11.__cancelCurrentPlayback = function(v45, v46, v47, v48, v49) --[[ Line: 221 ]] --[[ Name: __cancelCurrentPlayback ]]
    -- upvalues: v5 (copy)
    local l_currentPlaybackSessionStartTime_0 = v45.currentPlaybackSessionStartTime;
    if v49 then
        local v51 = tick();
        v5.assert(l_currentPlaybackSessionStartTime_0 and l_currentPlaybackSessionStartTime_0 <= v51);
        local v52 = if l_currentPlaybackSessionStartTime_0 and l_currentPlaybackSessionStartTime_0 <= v51 then v51 - l_currentPlaybackSessionStartTime_0 else -1;
        v49.reportVideoEnd(v47, v46, v45.currentPlaybackSessionId, v52, v48);
    end;
    v45.playingVideoKey = nil;
    v45.currentPlaybackSessionId = nil;
    v45.currentPlaybackSessionStartTime = nil;
    v45.videoAnalytics = nil;
    v45.playingVideoItemIndex = nil;
    v45.changed:fire(nil);
end;
if l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 then
    v11.setIsSettingFramerateThrottleAllowedByPolicy = function(_, v54) --[[ Line: 250 ]] --[[ Name: setIsSettingFramerateThrottleAllowedByPolicy ]]
        -- upvalues: v11 (copy)
        v11.isSettingFramerateThrottleAllowedByPolicy = v54;
    end;
end;
v11.setPreferredFramerateThrottling = function(v55, v56) --[[ Line: 258 ]] --[[ Name: setPreferredFramerateThrottling ]]
    -- upvalues: l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 (copy), v11 (copy)
    if l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 then
        v11.preferredFramerateThrottling = v56;
        return;
    else
        v55.preferredFramerateThrottling = v56;
        return;
    end;
end;
v11.default = v11.new();
return v11;