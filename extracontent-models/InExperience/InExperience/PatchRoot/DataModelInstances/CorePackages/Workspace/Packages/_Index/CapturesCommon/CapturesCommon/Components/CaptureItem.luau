local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_0.Enums.CaptureType);
local v4 = require(l_Parent_0.Components.MediaPlayer);
local _ = require(l_Parent_0.Types);
local v6 = require(l_Parent_0.Utils.getCropSize);
local v7 = require(l_Parent_0.Utils.getFitSize);
local v8 = require(l_Parent_0.Flags.FFlagUseRbxStorageInCapturesCommon);
return function(v9) --[[ Line: 25 ]]
    -- upvalues: v2 (copy), v7 (copy), v6 (copy), v3 (copy), v8 (copy), v4 (copy)
    local v10, v11 = v2.useState(Vector2.new(0, 0));
    local v12, v13 = v2.useState(Vector2.new(0, 0));
    local v14, v15 = v2.useState(UDim2.fromScale(1, 1));
    local v18 = v2.useCallback(function(v16) --[[ Line: 30 ]]
        -- upvalues: v13 (copy)
        local l_Resolution_0 = v16.Resolution;
        v13(l_Resolution_0);
    end, {});
    local v20 = v2.useCallback(function(v19) --[[ Line: 35 ]]
        -- upvalues: v11 (copy)
        v11(v19.AbsoluteSize);
    end, {});
    v2.useEffect(function() --[[ Line: 39 ]]
        -- upvalues: v9 (copy), v15 (copy), v7 (ref), v10 (copy), v12 (copy), v6 (ref)
        if v9.scaleType == Enum.ScaleType.Fit then
            v15(v7(v10, v12));
            return;
        else
            v15(v6(v10, v12));
            return;
        end;
    end, {
        v10, 
        v12
    });
    return v2.createElement("ImageButton", {
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        Image = if v9.capture.type == v3.Screenshot then v9.capture.contentId else if v8 then v9.capture.thumbnailKey else nil, 
        ScaleType = v9.scaleType or Enum.ScaleType.Crop, 
        Size = UDim2.fromScale(1, 1), 
        [v2.Change.AbsoluteSize] = if not v8 then v20 else nil, 
        [v2.Event.Activated] = v9.onActivated
    }, {
        Overlay = v9.overlay, 
        VideoPreview = if v8 and v9.capture.type == v3.Video and v9.shouldUseMediaPlayer and v9.mediaPlayerProps then v2.createElement(v4, v9.mediaPlayerProps) else if not v8 and v9.capture.type == v3.Video then if v9.shouldUseMediaPlayer and v9.mediaPlayerProps then v2.createElement(v4, v9.mediaPlayerProps) else v2.createElement("VideoFrame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Playing = v9.isVideoPlaying == true, 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = v14, 
            Video = v9.capture.contentId, 
            [v2.Event.Loaded] = v18
        }) else nil
    });
end;