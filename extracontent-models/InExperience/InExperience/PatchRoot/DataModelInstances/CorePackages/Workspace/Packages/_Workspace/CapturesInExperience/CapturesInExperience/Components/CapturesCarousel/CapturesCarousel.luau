local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = require(l_Parent_1.AppCommonLib);
local v5 = require(l_Parent_1.React);
local v6 = require(l_Parent_1.RoactUtils);
local v7 = require(l_Parent_1.RobloxAppHooks);
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
local l_useScreenSize_0 = v7.useScreenSize;
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local l_useSignal_0 = v6.Hooks.useSignal;
local v12 = require(l_Parent_0.Enums.CaptureType);
local v13 = require(l_Parent_0.Components.CapturesCarousel.CarouselItem);
local v14 = require(l_Parent_0.Components.CapturesCarousel.CarouselNavArrow);
local v15 = require(l_Parent_0.Thunks.CarouselScrolled);
local v16 = require(l_Parent_0.Constants);
local v17 = require(l_Parent_0.Analytics.EventNames);
local v18 = require(l_Parent_0.Utils.getClosestItemToCenter);
local _ = require(l_Parent_0.Types);
local v20 = require(l_Parent_0.Analytics.useAnalytics);
local v21 = require(l_Parent_0.Hooks.useCarouselController);
local v22 = require(l_Parent_0.Flags.FFlagUseRbxstorageInGallery);
local v23 = require(l_Parent_0.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript);
local function _(v24, v25) --[[ Line: 40 ]] --[[ Name: getMargins ]]
    local l_X_0 = (v25 - v24).X;
    if l_X_0 % 2 == 0 then
        local v27 = l_X_0 / 2;
        return v27, v27;
    else
        local v28 = math.floor(l_X_0 / 2);
        return v28 + 1, v28;
    end;
end;
local function _() --[[ Line: 54 ]] --[[ Name: getTouchScrollingEnabled ]]
    -- upvalues: l_UserInputService_0 (copy), l_UserGameSettings_0 (copy)
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    local v31 = true;
    if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.IOS then
        v31 = l_l_UserInputService_0_Platform_0 == Enum.Platform.Android;
    end;
    local l_TouchEnabled_0 = l_UserInputService_0.TouchEnabled;
    local l_ReducedMotion_0 = l_UserGameSettings_0.ReducedMotion;
    return v31 and l_TouchEnabled_0 and not l_ReducedMotion_0;
end;
return function(v35) --[[ Line: 70 ]]
    -- upvalues: v20 (copy), l_useDispatch_0 (copy), l_useScreenSize_0 (copy), v5 (copy), l_useSelector_0 (copy), v16 (copy), v17 (copy), v15 (copy), v21 (copy), l_useSignal_0 (copy), v18 (copy), v13 (copy), v22 (copy), v23 (copy), v12 (copy), l_UserInputService_0 (copy), l_UserGameSettings_0 (copy), v14 (copy)
    local v36 = v20();
    local v37 = l_useDispatch_0();
    local v38 = l_useScreenSize_0();
    local v39, v40 = v5.useState(false);
    local v41, v42 = v5.useState(0);
    local v44 = l_useSelector_0(function(v43) --[[ Line: 77 ]]
        -- upvalues: v16 (ref)
        return v43[v16.RoduxKey].Captures;
    end);
    local v46 = l_useSelector_0(function(v45) --[[ Line: 81 ]]
        -- upvalues: v16 (ref)
        return v45[v16.RoduxKey].Carousel.SelectedCaptureIndex;
    end);
    local v47, v48 = v5.useState(v46);
    local v49 = v38.X / v38.Y > 1 and 0.15 or 0.075;
    local v50 = math.clamp(math.floor(v38.X * v49), 50, 200);
    local v51 = math.floor(v50 * 0.2);
    local l_maxHeight_0 = v35.maxHeight;
    local v53 = v38.X - v50 * 2;
    local v54 = Vector2.new(math.floor(v53), (math.floor(l_maxHeight_0)));
    local v55 = v54.X * #v44;
    local l_X_1 = (v38 - v54).X;
    local v57, v58;
    if l_X_1 % 2 == 0 then
        local v59 = l_X_1 / 2;
        v57 = v59;
        v58 = v59;
    else
        local v60 = math.floor(l_X_1 / 2);
        v57 = v60 + 1;
        v58 = v60;
    end;
    local v63 = v5.useCallback(function(v61) --[[ Line: 102 ]]
        -- upvalues: v44 (copy), v46 (copy), v16 (ref), v36 (copy), v17 (ref), v37 (copy), v15 (ref)
        if v61 < 1 or #v44 < v61 then
            return;
        else
            local v62 = v61 < v46 and v16.CarouselDirection.Left or v16.CarouselDirection.Right;
            v36.fireEvent(v17.CapturesCarouselScrolled, {
                direction = v62
            });
            v37(v15(v61));
            return;
        end;
    end, {
        v44, 
        v46
    });
    l_X_1 = v21(v54, v46, v63);
    local l_carouselRef_0 = l_X_1.carouselRef;
    local l_carouselInputBegan_0 = l_X_1.carouselInputBegan;
    local l_carouselInputEnded_0 = l_X_1.carouselInputEnded;
    local l_deleteSelectedItem_0 = l_X_1.deleteSelectedItem;
    local l_selectedItemFadeOutBinding_0 = l_X_1.selectedItemFadeOutBinding;
    local l_postDeletionItemBinding_0 = l_X_1.postDeletionItemBinding;
    local l_selectedItemRef_0 = l_X_1.selectedItemRef;
    local l_setIsNavigationLocked_0 = l_X_1.setIsNavigationLocked;
    local v72 = v47 > 1;
    local v73 = v47 < #v44;
    local v74 = (not not v72 or v73) and not v35.isDisabled;
    v5.useEffect(function() --[[ Line: 130 ]]
        -- upvalues: l_setIsNavigationLocked_0 (copy), v74 (copy)
        l_setIsNavigationLocked_0(not v74);
    end, {
        v74, 
        l_setIsNavigationLocked_0
    });
    local v76 = v5.useCallback(function(v75) --[[ Line: 134 ]]
        -- upvalues: l_deleteSelectedItem_0 (copy)
        l_deleteSelectedItem_0(v75);
    end, {
        l_deleteSelectedItem_0
    });
    l_useSignal_0(v35.deleteItemSignal, v76);
    local v79 = v5.useCallback(function(v77) --[[ Line: 139 ]]
        -- upvalues: v18 (ref), v54 (copy), v47 (copy), v48 (copy)
        local v78 = v18(v54, v77);
        if v78 ~= v47 then
            v48(v78);
        end;
    end, {
        v54, 
        v47, 
        v48
    });
    local v80 = v5.useCallback(function() --[[ Line: 146 ]]
        -- upvalues: v36 (copy), v17 (ref)
        v36.fireEvent(v17.CapturesCarouselVideoMuteButtonActivated);
    end, {});
    local v82 = v5.useCallback(function(v81) --[[ Line: 150 ]]
        -- upvalues: v40 (copy), v39 (copy), v42 (copy), v36 (copy), v17 (ref)
        v40(not v39);
        v42(v81);
        if not v39 then
            v36.fireEvent(v17.CapturesCarouselVideoExpanded);
            return;
        else
            v36.fireEvent(v17.CapturesCarouselVideoShrank);
            return;
        end;
    end, {
        v39
    });
    local v86 = v5.useCallback(function(v83, v84) --[[ Line: 161 ]]
        -- upvalues: v47 (copy), v5 (ref), v13 (ref), v46 (copy), l_selectedItemFadeOutBinding_0 (copy), l_postDeletionItemBinding_0 (copy), v51 (copy), v22 (ref), v35 (copy), v54 (copy), v82 (copy), v80 (copy)
        if v47 + 3 < v84 or v84 < v47 - 3 then
            return nil;
        else
            local v85 = true;
            if v84 ~= v47 - 1 then
                v85 = false;
                if v47 == 1 then
                    v85 = v84 == 2;
                end;
            end;
            return v5.createElement(v13, {
                capture = v83, 
                fadeOutBinding = if v84 == v46 then l_selectedItemFadeOutBinding_0 else nil, 
                transitionBinding = if v84 == v46 then l_selectedItemFadeOutBinding_0 else if v85 then l_postDeletionItemBinding_0 else nil, 
                imagePadding = v51, 
                isDisabled = if v22 then v35.isDisabled and v46 == v84 else nil, 
                isSelected = v46 == v84, 
                itemIndex = v84, 
                itemSize = v54, 
                onExpandCallback = v82, 
                onMuteCallback = v80, 
                unfocusedSizeMultiplier = 0.8
            });
        end;
    end, {
        v54, 
        v47, 
        v51, 
        v35.isDisabled, 
        v82, 
        v80, 
        l_postDeletionItemBinding_0, 
        v46, 
        l_selectedItemFadeOutBinding_0
    });
    local v90 = v5.useMemo(function() --[[ Line: 201 ]]
        -- upvalues: v5 (ref), v44 (copy), v23 (ref), v22 (ref), v12 (ref), v54 (copy), v46 (copy), l_selectedItemRef_0 (copy), v39 (copy), v41 (copy), v86 (copy)
        local v87 = {
            Layout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            })
        };
        for v88, v89 in v44 do
            v87[if v23 then tostring(v89.CaptureTime.UnixTimestampMillis) else if v22 and v89.type == v12.Video then v89.thumbnailKey else v89.contentId] = v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = v88, 
                Size = UDim2.fromOffset(v54.X, v54.Y), 
                ref = if v88 == v46 then l_selectedItemRef_0 else nil, 
                ZIndex = v39 and v41 == v88 and 2 or 1
            }, {
                Item = v86(v89, v88)
            });
        end;
        return v87;
    end, {
        v44, 
        v54, 
        v41, 
        v39, 
        v86, 
        v46
    });
    local v91 = math.floor(v54.Y * 0.8);
    local l_createElement_0 = v5.createElement;
    local v93 = "Frame";
    local v94 = {
        BackgroundTransparency = 1, 
        LayoutOrder = v35.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, v35.maxHeight), 
        ZIndex = v35.ZIndex
    };
    local v95 = {};
    local l_createElement_1 = v5.createElement;
    local v97 = "ScrollingFrame";
    local v98 = {
        BackgroundTransparency = 1, 
        CanvasSize = UDim2.new(0, v55, 1, 0), 
        ClipsDescendants = false, 
        Position = UDim2.fromOffset(v57, 0), 
        ScrollBarThickness = 0, 
        ScrollingDirection = Enum.ScrollingDirection.X
    };
    local v99 = not v39;
    if v99 then
        v99 = v74;
        if v99 then
            local l_l_UserInputService_0_Platform_1 = l_UserInputService_0:GetPlatform();
            local v101 = true;
            if l_l_UserInputService_0_Platform_1 ~= Enum.Platform.IOS then
                v101 = l_l_UserInputService_0_Platform_1 == Enum.Platform.Android;
            end;
            local l_TouchEnabled_1 = l_UserInputService_0.TouchEnabled;
            local l_ReducedMotion_1 = l_UserGameSettings_0.ReducedMotion;
            v99 = v101 and l_TouchEnabled_1 and not l_ReducedMotion_1;
        end;
    end;
    v98.ScrollingEnabled = v99;
    v98.Size = UDim2.fromOffset(v54.X, v54.Y);
    v98[v5.Change.CanvasPosition] = v79;
    v98[v5.Event.InputBegan] = l_carouselInputBegan_0;
    v98[v5.Event.InputEnded] = l_carouselInputEnded_0;
    v98.ref = l_carouselRef_0;
    v95.AnimatedCarousel = l_createElement_1(v97, v98, v90);
    v95.LeftArrow = not v39 and v72 and v5.createElement(v14, {
        direction = v16.CarouselDirection.Left, 
        isDisabled = v35.isDisabled, 
        Size = UDim2.fromOffset(v57 - v51, v91), 
        ZIndex = 2
    });
    v95.RightArrow = not v39 and v73 and v5.createElement(v14, {
        direction = v16.CarouselDirection.Right, 
        isDisabled = v35.isDisabled, 
        Size = UDim2.fromOffset(v58 - v51, v91), 
        ZIndex = 2
    });
    return l_createElement_0(v93, v94, v95);
end;