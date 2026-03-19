local l_script_FirstAncestor_0 = script:FindFirstAncestor("FocusNavigationUtils");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.ReactFocusNavigation);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.Navigation);
local v5 = require(l_script_FirstAncestor_0.useFocusRoot);
local v6 = require(l_script_FirstAncestor_0.useDefaultAppEventHandlers);
local v7 = require(l_script_FirstAncestor_0.FocusNavigationDefaultEventMap);
local v8 = {};
return function(v9) --[[ Line: 23 ]] --[[ Name: useAppFocusRoot ]]
    -- upvalues: v8 (copy), v4 (copy), v6 (copy), v3 (copy), v7 (copy), v5 (copy)
    local v10 = v9.customEventHandlers or v8;
    local v11 = v9.customEventMap or v8;
    local v12 = v4.useNavigationFocus();
    local v13 = v6();
    local v14 = v3.Dictionary.union(v13, v10);
    local v15 = v3.Dictionary.union(v7, v11);
    local v16 = (v9.isFocusable == nil or v9.isFocusable) and (v12 == nil or v12);
    local v17 = v9.isAutoFocusRoot ~= nil and v9.isAutoFocusRoot;
    local v18 = v3.Dictionary.union(v9, {
        customEventHandlers = v3.None, 
        eventHandlers = v14, 
        eventMap = v15, 
        isFocusable = v16, 
        isAutoFocusRoot = v17
    });
    return v5(v18);
end;