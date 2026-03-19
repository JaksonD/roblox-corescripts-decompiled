local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent;
local _ = require(l_Parent_1.Style.StyleTypes);
local _ = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.Enum.AspectRatioMode);
local v5 = require(l_Parent_0.getExperienceTileRelativeHeight);
return function(v6, v7, v8, v9, v10, v11) --[[ Line: 18 ]]
    -- upvalues: v5 (copy)
    local v12 = v5(v6, v8, v9, v10, v11);
    return (math.floor(v7 * v12.Scale + v12.Offset));
end;