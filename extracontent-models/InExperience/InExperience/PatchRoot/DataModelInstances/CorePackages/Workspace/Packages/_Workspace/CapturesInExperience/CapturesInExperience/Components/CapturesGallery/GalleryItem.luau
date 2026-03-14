local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.CapturesCommon);
local v3 = require(l_Parent_1.Foundation);
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.RoactUtils);
local v6 = require(l_Parent_0.Analytics.useAnalytics);
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local v8 = require(l_Parent_0.Enums.CaptureType);
local v9 = require(l_Parent_0.Actions.CarouselOpened);
local v10 = require(l_Parent_0.Analytics.EventNames);
local l_getContentFromObject_0 = v2.Utils.getContentFromObject;
local l_getCropSize_0 = v2.Utils.getCropSize;
local v13 = require(l_Parent_0.Utils.getFormatTime);
local _ = require(l_Parent_0.Types);
local l_Text_0 = v3.Text;
local v16 = require(l_Parent_0.Flags.FFlagUseRbxstorageInGallery);
local v17 = require(l_Parent_0.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript);
return function(v18) --[[ Line: 30 ]]
    -- upvalues: v6 (copy), l_useDispatch_0 (copy), v4 (copy), v10 (copy), v9 (copy), l_getCropSize_0 (copy), v17 (copy), v8 (copy), l_getContentFromObject_0 (copy), v16 (copy), l_Text_0 (copy), v13 (copy)
    local v19 = v6();
    local v20 = l_useDispatch_0();
    local v21, v22 = v4.useState(Vector2.new(0, 0));
    local v23, v24 = v4.useState(Vector2.new(0, 0));
    local v25, v26 = v4.useState(UDim2.fromScale(1, 1));
    local v27 = v4.useCallback(function() --[[ Line: 38 ]]
        -- upvalues: v19 (copy), v10 (ref), v20 (copy), v9 (ref), v18 (copy)
        v19.fireEvent(v10.CapturesCarouselOpened);
        v20(v9(v18.captureIndex));
    end, {});
    local v29 = v4.useCallback(function(v28) --[[ Line: 43 ]]
        -- upvalues: v22 (copy)
        v22(v28.AbsoluteSize);
    end, {});
    local v32 = v4.useCallback(function(v30) --[[ Line: 47 ]]
        -- upvalues: v24 (copy)
        local l_Resolution_0 = v30.Resolution;
        v24(l_Resolution_0);
    end, {});
    v4.useEffect(function() --[[ Line: 52 ]]
        -- upvalues: v26 (copy), l_getCropSize_0 (ref), v21 (copy), v23 (copy)
        v26(l_getCropSize_0(v21, v23));
    end, {
        v21, 
        v23
    });
    return v4.createElement("ImageButton", {
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        Image = if v17 then nil else if v18.capture.type == v8.Screenshot then v18.capture.contentId else if v18.capture.type == v8.Video then v18.capture.thumbnailKey else nil, 
        ImageContent = if v17 then l_getContentFromObject_0(v18.capture) else nil, 
        ScaleType = Enum.ScaleType.Crop, 
        Size = UDim2.fromScale(1, 1), 
        [v4.Change.AbsoluteSize] = if not v16 then v29 else nil, 
        [v4.Event.Activated] = v27
    }, {
        TimeLength = if v17 and v18.capture.CaptureType == Enum.CaptureType.Video then v4.createElement(l_Text_0, {
            LayoutOrder = 2, 
            Text = v13(v18.capture.TimeLength), 
            tag = "text-title-large content-emphasis auto-xy size-full text-align-x-right text-align-y-bottom padding-x-small padding-y-xsmall"
        }) else if v17 and v18.capture.CaptureType == Enum.CaptureType.Screenshot then nil else if v16 and v18.capture.type == v8.Video then v4.createElement(l_Text_0, {
            LayoutOrder = 2, 
            Text = v13(v18.capture.videoCapture.TimeLength), 
            tag = "text-title-large content-emphasis auto-xy size-full text-align-x-right text-align-y-bottom padding-x-small padding-y-xsmall"
        }) else nil, 
        VideoPreview = if not v16 and v18.capture.type == v8.Video then v4.createElement("VideoFrame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Playing = false, 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = v25, 
            Video = v18.capture.contentId, 
            [v4.Event.Loaded] = v32
        }) else nil
    });
end;