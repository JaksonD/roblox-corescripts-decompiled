local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiGlobalNav");
local l_Parent_0 = script:FindFirstAncestor("TenFootUiGlobalNav").Parent;
local v2 = require(l_Parent_0.React);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v4 = require(l_script_FirstAncestor_0.Components.GlobalNavContainer.useGlobalNavProps);
local v5 = require(l_script_FirstAncestor_0.Components.GlobalNavContainer.useGlobalNavDisplayOptions);
local l_getActiveChildNavigationOptionsRecursively_0 = require(l_Parent_0.Navigation).getActiveChildNavigationOptionsRecursively;
local v7 = require(l_script_FirstAncestor_0.Components.GlobalNav);
return function() --[[ Line: 11 ]] --[[ Name: GlobalNavContainer ]]
    -- upvalues: l_useNavigation_0 (copy), v5 (copy), l_getActiveChildNavigationOptionsRecursively_0 (copy), v4 (copy), v2 (copy), v7 (copy)
    local v8 = l_useNavigation_0();
    local v9 = v5(v8, l_getActiveChildNavigationOptionsRecursively_0);
    local v10 = v4(v8, v9);
    return v2.createElement(v7, v10);
end;