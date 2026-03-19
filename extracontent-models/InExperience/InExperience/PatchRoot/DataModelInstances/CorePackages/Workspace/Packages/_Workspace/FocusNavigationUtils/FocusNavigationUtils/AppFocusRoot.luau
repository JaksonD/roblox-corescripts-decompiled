local l_script_FirstAncestor_0 = script:FindFirstAncestor("FocusNavigationUtils");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_Parent_0.ReactFocusNavigation);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.Navigation);
local v6 = require(script.Parent.useAppFocusRoot);
local v7 = require(l_script_FirstAncestor_0.BaseFocusRoot);
local v8 = require(script.Parent.FFlagFocusRootUseHooks);
local v9 = require(l_script_FirstAncestor_0.FocusRoot);
local v10 = require(l_script_FirstAncestor_0.useDefaultAppEventHandlers);
local v11 = require(l_script_FirstAncestor_0.FocusNavigationDefaultEventMap);
local v12 = {};
return function(v13) --[[ Line: 26 ]] --[[ Name: AppFocusRoot ]]
    -- upvalues: v8 (copy), v6 (copy), v2 (copy), v7 (copy), v12 (copy), v5 (copy), v10 (copy), v4 (copy), v11 (copy), v9 (copy)
    if v8 then
        local v14 = v6(v13);
        return v2.createElement(v7, {
            ref = v14, 
            isIsolated = v13.isIsolated, 
            frameProps = v13.frameProps
        }, v13.children);
    else
        local v15 = v13.customEventHandlers or v12;
        local v16 = v13.customEventMap or v12;
        local v17 = v5.useNavigationFocus();
        local v18 = v10();
        local v19 = v4.Dictionary.union(v18, v15);
        local v20 = v4.Dictionary.union(v11, v16);
        local v21 = (v13.isFocusable == nil or v13.isFocusable) and (v17 == nil or v17);
        local v22 = v13.isAutoFocusRoot ~= nil and v13.isAutoFocusRoot;
        local v23 = v4.Dictionary.union(v13, {
            customEventHandlers = v4.None, 
            eventHandlers = v19, 
            eventMap = v20, 
            isFocusable = v21, 
            isAutoFocusRoot = v22
        });
        return v2.createElement(v9, v23, v13.children);
    end;
end;