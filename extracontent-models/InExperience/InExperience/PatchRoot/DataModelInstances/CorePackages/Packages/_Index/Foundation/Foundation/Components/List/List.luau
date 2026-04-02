local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Enums.InputSize);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v5 = require(l_script_FirstAncestor_0.Components.View);
local v6 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v7 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v8 = require(script.Parent.ListContext);
local v9 = {
    testId = "--foundation-list"
};
return v2.memo(v2.forwardRef(function(v10, v11) --[[ Line: 27 ]] --[[ Name: List ]]
    -- upvalues: v7 (copy), v9 (copy), v2 (copy), v5 (copy), v6 (copy), v8 (copy)
    local v12 = v7(v10, v9);
    return v2.createElement(v5, v6(v12, {
        tag = "col size-full-0 auto-y", 
        ref = v11
    }), {
        ListContext = v2.createElement(v8.Provider, {
            value = {
                hasDivider = v12.hasDivider, 
                isInset = v12.isInset, 
                size = v12.size, 
                testId = v12.testId
            }
        }, v12.children)
    });
end));