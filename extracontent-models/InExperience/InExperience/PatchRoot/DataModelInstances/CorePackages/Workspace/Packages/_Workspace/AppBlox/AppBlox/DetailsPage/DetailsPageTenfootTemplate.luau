local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppBlox");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local l_AnimatedFlatList_0 = require(l_Parent_0.VirtualizedList).AnimatedFlatList;
local v4 = require(script.Parent.DetailsPageHeader);
local v5 = require(script.Parent.getPlatformConfig);
local v6 = require(script.Parent.Hooks.useDetailsPageRenderItems);
local v7 = require(script.Parent.Hooks.useAnimateFullscreen);
local v8 = require(script.Parent.DetailsPageRenderItem);
local v9 = require(l_Parent_0.Display);
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local v11 = require(l_script_FirstAncestor_0.FullscreenFrame);
local v12 = require(l_Parent_0.UIBlox);
local l_Overlay_0 = v12.App.Dialog.Overlay;
local l_LoadableImage_0 = v12.App.Loading.LoadableImage;
local _ = require(l_Parent_0.RobloxAppEnums);
local _ = require(l_Parent_0.ReactOtter);
local _ = require(script.Parent.Types);
local v18 = require(l_Parent_0.React);
local l_FFlagExtendScrollingFramesBySafeInsets_0 = require(l_Parent_0.SharedFlags).FFlagExtendScrollingFramesBySafeInsets;
local l_FFlagEnableLeftNavOnConsole_0 = require(l_Parent_0.SharedFlags).FFlagEnableLeftNavOnConsole;
local v21 = Vector2.new(96, 144);
local v22 = {
    animationConfig = {
        dampingRatio = 1, 
        frequency = 3
    }, 
    itemPadding = 36, 
    safeAreaSize = v21, 
    trailingWhitespace = 3000
};
return function(v23) --[[ Line: 153 ]] --[[ Name: DetailsPageTenfootTemplate ]]
    -- upvalues: v22 (copy), v2 (copy), v18 (copy), v5 (copy), v7 (copy), v4 (copy), v6 (copy), v8 (copy), l_FFlagExtendScrollingFramesBySafeInsets_0 (copy), l_useSignalState_0 (copy), v9 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), v11 (copy), l_LoadableImage_0 (copy), l_Overlay_0 (copy), l_AnimatedFlatList_0 (copy)
    local l_v22_0 = v22;
    if v23.tokens then
        l_v22_0 = v2.Dictionary.join(l_v22_0, v23.tokens);
    end;
    local v25, v26 = v18.useState(true);
    local v27 = v18.useMemo(function() --[[ Line: 164 ]]
        -- upvalues: v5 (ref), v23 (copy)
        return v5(v23.deviceType);
    end, {
        v23.deviceType
    });
    local v28 = v18.useRef(nil);
    local v29, v30 = v18.useState(Vector2.new(0, 0));
    local v32 = v18.useCallback(function(v31) --[[ Line: 170 ]]
        -- upvalues: v30 (copy)
        v30(v31.AbsoluteSize);
    end, {});
    v18.useEffect(function() --[[ Line: 173 ]]
        -- upvalues: v28 (copy), v30 (copy)
        if v28.current then
            v30(v28.current.AbsoluteSize);
        end;
    end, {});
    local v33 = if v23.thumbnailHeight then v23.thumbnailHeight else v27.thumbnailHeight;
    local v34 = if v23.headerBarBackgroundHeight ~= nil then v23.headerBarBackgroundHeight else v27.headerBarBackgroundHeight;
    local v35 = if v23.sideMargin then v23.sideMargin else v27.sideMargin;
    local v36 = v23.isFullscreen ~= nil and v23.isFullscreen;
    local l_renderFullscreenContent_0 = v23.renderFullscreenContent;
    local v38, v39 = v7(v36, l_renderFullscreenContent_0, l_v22_0.animationConfig);
    local v40 = v18.useMemo(function() --[[ Line: 193 ]]
        -- upvalues: v18 (ref), v4 (ref), v23 (copy), v33 (copy), v35 (copy), v34 (copy), l_v22_0 (ref)
        return v18.createElement(v4, {
            thumbnailImageUrl = v23.thumbnailImageUrl, 
            thumbnailAspectRatio = v23.thumbnailAspectRatio, 
            thumbnailHeight = v33, 
            titleText = v23.titleText, 
            subTitleText = v23.subTitleText, 
            actionBarLabelText = v23.actionBarLabelText, 
            renderInfoContent = v23.renderInfoContent, 
            actionBarProps = v23.actionBarProps, 
            sideMargin = v35, 
            headerBarBackgroundHeight = v34, 
            deviceType = v23.deviceType, 
            thumbnailShadowHeight = l_v22_0.thumbnailShadowHeight, 
            gradientHeight = l_v22_0.headerGradientHeight, 
            actionBarHeight = l_v22_0.actionBarHeight, 
            actionBarWidth = l_v22_0.actionBarWidth, 
            itemPadding = l_v22_0.thumbnailMargin, 
            bottomMargin = l_v22_0.headerBottomMargin
        });
    end, {
        v23.thumbnailImageUrl, 
        v23.thumbnailAspectRatio, 
        v33, 
        v23.titleText, 
        v23.subTitleText, 
        v23.renderInfoContent, 
        v23.actionBarProps, 
        v35, 
        v34, 
        v23.deviceType, 
        l_v22_0.thumbnailShadowHeight, 
        l_v22_0.headerGradientHeight, 
        l_v22_0.thumbnailMargin, 
        l_v22_0.headerBottomMargin
    });
    local v41 = v6(v23.componentList, v40, v29, l_v22_0.safeAreaSize);
    local v43 = v18.useCallback(function(v42) --[[ Line: 236 ]]
        -- upvalues: v18 (ref), v8 (ref), l_v22_0 (ref)
        return v18.createElement(v8, {
            item = v42.item, 
            itemPadding = l_v22_0.itemPadding, 
            safeArea = l_v22_0.safeAreaSize
        });
    end, {
        l_v22_0.itemPadding, 
        l_v22_0.safeAreaSize
    });
    local v44 = v18.useCallback(function() --[[ Line: 244 ]]
        -- upvalues: v18 (ref), l_v22_0 (ref)
        return v18.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_v22_0.itemPadding), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        });
    end, {
        l_v22_0.itemPadding
    });
    local v46 = v18.useCallback(function(v45) --[[ Line: 252 ]]
        -- upvalues: v41 (copy), v26 (copy)
        if v41[v45].showCornerGradient == false then
            v26(false);
            return;
        else
            v26(true);
            return;
        end;
    end, {
        v41
    });
    local v47 = if l_FFlagExtendScrollingFramesBySafeInsets_0 then l_useSignalState_0(v9.GetDisplayStore().getDeviceSafePadding) else nil;
    return v18.createElement(if l_FFlagEnableLeftNavOnConsole_0 then v11 else "Frame", {
        [v18.Change.AbsoluteSize] = v32, 
        Size = if l_FFlagEnableLeftNavOnConsole_0 then nil else UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        ref = v28
    }, {
        BackgroundImage = v18.createElement("Frame", {
            ZIndex = 1, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }, {
            BackgroundImage = v18.createElement(l_LoadableImage_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.new(1, 0, 1, 0), 
                Image = v23.bannerImageUrl, 
                ScaleType = Enum.ScaleType.Crop
            })
        }), 
        Overlay = v18.createElement(l_Overlay_0, {
            ZIndex = 2, 
            showGradient = v25, 
            gradientDirection = "topRight"
        }), 
        Content = v18.createElement(l_AnimatedFlatList_0, {
            onSelectedIndexChanged = v46, 
            animated = true, 
            initialNumToRender = #v41, 
            data = v41, 
            renderItem = v43, 
            ItemSeparatorComponent = v44, 
            ListFooterComponent = v18.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_v22_0.trailingWhitespace), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }), 
            ListHeaderComponent = v18.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_v22_0.safeAreaSize.Y), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }), 
            viewOffset = l_v22_0.safeAreaSize.Y, 
            contentContainerStyle = {
                BackgroundTransparency = 1
            }, 
            style = {
                Position = if l_FFlagEnableLeftNavOnConsole_0 then UDim2.fromOffset(0, -v47.top) else nil, 
                Size = if not not l_FFlagExtendScrollingFramesBySafeInsets_0 or l_FFlagEnableLeftNavOnConsole_0 then UDim2.new(1, 0, 1, v47.top + v47.bottom) else nil, 
                BackgroundTransparency = 1, 
                ScrollBarThickness = 0, 
                ScrollingEnabled = true, 
                Selectable = false, 
                VerticalScrollBarInset = Enum.ScrollBarInset.None, 
                ZIndex = 3
            }, 
            animationConfig = l_v22_0.animationConfig, 
            UNSTABLE_forceSiblingLayoutUpdate = true, 
            overrideAutomaticCanvasSize = not l_FFlagEnableLeftNavOnConsole_0 or false
        }), 
        Fullscreen = v18.createElement("CanvasGroup", {
            Size = UDim2.fromScale(1, 1), 
            GroupTransparency = v39, 
            BorderSizePixel = 0, 
            ZIndex = 4
        }, {
            FullscreenContent = if v38 then l_renderFullscreenContent_0() else nil
        })
    });
end;