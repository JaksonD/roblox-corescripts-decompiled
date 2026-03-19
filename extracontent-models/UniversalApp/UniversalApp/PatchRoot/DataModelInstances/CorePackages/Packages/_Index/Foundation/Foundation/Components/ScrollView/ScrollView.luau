local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Utility.Flags);
local v5 = require(script.Parent.ScrollingFrame);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v7 = require(l_script_FirstAncestor_0.Components.View);
local v8 = require(l_script_FirstAncestor_0.Utility.useDefaultTags);
local v9 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v10 = require(l_script_FirstAncestor_0.Providers.Style.useStyleTags);
local v11 = require(l_script_FirstAncestor_0.Enums.Visibility);
local v12 = require(l_script_FirstAncestor_0.Enums.ControlState);
local v13 = {
    layout = {
        SortOrder = Enum.SortOrder.LayoutOrder
    }, 
    scroll = {
        scrollBarVisibility = v11.Auto
    }, 
    AutoLocalize = false, 
    BorderSizePixel = 0, 
    ClipsDescendants = true, 
    isDisabled = false, 
    testId = "--foundation-scroll-view"
};
return v3.memo(v3.forwardRef(function(v14, v15) --[[ Line: 64 ]] --[[ Name: ScrollView ]]
    -- upvalues: v9 (copy), v13 (copy), v8 (copy), v10 (copy), v3 (copy), v12 (copy), v4 (copy), v2 (copy), v7 (copy), v5 (copy)
    local v16 = v9(v14, v13);
    local v17 = v8(v16.tag, "gui-object-defaults");
    local v18 = v10(v17);
    local v19, v20 = v3.useState(v12.Initialize);
    local function v22(v21) --[[ Line: 76 ]] --[[ Name: onStateChanged ]]
        -- upvalues: v20 (copy), v16 (copy)
        v20(v21);
        if v16.onStateChanged ~= nil then
            v16.onStateChanged(v21);
        end;
    end;
    local v23 = {
        onStateChanged = v22, 
        stateLayer = if not not v16.onStateChanged or v16.onActivated then v16.stateLayer else {
            affordance = "None"
        }, 
        selection = {
            Selectable = false
        }, 
        ref = v15, 
        [v3.Tag] = v18
    };
    local v24 = nil;
    if v4.FoundationBuildingBlocksRemoveDashUnion then
        v24 = table.clone(v16);
        v24.onStateChanged = v22;
        v24.stateLayer = if not not v16.onStateChanged or v16.onActivated then v16.stateLayer else {
            affordance = "None"
        };
        v24.selection = {
            Selectable = false
        };
        v24.ref = v15;
        v24[v3.Tag] = v18;
        v24.scroll = nil;
        v24.layout = nil;
    else
        v24 = v2.union(v16, v23);
        v24.scroll = nil;
        v24.layout = nil;
    end;
    local v25 = {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = v16.layout.FillDirection, 
            ItemLineAlignment = v16.layout.ItemLineAlignment, 
            HorizontalAlignment = v16.layout.HorizontalAlignment, 
            HorizontalFlex = v16.layout.HorizontalFlex, 
            VerticalAlignment = v16.layout.VerticalAlignment, 
            VerticalFlex = v16.layout.VerticalFlex, 
            Padding = v16.layout.Padding, 
            SortOrder = v16.layout.SortOrder, 
            Wraps = v16.layout.Wraps
        })
    };
    local v26 = nil;
    if v4.FoundationBuildingBlocksRemoveDashUnion then
        if v16.children and typeof(v16.children) == "table" and v16.layout ~= nil and v16.layout.FillDirection ~= nil then
            v26 = v25;
            for v27, v28 in v16.children do
                v26[v27] = v28;
            end;
        else
            v26 = v16.children;
        end;
    else
        v26 = if v16.children and typeof(v16.children) == "table" and v16.layout ~= nil and v16.layout.FillDirection ~= nil then v2.union(v25, v16.children) else v16.children;
    end;
    return v3.createElement(v7, v24, {
        ScrollingFrame = v3.createElement(v5, {
            controlState = v19, 
            selection = v16.selection, 
            scrollBarVisibility = v16.scroll.scrollBarVisibility, 
            onCanvasPositionChanged = v16.onCanvasPositionChanged, 
            onAbsoluteCanvasSizeChanged = v16.onAbsoluteCanvasSizeChanged, 
            onAbsoluteWindowSizeChanged = v16.onAbsoluteWindowSizeChanged, 
            AutomaticSize = v16.scroll.AutomaticSize, 
            AutomaticCanvasSize = v16.scroll.AutomaticCanvasSize, 
            CanvasSize = v16.scroll.CanvasSize, 
            ClipsDescendants = false, 
            ScrollingDirection = v16.scroll.ScrollingDirection, 
            ScrollingEnabled = v16.scroll.ScrollingEnabled, 
            VerticalScrollBarInset = v16.scroll.VerticalScrollBarInset, 
            HorizontalScrollBarInset = v16.scroll.HorizontalScrollBarInset, 
            ref = v16.scrollingFrameRef
        }, v26)
    });
end));