local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.ValueChangedSignal);
local v3 = {};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 18 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    return v2.new(v4);
end;
return v3;