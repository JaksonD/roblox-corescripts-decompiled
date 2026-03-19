local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Icon);
local v4 = require(l_script_FirstAncestor_0.Components.View);
local v5 = require(l_script_FirstAncestor_0.Enums.IconSize);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v7 = require(l_script_FirstAncestor_0.Utility.useRotation);
local v8 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v9 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v10 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v11 = {
    size = v5.Large, 
    testId = "--foundation-loading"
};
return v2.memo(v2.forwardRef(function(v12, v13) --[[ Line: 27 ]] --[[ Name: Loading ]]
    -- upvalues: v10 (copy), v11 (copy), v7 (copy), v8 (copy), v2 (copy), v4 (copy), v9 (copy), v3 (copy)
    local v14 = v10(v12, v11);
    local v15 = v7();
    local v16 = v8();
    local v17 = {
        name = "icons/graphic/loadingspinner", 
        size = v14.size, 
        style = v16.DarkMode.Content.Emphasis, 
        Rotation = v15, 
        ref = v13, 
        testId = ("%*--icon"):format(v14.testId)
    };
    return v2.createElement(v4, v9(v14, {
        tag = "auto-xy"
    }), {
        Icon = v2.createElement(v3, v17)
    });
end));