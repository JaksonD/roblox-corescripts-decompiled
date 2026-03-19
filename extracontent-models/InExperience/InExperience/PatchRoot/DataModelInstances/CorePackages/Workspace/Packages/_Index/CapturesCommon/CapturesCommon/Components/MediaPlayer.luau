local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Foundation);
local v4 = require(l_Parent_1.React);
local l_ButtonSize_0 = v3.Enums.ButtonSize;
local l_Enums_0 = v3.Enums;
local l_IconButton_0 = v3.IconButton;
local l_StateLayerAffordance_0 = l_Enums_0.StateLayerAffordance;
local l_Image_0 = v3.Image;
local l_Text_0 = v3.Text;
local l_View_0 = v3.View;
local v12 = require(l_Parent_0.Components.LoadableVideo);
local v13 = require(l_Parent_0.Components.ProgressBar);
local function _(v14) --[[ Line: 49 ]] --[[ Name: getCurrent ]]
    if typeof(v14) == "table" and v14.current ~= nil then
        return v14.current;
    else
        return nil;
    end;
end;
return function(v16) --[[ Line: 56 ]] --[[ Name: MediaPlayer ]]
    -- upvalues: v4 (copy), l_RunService_0 (copy), l_View_0 (copy), l_StateLayerAffordance_0 (copy), l_IconButton_0 (copy), l_ButtonSize_0 (copy), v12 (copy), l_Text_0 (copy), v13 (copy), v3 (copy), l_Image_0 (copy)
    local v17, v18 = v4.useState(0);
    local v19, v20 = v4.useState(0);
    local v21, v22 = v4.useState(false);
    local v23, v24 = v4.useState(false);
    local v25, v26 = v4.useState(false);
    local v27, v28 = v4.useState(true);
    v4.useEffect(function() --[[ Line: 64 ]]
        -- upvalues: v16 (copy), v22 (copy), l_RunService_0 (ref), v18 (copy)
        local l_videoRef_0 = v16.videoRef;
        local v30 = if typeof(l_videoRef_0) == "table" and l_videoRef_0.current ~= nil then l_videoRef_0.current else nil;
        if not v30 then
            return;
        else
            l_videoRef_0 = v30.Played:Connect(function() --[[ Line: 70 ]]
                -- upvalues: v22 (ref)
                v22(false);
            end);
            local v31 = v30.Ended:Connect(function() --[[ Line: 74 ]]
                -- upvalues: v22 (ref)
                v22(true);
            end);
            local v32 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 78 ]]
                -- upvalues: v18 (ref), v30 (copy)
                v18(v30.TimePosition);
            end);
            return function() --[[ Line: 82 ]]
                -- upvalues: v32 (copy), l_videoRef_0 (copy), v31 (copy)
                v32:Disconnect();
                l_videoRef_0:Disconnect();
                v31:Disconnect();
            end;
        end;
    end, {
        v16.videoRef, 
        v27, 
        v21
    });
    local v36 = v4.useCallback(function(v33) --[[ Line: 89 ]]
        -- upvalues: v16 (copy), v20 (copy)
        local l_videoRef_1 = v16.videoRef;
        local v35 = if typeof(l_videoRef_1) == "table" and l_videoRef_1.current ~= nil then l_videoRef_1.current else nil;
        if not v35 then
            return;
        else
            v20(v35.TimeLength);
            v16.onLoaded(v33);
            return;
        end;
    end, {
        v16.onLoaded, 
        v16.videoRef
    });
    local v37 = v4.useCallback(function() --[[ Line: 99 ]]
        -- upvalues: v28 (copy), v27 (copy)
        v28(not v27);
    end, {
        v27
    });
    local v40 = v4.useCallback(function() --[[ Line: 103 ]]
        -- upvalues: v16 (copy), v21 (copy), v22 (copy), v17 (copy), v19 (copy)
        local l_videoRef_2 = v16.videoRef;
        local v39 = if typeof(l_videoRef_2) == "table" and l_videoRef_2.current ~= nil then l_videoRef_2.current else nil;
        if not v39 then
            return;
        elseif not v21 then
            v39:Pause();
            v22(true);
            return;
        else
            if math.abs(v17 - v19) <= 0.1 then
                v39.TimePosition = 0;
            end;
            v39:Play();
            v22(false);
            return;
        end;
    end, {
        v21, 
        v16.videoRef, 
        v17, 
        v19
    });
    local v41 = v4.useCallback(function() --[[ Line: 121 ]]
        -- upvalues: v16 (copy), v26 (copy), v25 (copy)
        if v16.onExpandCallback then
            v16.onExpandCallback();
        end;
        v26(not v25);
    end, {
        v25, 
        v16.onExpandCallback
    });
    local v45 = v4.useCallback(function(v42) --[[ Line: 129 ]]
        -- upvalues: v16 (copy)
        local l_videoRef_3 = v16.videoRef;
        local v44 = if typeof(l_videoRef_3) == "table" and l_videoRef_3.current ~= nil then l_videoRef_3.current else nil;
        if not v44 then
            return;
        else
            v44.TimePosition = v44.TimeLength * v42;
            return;
        end;
    end, {
        v16.videoRef
    });
    local v48 = v4.useCallback(function() --[[ Line: 138 ]]
        -- upvalues: v16 (copy), v23 (copy), v24 (copy)
        if v16.onMuteCallback then
            v16.onMuteCallback();
        end;
        local l_videoRef_4 = v16.videoRef;
        local v47 = if typeof(l_videoRef_4) == "table" and l_videoRef_4.current ~= nil then l_videoRef_4.current else nil;
        if not v47 then
            return;
        else
            v47.Volume = v23 and 1 or 0;
            v24(not v23);
            return;
        end;
    end, {
        v23, 
        v16.onMuteCallback, 
        v16.videoRef
    });
    local v49 = not v16.Playing and v16.thumbnailImage ~= nil and v16.thumbnailImage ~= "";
    local v50 = (not not v16.Video or v16.VideoContent) and (v16.Playing ~= nil and v16.Playing or not v16.thumbnailImage);
    local l_createElement_0 = v4.createElement;
    local l_l_View_0_0 = l_View_0;
    local v53 = {
        tag = "shrink size-full", 
        onActivated = v37, 
        stateLayer = {
            affordance = l_StateLayerAffordance_0.None
        }, 
        ZIndex = v16.ZIndex
    };
    local v54 = {};
    local l_videoRef_5 = v16.videoRef;
    v54.HeaderBarContainer = if not ((if typeof(l_videoRef_5) == "table" and l_videoRef_5.current ~= nil then l_videoRef_5.current else nil) ~= nil and v16.onExpandCallback) or v16.isZooming or v27 or v16.isOverlayDisabled then nil else v4.createElement(l_View_0, {
        tag = "anchor-top-center position-top-center size-full-0 auto-y padding-medium row align-x-right", 
        ZIndex = 3
    }, {
        ExpandButton = v4.createElement(l_IconButton_0, {
            icon = v25 and "icons/actions/previewShrink" or "icons/actions/previewExpand", 
            isDisabled = false, 
            LayoutOrder = 1, 
            onActivated = v41, 
            size = l_ButtonSize_0.Medium
        })
    });
    v54.VideoPreview = if v50 then v4.createElement(v12, {
        AnchorPoint = v16.AnchorPoint, 
        BackgroundTransparency = v16.BackgroundTransparency, 
        cornerRadius = v16.cornerRadius, 
        Looped = v16.Looped, 
        onLoaded = v36, 
        Playing = v16.Playing, 
        Position = v16.Position, 
        renderOnFailed = v16.renderOnFailed, 
        scaleType = v16.scaleType, 
        Size = v16.Size, 
        Video = v16.Video, 
        VideoContent = v16.VideoContent, 
        videoRef = v16.videoRef
    }) else v4.createElement(l_View_0, {
        tag = "align-x-center align-y-center auto-xy items-center gap-medium"
    }, {
        Text = v4.createElement(l_Text_0, {
            Text = "No video to display", 
            tag = "auto-xy"
        })
    });
    l_videoRef_5 = v16.videoRef;
    v54.ProgressBarContainer = if not ((if typeof(l_videoRef_5) == "table" and l_videoRef_5.current ~= nil then l_videoRef_5.current else nil) ~= nil) or v16.isZooming or v27 or v16.isOverlayDisabled then nil else v4.createElement(l_View_0, {
        tag = "anchor-bottom-center position-bottom-center size-full-0 auto-y", 
        ZIndex = 3
    }, {
        ProgressBar = v4.createElement(v13, {
            isMuted = v23, 
            isPlaying = not v21, 
            isTimeHidden = v16.isTimeHidden, 
            onMuteButtonActivated = v48, 
            onPlayButtonActivated = v40, 
            onProgressBarActivated = v45, 
            timePosition = v17, 
            timeLength = v19
        })
    });
    v54.ShadowBlock = if not not v27 or v16.isOverlayDisabled then nil else v4.createElement(l_View_0, {
        backgroundStyle = {
            Color3 = Color3.fromRGB(0, 0, 0), 
            Transparency = 0.4
        }, 
        stateLayer = {
            affordance = v3.Enums.StateLayerAffordance.None
        }, 
        tag = "size-full-full", 
        ZIndex = 2
    });
    v54.ThumbnailImage = if v49 then v4.createElement(l_Image_0, {
        Image = v16.thumbnailImage, 
        Size = UDim2.fromScale(1, 1), 
        ZIndex = 2
    }, {
        UICorner = if v16.cornerRadius then v4.createElement("UICorner", {
            CornerRadius = UDim.new(0, v16.cornerRadius)
        }) else nil
    }) else nil;
    return l_createElement_0(l_l_View_0_0, v53, v54);
end;