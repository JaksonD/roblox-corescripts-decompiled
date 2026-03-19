local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.Cryo);
local l_AnimatedFlatList_0 = require(l_Parent_0.VirtualizedList).AnimatedFlatList;
local v3 = require(script.Parent.DetailsPageHeader);
local v4 = require(script.Parent.getPlatformConfig);
local v5 = require(script.Parent.Hooks.useDetailsPageRenderItems);
local v6 = require(script.Parent.Hooks.useAnimateFullscreen);
local v7 = require(script.Parent.DetailsPageRenderItem);
local v8 = require(l_Parent_0.Display);
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local v10 = require(l_Parent_0.UIBlox);
local l_Overlay_0 = v10.App.Dialog.Overlay;
local l_LoadableImage_0 = v10.App.Loading.LoadableImage;
local _ = require(l_Parent_0.RobloxAppEnums);
local _ = require(l_Parent_0.ReactOtter);
local _ = require(script.Parent.Types);
local v16 = require(l_Parent_0.React);
local l_FFlagExtendScrollingFramesBySafeInsets_0 = require(l_Parent_0.SharedFlags).FFlagExtendScrollingFramesBySafeInsets;
local v18 = Vector2.new(96, 144);
local v19 = {
    animationConfig = {
        dampingRatio = 1, 
        frequency = 3
    }, 
    itemPadding = 36, 
    safeAreaSize = v18, 
    trailingWhitespace = 3000
};
return function(v20) --[[ Line: 151 ]] --[[ Name: DetailsPageTenfootTemplate ]]
    -- upvalues: v19 (copy), v1 (copy), v16 (copy), v4 (copy), v6 (copy), v3 (copy), v5 (copy), v7 (copy), l_FFlagExtendScrollingFramesBySafeInsets_0 (copy), l_useSignalState_0 (copy), v8 (copy), l_LoadableImage_0 (copy), l_Overlay_0 (copy), l_AnimatedFlatList_0 (copy)
    local l_v19_0 = v19;
    if v20.tokens then
        l_v19_0 = v1.Dictionary.join(l_v19_0, v20.tokens);
    end;
    local v22, v23 = v16.useState(true);
    local v24 = v16.useMemo(function() --[[ Line: 162 ]]
        -- upvalues: v4 (ref), v20 (copy)
        return v4(v20.deviceType);
    end, {
        v20.deviceType
    });
    local v25 = v16.useRef(nil);
    local v26, v27 = v16.useState(Vector2.new(0, 0));
    local v29 = v16.useCallback(function(v28) --[[ Line: 168 ]]
        -- upvalues: v27 (copy)
        v27(v28.AbsoluteSize);
    end, {});
    v16.useEffect(function() --[[ Line: 171 ]]
        -- upvalues: v25 (copy), v27 (copy)
        if v25.current then
            v27(v25.current.AbsoluteSize);
        end;
    end, {});
    local v30 = if v20.thumbnailHeight then v20.thumbnailHeight else v24.thumbnailHeight;
    local v31 = if v20.headerBarBackgroundHeight ~= nil then v20.headerBarBackgroundHeight else v24.headerBarBackgroundHeight;
    local v32 = if v20.sideMargin then v20.sideMargin else v24.sideMargin;
    local v33 = v20.isFullscreen ~= nil and v20.isFullscreen;
    local l_renderFullscreenContent_0 = v20.renderFullscreenContent;
    local v35, v36 = v6(v33, l_renderFullscreenContent_0, l_v19_0.animationConfig);
    local v37 = v16.useMemo(function() --[[ Line: 191 ]]
        -- upvalues: v16 (ref), v3 (ref), v20 (copy), v30 (copy), v32 (copy), v31 (copy), l_v19_0 (ref)
        return v16.createElement(v3, {
            thumbnailImageUrl = v20.thumbnailImageUrl, 
            thumbnailAspectRatio = v20.thumbnailAspectRatio, 
            thumbnailHeight = v30, 
            titleText = v20.titleText, 
            subTitleText = v20.subTitleText, 
            actionBarLabelText = v20.actionBarLabelText, 
            renderInfoContent = v20.renderInfoContent, 
            actionBarProps = v20.actionBarProps, 
            sideMargin = v32, 
            headerBarBackgroundHeight = v31, 
            deviceType = v20.deviceType, 
            thumbnailShadowHeight = l_v19_0.thumbnailShadowHeight, 
            gradientHeight = l_v19_0.headerGradientHeight, 
            actionBarHeight = l_v19_0.actionBarHeight, 
            actionBarWidth = l_v19_0.actionBarWidth, 
            itemPadding = l_v19_0.thumbnailMargin, 
            bottomMargin = l_v19_0.headerBottomMargin
        });
    end, {
        v20.thumbnailImageUrl, 
        v20.thumbnailAspectRatio, 
        v30, 
        v20.titleText, 
        v20.subTitleText, 
        v20.renderInfoContent, 
        v20.actionBarProps, 
        v32, 
        v31, 
        v20.deviceType, 
        l_v19_0.thumbnailShadowHeight, 
        l_v19_0.headerGradientHeight, 
        l_v19_0.thumbnailMargin, 
        l_v19_0.headerBottomMargin
    });
    local v38 = v5(v20.componentList, v37, v26, l_v19_0.safeAreaSize);
    local v40 = v16.useCallback(function(v39) --[[ Line: 234 ]]
        -- upvalues: v16 (ref), v7 (ref), l_v19_0 (ref)
        return v16.createElement(v7, {
            item = v39.item, 
            itemPadding = l_v19_0.itemPadding, 
            safeArea = l_v19_0.safeAreaSize
        });
    end, {
        l_v19_0.itemPadding, 
        l_v19_0.safeAreaSize
    });
    local v41 = v16.useCallback(function() --[[ Line: 242 ]]
        -- upvalues: v16 (ref), l_v19_0 (ref)
        return v16.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_v19_0.itemPadding), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        });
    end, {
        l_v19_0.itemPadding
    });
    local v43 = v16.useCallback(function(v42) --[[ Line: 250 ]]
        -- upvalues: v38 (copy), v23 (copy)
        if v38[v42].showCornerGradient == false then
            v23(false);
            return;
        else
            v23(true);
            return;
        end;
    end, {
        v38
    });
    local v44 = if l_FFlagExtendScrollingFramesBySafeInsets_0 then l_useSignalState_0(v8.GetDisplayStore().getDeviceSafePadding) else nil;
    return v16.createElement("Frame", {
        [v16.Change.AbsoluteSize] = v29, 
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        ref = v25
    }, {
        BackgroundImage = v16.createElement("Frame", {
            ZIndex = 1, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }, {
            BackgroundImage = v16.createElement(l_LoadableImage_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.new(1, 0, 1, 0), 
                Image = v20.bannerImageUrl, 
                ScaleType = Enum.ScaleType.Crop
            })
        }), 
        Overlay = v16.createElement(l_Overlay_0, {
            ZIndex = 2, 
            showGradient = v22, 
            gradientDirection = "topRight"
        }), 
        Content = v16.createElement(l_AnimatedFlatList_0, {
            onSelectedIndexChanged = v43, 
            animated = true, 
            initialNumToRender = #v38, 
            data = v38, 
            renderItem = v40, 
            ItemSeparatorComponent = v41, 
            ListFooterComponent = v16.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_v19_0.trailingWhitespace), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }), 
            ListHeaderComponent = v16.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_v19_0.safeAreaSize.Y), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }), 
            viewOffset = l_v19_0.safeAreaSize.Y, 
            contentContainerStyle = {
                BackgroundTransparency = 1
            }, 
            style = {
                Size = if l_FFlagExtendScrollingFramesBySafeInsets_0 then UDim2.new(1, 0, 1, v44.bottom) else nil, 
                BackgroundTransparency = 1, 
                ScrollBarThickness = 0, 
                ScrollingEnabled = true, 
                Selectable = false, 
                VerticalScrollBarInset = Enum.ScrollBarInset.None, 
                ZIndex = 3
            }, 
            animationConfig = l_v19_0.animationConfig, 
            UNSTABLE_forceSiblingLayoutUpdate = true, 
            overrideAutomaticCanvasSize = true
        }), 
        Fullscreen = v16.createElement("CanvasGroup", {
            Size = UDim2.fromScale(1, 1), 
            GroupTransparency = v36, 
            BorderSizePixel = 0, 
            ZIndex = 4
        }, {
            FullscreenContent = if v35 then l_renderFullscreenContent_0() else nil
        })
    });
end;