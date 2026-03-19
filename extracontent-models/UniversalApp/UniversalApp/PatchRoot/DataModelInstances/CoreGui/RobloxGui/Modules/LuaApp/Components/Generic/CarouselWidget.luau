local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v4.Style.withStyle;
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v4.App.ImageSet.Images;
local v9 = require(l_Modules_0.LuaApp.FitChildren);
local l_ScrollingAppCarousel_0 = require(l_CorePackages_0.Workspace.Packages.AppBlox).ScrollingAppCarousel;
local l_LoadingStateContainer_0 = v4.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = v4.App.Loading.Enum.RetrievalStatus;
local l_CursorKind_0 = v4.App.SelectionImage.CursorKind;
local l_withSelectionCursorProvider_0 = v4.App.SelectionImage.withSelectionCursorProvider;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local v17 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local l_UiMode_0 = v17.UiMode;
local l_DeviceType_0 = v17.DeviceType;
local l_TooltipOrientation_0 = v4.App.Dialog.Enum.TooltipOrientation;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_IconWithTooltip_0 = require(l_CorePackages_0.Workspace.Packages.AppBlox).IconWithTooltip;
local l_maybeForceDarkTheme_0 = require(l_CorePackages_0.Workspace.Packages.CollectionViews).maybeForceDarkTheme;
local v24 = require(l_CorePackages_0.Packages.Foundation);
local l_IconButton_0 = v24.IconButton;
local l_View_0 = v24.View;
local l_IconSize_0 = v24.Enums.IconSize;
local v28 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppGameCarouselUseAutoSizing);
local l_FFlagLuaAppPropagateFriendsCarouselHeader_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppPropagateFriendsCarouselHeader;
local l_FFlagLuaAppDisableChevronSeeAll_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppDisableChevronSeeAll;
local v31 = l_Images_0["icons/actions/cycleRight"];
local v32 = v3.PureComponent:extend("CarouselWidget");
v32.getDerivedStateFromProps = function(v33, v34) --[[ Line: 49 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: l_RetrievalStatus_0 (copy)
    if v33.fetchingStatus == nil then
        return;
    else
        local v35 = l_RetrievalStatus_0.fromRawValue(v33.fetchingStatus);
        local l_wasLoaded_0 = v34.wasLoaded;
        if v35 == l_RetrievalStatus_0.Done then
            l_wasLoaded_0 = true;
        elseif v35 == l_RetrievalStatus_0.Failed or v35 == l_RetrievalStatus_0.NotStarted then
            l_wasLoaded_0 = false;
        elseif v35 == l_RetrievalStatus_0.Fetching and l_wasLoaded_0 then
            v35 = l_RetrievalStatus_0.Done;
        end;
        return {
            wasLoaded = l_wasLoaded_0, 
            dataStatus = v35
        };
    end;
end;
v32.init = function(v37) --[[ Line: 71 ]] --[[ Name: init ]]
    -- upvalues: l_RetrievalStatus_0 (copy)
    v37.state = {
        wasLoaded = false, 
        dataStatus = l_RetrievalStatus_0.NotStarted
    };
end;
v32.didMount = function(v38) --[[ Line: 78 ]] --[[ Name: didMount ]]
    -- upvalues: l_RetrievalStatus_0 (copy)
    v38:setState({
        wasLoaded = false, 
        dataStatus = l_RetrievalStatus_0.fromRawValue(v38.props.fetchingStatus)
    });
end;
v32.render = function(v39) --[[ Line: 85 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagLuaAppPropagateFriendsCarouselHeader_0 (copy), v3 (copy), l_ScrollingAppCarousel_0 (copy), l_FFlagLuaAppDisableChevronSeeAll_0 (copy), l_ImageSetLabel_0 (copy), v31 (copy), l_CursorKind_0 (copy), l_DeviceType_0 (copy), l_IconWithTooltip_0 (copy), l_TooltipOrientation_0 (copy), l_maybeForceDarkTheme_0 (copy), l_LoadingStateContainer_0 (copy), l_View_0 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), v28 (copy), v9 (copy), l_withStyle_0 (copy), l_withSelectionCursorProvider_0 (copy)
    local l_layoutOrder_0 = v39.props.layoutOrder;
    local l_onSeeAll_0 = v39.props.onSeeAll;
    local l_title_0 = v39.props.title;
    local l_items_0 = v39.props.items;
    local l_fetchingStatus_0 = v39.props.fetchingStatus;
    local l_onRetry_0 = v39.props.onRetry;
    local l_carouselHeight_0 = v39.props.carouselHeight;
    local l_canvasWidth_0 = v39.props.canvasWidth;
    local l_onChangeCanvasPosition_0 = v39.props.onChangeCanvasPosition;
    local l_onRefCallback_0 = v39.props.onRefCallback;
    local l_index_0 = v39.props.index;
    local l_itemCount_0 = v39.props.itemCount;
    local l_itemWidth_0 = v39.props.itemWidth;
    local l_itemPadding_0 = v39.props.itemPadding;
    local l_carouselMargin_0 = v39.props.carouselMargin;
    local l_showSeeAll_0 = v39.props.showSeeAll;
    local l_designTokens_0 = v39.props.designTokens;
    local l_showTooltip_0 = v39.props.showTooltip;
    local l_onActivateTooltip_0 = v39.props.onActivateTooltip;
    local l_tooltipHoverText_0 = v39.props.tooltipHoverText;
    local l_deviceType_0 = v39.props.deviceType;
    local l_screenSize_0 = v39.props.screenSize;
    local v62 = not l_FFlagLuaAppPropagateFriendsCarouselHeader_0 or l_title_0 ~= nil and l_title_0 ~= "";
    local v63 = nil;
    if v39.props.forceDarkThemeForHeader then
        v63 = l_designTokens_0.darkThemeTextColor;
    end;
    local function v80(v64, v65) --[[ Line: 118 ]]
        -- upvalues: v3 (ref), l_ScrollingAppCarousel_0 (ref), l_items_0 (copy), l_index_0 (copy), l_itemCount_0 (copy), l_itemWidth_0 (copy), l_itemPadding_0 (copy), l_carouselMargin_0 (copy), l_carouselHeight_0 (copy), l_canvasWidth_0 (copy), l_onChangeCanvasPosition_0 (copy), l_onRefCallback_0 (copy), l_designTokens_0 (copy), l_title_0 (copy), v63 (ref), l_FFlagLuaAppDisableChevronSeeAll_0 (ref), v39 (copy), l_showSeeAll_0 (copy), l_ImageSetLabel_0 (ref), v31 (ref), l_showTooltip_0 (copy), l_screenSize_0 (copy), l_CursorKind_0 (ref), l_onSeeAll_0 (copy), l_deviceType_0 (copy), l_DeviceType_0 (ref), l_IconWithTooltip_0 (ref), l_TooltipOrientation_0 (ref), l_onActivateTooltip_0 (copy), l_tooltipHoverText_0 (copy), v62 (copy), l_maybeForceDarkTheme_0 (ref), l_fetchingStatus_0 (copy), l_LoadingStateContainer_0 (ref), l_onRetry_0 (copy), l_View_0 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), v28 (ref), l_layoutOrder_0 (copy), v9 (ref)
        local l_Theme_0 = v64.Theme;
        local l_Font_0 = v64.Font;
        local v68 = v3.createElement(l_ScrollingAppCarousel_0, {
            items = l_items_0, 
            index = l_index_0, 
            itemCount = l_itemCount_0, 
            itemWidth = l_itemWidth_0, 
            itemPadding = l_itemPadding_0, 
            carouselMargin = l_carouselMargin_0, 
            carouselHeight = l_carouselHeight_0, 
            canvasWidth = l_canvasWidth_0, 
            onChangeCanvasPosition = l_onChangeCanvasPosition_0, 
            onRefCallback = l_onRefCallback_0
        });
        local v69 = v3.createElement("TextLabel", {
            Size = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1, 
            Font = l_designTokens_0.headerFont, 
            Text = l_title_0, 
            TextSize = l_designTokens_0.headerTextSize, 
            TextColor3 = v63 or l_Theme_0.TextEmphasis.Color, 
            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            TextTruncate = Enum.TextTruncate.SplitWord
        });
        local v70 = not l_FFlagLuaAppDisableChevronSeeAll_0;
        local v71 = {
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = if v70 then v39.props.textIconPadding else UDim.new(0, 4)
            }), 
            Title = v69, 
            SeeAllArrow = l_showSeeAll_0 and v3.createElement(l_ImageSetLabel_0, {
                Size = if v70 then v39.props.seeAllImageSize or UDim2.new(0, 20, 0, 20) else UDim2.new(0, 20, 0, 20), 
                BackgroundTransparency = 1, 
                Image = v31, 
                ImageColor3 = v63 or l_Theme_0.TextEmphasis.Color, 
                ImageTransparency = l_Theme_0.TextEmphasis.Transparency, 
                LayoutOrder = 2
            }) or nil, 
            UISizeConstraint = v3.createElement("UISizeConstraint", {
                MaxSize = if l_showTooltip_0 then Vector2.new(l_screenSize_0.X - 2 * (l_carouselMargin_0 or 0) - 48, 1e999) else Vector2.new(l_screenSize_0.X - 2 * (l_carouselMargin_0 or 0), 1e999)
            })
        };
        local v72 = v39.props.subtitle and v39.props.subtitle ~= "";
        local l_subtitleTextSize_0 = l_designTokens_0.subtitleTextSize;
        local v74 = nil;
        if v72 then
            if type(v39.props.subtitle) == "string" then
                v74 = v3.createElement("TextLabel", {
                    Text = v39.props.subtitle, 
                    Size = UDim2.new(1, 0, 0, l_subtitleTextSize_0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2, 
                    Font = l_Font_0.Body.Font, 
                    TextColor3 = v63 or l_Theme_0.TextDefault.Color, 
                    TextSize = l_subtitleTextSize_0, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    AutomaticSize = Enum.AutomaticSize.Y
                });
            elseif type(v39.props.subtitle) == "table" then
                v74 = v39.props.subtitle;
            end;
        end;
        local v75 = if v72 then {
            Layout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 4)
            }), 
            TitleWrapper = v3.createElement("Frame", {
                Size = UDim2.new(), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 1, 
                BackgroundTransparency = 1
            }, v71), 
            Subtitle = v74, 
            UISizeConstraint = v3.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(l_screenSize_0.X - 2 * (l_carouselMargin_0 or 0), 1e999)
            })
        } else v71;
        local v76 = nil;
        v76 = if l_showSeeAll_0 then v3.createElement("ImageButton", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            AutoButtonColor = false, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            SelectionImageObject = v65(l_CursorKind_0.InputButton), 
            [v3.Event.Activated] = l_onSeeAll_0
        }, v75) else v3.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, v75);
        local v77 = v3.createElement("Frame", {
            Size = UDim2.new(0, l_screenSize_0.X - 48, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            Layout = if l_deviceType_0 == l_DeviceType_0.Desktop then v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 4)
            }) else nil, 
            HeaderText = v76, 
            CarouselTooltip = v3.createElement(l_IconWithTooltip_0, {
                tooltipOrientation = l_TooltipOrientation_0.Bottom, 
                onActivateTooltip = l_onActivateTooltip_0, 
                anchorPoint = Vector2.new(1, 0), 
                position = if l_deviceType_0 == l_DeviceType_0.Desktop then nil else UDim2.new(1, 0, 0, 0), 
                layoutOrder = 2, 
                hoverText = l_tooltipHoverText_0, 
                triggerPointName = "CarouselTooltip"
            })
        });
        local v78 = {
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 12)
            }), 
            Header = v62 and l_maybeForceDarkTheme_0(if l_showTooltip_0 then v77 else v76, v39.props.forceDarkThemeForHeader), 
            CarouselFrame = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_carouselHeight_0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                CarouselContent = l_fetchingStatus_0 and v3.createElement(l_LoadingStateContainer_0, {
                    dataStatus = v39.state.dataStatus, 
                    onRetry = l_onRetry_0, 
                    renderOnLoading = function() --[[ Line: 286 ]] --[[ Name: renderOnLoading ]]
                        return nil;
                    end, 
                    renderOnLoaded = function() --[[ Line: 289 ]] --[[ Name: renderOnLoaded ]]
                        -- upvalues: v68 (copy)
                        return v68;
                    end
                }) or v68
            })
        };
        local v79 = if v39.props.onActivateInfoIcon then v3.createElement(l_View_0, {
            Size = UDim2.new(1, -l_designTokens_0.iconSizeSmall, 0, -12), 
            tag = "col align-x-right align-y-top"
        }, {
            v3.createElement(l_View_0, {
                Size = UDim2.new(0, 0, 0, 14)
            }), 
            v3.createElement(l_IconButton_0, {
                size = l_IconSize_0.Small, 
                icon = "icons/actions/info_small", 
                onActivated = v39.props.onActivateInfoIcon
            })
        }) else nil;
        if v28() then
            return v3.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = l_layoutOrder_0
            }, v78, v79);
        else
            return v3.createElement(v9.FitFrame, {
                fitAxis = v9.FitAxis.Height, 
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = l_layoutOrder_0
            }, v78, v79);
        end;
    end;
    return l_withStyle_0(function(v81) --[[ Line: 326 ]]
        -- upvalues: l_withSelectionCursorProvider_0 (ref), v80 (copy)
        return l_withSelectionCursorProvider_0(function(v82) --[[ Line: 327 ]]
            -- upvalues: v80 (ref), v81 (copy)
            return v80(v81, v82);
        end);
    end);
end;
return function(v83) --[[ Line: 332 ]]
    -- upvalues: l_useUiModeInfo_0 (copy), l_useStyle_0 (copy), l_useDesignTokens_0 (copy), l_UiMode_0 (copy), l_useSelector_0 (copy), v2 (copy), v3 (copy), v32 (copy)
    local v84 = l_useUiModeInfo_0();
    local v85 = l_useStyle_0();
    local v87 = l_useDesignTokens_0(function(v86) --[[ Line: 335 ]]
        -- upvalues: v84 (copy), l_UiMode_0 (ref), v85 (copy)
        if v84.uiMode == l_UiMode_0.TenFoot then
            return {
                headerFont = v86.Semantic.Typography.Header.Font, 
                headerTextSize = v86.Semantic.Typography.Header.FontSize, 
                subtitleTextSize = v86.Semantic.Typography.Subheader.FontSize, 
                darkThemeTextColor = v86.Global.Color.White.Color3, 
                iconSizeSmall = v86.Global.Size_400
            };
        else
            return {
                headerFont = v85.Font.Header1.Font, 
                headerTextSize = v85.Font.BaseSize * v85.Font.Header1.RelativeSize, 
                subtitleTextSize = v85.Font.BaseSize * v85.Font.CaptionLarge.RelativeSize, 
                darkThemeTextColor = v86.Global.Color.White.Color3, 
                iconSizeSmall = v86.Global.Size_400
            };
        end;
    end);
    local v89 = l_useSelector_0(function(v88) --[[ Line: 354 ]]
        return v88.ScreenSize;
    end);
    local v90 = v83.showSeeAll and v84.uiMode ~= l_UiMode_0.TenFoot;
    local v91 = v2.Dictionary.join(v83, {
        designTokens = v87, 
        showSeeAll = v90, 
        screenSize = v89
    });
    return v3.createElement(v32, v91);
end;