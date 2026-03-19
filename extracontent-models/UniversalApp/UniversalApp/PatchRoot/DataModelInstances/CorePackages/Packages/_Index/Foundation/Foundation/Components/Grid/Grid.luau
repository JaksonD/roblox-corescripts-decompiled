local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Enums.Breakpoint);
local v3 = require(script.Parent.GridStyleSheet);
local v4 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Providers.Responsive.ResponsiveContext);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v7 = require(l_script_FirstAncestor_0.Components.View);
local v8 = require(l_script_FirstAncestor_0.Utility.getGridMetrics);
local v9 = require(l_script_FirstAncestor_0.Providers.Responsive.Hooks.useBreakpoint);
local v10 = require(l_script_FirstAncestor_0.Providers.Responsive.useResponsive);
local v11 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v12 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v13 = {
    [Enum.ItemLineAlignment.Start] = "items-start", 
    [Enum.ItemLineAlignment.Center] = "items-center", 
    [Enum.ItemLineAlignment.End] = "items-end"
};
local v14 = {
    tag = "size-full-0 auto-y", 
    align = Enum.ItemLineAlignment.Start, 
    SortOrder = Enum.SortOrder.LayoutOrder, 
    Wraps = true, 
    testId = "--foundation-grid"
};
return v4.memo(v4.forwardRef(function(v15, v16) --[[ Line: 44 ]] --[[ Name: Grid ]]
    -- upvalues: v12 (copy), v14 (copy), v10 (copy), v4 (copy), v9 (copy), v8 (copy), v2 (copy), v13 (copy), v7 (copy), v11 (copy), v3 (copy)
    local v17 = v12(v15, v14);
    local v18 = v10();
    local v19, v20 = v4.useState(nil);
    local v21, v22 = v9(v19);
    local v23 = v8(v18.config, v21, v22.X);
    local v24 = v18.config.breakpoint.widths[v2.XLarge];
    local v25 = v13[v17.align];
    return v4.createElement(v7, v11(v17, {
        tag = v17.tag, 
        ref = v16
    }), {
        GridMeasure = v4.createElement(v7, {
            ref = v20, 
            tag = "size-full-0"
        }, {
            GridMeasureSizeConstraint = v4.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(v24, 1e999)
            })
        }), 
        GridAlignment = v4.createElement(v7, {
            tag = ("size-full-0 auto-y col flex-x-fill %*"):format(v25)
        }, {
            GridStyleSheet = v4.createElement(v3, {
                breakpoint = v21, 
                containerWidth = v22.X
            }), 
            Grid = v4.createElement(v7, {
                tag = "auto-y", 
                Size = UDim2.fromOffset(v22.X, 0), 
                layout = {
                    Padding = if not v17.Wraps then UDim.new(0, v23.gutterWidth) else nil, 
                    SortOrder = v17.SortOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalFlex = if v17.Wraps then Enum.UIFlexAlignment.SpaceBetween else nil, 
                    Wraps = v17.Wraps
                }
            }, {
                GridSizeConstraint = v4.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(v24, 1e999)
                }), 
                GridMargin = v4.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v23.margin), 
                    PaddingRight = UDim.new(0, v23.margin)
                })
            }, v17.children)
        })
    });
end));