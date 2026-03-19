local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Foundation);
local l_FFlagFixCommunityHeaderForWideMode_0 = require(l_Parent_0.SharedFlags).FFlagFixCommunityHeaderForWideMode;
local l_FullscreenPageWithSafeArea_0 = require(l_Parent_0.AppBlox).FullscreenPageWithSafeArea;
local v7 = require(l_script_FirstAncestor_0.Common.Enums);
local v8 = require(l_script_FirstAncestor_0.Hooks.useProfileFormFactor);
local v9 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local v10 = require(l_script_FirstAncestor_0.Common.Constants);
local v11 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformFixWideModeUI);
local l_View_0 = v4.View;
local l_IconButton_0 = v4.IconButton;
local l_IconSize_0 = v4.Enums.IconSize;
local l_useStyle_0 = v3.Core.Style.useStyle;
return function(v16) --[[ Line: 38 ]] --[[ Name: ProfileFullView ]]
    -- upvalues: l_useStyle_0 (copy), v8 (copy), v7 (copy), v10 (copy), l_FFlagFixCommunityHeaderForWideMode_0 (copy), v9 (copy), v2 (copy), l_View_0 (copy), l_IconButton_0 (copy), v11 (copy), l_IconSize_0 (copy), l_FullscreenPageWithSafeArea_0 (copy)
    local l_Theme_0 = l_useStyle_0().Theme;
    local v18 = v8().formFactor == v7.ProfileFormFactor.Wide;
    local v19 = v18 and 36 or 16;
    local v20 = v18 and 24 or 16;
    local v21 = v18 and 1018 or 1e999;
    local v22 = -v10.PAGE_PADDING;
    if l_FFlagFixCommunityHeaderForWideMode_0 then
        v22 = if (v9(v7.Components.CoverPhoto) or {}).coverPhotoId ~= nil then -v10.PAGE_PADDING else 56;
    end;
    local v23, v24 = v2.useState(0);
    local v25 = v23 > 50;
    local v28 = v2.useCallback(function(v26) --[[ Line: 58 ]]
        -- upvalues: v24 (copy)
        local v27 = math.abs(v26.CanvasPosition.Y);
        v24(v27);
    end, {});
    local v29 = v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 56), 
        Position = UDim2.fromOffset(0, 0), 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = v25 and 0.1 or 1, 
        BorderSizePixel = 0, 
        ZIndex = 1000
    }, {
        DropShadow = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 2), 
            Position = UDim2.new(0, 0, 1, 0), 
            BackgroundColor3 = l_Theme_0.DropShadow.Color, 
            BackgroundTransparency = if v25 then l_Theme_0.DropShadow.Transparency else 1, 
            BorderSizePixel = 0
        }), 
        HeaderContent = v2.createElement(l_View_0, {
            Size = UDim2.fromScale(1, 1), 
            tag = "padding-medium"
        }, {
            CloseButton = v2.createElement(l_IconButton_0, {
                anchorPoint = if v11 then nil else Vector2.new(0, 0.5), 
                position = if v11 then nil else UDim2.new(0, 0, 0.5, 0), 
                AnchorPoint = if v11 then Vector2.new(0, 0.5) else nil, 
                Position = if v11 then UDim2.new(0, 0, 0.5, 0) else nil, 
                iconSize = l_IconSize_0.Medium, 
                icon = "icons/navigation/close", 
                onActivated = v16.navigateBack, 
                backgroundTransparency = 1
            })
        })
    });
    local v30 = v2.createElement("Frame", {
        Size = UDim2.fromScale(1, v18 and 0 or 1), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Position = UDim2.new(0, 0, 0, v22)
    }, {
        UIListLayout = if v18 then v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        }) else nil, 
        ConstrainedContent = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, v18 and 0 or 1), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = v18 and 1 or nil
        }, {
            UISizeConstraint = if v18 then v2.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(v21, 1e999)
            }) else nil, 
            UIPadding = v2.createElement("UIPadding", {
                PaddingLeft = if v18 then UDim.new(0, v19) else nil, 
                PaddingRight = if v18 then UDim.new(0, v19) else nil, 
                PaddingTop = if v18 then UDim.new(0, v20) else nil, 
                PaddingBottom = UDim.new(0, v20)
            }), 
            Content = v16.renderContent()
        })
    });
    return v2.createElement(if v11 then l_FullscreenPageWithSafeArea_0 else "Frame", {
        Size = if v11 then nil else UDim2.fromScale(1, 1), 
        Position = if v11 then nil else UDim2.fromScale(0, 0), 
        includeStatusBar = v11 and true or nil, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
        BorderSizePixel = if v11 then nil else 0
    }, {
        ContentContainer = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromOffset(0, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            ScrollingFrame = v2.createElement("ScrollingFrame", {
                Size = UDim2.fromScale(1, 1), 
                Position = UDim2.fromOffset(0, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ScrollBarThickness = 0, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                CanvasSize = UDim2.new(1, 0, 0, 0), 
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                Selectable = false, 
                ElasticBehavior = Enum.ElasticBehavior.Never, 
                [v2.Change.CanvasPosition] = v28
            }, {
                ContentFrame = v30
            })
        }), 
        StickyHeader = v29
    });
end;