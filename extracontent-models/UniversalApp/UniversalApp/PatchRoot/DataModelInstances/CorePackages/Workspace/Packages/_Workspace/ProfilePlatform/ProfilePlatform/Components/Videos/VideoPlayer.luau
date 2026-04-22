local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Components.Videos.MediaPlayer);
local l_VideoPlaybackDetector_0 = require(l_Parent_0.VideoUtils).VideoPlaybackDetector;
local v6 = require(l_Parent_0.Responsive);
local l_useLastInput_0 = v6.useLastInput;
return (v3.forwardRef(function(v8, v9) --[[ Line: 35 ]]
    -- upvalues: v3 (copy), l_useLastInput_0 (copy), l_RunService_0 (copy), l_VideoPlaybackDetector_0 (copy), v6 (copy), v4 (copy)
    local l_videoId_0 = v8.videoId;
    local v11 = v3.useRef(nil);
    local v12 = v8.isFullscreen or false;
    local v13, v14 = v3.useState(v8.isMuted == nil or v8.isMuted);
    local v15 = v3.useRef(nil);
    local v16, v17 = v3.useState(false);
    local v18 = l_useLastInput_0();
    local v19, v20 = v3.useState(false);
    local v21, v22 = v3.useState(0);
    v3.useImperativeHandle(v9, function() --[[ Line: 46 ]]
        -- upvalues: v11 (copy), v14 (copy), v13 (copy), v16 (copy), v21 (copy)
        return {
            setTimePosition = function(v23) --[[ Line: 48 ]] --[[ Name: setTimePosition ]]
                -- upvalues: v11 (ref)
                local l_current_0 = v11.current;
                if l_current_0 then
                    l_current_0.TimePosition = v23;
                end;
            end, 
            toggleMute = function() --[[ Line: 54 ]] --[[ Name: toggleMute ]]
                -- upvalues: v14 (ref), v13 (ref)
                v14(not v13);
            end, 
            togglePlayPause = function() --[[ Line: 57 ]] --[[ Name: togglePlayPause ]]
                -- upvalues: v11 (ref), v16 (ref), v21 (ref)
                local l_current_1 = v11.current;
                if not l_current_1 then
                    return;
                elseif v16 then
                    l_current_1:Pause();
                    return;
                else
                    if l_current_1.TimePosition >= v21 - 0.2 then
                        l_current_1.TimePosition = 0;
                    end;
                    l_current_1:Play();
                    return;
                end;
            end
        };
    end, {
        v13, 
        v16, 
        v21
    });
    local v27 = v3.useCallback(function() --[[ Line: 74 ]]
        -- upvalues: v11 (copy), v13 (copy)
        local l_current_2 = v11.current;
        if l_current_2 then
            l_current_2.Volume = v13 and 0 or 1;
        end;
    end, {
        v13
    });
    local v28 = v3.useCallback(function() --[[ Line: 81 ]]
        -- upvalues: v3 (ref)
        return (v3.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        }));
    end, {});
    local v31 = v3.useCallback(function(_) --[[ Line: 88 ]]
        -- upvalues: v11 (copy), v27 (copy), v22 (copy)
        local l_current_3 = v11.current;
        if not l_current_3 then
            return;
        else
            v27();
            v22(l_current_3.TimeLength);
            return;
        end;
    end, {});
    local v32 = v3.useCallback(function() --[[ Line: 97 ]]
        -- upvalues: v20 (copy)
        v20(true);
    end, {});
    local v33 = v3.useCallback(function() --[[ Line: 101 ]]
        -- upvalues: v20 (copy)
        v20(false);
    end, {});
    v3.useEffect(function() --[[ Line: 105 ]]
        -- upvalues: v27 (copy)
        v27();
    end, {
        v13
    });
    v3.useEffect(function() --[[ Line: 110 ]]
        -- upvalues: v11 (copy), v21 (copy), v16 (copy)
        local l_current_4 = v11.current;
        if not l_current_4 or v21 == 0 then
            return;
        else
            if v16 and l_current_4.TimePosition >= v21 - 0.2 then
                l_current_4.TimePosition = 0;
            end;
            return;
        end;
    end, {
        v16, 
        v21
    });
    v3.useEffect(function() --[[ Line: 121 ]]
        -- upvalues: v11 (copy), v21 (copy), v8 (copy)
        local l_current_5 = v11.current;
        if not l_current_5 or v21 == 0 then
            return;
        else
            if v8.initialTimePosition then
                if v8.initialTimePosition >= v21 - 0.2 then
                    l_current_5.TimePosition = 0;
                    return;
                else
                    l_current_5.TimePosition = v8.initialTimePosition;
                end;
            end;
            return;
        end;
    end, {
        v8.initialTimePosition, 
        v21
    });
    v3.useEffect(function() --[[ Line: 136 ]]
        -- upvalues: v11 (copy), v12 (copy), v17 (copy)
        local l_current_6 = v11.current;
        if l_current_6 and v12 then
            l_current_6:Play();
            v17(true);
        end;
    end, {
        v12
    });
    v3.useEffect(function() --[[ Line: 144 ]]
        -- upvalues: v11 (copy), l_RunService_0 (ref), v22 (copy), v8 (copy), v16 (copy), v13 (copy), v17 (copy)
        local l_current_7 = v11.current;
        if not l_current_7 then
            return;
        else
            local v40 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 150 ]]
                -- upvalues: l_current_7 (copy), v22 (ref), v8 (ref), v16 (ref), v13 (ref)
                local l_TimePosition_0 = l_current_7.TimePosition;
                local l_TimeLength_0 = l_current_7.TimeLength;
                v22(l_TimeLength_0);
                if v8.onTimeUpdate then
                    v8.onTimeUpdate(l_TimePosition_0);
                end;
                if v8.onProgressUpdate then
                    v8.onProgressUpdate(l_TimePosition_0, l_TimeLength_0, v16, v13);
                end;
            end);
            local v41 = l_current_7.Played:Connect(function() --[[ Line: 162 ]]
                -- upvalues: v17 (ref)
                v17(true);
            end);
            local v42 = l_current_7.Paused:Connect(function() --[[ Line: 166 ]]
                -- upvalues: v17 (ref)
                v17(false);
            end);
            local v43 = l_current_7.Ended:Connect(function() --[[ Line: 170 ]]
                -- upvalues: v17 (ref)
                v17(false);
            end);
            return function() --[[ Line: 174 ]]
                -- upvalues: v40 (copy), v41 (copy), v42 (copy), v43 (copy)
                v40:Disconnect();
                v41:Disconnect();
                v42:Disconnect();
                v43:Disconnect();
            end;
        end;
    end, {
        v13, 
        v16, 
        v8.onProgressUpdate, 
        v8.onTimeUpdate
    });
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        ClipsDescendants = not v12, 
        LayoutOrder = v8.layoutOrder, 
        Size = UDim2.fromScale(1, 1), 
        ZIndex = v12 and 1000 or 1, 
        ref = v15, 
        [v3.Event.MouseEnter] = v32, 
        [v3.Event.MouseLeave] = v33
    }, {
        VideoPlaybackDetector = if not v12 then v3.createElement(l_VideoPlaybackDetector_0, {
            isHovered = v19, 
            isHoverSupported = v18 ~= v6.Input.Touch, 
            isVideoEligible = true, 
            itemIndex = nil, 
            onPlaybackChange = function(v44) --[[ Line: 204 ]] --[[ Name: onPlaybackChange ]]
                -- upvalues: v17 (copy)
                v17(v44);
            end, 
            itemFrameRef = v15, 
            videoDwellTimeInSec = 1, 
            videoKey = l_videoId_0, 
            videoPlaybackCoordinator = v8.videoPlaybackCoordinator, 
            videoVisiblePercent = 80
        }) else nil, 
        VideoContainer = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ClipsDescendants = true, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = v12 and 1001 or 1
        }, {
            VideoContent = v3.createElement(v4, {
                cornerRadius = v8.cornerRadius, 
                isFullScreen = v12, 
                Looped = v8.looped, 
                onExpandCallback = function() --[[ Line: 182 ]] --[[ Name: handleExpand ]]
                    -- upvalues: v8 (copy), v11 (copy)
                    if v8.onExpandCallback then
                        v8.onExpandCallback(v11.current and v11.current.TimePosition or 0);
                    end;
                end, 
                onVideoLoaded = v31, 
                Playing = v16, 
                Position = UDim2.fromScale(0.5, 0.5), 
                renderOnFailed = v28, 
                Size = UDim2.fromScale(1, 1), 
                thumbnailImage = v8.thumbnailImage, 
                timeLength = v21, 
                Video = l_videoId_0, 
                videoRef = v11, 
                ZIndex = v12 and 1001 or 1
            })
        })
    });
end));