local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.React);
local v4 = require(l_Parent_2.Cryo);
local _ = require(l_Parent_0.Style.StyleTypes);
local _ = require(l_Parent_0.Style.Fonts);
local v7 = require(l_Parent_1.Core.Style.useStyle);
local v8 = require(l_Parent_1.Core.Text.GenericTextLabel.GenericTextLabel);
local v9 = require(l_Parent_1.Core.Text.GetTextSize);
local v10 = require(l_Parent_1.Core.Bar.ThreeSectionBar);
local v11 = {
    barHeight = 48, 
    title = "", 
    isTitleCentered = true, 
    isSecondary = false, 
    isOnMedia = false, 
    hasDivider = false
};
local function v28(v12, v13) --[[ Line: 92 ]] --[[ Name: useHeaderBarStyle ]]
    -- upvalues: v3 (copy)
    local l_Tokens_0 = v13.Tokens;
    local l_Theme_0 = v13.Theme;
    local l_backgroundStyle_0 = v12.backgroundStyle;
    local l_backgroundTransparency_0 = v12.backgroundTransparency;
    local l_isOnMedia_0 = v12.isOnMedia;
    local v20 = v3.useMemo(function() --[[ Line: 99 ]]
        -- upvalues: l_isOnMedia_0 (copy), l_backgroundStyle_0 (copy), l_Theme_0 (copy), l_backgroundTransparency_0 (copy)
        if l_isOnMedia_0 then
            return {};
        else
            local v19 = l_backgroundStyle_0 or {
                Color3 = l_Theme_0.BackgroundDefault.Color, 
                Transparency = l_Theme_0.BackgroundDefault.Transparency
            };
            if l_backgroundTransparency_0 then
                v19.Transparency = l_backgroundTransparency_0;
            end;
            return v19;
        end;
    end, {
        l_isOnMedia_0, 
        l_backgroundStyle_0, 
        l_backgroundTransparency_0, 
        l_Theme_0
    });
    local l_paddingTop_0 = v12.paddingTop;
    local l_paddingRight_0 = v12.paddingRight;
    local l_paddingBottom_0 = v12.paddingBottom;
    local l_paddingLeft_0 = v12.paddingLeft;
    local l_margin_0 = v12.margin;
    local v27 = v3.useMemo(function() --[[ Line: 123 ]]
        -- upvalues: l_paddingTop_0 (copy), l_Tokens_0 (copy), l_paddingRight_0 (copy), l_paddingBottom_0 (copy), l_paddingLeft_0 (copy), l_margin_0 (copy)
        local v26 = {
            Top = l_paddingTop_0 or UDim.new(0, l_Tokens_0.Global.Space_100), 
            Right = l_paddingRight_0 or UDim.new(0, l_Tokens_0.Global.Space_250), 
            Bottom = l_paddingBottom_0 or UDim.new(0, l_Tokens_0.Global.Space_100), 
            Left = l_paddingLeft_0 or UDim.new(0, l_Tokens_0.Global.Space_250)
        };
        if l_margin_0 then
            v26.Left = UDim.new(0, l_margin_0);
            v26.Right = UDim.new(0, l_margin_0);
        end;
        return v26;
    end, {
        l_paddingTop_0, 
        l_paddingRight_0, 
        l_paddingBottom_0, 
        l_paddingLeft_0, 
        l_margin_0, 
        l_Tokens_0
    });
    return {
        BackgroundStyle = v20, 
        Padding = v27
    };
end;
local function v47(v29, v30) --[[ Line: 144 ]] --[[ Name: useRenderLeft ]]
    -- upvalues: v3 (copy), v4 (copy), v8 (copy)
    return v3.useMemo(function() --[[ Line: 145 ]]
        -- upvalues: v29 (copy), v3 (ref), v30 (copy), v4 (ref), v8 (ref)
        local l_title_0 = v29.title;
        local l_renderLeft_0 = v29.renderLeft;
        local l_isTitleCentered_0 = v29.isTitleCentered;
        local l_isSecondary_0 = v29.isSecondary;
        local l_shouldHideSecondaryLeftItem_0 = v29.shouldHideSecondaryLeftItem;
        local v36 = true;
        if l_renderLeft_0 ~= nil then
            v36 = l_renderLeft_0 == v3.None;
        end;
        local l_Tokens_1 = v30.Tokens;
        local l_renderLeft_1 = v29.renderLeft;
        if v36 and string.len(l_title_0) > 0 then
            return function(v39) --[[ Line: 156 ]]
                -- upvalues: v4 (ref), v3 (ref), l_Tokens_1 (copy), v8 (ref), l_title_0 (copy)
                local v40 = v4.Dictionary.join(v39.children, {
                    TextPadding = v3.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, l_Tokens_1.Global.Space_25), 
                        PaddingBottom = UDim.new(0, l_Tokens_1.Global.Space_25)
                    })
                });
                return v3.createElement(v3.Fragment, nil, {
                    Text = v3.createElement(v8, {
                        fluidSizing = true, 
                        Text = l_title_0, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        fontStyle = l_Tokens_1.Semantic.Typography.Title, 
                        colorStyle = l_Tokens_1.Semantic.Color.Text.Emphasis
                    }, v40)
                });
            end;
        elseif l_isSecondary_0 and not l_shouldHideSecondaryLeftItem_0 and string.len(l_title_0) > 0 then
            local l_Theme_1 = v30.Theme;
            local l_Font_0 = v30.Font;
            local l_Header2_0 = l_Font_0.Header2;
            local v44 = l_Header2_0.RelativeSize * l_Font_0.BaseSize;
            return function() --[[ Line: 181 ]]
                -- upvalues: v3 (ref), v44 (copy), l_renderLeft_0 (copy), l_Theme_1 (copy), v8 (ref), l_title_0 (copy), l_Header2_0 (copy)
                return v3.createElement(v3.Fragment, nil, {
                    Text = v3.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, v44), 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1
                    }, {
                        Layout = v3.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Horizontal, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            Padding = UDim.new(0, 12)
                        }), 
                        Left = v3.createElement("Frame", {
                            LayoutOrder = 1, 
                            Selectable = false, 
                            Size = UDim2.fromOffset(0, 0), 
                            BorderSizePixel = 0, 
                            BackgroundTransparency = 1, 
                            AutomaticSize = Enum.AutomaticSize.XY
                        }, {
                            LeftContent = if l_renderLeft_0 then l_renderLeft_0() else nil
                        }), 
                        Divider = v3.createElement("Frame", {
                            LayoutOrder = 2, 
                            Selectable = false, 
                            BackgroundColor3 = l_Theme_1.Divider.Color, 
                            BackgroundTransparency = l_Theme_1.Divider.Transparency, 
                            BorderSizePixel = 0, 
                            Size = UDim2.new(0, 1, 1, 0)
                        }), 
                        TextLabel = v3.createElement(v8, {
                            LayoutOrder = 3, 
                            Selectable = false, 
                            ClipsDescendants = true, 
                            Text = l_title_0, 
                            TextTruncate = Enum.TextTruncate.AtEnd, 
                            TextWrapped = false, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            fontStyle = l_Header2_0, 
                            colorStyle = l_Theme_1.TextEmphasis
                        })
                    })
                });
            end;
        else
            if not l_isSecondary_0 and not l_isTitleCentered_0 then
                local l_Header_0 = l_Tokens_1.Semantic.Typography.Header;
                local l_FontSize_0 = l_Header_0.FontSize;
                l_renderLeft_1 = function() --[[ Line: 230 ]]
                    -- upvalues: v3 (ref), l_FontSize_0 (copy), l_Tokens_1 (copy), l_renderLeft_0 (copy), v8 (ref), l_title_0 (copy), l_Header_0 (copy)
                    return v3.createElement(v3.Fragment, nil, {
                        LeftFrame = v3.createElement("Frame", {
                            Selectable = false, 
                            Size = UDim2.new(1, 0, 0, l_FontSize_0), 
                            BorderSizePixel = 0, 
                            BackgroundTransparency = 1
                        }, {
                            Layout = v3.createElement("UIListLayout", {
                                SortOrder = Enum.SortOrder.LayoutOrder, 
                                FillDirection = Enum.FillDirection.Horizontal, 
                                VerticalAlignment = Enum.VerticalAlignment.Center, 
                                Padding = UDim.new(0, l_Tokens_1.Global.Space_150)
                            }), 
                            Left = v3.createElement("Frame", {
                                LayoutOrder = 1, 
                                Selectable = false, 
                                Size = UDim2.fromOffset(0, 0), 
                                BorderSizePixel = 0, 
                                BackgroundTransparency = 1, 
                                AutomaticSize = Enum.AutomaticSize.XY
                            }, {
                                LeftContent = if l_renderLeft_0 then l_renderLeft_0() else nil
                            }), 
                            TextLabel = v3.createElement(v8, {
                                LayoutOrder = 2, 
                                Selectable = false, 
                                ClipsDescendants = true, 
                                Text = l_title_0, 
                                TextTruncate = Enum.TextTruncate.AtEnd, 
                                TextWrapped = false, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                fontStyle = l_Header_0, 
                                colorStyle = l_Tokens_1.Semantic.Color.Text.Emphasis
                            }, {
                                TextPadding = v3.createElement("UIPadding", {
                                    PaddingTop = UDim.new(0, l_Tokens_1.Global.Space_25), 
                                    PaddingBottom = UDim.new(0, l_Tokens_1.Global.Space_25)
                                })
                            })
                        })
                    });
                end;
            end;
            return l_renderLeft_1;
        end;
    end, {
        v29.title, 
        v29.isTitleCentered, 
        v29.renderLeft, 
        v29.isSecondary, 
        v29.shouldHideSecondaryLeftItem, 
        v30
    });
end;
return function(v48) --[[ Line: 286 ]] --[[ Name: HeaderBar ]]
    -- upvalues: v4 (copy), v11 (copy), v7 (copy), v3 (copy), v47 (copy), v8 (copy), v9 (copy), v28 (copy), v10 (copy)
    local v49 = v4.Dictionary.join(v11, v48);
    local v50 = v7();
    local l_Tokens_2 = v50.Tokens;
    local l_title_1 = v49.title;
    local l_renderCenter_0 = v49.renderCenter;
    local l_renderRight_0 = v49.renderRight;
    local l_isTitleCentered_1 = v49.isTitleCentered;
    local l_isSecondary_1 = v49.isSecondary;
    local l_onHeaderActivated_0 = v49.onHeaderActivated;
    local l_contentPaddingRight_0 = v49.contentPaddingRight;
    local l_automaticHeight_0 = v49.automaticHeight;
    local l_isOnMedia_1 = v49.isOnMedia;
    local l_zIndex_0 = v49.zIndex;
    local l_hasDivider_0 = v49.hasDivider;
    local v63 = true;
    if v49.renderLeft ~= nil then
        v63 = v49.renderLeft == v3.None;
    end;
    local v64 = v47(v49, v50);
    local v68 = v3.useMemo(function() --[[ Line: 306 ]]
        -- upvalues: l_renderCenter_0 (copy), v63 (copy), l_isSecondary_1 (copy), l_isTitleCentered_1 (copy), l_Tokens_2 (copy), v3 (ref), v8 (ref), l_title_1 (copy)
        local l_l_renderCenter_0_0 = l_renderCenter_0;
        if not l_l_renderCenter_0_0 and not v63 and not l_isSecondary_1 and l_isTitleCentered_1 then
            local l_Header_1 = l_Tokens_2.Semantic.Typography.Header;
            local l_FontSize_1 = l_Header_1.FontSize;
            l_l_renderCenter_0_0 = function() --[[ Line: 313 ]]
                -- upvalues: v3 (ref), v8 (ref), l_FontSize_1 (copy), l_title_1 (ref), l_Header_1 (copy), l_Tokens_2 (ref)
                return v3.createElement(v8, {
                    Selectable = false, 
                    ClipsDescendants = true, 
                    Size = UDim2.new(1, 0, 0, l_FontSize_1), 
                    Text = l_title_1, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextWrapped = false, 
                    fontStyle = l_Header_1, 
                    colorStyle = l_Tokens_2.Semantic.Color.Text.Emphasis
                }, {
                    TextPadding = v3.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, l_Tokens_2.Global.Space_25), 
                        PaddingBottom = UDim.new(0, l_Tokens_2.Global.Space_25)
                    })
                });
            end;
        end;
        return l_l_renderCenter_0_0;
    end, {
        l_renderCenter_0, 
        v63, 
        l_isSecondary_1, 
        l_isTitleCentered_1, 
        l_Tokens_2, 
        l_title_1
    });
    local v71 = v3.useMemo(function() --[[ Line: 334 ]]
        -- upvalues: v64 (copy), l_renderCenter_0 (copy), l_renderRight_0 (copy), v63 (copy), l_isSecondary_1 (copy), l_isTitleCentered_1 (copy), l_Tokens_2 (copy), v9 (ref), l_title_1 (copy)
        if v64 and l_renderCenter_0 and l_renderRight_0 then
            return 0;
        elseif not l_renderCenter_0 and not v63 and not l_isSecondary_1 and l_isTitleCentered_1 then
            local l_Header_2 = l_Tokens_2.Semantic.Typography.Header;
            local l_FontSize_2 = l_Header_2.FontSize;
            return v9(l_title_1, l_FontSize_2, l_Header_2.Font, Vector2.new(1e999, 1e999)).X;
        else
            return 1e999;
        end;
    end, {
        l_title_1, 
        l_isTitleCentered_1, 
        v63, 
        v64, 
        l_renderCenter_0, 
        l_renderRight_0, 
        l_isSecondary_1, 
        l_Tokens_2
    });
    local v72 = v3.useMemo(function() --[[ Line: 351 ]]
        -- upvalues: l_contentPaddingRight_0 (copy), v63 (copy), l_Tokens_2 (copy)
        if l_contentPaddingRight_0 then
            return l_contentPaddingRight_0;
        elseif v63 then
            return UDim.new(0, 0);
        else
            return UDim.new(0, l_Tokens_2.Global.Space_300);
        end;
    end, {
        l_contentPaddingRight_0, 
        v63, 
        l_Tokens_2
    });
    local v73 = v28(v49, v50);
    local l_BackgroundStyle_0 = v73.BackgroundStyle;
    local l_Padding_0 = v73.Padding;
    local v76 = if l_isOnMedia_1 then v49.barHeight + l_Tokens_2.Global.Size_500 else v49.barHeight;
    local v77 = l_automaticHeight_0 and 0 or math.max(0, v49.barHeight - l_Padding_0.Top.Offset - l_Padding_0.Bottom.Offset);
    return v3.createElement("Frame", {
        Selectable = false, 
        Size = UDim2.new(1, 0, 0, v76), 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_BackgroundStyle_0.Color3, 
        BackgroundTransparency = l_BackgroundStyle_0.Transparency, 
        AutomaticSize = if l_automaticHeight_0 then Enum.AutomaticSize.Y else nil, 
        ZIndex = l_zIndex_0
    }, {
        Gradient = if l_isOnMedia_1 then v3.createElement("UIGradient", {
            Rotation = 90, 
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)), 
                ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
            }), 
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.7), 
                NumberSequenceKeypoint.new(1, 1)
            })
        }) else nil, 
        OnMediaExtendedHeight = if l_isOnMedia_1 then v3.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, l_Tokens_2.Global.Size_500)
        }) else nil, 
        Bar = v3.createElement("Frame", {
            Selectable = false, 
            Size = UDim2.fromScale(1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            Padding = v3.createElement("UIPadding", {
                PaddingTop = l_Padding_0.Top, 
                PaddingRight = l_Padding_0.Right, 
                PaddingBottom = l_Padding_0.Bottom, 
                PaddingLeft = l_Padding_0.Left
            }), 
            ThreeSectionBar = v3.createElement(v10, {
                BackgroundTransparency = 1, 
                barHeight = v77, 
                automaticHeight = l_automaticHeight_0, 
                renderLeft = v64, 
                renderCenter = v68, 
                renderRight = l_renderRight_0, 
                estimatedCenterWidth = v71, 
                sectionSpacing = l_Tokens_2.Global.Space_150, 
                contentPaddingRight = v72
            })
        }), 
        HeaderClickArea = if l_onHeaderActivated_0 then v3.createElement("TextButton", {
            AutoButtonColor = false, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Text = "", 
            Size = UDim2.fromScale(1, 1), 
            Selectable = false, 
            [v3.Event.Activated] = l_onHeaderActivated_0, 
            ZIndex = 0
        }) else nil, 
        BottomDivider = if l_hasDivider_0 then v3.createElement("Frame", {
            Selectable = false, 
            Size = UDim2.new(1, 0, 0, l_Tokens_2.Global.Stroke_100), 
            Position = UDim2.new(0, 0, 1, -l_Tokens_2.Global.Stroke_100), 
            BackgroundColor3 = l_Tokens_2.Semantic.Color.Common.Divider.Color3, 
            BackgroundTransparency = l_Tokens_2.Semantic.Color.Common.Divider.Transparency, 
            BorderSizePixel = 0, 
            ZIndex = 1
        }) else nil
    });
end;