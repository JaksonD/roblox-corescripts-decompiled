local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local _ = require(l_Parent_0.Types);
return v2.makeActionCreator(script.Name, function(v4, v5) --[[ Line: 13 ]]
    return {
        captures = v4, 
        selectedCapture = v5
    };
end);