local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v4 = require(script.Parent.PopoverContext);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v6 = {
    testId = "--foundation-popover"
};
return function(v7) --[[ Line: 23 ]] --[[ Name: Popover ]]
    -- upvalues: v3 (copy), v6 (copy), v2 (copy), v4 (copy)
    local v8 = v3(v7, v6);
    local v9, v10 = v2.useState(nil);
    return v2.createElement(v4.Provider, {
        value = {
            anchor = v9, 
            setAnchor = v10, 
            isOpen = v8.isOpen, 
            testId = v8.testId
        }
    }, v8.children);
end;