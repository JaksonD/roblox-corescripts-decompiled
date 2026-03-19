local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.CapturesCommon);
local v3 = require(l_Parent_1.Cryo);
local v4 = require(l_Parent_1.Foundation);
local v5 = require(l_Parent_1.React);
local v6 = require(l_Parent_1.RoactUtils);
local v7 = require(l_Parent_1.UIBlox);
local l_Checkbox_0 = v7.App.InputButton.Checkbox;
local l_Images_0 = v7.App.ImageSet.Images;
local l_Text_0 = v4.Text;
local v11 = require(l_Parent_0.Analytics.useAnalytics);
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local v14 = require(l_Parent_0.Enums.CaptureType);
local v15 = require(l_Parent_0.Constants);
local v16 = require(l_Parent_0.Analytics.EventNames);
local l_getContentFromObject_0 = v2.Utils.getContentFromObject;
local l_getCropSize_0 = v2.Utils.getCropSize;
local v19 = require(l_Parent_0.Utils.getFormatTime);
local v20 = require(l_Parent_0.Thunks.SelectCapture);
local _ = require(l_Parent_0.Types);
local v22 = require(l_Parent_0.Flags.FFlagUseRbxstorageInGallery);
local v23 = require(l_Parent_0.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript);
return function(v24) --[[ Line: 42 ]]
    -- upvalues: v11 (copy), l_useDispatch_0 (copy), v5 (copy), l_useSelector_0 (copy), v15 (copy), v16 (copy), v20 (copy), l_getCropSize_0 (copy), v3 (copy), v23 (copy), v14 (copy), v22 (copy), l_getContentFromObject_0 (copy), l_Checkbox_0 (copy), l_Images_0 (copy), l_Text_0 (copy), v19 (copy)
    local v25 = v11();
    local v26 = l_useDispatch_0();
    local v27, v28 = v5.useState(Vector2.new(0, 0));
    local v29, v30 = v5.useState(Vector2.new(0, 0));
    local v31, v32 = v5.useState(UDim2.fromScale(1, 1));
    local v33, v34 = v5.useState(false);
    local v36 = l_useSelector_0(function(v35) --[[ Line: 50 ]]
        -- upvalues: v15 (ref)
        return v35[v15.RoduxKey].CaptureManager.SelectedCaptures;
    end);
    local v37 = v5.useCallback(function() --[[ Line: 54 ]]
        -- upvalues: v34 (copy), v33 (copy), v25 (copy), v16 (ref), v26 (copy), v20 (ref), v24 (copy)
        v34(not v33);
        v25.fireEvent(v16.CapturesManagerItemActivated);
        v26(v20(v24.capture));
    end, {
        v33, 
        v24.capture
    });
    local v39 = v5.useCallback(function(v38) --[[ Line: 60 ]]
        -- upvalues: v28 (copy)
        v28(v38.AbsoluteSize);
    end, {});
    local v42 = v5.useCallback(function(v40) --[[ Line: 64 ]]
        -- upvalues: v30 (copy)
        local l_Resolution_0 = v40.Resolution;
        v30(l_Resolution_0);
    end, {});
    v5.useEffect(function() --[[ Line: 69 ]]
        -- upvalues: v32 (copy), l_getCropSize_0 (ref), v27 (copy), v29 (copy)
        v32(l_getCropSize_0(v27, v29));
    end, {
        v27, 
        v29
    });
    v5.useEffect(function() --[[ Line: 73 ]]
        -- upvalues: v34 (copy), v3 (ref), v36 (copy), v24 (copy)
        v34(v3.List.find(v36, v24.capture) ~= nil);
    end, {
        v36, 
        v24.capture
    });
    return v5.createElement("ImageButton", {
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        Image = if v23 then nil else if v24.capture.type == v14.Screenshot then v24.capture.contentId else if v22 then v24.capture.thumbnailKey else nil, 
        ImageContent = if v23 then l_getContentFromObject_0(v24.capture) else nil, 
        ImageTransparency = v33 and 0.5 or 0, 
        ScaleType = Enum.ScaleType.Crop, 
        Size = UDim2.fromScale(1, 1), 
        [v5.Change.AbsoluteSize] = if not v22 then v39 else nil, 
        [v5.Event.Activated] = v37
    }, {
        CheckboxFrame = v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(1, -34, 0, 8), 
            Size = UDim2.fromOffset(26, 26), 
            ZIndex = 2
        }, {
            Checkbox = if v33 then v5.createElement(l_Checkbox_0, {
                isSelected = true, 
                isDisabled = false, 
                layoutOrder = 1, 
                text = "", 
                onActivated = v37
            }) else v5.createElement("ImageButton", {
                BackgroundTransparency = 1, 
                Image = l_Images_0["squircles/hollow"].Image, 
                ImageRectOffset = l_Images_0["squircles/hollow"].ImageRectOffset, 
                ImageRectSize = l_Images_0["squircles/hollow"].ImageRectSize, 
                ImageTransparency = 0.7, 
                Size = UDim2.fromOffset(26, 26), 
                [v5.Event.Activated] = v37
            })
        }), 
        TimeLength = if v23 and v24.capture.CaptureType == Enum.CaptureType.Video then v5.createElement(l_Text_0, {
            LayoutOrder = 2, 
            Text = v19(v24.capture.TimeLength), 
            tag = "text-title-large content-emphasis auto-xy size-full text-align-x-right text-align-y-bottom padding-x-small padding-y-xsmall"
        }) else if v23 and v24.capture.CaptureType == Enum.CaptureType.Screenshot then nil else if v22 and v24.capture.type == v14.Video then v5.createElement(l_Text_0, {
            LayoutOrder = 2, 
            Text = v19(v24.capture.videoCapture.TimeLength), 
            tag = "text-title-large content-emphasis auto-xy size-full text-align-x-right text-align-y-bottom padding-x-small padding-y-xsmall"
        }) else nil, 
        VideoPreview = if not v22 and v24.capture.type == v14.Video then v5.createElement("VideoFrame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Playing = false, 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = v31, 
            Video = v24.capture.contentId, 
            [v5.Event.Loaded] = v42
        }) else nil
    });
end;