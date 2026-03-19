local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v5.Style.withStyle;
local l_LoadableImage_0 = v5.App.Loading.LoadableImage;
local v8 = require(l_Modules_0.Common.Text);
local v9 = require(l_Modules_0.Luobu.Enum.TencentNoticeType);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v11 = v2.PureComponent:extend("NoticePageControlItem");
v11.validateProps = v4.strictInterface({
    headerHeight = v4.number, 
    contentHeight = v4.number, 
    width = v4.number, 
    notice = v4.table, 
    layoutOrder = v4.number, 
    formFactor = v4.string, 
    hasOneNotice = v4.boolean
});
v11.render = function(v12) --[[ Line: 32 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v9 (copy), v2 (copy)
    local l_headerHeight_0 = v12.props.headerHeight;
    local l_contentHeight_0 = v12.props.contentHeight;
    local l_width_0 = v12.props.width;
    local l_title_0 = v12.props.notice.title;
    local l_layoutOrder_0 = v12.props.layoutOrder;
    return l_withStyle_0(function(v18) --[[ Line: 38 ]]
        -- upvalues: l_width_0 (copy), v12 (copy), v9 (ref), v2 (ref), l_headerHeight_0 (copy), l_contentHeight_0 (copy), l_layoutOrder_0 (copy), l_title_0 (copy)
        local l_Font_0 = v18.Font;
        local l_Theme_0 = v18.Theme;
        local l_Font_1 = l_Font_0.Header1.Font;
        local l_Color_0 = l_Theme_0.TextEmphasis.Color;
        local v23 = v18.Font.BaseSize * v18.Font.Header2.RelativeSize;
        local v24 = l_width_0 - 48;
        local v25 = v12.props.notice.type == v9.Text;
        return v2.createElement("Frame", {
            BackgroundTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
            BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
            BorderSizePixel = 0, 
            Size = UDim2.fromOffset(l_width_0, l_headerHeight_0 + l_contentHeight_0), 
            AnchorPoint = Vector2.new(0, 0), 
            LayoutOrder = l_layoutOrder_0
        }, {
            TopFrame = v2.createElement("Frame", {
                Size = UDim2.fromOffset(l_width_0, l_headerHeight_0 + 10), 
                BackgroundTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
                BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                BorderSizePixel = 0, 
                ZIndex = 3
            }, {
                TitleLabel = v2.createElement("TextLabel", {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Size = UDim2.new(0.7, 0, 1, 0), 
                    Text = l_title_0, 
                    TextColor3 = l_Color_0, 
                    BackgroundTransparency = 1, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    Font = l_Font_1, 
                    TextSize = v23, 
                    BorderSizePixel = 0
                }), 
                DividerLine = v25 and v2.createElement("Frame", {
                    BorderSizePixel = 0, 
                    BackgroundColor3 = l_Theme_0.Divider.Color, 
                    BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                    Size = UDim2.fromOffset(v24, 1), 
                    Position = UDim2.fromOffset(24, l_headerHeight_0 + 10)
                })
            }), 
            ContentFrame = v12:renderContent(v18, l_headerHeight_0, l_width_0, l_contentHeight_0)
        });
    end);
end;
v11.renderContent = function(v26, v27, v28, v29, v30) --[[ Line: 86 ]] --[[ Name: renderContent ]]
    -- upvalues: v9 (copy)
    local l_type_0 = v26.props.notice.type;
    if l_type_0 == v9.Text then
        return v26:renderTextContent(v27, v28, v29, v30);
    elseif l_type_0 == v9.Image then
        return v26:renderImageContent(v27, v28, v29, v30);
    else
        warn("Error: TencentNoticeType is incorrect! Please fix or add new type:" .. l_type_0);
        return nil;
    end;
end;
v11.renderTextContent = function(v32, v33, v34, v35, v36) --[[ Line: 98 ]] --[[ Name: renderTextContent ]]
    -- upvalues: v8 (copy), v2 (copy)
    local l_content_0 = v32.props.notice.content;
    if l_content_0 == nil then
        return nil;
    else
        local v38 = v35 - 48;
        local l_Theme_1 = v33.Theme;
        local l_Font_2 = v33.Font.Body.Font;
        local v41 = v33.Font.BaseSize * v33.Font.Body.RelativeSize;
        local l_TextDefault_0 = l_Theme_1.TextDefault;
        local v43 = v8.GetTextHeight(l_content_0, l_Font_2, v41, 10000);
        local v44 = v43 < v36 and v36 or v43;
        local v45 = v36 + 10;
        if v32.props.hasOneNotice then
            v45 = v45 - 48;
        end;
        return v2.createElement("ScrollingFrame", {
            Size = UDim2.fromOffset(v35, v45), 
            Position = UDim2.new(0, 0, 0, v34 - 10), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_Theme_1.BackgroundUIDefault.Color, 
            BackgroundTransparency = l_Theme_1.BackgroundUIDefault.Transparency, 
            CanvasSize = UDim2.new(0, v35, 0, v44), 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            ScrollBarThickness = 0
        }, {
            Content = v2.createElement("TextLabel", {
                Size = UDim2.fromOffset(v38, v44), 
                Position = UDim2.fromOffset(24, 34), 
                Text = l_content_0, 
                Font = l_Font_2, 
                TextSize = v41, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextColor3 = l_TextDefault_0.Color, 
                TextTransparency = l_TextDefault_0.Transparency, 
                TextWrapped = true, 
                BackgroundTransparency = 1, 
                TextTruncate = Enum.TextTruncate.AtEnd
            })
        });
    end;
end;
v11.renderImageContent = function(v46, v47, v48, v49, v50) --[[ Line: 141 ]] --[[ Name: renderImageContent ]]
    -- upvalues: l_FormFactor_0 (copy), v2 (copy), l_LoadableImage_0 (copy)
    local l_Theme_2 = v47.Theme;
    local l_landscapePicUrl_0 = v46.props.notice.landscapePicUrl;
    local l_portraitPicUrl_0 = v46.props.notice.portraitPicUrl;
    local v54 = v46.props.formFactor == l_FormFactor_0.WIDE and l_landscapePicUrl_0 or l_portraitPicUrl_0;
    local v55 = not v46.props.hasOneNotice;
    local v56 = v2.createElement("Frame", {
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_Theme_2.Overlay.Color, 
        BorderSizePixel = 0, 
        Size = UDim2.fromOffset(v49, 48), 
        Position = UDim2.fromOffset(0, v50 - 48), 
        ZIndex = 3
    }, {
        UIGradient = v2.createElement("UIGradient", {
            Rotation = 90, 
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)), 
                ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
            }), 
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1), 
                NumberSequenceKeypoint.new(0.1, 1), 
                NumberSequenceKeypoint.new(1, 0)
            })
        })
    });
    local v57 = v2.createElement(l_LoadableImage_0, {
        Size = UDim2.fromOffset(v49, v50), 
        Position = UDim2.fromOffset(0, 0), 
        Image = v54, 
        useShimmerAnimationWhileLoading = true, 
        showFailedStateWhenLoadingFailed = true, 
        BackgroundTransparency = 1
    }, {
        gradientLayer = v55 and v56
    });
    return v2.createElement("Frame", {
        Size = UDim2.fromOffset(v49, v50), 
        Position = UDim2.fromOffset(0, v48), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        TopCoverLayer = v2.createElement("Frame", {
            BackgroundTransparency = l_Theme_2.BackgroundUIDefault.Transparency, 
            BackgroundColor3 = l_Theme_2.BackgroundUIDefault.Color, 
            BorderSizePixel = 0, 
            Size = UDim2.fromOffset(v49, 10), 
            Position = UDim2.fromOffset(0, 0), 
            ZIndex = 2
        }), 
        ImageView = v57
    });
end;
return (v3.connect(function(v58) --[[ Line: 202 ]] --[[ Name: mapStateToProps ]]
    return {
        formFactor = v58.FormFactor
    };
end, nil)(v11));