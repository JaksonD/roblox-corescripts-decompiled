local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.AppCommonLib);
local v3 = require(l_Parent_1.CapturesCommon);
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.RobloxAppHooks);
local v6 = require(l_Parent_1.UIBlox);
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_memoize_0 = v2.memoize;
local l_useScreenSize_0 = v5.useScreenSize;
local l_useStyle_0 = v6.Core.Style.useStyle;
local v11 = require(l_Parent_0.Enums.CaptureType);
local l_getContentFromObject_0 = v3.Utils.getContentFromObject;
local v13 = require(l_Parent_0.Utils.getCaptureSize);
local l_MediaPlayer_0 = v3.Components.MediaPlayer;
local _ = require(l_Parent_0.Types);
local l_FFlagUseMediaPlayerInCarousel_0 = require(l_Parent_1.SharedFlags).FFlagUseMediaPlayerInCarousel;
local v17 = require(l_Parent_0.Flags.FFlagUseRbxstorageInGallery);
local v18 = require(l_Parent_0.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript);
local v24 = l_memoize_0(function(v19, v20) --[[ Line: 33 ]]
    local v21 = v19.X / v19.Y;
    local l_X_0 = v20.X;
    local v23 = math.floor(l_X_0 / v21);
    if v20.Y < v23 then
        v23 = v20.Y;
        l_X_0 = math.floor(v23 * v21);
    end;
    return Vector2.new(l_X_0, v23);
end);
local function _(v25) --[[ Line: 47 ]] --[[ Name: getDeleteTransitionSize ]]
    return UDim2.fromScale(v25, v25);
end;
local function v28(v27) --[[ Line: 51 ]] --[[ Name: getDeleteTransitionTransparency ]]
    -- upvalues: l_UserGameSettings_0 (copy)
    if l_UserGameSettings_0.ReducedMotion then
        return v27;
    else
        return 1;
    end;
end;
local function v30(v29) --[[ Line: 55 ]] --[[ Name: getCapturesItemSize ]]
    -- upvalues: l_UserGameSettings_0 (copy)
    if l_UserGameSettings_0.ReducedMotion then
        return (UDim2.fromScale(1, 1));
    else
        return (UDim2.fromScale(v29, v29));
    end;
end;
local function _(v31, v32) --[[ Line: 59 ]] --[[ Name: getFullScreenSize ]]
    local v33 = v31.X / v31.Y;
    local v34 = v32.X / v33;
    if v34 <= v32.Y then
        return UDim2.fromOffset(v32.X, v34);
    else
        local v35 = v32.Y * v33;
        return UDim2.fromOffset(v35, v32.Y);
    end;
end;
return function(v37) --[[ Line: 85 ]]
    -- upvalues: l_useStyle_0 (copy), v4 (copy), l_useScreenSize_0 (copy), v18 (copy), v11 (copy), v13 (copy), v24 (copy), l_UserGameSettings_0 (copy), l_getContentFromObject_0 (copy), v30 (copy), l_FFlagUseMediaPlayerInCarousel_0 (copy), l_MediaPlayer_0 (copy), v17 (copy), v28 (copy)
    local v38 = l_useStyle_0();
    local l_itemSize_0 = v37.itemSize;
    local v40, v41 = v4.useBinding(0);
    local v42, v43 = v4.useState(Vector2.new(0, 0));
    local v44 = l_useScreenSize_0();
    local v45 = v4.useRef(nil);
    local v46 = v4.useRef(nil);
    local v47, v48 = v4.useState(false);
    local l_imagePadding_0 = v37.imagePadding;
    local l_itemIndex_0 = v37.itemIndex;
    local v52 = v4.useCallback(function(v51) --[[ Line: 99 ]]
        -- upvalues: v41 (copy)
        v41(v51.AbsolutePosition.X);
    end, {
        v41
    });
    v4.useEffect(function() --[[ Line: 103 ]]
        -- upvalues: v46 (copy)
        return function() --[[ Line: 104 ]]
            -- upvalues: v46 (ref)
            if v46.current then
                v46.current.Video = "";
            end;
        end;
    end, {});
    v4.useEffect(function() --[[ Line: 111 ]]
        -- upvalues: v18 (ref), v37 (copy), v43 (copy), l_itemSize_0 (copy), v11 (ref), v13 (ref)
        if v18 then
            if v37.capture.CaptureType == Enum.CaptureType.Screenshot then
                v43(l_itemSize_0);
            end;
            return;
        elseif v37.capture.type == v11.Video then
            return;
        else
            task.spawn(function() --[[ Line: 123 ]]
                -- upvalues: v13 (ref), v37 (ref), v43 (ref), l_itemSize_0 (ref)
                local v53 = v13(v37.capture.contentId);
                if v53 then
                    v43(v53);
                    return;
                else
                    v43(l_itemSize_0);
                    return;
                end;
            end);
            return;
        end;
    end, {
        l_itemSize_0, 
        v37.capture
    });
    local v56 = v4.useCallback(function(v54) --[[ Line: 134 ]]
        -- upvalues: v46 (copy), v43 (copy)
        v46.current = v54;
        local l_Resolution_0 = v54.Resolution;
        v43(Vector2.new(l_Resolution_0.X, l_Resolution_0.Y));
    end, {});
    local v62 = v4.useCallback(function(v57) --[[ Line: 140 ]]
        -- upvalues: l_itemSize_0 (copy), v44 (copy)
        local v58 = l_itemSize_0.X / 2;
        local v59 = v44.X / 2;
        local v60 = v57 + v58;
        local v61 = math.abs(v59 - v60);
        v61 = v61 < 25 and 0 or v61 - 25;
        return math.sign(v59 - v60), (math.min(1, v61 / (l_itemSize_0.X - 25)));
    end, {
        l_itemSize_0, 
        l_itemIndex_0, 
        v44
    });
    local v70 = v4.useCallback(function(v63) --[[ Line: 158 ]]
        -- upvalues: v62 (copy), v24 (ref), v42 (copy), l_itemSize_0 (copy), v37 (copy)
        local _, v65 = v62(v63);
        local v66 = v24(v42, l_itemSize_0);
        if v65 == 0 then
            return UDim2.fromOffset(v66.X, v66.Y);
        else
            local v67 = 1 - v65 * (1 - v37.unfocusedSizeMultiplier);
            local v68 = v66.Y * v67;
            local v69 = v66.X * v67;
            v68 = math.floor(v68);
            v69 = math.floor(v69);
            return UDim2.fromOffset(v69, v68);
        end;
    end, {
        v42, 
        l_itemSize_0, 
        v37.unfocusedSizeMultiplier, 
        v62
    });
    local v76 = v4.useCallback(function(v71) --[[ Line: 177 ]]
        -- upvalues: v62 (copy), v70 (copy), l_itemSize_0 (copy), l_imagePadding_0 (copy)
        local v72, v73 = v62(v71);
        if v73 == 0 then
            return UDim2.fromScale(0.5, 0.5);
        else
            local l_Offset_0 = v70(v71).X.Offset;
            local v75 = (l_itemSize_0.X / 2 - l_imagePadding_0 - l_Offset_0 / 2) * v73;
            return UDim2.new(0.5, v75 * v72, 0.5, 0);
        end;
    end, {
        v42, 
        l_imagePadding_0, 
        l_itemSize_0, 
        v44, 
        v62, 
        v70
    });
    local l_Transparency_0 = v38.Theme.Overlay.Transparency;
    local v81 = v4.useCallback(function(v78) --[[ Line: 198 ]]
        -- upvalues: v62 (copy), l_Transparency_0 (copy)
        local _, v80 = v62(v78);
        return 1 - (1 - l_Transparency_0) * v80;
    end, {
        l_Transparency_0, 
        v62
    });
    local v85 = v4.useCallback(function(v82) --[[ Line: 203 ]]
        -- upvalues: l_UserGameSettings_0 (ref), v81 (copy)
        local l_absoluteXPosition_0 = v82.absoluteXPosition;
        local l_fadeOutBinding_0 = v82.fadeOutBinding;
        if l_UserGameSettings_0.ReducedMotion and l_fadeOutBinding_0 then
            return 1;
        elseif l_fadeOutBinding_0 then
            return (math.min(v81(l_absoluteXPosition_0), l_fadeOutBinding_0));
        else
            return v81(l_absoluteXPosition_0);
        end;
    end, {
        v81
    });
    local v86 = v4.useCallback(function() --[[ Line: 217 ]]
        -- upvalues: v37 (copy), v48 (copy), v47 (copy)
        if v37.onExpandCallback then
            v37.onExpandCallback(v37.itemIndex);
        end;
        v48(not v47);
    end, {
        v47, 
        v37.onExpandCallback, 
        v37.itemIndex
    });
    local v87 = v4.useCallback(function() --[[ Line: 224 ]]
        -- upvalues: v37 (copy)
        if v37.onMuteCallback then
            v37.onMuteCallback();
        end;
    end, {
        v37.onMuteCallback
    });
    local v88 = v4.useCallback(function() --[[ Line: 230 ]]
        -- upvalues: v4 (ref)
        return (v4.createElement("Frame", {
            Size = UDim2.fromScale(1, 1)
        }));
    end, {});
    local v89 = if v18 then v37.capture.CaptureType == Enum.CaptureType.Screenshot else v37.capture.type == v11.Screenshot;
    local v90 = if v18 then v37.capture.CaptureType == Enum.CaptureType.Video else v37.capture.type == v11.Video;
    local v91 = if v18 then l_getContentFromObject_0(v37.capture) else v37.capture.contentId;
    local v92 = if v18 then v37.capture else v37.capture.videoCapture;
    local l_createElement_0 = v4.createElement;
    local v94 = "Frame";
    local v95 = {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = UDim2.fromScale(1, 1), 
        [v4.Change.AbsolutePosition] = v52
    };
    local v96 = {
        FullScreenOffset = v4.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v47 and 16 or 0)
        })
    };
    local l_createElement_1 = v4.createElement;
    local v98 = "Frame";
    local v99 = {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Position = if v47 then UDim2.fromScale(0.5, 0.5) else v40:map(v76)
    };
    local v100;
    if v47 then
        local v101 = v42.X / v42.Y;
        local v102 = v44.X / v101;
        if v102 <= v44.Y then
            v100 = UDim2.fromOffset(v44.X, v102);
        else
            local v103 = v44.Y * v101;
            v100 = UDim2.fromOffset(v103, v44.Y);
        end;
    else
        v100 = v40:map(v70);
    end;
    v99.Size = v100;
    v100 = {
        CaptureImage = if v89 then v4.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundColor3 = v38.Theme.BackgroundContrast.Color, 
            BackgroundTransparency = v18 and 0 or 1, 
            BorderSizePixel = 0, 
            Image = if v18 then nil else v91, 
            ImageContent = if v18 then v91 else nil, 
            Position = UDim2.fromScale(0.5, 0.5), 
            ScaleType = if v18 then Enum.ScaleType.Fit else Enum.ScaleType.Crop, 
            Size = if v37.fadeOutBinding then v37.fadeOutBinding:map(v30) else UDim2.fromScale(1, 1), 
            Visible = v42 ~= Vector2.new(0, 0), 
            ZIndex = 1
        }) else nil
    };
    local v104;
    if v90 then
        if l_FFlagUseMediaPlayerInCarousel_0 then
            v104 = v4.createElement;
            local l_l_MediaPlayer_0_0 = l_MediaPlayer_0;
            local v106 = {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundColor3 = v38.Theme.BackgroundContrast.Color, 
                BackgroundTransparency = v18 and 0 or 1, 
                BorderSizePixel = 0, 
                isOverlayDisabled = not v37.isSelected or v37.isDisabled
            };
            local v107 = false;
            if v44.X > v44.Y then
                v107 = false;
                if v42.Y > v42.X then
                    v107 = not v47;
                end;
            end;
            v106.isTimeHidden = v107;
            v106.Looped = true;
            v106.onExpandCallback = v86;
            v106.onMuteCallback = v87;
            v106.onLoaded = v56;
            v106.Playing = v37.isSelected and v40:map(function(v108) --[[ Line: 305 ]]
                -- upvalues: v62 (copy)
                local _, v110 = v62(v108);
                return v110 < 0.5;
            end);
            v106.Position = UDim2.fromScale(0.5, 0.5);
            v106.renderOnFailed = v88;
            v106.Size = if v37.fadeOutBinding then v37.fadeOutBinding:map(v30) else UDim2.fromScale(1, 1);
            v106.VideoContent = l_getContentFromObject_0(v92);
            v106.videoRef = v45;
            v106.ZIndex = v47 and 5 or 1;
            v104 = v104(l_l_MediaPlayer_0_0, v106);
        else
            v104 = v4.createElement("VideoFrame", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Playing = v40:map(function(v111) --[[ Line: 321 ]]
                    -- upvalues: v62 (copy)
                    local _, v113 = v62(v111);
                    return v113 < 0.5;
                end), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Looped = true, 
                Size = if v37.fadeOutBinding then v37.fadeOutBinding:map(v30) else UDim2.fromScale(1, 1), 
                Video = if not v17 then v37.capture.contentId else nil, 
                VideoContent = if v17 then l_getContentFromObject_0(v37.capture.videoCapture) else nil, 
                Volume = 0, 
                ZIndex = 1, 
                [v4.Event.Loaded] = v56
            });
        end;
    else
        v104 = nil;
    end;
    v100.CaptureVideo = v104;
    v100.Overlay = v4.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundColor3 = v38.Theme.Overlay.Color, 
        BackgroundTransparency = v4.joinBindings({
            absoluteXPosition = v40, 
            fadeOutBinding = v37.fadeOutBinding
        }):map(v85), 
        BorderSizePixel = 0, 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = if v37.fadeOutBinding then v37.fadeOutBinding:map(v30) else UDim2.fromScale(1, 1), 
        ZIndex = 2
    });
    v100.TransitionOverlay = v4.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundColor3 = v38.Theme.BackgroundContrast.Color, 
        BackgroundTransparency = if v37.transitionBinding then v37.transitionBinding:map(v28) else 1, 
        BorderSizePixel = 0, 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = UDim2.fromScale(1, 1), 
        ZIndex = 3
    });
    v100.FullScreenBackground = if l_FFlagUseMediaPlayerInCarousel_0 and v47 then v4.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundColor3 = v38.Theme.BackgroundContrast.Color, 
        BackgroundTransparency = 0, 
        BorderSizePixel = 0, 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = UDim2.fromOffset(v44.X, v44.Y), 
        ZIndex = 4
    }) else nil;
    v96.CaptureContainer = l_createElement_1(v98, v99, v100);
    return l_createElement_0(v94, v95, v96);
end;