local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Cryo);
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Parent_0.isRoact17);
local v5 = require(l_Parent_0.Rect);
local v6 = {
    Horizontal = {}, 
    Vertical = {}, 
    Both = {}
};
local v7 = v3.PureComponent:extend("FitFrameOnAxis");
v7.defaultProps = {
    axis = v6.Vertical, 
    minimumSize = UDim2.new(UDim.new(0, 0), UDim.new(0, 0)), 
    margin = v5.square(0), 
    FillDirection = Enum.FillDirection.Vertical, 
    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
    ImageSet = {}, 
    VerticalAlignment = Enum.VerticalAlignment.Top, 
    contentPadding = UDim.new(0, 0), 
    textProps = nil
};
v7.init = function(v8) --[[ Line: 31 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v4 (copy)
    v8.layoutRef = v3.createRef();
    if v4() then
        v8.frameRef = v8.props.forwardedRef or v3.createRef();
    else
        v8.frameRef = v8.props[v3.Ref] or v3.createRef();
    end;
    v8.onResize = function() --[[ Line: 39 ]]
        -- upvalues: v8 (copy)
        local l_current_0 = v8.layoutRef.current;
        local l_current_1 = v8.frameRef.current;
        if not l_current_1 or not l_current_0 then
            return;
        else
            l_current_1.Size = v8:__getSize(l_current_0);
            return;
        end;
    end;
end;
v7.render = function(v11) --[[ Line: 50 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v2 (copy)
    assert(v11.props.Size == nil, "Size is not a valid property of FitFrameOnAxis. Did you mean `minimumSize`?");
    local v12 = v11.props[v3.Children] or {};
    local v13 = v11:__getFilteredProps();
    local v14 = v11.props.onActivated and "ImageButton" or "ImageLabel";
    v12 = v2.Dictionary.join(v12, {
        ["$layout"] = v3.createElement("UIListLayout", {
            FillDirection = v11.props.FillDirection, 
            HorizontalAlignment = v11.props.HorizontalAlignment, 
            Padding = v11.props.contentPadding, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = v11.props.VerticalAlignment, 
            [v3.Change.AbsoluteContentSize] = v11.onResize, 
            [v3.Ref] = v11.layoutRef
        }), 
        ["$margin"] = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v11.props.margin.left), 
            PaddingRight = UDim.new(0, v11.props.margin.right), 
            PaddingTop = UDim.new(0, v11.props.margin.top), 
            PaddingBottom = UDim.new(0, v11.props.margin.bottom)
        })
    });
    if v11.props.textProps then
        return v3.createElement(v14, v13, {
            TextLabel = v3.createElement("TextLabel", v2.Dictionary.join(v11.props.textProps, {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1)
            })), 
            ChildFrame = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1)
            }, v12)
        });
    else
        return v3.createElement(v14, v13, v12);
    end;
end;
v7.didMount = function(v15) --[[ Line: 93 ]] --[[ Name: didMount ]]
    v15.onResize();
end;
v7.didUpdate = function(v16) --[[ Line: 97 ]] --[[ Name: didUpdate ]]
    v16.onResize();
end;
v7.__getFilteredProps = function(v17) --[[ Line: 101 ]] --[[ Name: __getFilteredProps ]]
    -- upvalues: v2 (copy), v3 (copy), v7 (copy)
    local v18 = v2.Dictionary.join(v17.props.ImageSet, {
        [v3.Ref] = v17.frameRef, 
        [v3.Event.Activated] = v17.props.onActivated
    });
    for v19, _ in pairs(v7.defaultProps) do
        v18[v19] = v2.None;
    end;
    v18.textProps = v2.None;
    return v2.Dictionary.join(v17.props, v18, {
        onActivated = v2.None, 
        forwardedRef = v2.None, 
        [v3.Children] = v2.None
    });
end;
v7.__getSize = function(v21, v22) --[[ Line: 124 ]] --[[ Name: __getSize ]]
    -- upvalues: v6 (copy)
    if v21.props.axis == v6.Both then
        return v21:__getBothAxisSize(v22);
    else
        local v23 = v21:__getAxisUDim(v22.AbsoluteContentSize);
        local v24 = v21:__getOtherUDim();
        if v21.props.axis == v6.Vertical then
            return UDim2.new(v24, v23);
        elseif v21.props.axis == v6.Horizontal then
            return UDim2.new(v23, v24);
        else
            return;
        end;
    end;
end;
v7.__getBothAxisSize = function(v25, v26) --[[ Line: 141 ]] --[[ Name: __getBothAxisSize ]]
    local l_minimumSize_0 = v25.props.minimumSize;
    local l_AbsoluteContentSize_0 = v26.AbsoluteContentSize;
    local v29 = UDim.new(l_minimumSize_0.X.Scale, l_AbsoluteContentSize_0.X + v25:__getHorizontalMargin());
    local v30 = UDim.new(l_minimumSize_0.Y.Scale, l_AbsoluteContentSize_0.Y + v25:__getVerticalMargin());
    return UDim2.new(v29, v30);
end;
v7.__getAxisUDim = function(v31, v32) --[[ Line: 151 ]] --[[ Name: __getAxisUDim ]]
    -- upvalues: v6 (copy)
    local l_minimumSize_1 = v31.props.minimumSize;
    local v34 = nil;
    local v35 = nil;
    if v31.props.axis == v6.Vertical then
        v34 = l_minimumSize_1.Y;
        v35 = v32.Y + v31:__getVerticalMargin();
    elseif v31.props.axis == v6.Horizontal then
        v34 = l_minimumSize_1.X;
        v35 = v32.X + v31:__getHorizontalMargin();
    end;
    return UDim.new(v34.Scale, (math.max(v35, v34.Offset)));
end;
v7.__getVerticalMargin = function(v36) --[[ Line: 169 ]] --[[ Name: __getVerticalMargin ]]
    return v36.props.margin.top + v36.props.margin.bottom;
end;
v7.__getHorizontalMargin = function(v37) --[[ Line: 173 ]] --[[ Name: __getHorizontalMargin ]]
    return v37.props.margin.left + v37.props.margin.right;
end;
v7.__getOtherUDim = function(v38) --[[ Line: 177 ]] --[[ Name: __getOtherUDim ]]
    -- upvalues: v6 (copy)
    local l_minimumSize_2 = v38.props.minimumSize;
    if v38.props.axis == v6.Vertical then
        return l_minimumSize_2.X;
    elseif v38.props.axis == v6.Horizontal then
        return l_minimumSize_2.Y;
    else
        return;
    end;
end;
local v40 = nil;
v40 = if v4() then v3.forwardRef(function(v41, v42) --[[ Line: 191 ]]
    -- upvalues: v3 (copy), v7 (copy), v2 (copy)
    return v3.createElement(v7, v2.Dictionary.join(v41, {
        forwardedRef = v42
    }));
end) else v7;
v40.Axis = v6;
return v40;