local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local _ = require(l_Parent_0.Enums.CapturesToastType);
local _ = require(l_Parent_0.Types);
return v2.makeActionCreator(script.Name, function(v5, v6) --[[ Line: 16 ]]
    return {
        toastType = v5, 
        toastConfig = v6
    };
end);