local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.Roact);
local v3 = require(script.Parent.FitFrameOnAxis);
local v4 = require(script.Parent.isRoact17);
return v2.forwardRef(function(v5, v6) --[[ Line: 10 ]]
    -- upvalues: v4 (copy), v2 (copy), v1 (copy), v3 (copy)
    v5 = v5 or {};
    local l_height_0 = v5.height;
    local v8 = v4() and "forwardedRef" or v2.Ref;
    local v9 = v1.Dictionary.join(v5, {
        axis = v3.Axis.Horizontal, 
        minimumSize = UDim2.new(UDim.new(0, 0), l_height_0), 
        [v8] = v6, 
        height = v1.None
    });
    return v2.createElement(v3, v9);
end);