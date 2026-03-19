local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactIs);
local v4 = require(l_script_FirstAncestor_0.Components.Text);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v6 = require(l_script_FirstAncestor_0.Components.View);
local v7 = require(script.Parent.useStatusIndicatorVariants);
local v8 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v9 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v10 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v11 = {
    variant = require(l_script_FirstAncestor_0.Enums.StatusIndicatorVariant).Standard, 
    max = 1e999, 
    testId = "--foundation-status-indicator"
};
return v2.memo(v2.forwardRef(function(v12, v13) --[[ Line: 45 ]] --[[ Name: StatusIndicator ]]
    -- upvalues: v10 (copy), v11 (copy), v8 (copy), v7 (copy), v2 (copy), v6 (copy), v9 (copy), v4 (copy), v3 (copy)
    local v14 = v10(v12, v11);
    local v15 = v8();
    local v16 = v14.value ~= nil;
    local v17 = v7(v15, v14.variant, v16);
    local v19 = v2.useCallback(function(v18) --[[ Line: 52 ]]
        -- upvalues: v14 (copy)
        if v14.max and v14.max < v18 then
            return (("%*+"):format(v14.max));
        else
            return (tostring(v18));
        end;
    end, {
        v14.max
    });
    return v2.createElement(v6, v9(v14, {
        tag = v17.container.tag, 
        ref = v13
    }), {
        Text = if v16 then v2.createElement(v4, {
            Text = if v3.isBinding(v14.value) then v14.value:map(v19) else v19(v14.value), 
            textStyle = v17.content.style, 
            tag = v17.content.tag, 
            testId = ("%*--text"):format(v14.testId)
        }) else nil
    });
end));