local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Enums.Breakpoint);
local v3 = require(script.Parent.GridDebugStyleSheet);
local v4 = require(l_Parent_0.React);
local v5 = require(l_script_FirstAncestor_0.Providers.Style.StyleSheetContext);
local v6 = require(l_script_FirstAncestor_0.Components.Text);
local v7 = require(l_script_FirstAncestor_0.Components.View);
local v8 = require(l_script_FirstAncestor_0.Utility.getGridMetrics);
local v9 = require(l_script_FirstAncestor_0.Providers.Responsive.Hooks.useBreakpoint);
local v10 = require(l_script_FirstAncestor_0.Providers.Responsive.useResponsive);
local v11 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v12 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local function v14(v13) --[[ Line: 29 ]] --[[ Name: DebugCol ]]
    -- upvalues: v4 (copy), v7 (copy)
    return v4.createElement(v7, {
        Size = v13.size or UDim2.new(0, v13.width or 0, 1, 0), 
        backgroundStyle = v13.backgroundStyle, 
        LayoutOrder = v13.LayoutOrder, 
        tag = v13.tag
    });
end;
local v15 = {
    debugTransparency = 0.7
};
return function(v16) --[[ Line: 48 ]] --[[ Name: GridDebug ]]
    -- upvalues: v12 (copy), v15 (copy), v11 (copy), v4 (copy), v10 (copy), v9 (copy), v8 (copy), v2 (copy), v14 (copy), v7 (copy), v3 (copy), v6 (copy), v5 (copy)
    local v17 = v12(v16, v15);
    local v18 = v11();
    local v19, v20 = v4.useState(nil);
    local v21 = v10();
    local v22, v23 = v4.useState(nil);
    local v24, v25 = v9(v22);
    local v26 = v8(v21.config, v24, v25.X);
    local v27 = v21.config.breakpoint.widths[v2.XLarge];
    local v28 = {};
    local v29 = ({
        [Enum.ItemLineAlignment.Start] = "position-top-left anchor-top-left", 
        [Enum.ItemLineAlignment.Center] = "position-top-center anchor-top-center", 
        [Enum.ItemLineAlignment.End] = "position-top-right anchor-top-right"
    })[v17.align];
    for v30 = 1, v26.full.colCount - 1 do
        if v30 < v26.full.colCount then
            table.insert(v28, v4.createElement(v14, {
                key = ("DebugCol%*"):format(v30), 
                width = v26.gutterWidth, 
                backgroundStyle = {
                    Color3 = v18.Color.System.Alert.Color3, 
                    Transparency = 0.5
                }, 
                LayoutOrder = v30
            }));
        end;
    end;
    return v4.createElement(v7, {
        tag = ("size-full-full %*"):format(v29)
    }, {
        GridDebugStyleSheet = v4.createElement(v3, {
            breakpoint = v24, 
            ref = v20
        }), 
        GridDebugMeasureWrapper = v4.createElement(v7, {
            ref = v23, 
            tag = "size-full-0"
        }, {
            GridMeasureSizeConstraint = v4.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(v27, 1e999)
            })
        }), 
        GridDebugMeasure = v4.createElement(v7, {
            Size = UDim2.new(1, 0, 0, 4), 
            backgroundStyle = {
                Color3 = Color3.fromRGB(255, 0, 0), 
                Transparency = v17.debugTransparency
            }
        }), 
        GridDebugSizeConstraint = v4.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(v27, 1e999)
        }), 
        GridDebugSizeLabel = v4.createElement(v6, {
            tag = "text-label-small position-top-center anchor-top-center auto-xy bg-over-media-300 padding-xxsmall text-truncate-end", 
            Text = ("breakpoint: %*, width: %*, columns: %*, maxWidth: %*, margin: %*, gapWidth: %*"):format(v21.config.breakpoint.shortNames[v24], v25.X, v26.full.colCount, v27, v26.margin, v26.gutterWidth)
        }), 
        GridDebug = v4.createElement(v7, {
            tag = "size-full-full row", 
            backgroundStyle = {
                Color3 = v18.Color.System.Emphasis.Color3, 
                Transparency = v17.debugTransparency
            }
        }, {
            LeftMargin = v4.createElement(v14, {
                width = v26.margin, 
                backgroundStyle = {
                    Color3 = v18.Color.System.Warning.Color3, 
                    Transparency = v17.debugTransparency
                }, 
                LayoutOrder = 0
            }), 
            Columns = v4.createElement(v7, {
                tag = "size-0-full row fill flex-x-evenly", 
                backgroundStyle = {
                    Color3 = v18.Color.System.Emphasis.Color3, 
                    Transparency = v17.debugTransparency
                }, 
                LayoutOrder = 1
            }, v28), 
            RightMargin = v4.createElement(v14, {
                width = v26.margin, 
                backgroundStyle = {
                    Color3 = v18.Color.System.Warning.Color3, 
                    Transparency = v17.debugTransparency
                }, 
                LayoutOrder = 2
            })
        }), 
        GridDebugContent = if v19 then v4.createElement(v5.Provider, {
            value = v19
        }, v4.createElement(v7, {
            tag = "size-full-full"
        }, {
            GridDebugPadding = v4.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v26.gapHeight * 2)
            }), 
            GridDebugChildren = v4.createElement(v4.Fragment, nil, v16.children)
        })) else nil
    });
end;