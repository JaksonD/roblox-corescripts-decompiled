local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.UIBlox);
local l_withStyle_0 = v1.Core.Style.withStyle;
local l_ImageSetLabel_0 = v1.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v1.App.ImageSet.Images;
local l_LoadableImage_0 = v1.App.Loading.LoadableImage;
local l_ActionBar_0 = v1.App.Button.ActionBar;
local l_DeviceType_0 = require(l_Parent_0.RobloxAppEnums).DeviceType;
local v8 = require(l_Parent_0.Roact);
local v9 = require(l_Parent_0.t);
local v10 = require(script.Parent.DetailsPageTitleContent);
local l_FFlagLuaAppFixDetailsPageThumbnailRenderInPhone_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixDetailsPageThumbnailRenderInPhone;
local v12 = game:DefineFastFlag("LuaAppBottomAlignDetailsHeaderInfoFrame", false);
local l_FFlagUIBloxEnableActionBarButtonOverride_0 = require(l_Parent_0.SharedFlags).UIBlox.FFlagUIBloxEnableActionBarButtonOverride;
local l_FFlagUIBloxAddTestIdToActionBar_0 = require(l_Parent_0.SharedFlags).UIBlox.FFlagUIBloxAddTestIdToActionBar;
local v15 = game:DefineFastFlag("FFlagFixDetailsPageIconShadowSlicing", false);
local v16 = v8.PureComponent:extend("DetailsPageHeader");
v16.defaultProps = {
    thumbnailHeight = 200, 
    thumbnailAspectRatio = Vector2.new(1, 1), 
    actionBarHeight = 48, 
    actionBarWidth = 380
};
v16.validateProps = v9.strictInterface({
    thumbnailImageUrl = v9.optional(v9.string), 
    thumbnailAspectRatio = v9.optional(v9.Vector2), 
    thumbnailHeight = v9.optional(v9.number), 
    titleText = v9.optional(v9.string), 
    subTitleText = v9.optional(v9.string), 
    actionBarLabelText = v9.optional(v9.string), 
    renderInfoContent = v9.optional(v9.callback), 
    renderCustomHeader = v9.optional(v9.callback), 
    headerBarBackgroundHeight = v9.optional(v9.number), 
    sideMargin = v9.optional(v9.number), 
    itemPadding = v9.optional(v9.number), 
    bottomMargin = v9.optional(v9.number), 
    gradientHeight = v9.optional(v9.number), 
    thumbnailShadowHeight = v9.optional(v9.number), 
    actionBarHeight = v9.optional(v9.number), 
    actionBarWidth = v9.optional(v9.number), 
    maxContentWidth = v9.optional(v9.number), 
    actionBarProps = v9.optional(v9.table), 
    deviceType = v9.optional(v9.string)
});
v16.renderThumbnail = function(v17, v18, v19, v20, v21) --[[ Line: 78 ]] --[[ Name: renderThumbnail ]]
    -- upvalues: v8 (copy), l_LoadableImage_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), v15 (copy)
    return v8.createElement("Frame", {
        Size = UDim2.fromOffset(v20, v21), 
        LayoutOrder = 1, 
        AnchorPoint = Vector2.new(0, 1), 
        Position = UDim2.new(0, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        ThumbnailTile = v8.createElement(l_LoadableImage_0, {
            cornerRadius = UDim.new(0, 8), 
            Size = UDim2.fromScale(1, 1), 
            Image = v17.props.thumbnailImageUrl
        }), 
        DropShadow = if v19 > 0 then v8.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(1, 0, 0, 28), 
            Position = UDim2.fromScale(0, 1), 
            BackgroundTransparency = 1, 
            Image = l_Images_0["component_assets/dropshadow_thumbnail_28"], 
            ImageColor3 = v18.Theme.DropShadow.Color, 
            ImageTransparency = v18.Theme.DropShadow.Transparency, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = if v15 then Rect.new(32, 0, 33, 1) else Rect.new(32, 0, 33, 28)
        }) else nil
    });
end;
v16.renderDesktopMode = function(v22, v23) --[[ Line: 108 ]] --[[ Name: renderDesktopMode ]]
    -- upvalues: v8 (copy), v12 (copy), v10 (copy), l_ActionBar_0 (copy), l_FFlagUIBloxEnableActionBarButtonOverride_0 (copy), l_FFlagUIBloxAddTestIdToActionBar_0 (copy)
    local l_thumbnailHeight_0 = v22.props.thumbnailHeight;
    local v25 = l_thumbnailHeight_0 * (v22.props.thumbnailAspectRatio.X / v22.props.thumbnailAspectRatio.Y);
    local v26 = v22.props.sideMargin or 48;
    local v27 = v22.props.itemPadding or 24;
    local v28 = 28;
    if v22.props.thumbnailShadowHeight ~= nil then
        v28 = v22.props.thumbnailShadowHeight;
    end;
    local v29 = v8.createElement("Frame", {
        Size = UDim2.new(1, -(v25 + v26 * 2), 1, 0), 
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = 2
    }, if v22.props.renderCustomHeader then v22.props.renderCustomHeader() else {
        Layout = v8.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = if v12 then Enum.VerticalAlignment.Bottom else Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, 16)
        }), 
        TitleInfo = v8.createElement(v10, {
            titleText = v22.props.titleText, 
            subTitleText = v22.props.subTitleText, 
            renderInfoContent = v22.props.renderInfoContent, 
            verticalAlignment = Enum.VerticalAlignment.Top, 
            layoutOrder = 1
        }), 
        ActonBarFrame = v8.createElement("Frame", {
            Size = UDim2.fromOffset(v22.props.actionBarWidth, v22.props.actionBarHeight), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            ActionBar = v22.props.actionBarProps and v8.createElement(l_ActionBar_0, {
                button = v22.props.actionBarProps.button, 
                buttonOverride = if l_FFlagUIBloxEnableActionBarButtonOverride_0 then v22.props.actionBarProps.buttonOverride else nil, 
                icons = v22.props.actionBarProps.icons, 
                iconSize = v22.props.actionBarProps.iconSize, 
                buttonHeight = v22.props.actionBarProps.buttonHeight, 
                buttonPadding = v22.props.actionBarProps.buttonPadding, 
                textButtons = v22.props.actionBarProps.textButtons, 
                enableButtonAtStart = true, 
                marginOverride = {
                    left = 0, 
                    right = 0, 
                    top = 0, 
                    bottom = 0
                }, 
                horizontalAlignment = Enum.HorizontalAlignment.Left, 
                testId = l_FFlagUIBloxAddTestIdToActionBar_0 and "--experience-details" or nil
            }) or nil
        }), 
        ActionBarLabel = if v22.props.actionBarLabelText then v8.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Text = v22.props.actionBarLabelText, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true, 
            BackgroundTransparency = 1, 
            Font = v23.Tokens.Semantic.Typography.Body.Font, 
            TextSize = v23.Tokens.Semantic.Typography.Body.FontSize, 
            TextColor3 = v23.Tokens.Semantic.Color.Text.Emphasis.Color3, 
            TextTransparency = v23.Tokens.Semantic.Color.Text.Emphasis.Transparency, 
            LayoutOrder = 3
        }) else nil
    });
    return {
        Padding = v8.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v26), 
            PaddingRight = UDim.new(0, v26), 
            PaddingBottom = UDim.new(0, 16)
        }), 
        ContentFrame = v8.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Position = UDim2.fromScale(0.5, 1), 
            AnchorPoint = Vector2.new(0.5, 1), 
            BackgroundTransparency = 1
        }, if v22.props.renderCustomHeader then {
            CustomHeader = v22.props.renderCustomHeader(), 
            UISizeConstraint = if v22.props.maxContentWidth then v8.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(v22.props.maxContentWidth, 1e999)
            }) else nil
        } else {
            Layout = v8.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                Padding = UDim.new(0, v27)
            }), 
            ThumbnailTileFrame = v22:renderThumbnail(v23, v28, v25, l_thumbnailHeight_0), 
            InfoFrame = v29, 
            UISizeConstraint = if v22.props.maxContentWidth then v8.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(v22.props.maxContentWidth, 1e999)
            }) else nil
        })
    };
end;
v16.renderisPhone = function(v30, v31) --[[ Line: 237 ]] --[[ Name: renderisPhone ]]
    -- upvalues: v8 (copy), l_FFlagLuaAppFixDetailsPageThumbnailRenderInPhone_0 (copy)
    local l_thumbnailHeight_1 = v30.props.thumbnailHeight;
    local v33 = l_thumbnailHeight_1 * (v30.props.thumbnailAspectRatio.X / v30.props.thumbnailAspectRatio.Y);
    local v34 = v30.props.sideMargin or 24;
    if v30.props.renderCustomHeader then
        return {
            Padding = v8.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v34), 
                PaddingRight = UDim.new(0, v34), 
                PaddingBottom = UDim.new(0, 16)
            }), 
            ContentFrame = v8.createElement("Frame", {
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.fromScale(0, 1), 
                BackgroundTransparency = 1
            }, {
                Content = v30.props.renderCustomHeader()
            })
        };
    else
        return {
            Padding = v8.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v34), 
                PaddingRight = UDim.new(0, v34), 
                PaddingBottom = UDim.new(0, 16)
            }), 
            ThumbnailTileFrame = if l_FFlagLuaAppFixDetailsPageThumbnailRenderInPhone_0 then v30:renderThumbnail(v31, 0, v33, l_thumbnailHeight_1) else v30:renderThumbnail(v31, v33, l_thumbnailHeight_1)
        };
    end;
end;
v16.render = function(v35) --[[ Line: 275 ]] --[[ Name: render ]]
    -- upvalues: l_DeviceType_0 (copy), l_withStyle_0 (copy), v8 (copy)
    local v36 = v35.props.deviceType == l_DeviceType_0.Phone;
    local l_thumbnailHeight_2 = v35.props.thumbnailHeight;
    local v38 = v35.props.headerBarBackgroundHeight or 80;
    local v39 = v35.props.gradientHeight or l_thumbnailHeight_2 + 16 - v38 + 44;
    local l_bottomMargin_0 = v35.props.bottomMargin;
    return l_withStyle_0(function(v41) --[[ Line: 285 ]]
        -- upvalues: v8 (ref), v39 (copy), v38 (copy), v36 (copy), v35 (copy), l_thumbnailHeight_2 (copy), l_bottomMargin_0 (copy)
        local l_Theme_0 = v41.Theme;
        return v8.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }, {
            Layout = v8.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left
            }), 
            GradientBar = v8.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v39), 
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                AnchorPoint = Vector2.new(0, 1), 
                BorderSizePixel = 0, 
                LayoutOrder = 1
            }, {
                Gradient = v8.createElement("UIGradient", {
                    Rotation = 270, 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0), 
                        NumberSequenceKeypoint.new(0.5, 0.25), 
                        NumberSequenceKeypoint.new(1, 1)
                    })
                })
            }), 
            BackgroundBar = v8.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v38), 
                Position = UDim2.fromScale(0, 1), 
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                LayoutOrder = 2
            }, v36 and v35:renderisPhone(v41, l_thumbnailHeight_2) or v35:renderDesktopMode(v41, l_thumbnailHeight_2)), 
            Padding = if l_bottomMargin_0 then v8.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_bottomMargin_0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 3
            }) else nil
        });
    end);
end;
return v16;