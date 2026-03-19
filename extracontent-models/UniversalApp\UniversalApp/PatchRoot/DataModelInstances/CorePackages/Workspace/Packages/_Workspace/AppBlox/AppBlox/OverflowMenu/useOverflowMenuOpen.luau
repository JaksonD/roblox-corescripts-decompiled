local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppBlox");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local v3 = require(l_script_FirstAncestor_0.OverflowMenu.getOverflowMenuSignalStore);
return function(v4) --[[ Line: 9 ]] --[[ Name: useOverflowMenuOpen ]]
    -- upvalues: v3 (copy), l_useSignalState_0 (copy)
    local l_getActiveMenuKey_0 = v3().getActiveMenuKey;
    return l_useSignalState_0(l_getActiveMenuKey_0) == v4;
end;