local l_Parent_0 = script:FindFirstAncestor("GameFilters").Parent;
local _ = require(l_Parent_0.DiscoveryTypes);
local v2 = require(l_Parent_0.Foundation);
local l_RadioGroup_0 = v2.RadioGroup;
local l_View_0 = v2.View;
local l_Badge_0 = v2.Badge;
local l_Text_0 = v2.Text;
local v7 = require(l_Parent_0.React);
local l_FFlagLuaAppChartsFilterOptionTextTag_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppChartsFilterOptionTextTag;
local v9 = game:DefineFastFlag("LuaAppWrapChartsFilterOptionLabels", false);
local l_useTokens_0 = v2.Hooks.useTokens;
return function(v11) --[[ Line: 28 ]]
    -- upvalues: l_useTokens_0 (copy), v7 (copy), l_FFlagLuaAppChartsFilterOptionTextTag_0 (copy), l_RadioGroup_0 (copy), l_View_0 (copy), l_Text_0 (copy), v9 (copy), l_Badge_0 (copy), v2 (copy)
    local v12 = l_useTokens_0();
    local l_XXLarge_0 = v12.Padding.XXLarge;
    local v15 = {
        Padding = v7.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v12.Padding.Medium), 
            PaddingBottom = UDim.new(0, v12.Padding.Medium)
        }), 
        SizeConstraint = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then nil else v7.createElement("UISizeConstraint", {
            MaxSize = v11.containerMaxWidthBinding:map(function(v14) --[[ Line: 42 ]]
                -- upvalues: l_XXLarge_0 (copy)
                return Vector2.new(v14 - 3 * l_XXLarge_0, 1e999);
            end)
        }), 
        Layout = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v7.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalFlex = Enum.UIFlexAlignment.Fill
        }) else nil
    };
    for v16, v17 in v11.options do
        local v18 = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v17.optionContextTag ~= nil and v17.optionContextTag ~= "" else nil;
        table.insert(v15, if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v7.createElement(l_RadioGroup_0.Item, {
            value = v17.optionId, 
            LayoutOrder = v16, 
            label = v7.createElement(l_View_0, {
                tag = "size-0 auto-xy row gap-medium flex-between align-y-center fill"
            }, {
                OptionItem = v7.createElement(l_Text_0, {
                    tag = {
                        ["auto-xy content-default gui-object-defaults size-0 text-color-defaults text-defaults text-size-defaults text-title-medium text-truncate-split text-align-x-left text-align-y-center shrink"] = true, 
                        ["text-wrap"] = v9
                    }, 
                    LayoutOrder = 1, 
                    Text = v17.optionDisplayName, 
                    textStyle = if v11.selectedOptionId == v17.optionId then v12.Color.Content.Emphasis else v12.Color.Content.Default
                }, {
                    SizeConstraint = v7.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(v12.Size.Size_3000 * 3, 1e999)
                    })
                }), 
                ContextTag = v18 and v7.createElement(l_View_0, {
                    tag = "auto-xy size-0", 
                    LayoutOrder = 2
                }, {
                    Badge = v7.createElement(l_Badge_0, {
                        variant = v2.Enums.BadgeVariant.Neutral, 
                        text = v17.optionContextTag
                    }), 
                    SizeConstraint = v7.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(v12.Size.Size_3000, 1e999)
                    })
                }) or nil
            })
        }) else v7.createElement(l_RadioGroup_0.Item, {
            value = v17.optionId, 
            label = v17.optionDisplayName
        }));
    end;
    if l_FFlagLuaAppChartsFilterOptionTextTag_0 then
        return v7.createElement("Frame", {
            LayoutOrder = v11.LayoutOrder, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.X, 
            Size = v11.Size
        }, {
            Padding = v7.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, l_XXLarge_0), 
                PaddingRight = UDim.new(0, l_XXLarge_0)
            }), 
            ScrollingFrame = v7.createElement("ScrollingFrame", {
                AutomaticCanvasSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                CanvasSize = UDim2.fromScale(0, 0), 
                ClipsDescendants = true, 
                ElasticBehavior = Enum.ElasticBehavior.Always, 
                ScrollBarThickness = 0, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                Selectable = false, 
                AutomaticSize = Enum.AutomaticSize.X, 
                Size = UDim2.fromScale(1, 1), 
                [v7.Change.AbsoluteCanvasSize] = v11.onCanvasSizeChanged
            }, {
                RadioGroup = v7.createElement(l_RadioGroup_0.Root, {
                    value = v11.selectedOptionId, 
                    onValueChanged = v11.onSelectedOptionChanged
                }, v15), 
                Layout = v7.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalFlex = Enum.UIFlexAlignment.Fill
                })
            })
        });
    else
        return v7.createElement("ScrollingFrame", {
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            CanvasSize = UDim2.fromScale(1, 0), 
            ClipsDescendants = true, 
            ElasticBehavior = Enum.ElasticBehavior.Always, 
            LayoutOrder = v11.LayoutOrder, 
            ScrollBarThickness = 0, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            Selectable = false, 
            Size = v11.Size
        }, {
            MenuFrame = v7.createElement("Frame", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                [v7.Change.AbsoluteSize] = function(v19) --[[ Line: 163 ]]
                    -- upvalues: v11 (copy)
                    v11.onCanvasSizeChanged(v19.AbsoluteSize);
                end
            }, {
                Padding = v7.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, l_XXLarge_0), 
                    PaddingRight = UDim.new(0, l_XXLarge_0)
                }), 
                RadioGroup = v7.createElement(l_RadioGroup_0.Root, {
                    value = v11.selectedOptionId, 
                    onValueChanged = v11.onSelectedOptionChanged
                }, v15)
            })
        });
    end;
end;