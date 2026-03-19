local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_0.App.Loading.LoadingSpinner);
local v4 = v2.PureComponent:extend("LoadingStatePage");
v4.render = function(_) --[[ Line: 12 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.createElement(v3, {
        size = UDim2.fromOffset(42, 42), 
        position = UDim2.fromScale(0.5, 0.5), 
        anchorPoint = Vector2.new(0.5, 0.5)
    });
end;
return v4;