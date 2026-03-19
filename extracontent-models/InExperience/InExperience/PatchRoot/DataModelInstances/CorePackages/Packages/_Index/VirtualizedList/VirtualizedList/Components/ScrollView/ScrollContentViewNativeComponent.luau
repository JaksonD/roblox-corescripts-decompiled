local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local v4 = require(l_Parent_0.React);
local l_Change_0 = v4.Change;
local v6 = v4.Component:extend("ScrollContentViewNativeComponent");
v6.init = function(v7, v8) --[[ Line: 27 ]] --[[ Name: init ]]
    v7.props = v8;
end;
v6.render = function(v9) --[[ Line: 31 ]] --[[ Name: render ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy), l_Change_0 (copy), v4 (copy)
    local v12 = if l_Array_0.isArray(v9.props.style) then l_Array_0.reduce(v9.props.style, function(v10, v11) --[[ Line: 33 ]]
        -- upvalues: l_Object_0 (ref)
        return l_Object_0.assign(v10, v11);
    end, {}) else v9.props.style;
    local v13 = l_Object_0.assign({
        Name = "RCTScrollContentView", 
        [l_Change_0.AbsoluteSize] = v9.props.onLayout, 
        Size = UDim2.new(1, 0, 1, 0)
    }, if v9.props.AutomaticSize then {
        AutomaticSize = v9.props.AutomaticSize
    } else nil, v12);
    return v4.createElement("Frame", v13, v9.props.children);
end;
return v6;