local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppBlox");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Roact);
local v6 = require(l_Parent_0.t);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local l_withStyle_0 = v2.Core.Style.withStyle;
local l_LoadableImage_0 = v2.App.Loading.LoadableImage;
local l_Images_0 = v2.App.ImageSet.Images;
local l_IconButton_0 = v2.App.Button.IconButton;
local l_IconSize_0 = v2.App.ImageSet.Enum.IconSize;
local l_getIconSize_0 = v2.App.ImageSet.getIconSize;
local l_getIconSizeUDim2_0 = v2.App.ImageSet.getIconSizeUDim2;
local l_VerticalScrollView_0 = v2.App.Container.VerticalScrollView;
local l_ActionBar_0 = v2.App.Button.ActionBar;
local v17 = require(script.Parent.Parent.StickyActionBar);
local l_DeviceType_0 = require(l_Parent_0.RobloxAppEnums).DeviceType;
local l_useLastInputMode_0 = require(l_Parent_0.FocusNavigationUtils).useLastInputMode;
local v20 = require(script.Parent.getPlatformConfig);
local v21 = require(script.Parent.DetailsPageHeader);
local v22 = require(script.Parent.DetailsPageBody);
local v23 = require(script.Parent.validateDetailsPageComponentList);
local v24 = require(l_script_FirstAncestor_0.useAnimateScrollViewToSelection);
local l_getTestId_0 = require(l_Parent_0.RoactUtils).getTestId;
local l_FFlagLuaAppFixDetailsPageThumbnailRenderInPhone_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixDetailsPageThumbnailRenderInPhone;
local l_FFlagLuaAppFixSDPLayout_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixSDPLayout;
local l_FFlagHideCloseButtonEdp_0 = require(l_Parent_0.SharedFlags).FFlagHideCloseButtonEdp;
local v29 = game:DefineFastFlag("LuaAppDisableStickyBarMediaGallery", false);
local l_FFlagLuaAppAddTestIdsForArrow_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddTestIdsForArrow;
local v31 = v5.PureComponent:extend("DetailsPageTemplate");
local function _(v32, v33) --[[ Line: 58 ]] --[[ Name: applyTokenScaling ]]
    return v32 * v33.Stroke.Standard;
end;
v31.validateProps = v6.strictInterface({
    foundationTokens = v6.table, 
    thumbnailImageUrl = v6.optional(v6.string), 
    thumbnailHeight = v6.optional(v6.number), 
    thumbnailAspectRatio = v6.optional(v6.Vector2), 
    thumbnailShadowHeight = if l_FFlagLuaAppFixDetailsPageThumbnailRenderInPhone_0 then v6.optional(v6.number) else nil, 
    titleText = v6.optional(v6.string), 
    subTitleText = v6.optional(v6.string), 
    actionBarLabelText = v6.optional(v6.string), 
    renderInfoContent = v6.optional(v6.callback), 
    renderCustomHeader = v6.optional(v6.callback), 
    actionBarProps = v6.optional(v6.table), 
    actionBarWidth = v6.optional(v6.number), 
    actionBarHeight = v6.optional(v6.number), 
    componentList = v6.optional(v23), 
    dualPanelBreakpoint = v6.optional(v6.number), 
    sideMargin = v6.optional(v6.number), 
    bodyClipsDescendants = v6.optional(v6.boolean), 
    maxContentWidth = v6.optional(v6.number), 
    startingOffsetPosition = v6.optional(v6.number), 
    headerBarBackgroundHeight = v6.optional(v6.number), 
    onClose = v6.callback, 
    bannerPlaceholderGradient = v6.optional(v6.table), 
    bannerImageUrl = v6.optional(v6.string), 
    isFullscreen = v6.optional(v6.boolean), 
    renderFullscreenContent = v6.optional(v6.callback), 
    deviceType = v6.optional(v6.string), 
    isMobile = v6.optional(v6.boolean), 
    tokens = v6.optional(v6.table), 
    containerRef = v6.optional(v6.union(v6.table, v6.callback)), 
    backgroundFrameSize = v6.optional(v6.UDim2), 
    scrollingFrameRef = v6.optional(v6.table), 
    disableScrollingForFocusNav = v6.optional(v6.boolean), 
    gradientHeight = v6.optional(v6.number), 
    backgroundImageTransparency = v6.optional(v6.number), 
    disableBackgroundAspectRatio = v6.optional(v6.boolean), 
    bodyContainerSafeAreaSize = if l_FFlagLuaAppFixSDPLayout_0 then v6.optional(v6.UDim2) else nil, 
    backgroundImageSize = if l_FFlagLuaAppFixSDPLayout_0 then v6.optional(v6.UDim2) else nil, 
    headerPadding = if l_FFlagLuaAppFixSDPLayout_0 then v6.optional(v6.number) else nil, 
    disableStickyActionBar = v6.optional(v6.boolean), 
    hideCloseButton = if l_FFlagHideCloseButtonEdp_0 then v6.optional(v6.boolean) else nil
});
v31.defaultProps = {
    deviceType = l_DeviceType_0.Desktop, 
    isFullscreen = false
};
local function _(v35, v36) --[[ Line: 167 ]] --[[ Name: getHeaderPaddingHeight ]]
    -- upvalues: v20 (copy)
    local v37 = v20(v35.deviceType);
    return v36 - if v35.headerBarBackgroundHeight then v35.headerBarBackgroundHeight else v37.headerBarBackgroundHeight * v35.foundationTokens.Stroke.Standard;
end;
v31.init = function(v39) --[[ Line: 176 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v20 (copy), l_DeviceType_0 (copy)
    v39.containerRef = v5.createRef();
    v39.scrollingFrameRef = v39.props.scrollingFrameRef;
    v39.scrolled = false;
    v39.state = {
        showStickyActionTopBar = false, 
        backgroundHeight = 500, 
        containerSize = Vector2.new(500, 500), 
        backgroundComponentPosition = 250
    };
    v39.onContainerSizeChange = function(v40) --[[ Line: 187 ]]
        -- upvalues: v39 (copy)
        v39:setState({
            containerSize = v40.AbsoluteSize
        });
    end;
    v39.onBackgroundComponentFrameSizeChange = function(v41) --[[ Line: 193 ]]
        -- upvalues: v39 (copy), v20 (ref)
        v39:setState(function(_, v43) --[[ Line: 195 ]]
            -- upvalues: v41 (copy), v20 (ref)
            local l_Y_0 = v41.AbsoluteSize.Y;
            local v45 = v20(v43.deviceType);
            v45 = math.max(0, l_Y_0 - if v43.headerBarBackgroundHeight then v43.headerBarBackgroundHeight else v45.headerBarBackgroundHeight * v43.foundationTokens.Stroke.Standard) / 2;
            return {
                backgroundHeight = l_Y_0, 
                backgroundComponentPosition = v45
            };
        end);
    end;
    v39.canvasPositionChange = function(v46) --[[ Line: 206 ]]
        -- upvalues: v39 (copy), v20 (ref), l_DeviceType_0 (ref)
        v39.scrolled = true;
        v39:setState(function(v47, v48) --[[ Line: 209 ]]
            -- upvalues: v20 (ref), v46 (copy), v39 (ref), l_DeviceType_0 (ref)
            local l_backgroundHeight_0 = v47.backgroundHeight;
            local v50 = v20(v48.deviceType);
            local v51 = l_backgroundHeight_0 - if v48.headerBarBackgroundHeight then v48.headerBarBackgroundHeight else v50.headerBarBackgroundHeight * v48.foundationTokens.Stroke.Standard;
            l_backgroundHeight_0 = math.max(0, v51 - v46.CanvasPosition.Y) / 2;
            if v51 < v46.CanvasPosition.Y then
                if v47.showStickyActionTopBar == false and v39.props.deviceType ~= l_DeviceType_0.Phone and not v39.props.disableStickyActionBar then
                    return {
                        showStickyActionTopBar = true
                    };
                else
                    return nil;
                end;
            elseif v47.showStickyActionTopBar == true then
                return {
                    showStickyActionTopBar = false, 
                    backgroundComponentPosition = l_backgroundHeight_0
                };
            else
                return {
                    backgroundComponentPosition = l_backgroundHeight_0
                };
            end;
        end);
    end;
end;
v31.render = function(v52) --[[ Line: 246 ]] --[[ Name: render ]]
    -- upvalues: l_DeviceType_0 (copy), v20 (copy), l_FFlagLuaAppFixSDPLayout_0 (copy), l_withStyle_0 (copy), l_getIconSize_0 (copy), l_IconSize_0 (copy), v5 (copy), l_FFlagHideCloseButtonEdp_0 (copy), l_getIconSizeUDim2_0 (copy), v4 (copy), l_FFlagLuaAppAddTestIdsForArrow_0 (copy), l_getTestId_0 (copy), l_IconButton_0 (copy), l_Images_0 (copy), l_LoadableImage_0 (copy), v29 (copy), v17 (copy), l_VerticalScrollView_0 (copy), v21 (copy), l_FFlagLuaAppFixDetailsPageThumbnailRenderInPhone_0 (copy), v22 (copy), l_ActionBar_0 (copy)
    local v53 = false;
    local v54 = v52.props.deviceType == l_DeviceType_0.Phone;
    local v55 = v20(v52.props.deviceType);
    local v56 = if v52.props.thumbnailHeight then v52.props.thumbnailHeight else v55.thumbnailHeight * v52.props.foundationTokens.Stroke.Standard;
    local v57 = if v52.props.headerBarBackgroundHeight then v52.props.headerBarBackgroundHeight else v55.headerBarBackgroundHeight * v52.props.foundationTokens.Stroke.Standard;
    local v58 = if v52.props.sideMargin then v52.props.sideMargin else v55.sideMargin;
    local v59 = if v52.props.dualPanelBreakpoint then v52.props.dualPanelBreakpoint else v55.dualPanelBreakpoint;
    local v60, v61, v62, v63;
    if l_FFlagLuaAppFixSDPLayout_0 then
        v63 = v52.props.headerPadding;
        v53 = v63;
    end;
    if not v53 then
        v60 = v52.props;
        v61 = v52.state.backgroundHeight;
        v62 = v20(v60.deviceType);
        v63 = v61 - if v60.headerBarBackgroundHeight then v60.headerBarBackgroundHeight else v62.headerBarBackgroundHeight * v60.foundationTokens.Stroke.Standard;
    end;
    v53 = false;
    v60 = v52.state.backgroundComponentPosition;
    v61 = v52.state.containerSize;
    v62 = v52.props.isFullscreen;
    local l_renderFullscreenContent_0 = v52.props.renderFullscreenContent;
    local v65 = not v54 and (v62 and l_renderFullscreenContent_0 and true or false);
    return l_withStyle_0(function(v66) --[[ Line: 270 ]]
        -- upvalues: v52 (copy), v54 (copy), l_getIconSize_0 (ref), l_IconSize_0 (ref), v57 (copy), v5 (ref), l_FFlagHideCloseButtonEdp_0 (ref), l_getIconSizeUDim2_0 (ref), v4 (ref), l_FFlagLuaAppAddTestIdsForArrow_0 (ref), l_getTestId_0 (ref), l_IconButton_0 (ref), v65 (copy), l_Images_0 (ref), l_LoadableImage_0 (ref), v60 (copy), l_FFlagLuaAppFixSDPLayout_0 (ref), v61 (copy), v29 (ref), v17 (ref), l_VerticalScrollView_0 (ref), v63 (copy), v21 (ref), v56 (copy), l_FFlagLuaAppFixDetailsPageThumbnailRenderInPhone_0 (ref), v58 (copy), v22 (ref), v59 (copy), l_renderFullscreenContent_0 (copy), l_ActionBar_0 (ref)
        local l_Theme_0 = v66.Theme;
        local v68 = v52.props.bannerImageUrl == nil;
        local v69 = v52.props.bannerPlaceholderGradient or {
            Rotation = 90, 
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, l_Theme_0.BackgroundMuted.Color), 
                ColorSequenceKeypoint.new(1, l_Theme_0.BackgroundUIDefault.Color)
            })
        };
        local v70 = v54 and (l_getIconSize_0(l_IconSize_0.Large) + 22) / 2 or v57 / 2;
        local v71 = v54 and v52.props.actionBarProps;
        return v5.createElement("TextButton", {
            Text = "", 
            Selectable = false, 
            AutoButtonColor = false, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            ClipsDescendants = true, 
            [v5.Ref] = if v52.props.containerRef then v52.props.containerRef else v52.containerRef, 
            [v5.Change.AbsoluteSize] = v52.onContainerSizeChange
        }, {
            CloseButtonFrame = if l_FFlagHideCloseButtonEdp_0 and v52.props.hideCloseButton then nil else v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = l_getIconSizeUDim2_0(l_IconSize_0.Large), 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, 22, 0, v70), 
                ZIndex = 2, 
                [v4.Tag] = if l_FFlagLuaAppAddTestIdsForArrow_0 then l_getTestId_0("details-close-button") else nil
            }, {
                CloseButton = v5.createElement(l_IconButton_0, {
                    size = UDim2.fromScale(1, 1), 
                    icon = v65 and l_Images_0["icons/navigation/pushBack"] or l_Images_0["icons/navigation/close"], 
                    iconColor3 = v66.Theme.UIEmphasis.Color, 
                    iconSize = l_IconSize_0.Medium, 
                    onActivated = v52.props.onClose, 
                    showBackground = v52.state.showStickyActionTopBar == false, 
                    backgroundColor = v66.Theme.BackgroundUIDefault
                })
            }), 
            BackgroundDetailsFrame = v5.createElement("Frame", {
                BackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
                BackgroundTransparency = l_Theme_0.BackgroundMuted.Transparency, 
                Size = if v52.props.backgroundFrameSize then v52.props.backgroundFrameSize else UDim2.fromScale(1, 1), 
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.fromScale(0.5, 0), 
                [v5.Change.AbsoluteSize] = v52.onBackgroundComponentFrameSizeChange
            }, {
                GradientPlaceholder = v68 and v5.createElement("UIGradient", v69) or nil, 
                UIAspectRatioConstraint = if not not v68 or v52.props.disableBackgroundAspectRatio then nil else v5.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1.7777777777777777
                }), 
                BackgroundImage = v68 == false and v5.createElement(l_LoadableImage_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0, v60), 
                    Size = l_FFlagLuaAppFixSDPLayout_0 and v52.props.backgroundImageSize or UDim2.new(0, v61.x, 1, 0), 
                    Image = v52.props.bannerImageUrl, 
                    ScaleType = Enum.ScaleType.Crop, 
                    BackgroundTransparency = v52.props.backgroundImageTransparency
                }) or nil
            }), 
            StickyActionBarFrame = (not not v52.state.showStickyActionTopBar or if v29 then v65 and not v52.props.disableStickyActionBar else v65) and v5.createElement("TextButton", {
                Text = "", 
                AutoButtonColor = false, 
                Size = UDim2.new(1, 0, 0, v57), 
                BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                BackgroundTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
                BorderSizePixel = 0
            }, {
                StickyActionBar = v5.createElement(v17, {
                    actionBarProps = v52.props.actionBarProps, 
                    actionBarWidth = v52.props.actionBarWidth, 
                    infoProps = {
                        icon = v52.props.thumbnailImageUrl, 
                        title = v52.props.titleText
                    }
                })
            }) or nil, 
            ContentScrollingFrame = v5.createElement(l_VerticalScrollView_0, {
                size = UDim2.fromScale(1, 1), 
                canvasSizeY = UDim.new(1, 0), 
                useAutomaticCanvasSize = true, 
                scrollingEnabled = not v52.props.disableScrollingForFocusNav and not v65, 
                [v5.Change.CanvasPosition] = v52.canvasPositionChange, 
                scrollingFrameRef = v52.scrollingFrameRef, 
                isGamepadFocusable = false, 
                selectable = false
            }, {
                Layout = v5.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                Padding = v5.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v63), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }), 
                MainView = v5.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2, 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    Layout = v5.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical
                    }), 
                    HeaderContainer = v5.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, v57), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1
                    }, {
                        DetailsPageHeader = v5.createElement(v21, {
                            thumbnailImageUrl = v52.props.thumbnailImageUrl, 
                            thumbnailAspectRatio = v52.props.thumbnailAspectRatio, 
                            thumbnailHeight = v56, 
                            thumbnailShadowHeight = if l_FFlagLuaAppFixDetailsPageThumbnailRenderInPhone_0 then v52.props.thumbnailShadowHeight else nil, 
                            titleText = v52.props.titleText, 
                            subTitleText = v52.props.subTitleText, 
                            actionBarLabelText = v52.props.actionBarLabelText, 
                            renderInfoContent = v52.props.renderInfoContent, 
                            renderCustomHeader = v52.props.renderCustomHeader, 
                            actionBarProps = if not not v52.state.showStickyActionTopBar or if v29 then not v52.props.disableStickyActionBar and v65 else v65 then nil else v52.props.actionBarProps, 
                            actionBarWidth = v52.props.actionBarWidth, 
                            actionBarHeight = v52.props.actionBarHeight, 
                            headerBarBackgroundHeight = v57, 
                            sideMargin = v58, 
                            maxContentWidth = v52.props.maxContentWidth, 
                            deviceType = v52.props.deviceType, 
                            gradientHeight = v52.props.gradientHeight
                        })
                    }), 
                    BodyContainer = v5.createElement("Frame", {
                        Size = UDim2.fromScale(1, 0), 
                        LayoutOrder = 2, 
                        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
                        BorderSizePixel = 0, 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }, {
                        BodyContainerSafeArea = v5.createElement("Frame", {
                            Size = l_FFlagLuaAppFixSDPLayout_0 and v52.props.bodyContainerSafeAreaSize or UDim2.fromOffset(math.min(v61.x, v61.y * 1.7777777777777777), 0), 
                            AnchorPoint = Vector2.new(0.5, 0), 
                            Position = UDim2.fromScale(0.5, 0), 
                            BackgroundTransparency = 1, 
                            AutomaticSize = Enum.AutomaticSize.Y
                        }, {
                            DetailsPageBody = v5.createElement(v22, {
                                titleText = v52.props.titleText, 
                                subTitleText = v52.props.subTitleText, 
                                renderInfoContent = v52.props.renderInfoContent, 
                                bodyClipsDescendants = v52.props.bodyClipsDescendants, 
                                componentList = v52.props.componentList, 
                                dualPanelBreakpoint = v59, 
                                sideMargin = v58, 
                                maxContentWidth = v52.props.maxContentWidth, 
                                deviceType = v52.props.deviceType, 
                                showPageDetails = v54 and v52.props.renderCustomHeader == nil, 
                                bottomPadding = 100
                            })
                        })
                    })
                }), 
                MobileActionViewPadding = v71 and v5.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 72), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 3
                })
            }), 
            FullscreenFrame = v65 and v5.createElement("TextButton", {
                Size = UDim2.new(1, 0, 1, -v57), 
                Position = UDim2.fromOffset(0, v57), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                AutoButtonColor = false, 
                ClipsDescendants = true, 
                ZIndex = 2
            }, {
                FullscreenContent = l_renderFullscreenContent_0()
            }) or nil, 
            MobileActionBarFrame = v71 and v5.createElement("TextButton", {
                Text = "", 
                AutoButtonColor = false, 
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.fromScale(0, 1), 
                Size = UDim2.new(1, 0, 0, 72), 
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                ZIndex = 3
            }, {
                GradientBar = v5.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 24), 
                    BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                    AnchorPoint = Vector2.new(0, 1), 
                    BorderSizePixel = 0, 
                    LayoutOrder = 1
                }, {
                    Gradient = v5.createElement("UIGradient", {
                        Rotation = 270, 
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 0.25), 
                            NumberSequenceKeypoint.new(1, 0.9999)
                        })
                    })
                }), 
                ActionBar = v5.createElement(l_ActionBar_0, {
                    button = v52.props.actionBarProps.button, 
                    icons = v52.props.actionBarProps.icons
                })
            })
        });
    end);
end;
v31.didMount = function(v72) --[[ Line: 520 ]] --[[ Name: didMount ]]
    if v72.containerRef.current then
        v72.onContainerSizeChange(v72.containerRef.current);
    end;
end;
v31.didUpdate = function(v73) --[[ Line: 526 ]] --[[ Name: didUpdate ]]
    -- upvalues: v20 (copy)
    local v74 = v20(v73.props.deviceType);
    if v73.scrolled == false and v73.scrollingFrameRef.current then
        local v75 = if v73.props.startingOffsetPosition then v73.props.startingOffsetPosition else v74.startingOffsetPosition;
        local v76 = 0;
        local l_props_0 = v73.props;
        local l_backgroundHeight_1 = v73.state.backgroundHeight;
        local v79 = v20(l_props_0.deviceType);
        local v80 = math.max(v76, l_backgroundHeight_1 - (if l_props_0.headerBarBackgroundHeight then l_props_0.headerBarBackgroundHeight else v79.headerBarBackgroundHeight * l_props_0.foundationTokens.Stroke.Standard) - v75);
        v73.scrollingFrameRef.current.CanvasPosition = Vector2.new(0, v80);
    end;
end;
return function(v81) --[[ Line: 540 ]]
    -- upvalues: v4 (copy), v24 (copy), l_useTokens_0 (copy), l_useLastInputMode_0 (copy), v31 (copy), v3 (copy)
    local v82 = v4.useRef(nil);
    v24(v82, 0.4);
    local v83 = l_useTokens_0();
    local v84 = l_useLastInputMode_0() ~= "Cursor";
    return v4.createElement(v31, v3.Dictionary.join(v81, {
        foundationTokens = v83, 
        scrollingFrameRef = v82, 
        disableScrollingForFocusNav = v84
    }));
end;