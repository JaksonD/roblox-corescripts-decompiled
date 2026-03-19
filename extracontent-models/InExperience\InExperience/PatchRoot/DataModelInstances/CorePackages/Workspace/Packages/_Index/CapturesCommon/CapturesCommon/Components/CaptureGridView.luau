local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Dash);
local v3 = require(l_Parent_1.Foundation);
local v4 = require(l_Parent_1.React);
local l_GridView_0 = require(l_Parent_1.UIBlox).App.Grid.GridView;
local l_ScrollBarVisibility_0 = v3.Enums.ScrollBarVisibility;
local l_ScrollView_0 = v3.ScrollView;
local l_View_0 = v3.View;
local v9 = require(l_Parent_0.Components.MenuButton);
local _ = require(l_Parent_0.Types);
local v11 = require(l_Parent_0.Hooks.useScreenSize);
local function _(v12) --[[ Line: 41 ]] --[[ Name: getItemsPerRow ]]
    return (math.clamp(math.floor(v12 / 120), 1, 4));
end;
local function v19(v14, v15) --[[ Line: 45 ]] --[[ Name: getGalleryItemSize ]]
    local v16 = math.clamp(math.floor(v15 / 120), 1, 4);
    v15 = v15 - 4 * (v16 - 1);
    local v17 = math.min(v15 / v16, v15);
    local v18 = v17 * v14;
    return Vector2.new(math.floor(v17), (math.floor(v18)));
end;
local function _(v20, v21, v22) --[[ Line: 55 ]] --[[ Name: getItemsPerPage ]]
    if v20 <= 0 then
        return 0;
    else
        local v23 = math.floor(v20 / v22.Y);
        if v20 < v22.Y * v23 + (v23 - 1) * 4 then
            v23 = v23 - 1;
        end;
        return (math.max(v23 * math.clamp(math.floor(v21 / 120), 1, 4), 8));
    end;
end;
return function(v25) --[[ Line: 70 ]]
    -- upvalues: v4 (copy), v11 (copy), v19 (copy), v2 (copy), l_View_0 (copy), l_ScrollView_0 (copy), l_ScrollBarVisibility_0 (copy), l_GridView_0 (copy), v9 (copy)
    local v26, v27 = v4.useState(Vector2.new(0, 0));
    local v28, v29 = v4.useState(0);
    local v30 = v11();
    local v32 = v4.useCallback(function(v31) --[[ Line: 75 ]]
        -- upvalues: v27 (copy)
        v27(v31.AbsoluteSize);
    end, {});
    local v33 = false;
    if v26.X > 0 then
        v33 = v26.Y > 0;
    end;
    local v34 = v25.shouldShowShowMoreButton and v28 < #v25.captures;
    local v35 = math.clamp(v30.Y / v30.X, 0.42857142857142855, 1);
    local v36 = v26.Y - 12 - 40 - 36;
    local v37 = v26.X - 12 - 8;
    local v38 = v4.useMemo(function() --[[ Line: 89 ]]
        -- upvalues: v19 (ref), v35 (ref), v37 (copy)
        return v19(v35, v37);
    end, {
        v35, 
        v37
    });
    local v43 = v4.useMemo(function() --[[ Line: 93 ]]
        -- upvalues: v36 (copy), v37 (copy), v38 (copy)
        local l_v36_0 = v36;
        local l_v37_0 = v37;
        local l_v38_0 = v38;
        if l_v36_0 <= 0 then
            return 0;
        else
            local v42 = math.floor(l_v36_0 / l_v38_0.Y);
            if l_v36_0 < l_v38_0.Y * v42 + (v42 - 1) * 4 then
                v42 = v42 - 1;
            end;
            return (math.max(v42 * math.clamp(math.floor(l_v37_0 / 120), 1, 4), 8));
        end;
    end, {
        v36, 
        v37, 
        v38
    });
    v4.useEffect(function() --[[ Line: 97 ]]
        -- upvalues: v28 (copy), v43 (copy), v29 (copy)
        if v28 < v43 then
            v29(v43);
        end;
    end, {
        v26, 
        v43, 
        v28
    });
    local v44 = v4.useCallback(function() --[[ Line: 103 ]]
        -- upvalues: v29 (copy), v28 (copy), v43 (copy)
        v29(v28 + v43);
    end, {
        v28, 
        v43
    });
    local v46 = v4.useMemo(function() --[[ Line: 107 ]]
        -- upvalues: v34 (copy), v25 (copy), v28 (copy), v2 (ref)
        if v34 then
            local v45 = math.min(#v25.captures, v28);
            return v2.slice(v25.captures, 1, v45);
        else
            return v25.captures;
        end;
    end, {
        v25.captures, 
        v34, 
        v28
    });
    return v4.createElement(l_View_0, {
        BorderSizePixel = 0, 
        onAbsoluteSizeChanged = v32, 
        Position = if v25.position then v25.position else UDim2.fromOffset(0, 0), 
        Size = if v25.size then v25.size else UDim2.fromScale(1, 1), 
        tag = "bg-surface-0"
    }, {
        CaptureGridViewContainer = v4.createElement(l_View_0, {
            tag = "bg-action-subtle size-full gap-xsmall col align-x-center align-y-top shrink"
        }, {
            Header = v25.header, 
            ScrollView = v4.createElement(l_ScrollView_0, {
                BorderSizePixel = 0, 
                LayoutOrder = if v25.layoutOrder then v25.layoutOrder else 1, 
                scroll = {
                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                    CanvasSize = UDim2.fromScale(1, 0), 
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    scrollBarVisibility = l_ScrollBarVisibility_0.Auto
                }, 
                tag = "auto-y size-full-0 gap-xsmall col align-x-center align-y-top shrink padding-x-xsmall"
            }, {
                GridView = if v33 then v4.createElement(l_GridView_0, {
                    itemPadding = Vector2.new(4, 4), 
                    items = v46, 
                    itemSize = v38, 
                    LayoutOrder = 1, 
                    renderItem = v25.renderItem
                }) else nil, 
                ShowMore = if v34 then v4.createElement(v9, {
                    buttonHeight = 40, 
                    LayoutOrder = 2, 
                    onActivated = v44, 
                    text = "Show More"
                }) else nil
            })
        })
    });
end;