local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local v4 = require(l_Parent_0.React);
local l_Change_0 = v4.Change;
local v6 = v4.Component:extend("View");
v6.init = function(v7, v8) --[[ Line: 41 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy)
    v7.props = v8;
    v7._nativeRef = v7.props.nativeRef or v4.createRef();
end;
v6.render = function(v9) --[[ Line: 46 ]] --[[ Name: render ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy), l_Change_0 (copy), v4 (copy)
    local v12 = if l_Array_0.isArray(v9.props.style) then l_Array_0.reduce(v9.props.style, function(v10, v11) --[[ Line: 48 ]]
        -- upvalues: l_Object_0 (ref)
        return l_Object_0.assign(v10, v11);
    end, {}) else v9.props.style;
    local v13 = l_Object_0.assign(table.clone(v9.props), v12);
    v9.nativeProps = {
        ref = v9._nativeRef, 
        BackgroundColor3 = v13.BackgroundColor3, 
        Name = v13.Name or "View", 
        Size = v13.Size or UDim2.new(1, 0, 0, 0), 
        AutomaticSize = v13.AutomaticSize or Enum.AutomaticSize.Y, 
        ZIndex = v13.ZIndex or nil, 
        LayoutOrder = v13.LayoutOrder or nil, 
        BorderSizePixel = v13.BorderSizePixel or 0, 
        BackgroundTransparency = v13.BackgroundTransparency or 1, 
        [l_Change_0.AbsoluteSize] = v13.onLayout
    };
    return v4.createElement("Frame", v9.nativeProps, v9.props.children);
end;
return v6;