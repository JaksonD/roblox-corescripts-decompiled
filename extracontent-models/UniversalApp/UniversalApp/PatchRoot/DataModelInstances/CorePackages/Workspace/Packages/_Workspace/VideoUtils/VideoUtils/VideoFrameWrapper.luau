local l_Parent_0 = script:FindFirstAncestor("VideoUtils").Parent;
local v1 = require(l_Parent_0.React);
local l_FFlagLuaAppVideoPreviewSmoothTransition_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppVideoPreviewSmoothTransition;
local l_FFlagLuaAppVideoFrameSingleTilePooling_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppVideoFrameSingleTilePooling;
return function(v4) --[[ Line: 23 ]] --[[ Name: VideoFrameWrapper ]]
    -- upvalues: v1 (copy), l_FFlagLuaAppVideoFrameSingleTilePooling_0 (copy), l_FFlagLuaAppVideoPreviewSmoothTransition_0 (copy)
    v1.useEffect(function() --[[ Line: 24 ]]
        -- upvalues: v4 (copy)
        local v5 = if v4.videoFrameRef then v4.videoFrameRef.current else nil;
        return function() --[[ Line: 27 ]]
            -- upvalues: v5 (copy)
            if v5 then
                v5.Video = "";
            end;
        end;
    end, {
        v4.videoFrameRef
    });
    return v1.createElement("VideoFrame", {
        Size = UDim2.fromScale(1, 1), 
        Video = if l_FFlagLuaAppVideoFrameSingleTilePooling_0 then if v4.isPlaying then v4.video else "" else v4.video, 
        Playing = not l_FFlagLuaAppVideoFrameSingleTilePooling_0 or v4.isPlaying, 
        Looped = v4.looped, 
        Volume = v4.volume, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ZIndex = if l_FFlagLuaAppVideoPreviewSmoothTransition_0 then v4.zIndex or 1 else 1, 
        ref = v4.videoFrameRef, 
        [v1.Event.Loaded] = v4.onLoaded, 
        [v1.Event.DidLoop] = v4.onLooped, 
        [v1.Event.Ended] = v4.onEnded
    }, {
        Corner = if v4.cornerRadius then v1.createElement("UICorner", {
            CornerRadius = UDim.new(0, v4.cornerRadius)
        }) else nil
    });
end;