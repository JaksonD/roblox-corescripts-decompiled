local l_Parent_0 = script:FindFirstAncestor("RobloxAppNavigation").Parent;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local _ = require(script.Parent.types);
return function(v3) --[[ Line: 8 ]] --[[ Name: useNavigationProps ]]
    -- upvalues: l_useNavigation_0 (copy)
    local v4 = l_useNavigation_0();
    return v3(v4.getParam("detail"), v4.getParam("extraProps", {}), v4);
end;