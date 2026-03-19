local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.Roact);
local v3 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 8 ]]
    return game:GetEngineFeature("TextBoundsRoundUp");
end);
v3 = l_status_0 and l_result_0;
l_status_0 = game:GetService("TextService");
l_result_0 = function(v6, v7, v8, v9) --[[ Line: 16 ]] --[[ Name: getTextHeight ]]
    -- upvalues: v3 (ref), l_status_0 (copy)
    if v3 then
        return l_status_0:GetTextSize(v6, v7, v8, Vector2.new(v9, 10000)).Y;
    else
        return l_status_0:GetTextSize(v6, v7, v8, Vector2.new(v9, 10000)).Y + 2;
    end;
end;
local function v13(v10, v11, v12) --[[ Line: 24 ]] --[[ Name: getTextWidth ]]
    -- upvalues: v3 (ref), l_status_0 (copy)
    if v3 then
        return l_status_0:GetTextSize(v10, v11, v12, Vector2.new(10000, 10000)).X;
    else
        return l_status_0:GetTextSize(v10, v11, v12, Vector2.new(10000, 10000)).X + 2;
    end;
end;
local v14 = {
    FitToText = {}
};
local v15 = v2.PureComponent:extend("FitTextLabel");
v15.defaultProps = {
    Font = Enum.Font.SourceSans, 
    Text = "Label", 
    TextSize = 12, 
    TextWrapped = true, 
    maximumWidth = 1e999
};
v15.init = function(v16) --[[ Line: 47 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    if v2.Ref == "ref" then
        v16.frameRef = v16.props.forwardedRef or v2.createRef();
    else
        v16.frameRef = v16.props[v2.Ref] or v2.createRef();
    end;
    v16.onResize = function() --[[ Line: 54 ]]
        -- upvalues: v16 (copy)
        if not v16.frameRef.current then
            return;
        else
            v16.frameRef.current.Size = v16:__getSize(v16.frameRef.current);
            return;
        end;
    end;
end;
v15.render = function(v17) --[[ Line: 63 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy)
    local v18 = v17.props.onActivated and "TextButton" or "TextLabel";
    return v2.createElement(v18, v17:__getFilteredProps());
end;
v15.didMount = function(v19) --[[ Line: 68 ]] --[[ Name: didMount ]]
    v19.onResize();
end;
v15.didUpdate = function(v20) --[[ Line: 72 ]] --[[ Name: didUpdate ]]
    v20.onResize();
end;
v15.__getFilteredProps = function(v21) --[[ Line: 76 ]] --[[ Name: __getFilteredProps ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v22 = {
        width = v1.None, 
        maximumWidth = v1.None, 
        onActivated = v1.None, 
        forwardedRef = v1.None, 
        Size = UDim2.new(v21.props.width, UDim.new(0, 0)), 
        [v2.Ref] = v21.frameRef
    };
    local l_Children_0 = v2.Children;
    local l_join_0 = v1.Dictionary.join;
    local v25 = v21.props[v2.Children] or {};
    local v26 = {};
    local v27 = false;
    if v21.props.maximumWidth < 1e999 then
        v27 = v2.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(v21.props.maximumWidth, 1e999)
        });
    end;
    v26.sizeConstraint = v27;
    v22[l_Children_0] = l_join_0(v25, v26);
    v22[v2.Event.Activated] = v21.props.onActivated;
    v22[v2.Change.AbsoluteSize] = function(v28) --[[ Line: 97 ]]
        -- upvalues: v21 (copy), v2 (ref)
        if v21.props[v2.Change.AbsoluteSize] then
            v21.props[v2.Change.AbsoluteSize](v28);
        end;
        v21.onResize();
    end;
    return v1.Dictionary.join(v21.props, v22);
end;
v15.__getSize = function(v29, v30) --[[ Line: 108 ]] --[[ Name: __getSize ]]
    -- upvalues: v14 (copy), v13 (copy), l_result_0 (copy)
    local l_maximumWidth_0 = v29.props.maximumWidth;
    local l_width_0 = v29.props.width;
    if l_width_0 == v14.FitToText then
        local v33 = v13(v29.props.Text, v29.props.TextSize, v29.props.Font);
        l_width_0 = UDim.new(0, (math.min(v33, l_maximumWidth_0)));
    end;
    local v34 = math.max(l_maximumWidth_0 < 1e999 and l_maximumWidth_0 or 0, v30.AbsoluteSize.X);
    local v35 = l_result_0(v29.props.Text, v29.props.TextSize, v29.props.Font, v34);
    return UDim2.new(l_width_0, UDim.new(0, v35));
end;
local v36 = nil;
v36 = if v2.Ref == "ref" then v2.forwardRef(function(v37, v38) --[[ Line: 129 ]]
    -- upvalues: v2 (copy), v15 (copy), v1 (copy)
    return v2.createElement(v15, v1.Dictionary.join(v37, {
        forwardedRef = v38
    }));
end) else v15;
v36.Width = v14;
return v36;