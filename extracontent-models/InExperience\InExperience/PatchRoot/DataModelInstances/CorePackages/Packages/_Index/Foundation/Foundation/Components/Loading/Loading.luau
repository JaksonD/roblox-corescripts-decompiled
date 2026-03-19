local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Icon);
local v4 = require(l_script_FirstAncestor_0.Components.View);
local v5 = require(l_script_FirstAncestor_0.Enums.IconSize);
local v6 = require(l_script_FirstAncestor_0.Utility.Flags);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v8 = require(l_script_FirstAncestor_0.Utility.useRotation);
local v9 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v10 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v11 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v12 = {
    size = v5.Large, 
    testId = "--foundation-loading"
};
return v2.memo(v2.forwardRef(function(v13, v14) --[[ Line: 28 ]] --[[ Name: Loading ]]
    -- upvalues: v11 (copy), v12 (copy), v8 (copy), v9 (copy), v6 (copy), v2 (copy), v4 (copy), v10 (copy), v3 (copy)
    local v15 = v11(v13, v12);
    local v16 = v8();
    local v17 = v9();
    local v18 = {
        name = "icons/graphic/loadingspinner", 
        size = v15.size, 
        style = v17.DarkMode.Content.Emphasis, 
        Rotation = v16, 
        ref = v14, 
        testId = if v6.FoundationLoadingWrapInView then ("%*--icon"):format(v15.testId) else nil
    };
    return v2.createElement(if v6.FoundationLoadingWrapInView then v4 else v2.Fragment, if v6.FoundationLoadingWrapInView then v10(v15, {
        tag = "auto-xy"
    }) else {}, {
        Icon = v2.createElement(v3, if v6.FoundationLoadingWrapInView then v18 else v10(v15, v18))
    });
end));