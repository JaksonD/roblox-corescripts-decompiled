local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v4 = require(l_script_FirstAncestor_0.Components.View);
local v5 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v6 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v7 = require(script.Parent.RadioGroupContext);
local v8 = {
    Selectable = true, 
    testId = "--foundation-radio-group"
};
return v2.memo(v2.forwardRef(function(v9, v10) --[[ Line: 26 ]] --[[ Name: RadioGroup ]]
    -- upvalues: v6 (copy), v8 (copy), v2 (copy), v4 (copy), v5 (copy), v7 (copy)
    local v11 = v6(v9, v8);
    local v12, v13 = v2.useState(v11.value);
    v2.useEffect(function() --[[ Line: 30 ]]
        -- upvalues: v11 (copy), v13 (copy)
        if v11.value ~= nil then
            v13(v11.value);
        end;
    end, {
        v11.value
    });
    local v15 = v2.useCallback(function(v14) --[[ Line: 36 ]]
        -- upvalues: v13 (copy), v11 (copy)
        v13(v14);
        v11.onValueChanged(v14);
    end, {
        v13, 
        v11.onValueChanged
    });
    return v2.createElement(v4, v5(v11, {
        tag = "auto-xy col gap-medium", 
        ref = v10
    }), {
        RadioGroupContext = v2.createElement(v7.Provider, {
            value = {
                value = v12, 
                onValueChanged = v15, 
                Selectable = v11.Selectable, 
                testId = v11.testId
            }
        }, v11.children)
    });
end));