local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Enums.Orientation);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v5 = require(l_script_FirstAncestor_0.Components.View);
local v6 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v7 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v8 = require(script.Parent.OptionSelectorGroupContext);
local v9 = {
    orientation = v3.Vertical, 
    Selectable = true, 
    testId = "--foundation-option-selector-group"
};
return v2.memo(v2.forwardRef(function(v10, v11) --[[ Line: 32 ]] --[[ Name: OptionSelectorGroup ]]
    -- upvalues: v7 (copy), v9 (copy), v2 (copy), v5 (copy), v6 (copy), v3 (copy), v8 (copy)
    local v12 = v7(v10, v9);
    local v13, v14 = v2.useState(v12.value);
    v2.useEffect(function() --[[ Line: 36 ]]
        -- upvalues: v12 (copy), v14 (copy)
        if v12.value ~= nil then
            v14(v12.value);
        end;
    end, {
        v12.value
    });
    local v16 = v2.useCallback(function(v15) --[[ Line: 42 ]]
        -- upvalues: v14 (copy), v12 (copy)
        v14(v15);
        v12.onValueChanged(v15);
    end, {
        v14, 
        v12.onValueChanged
    });
    return v2.createElement(v5, v6(v12, {
        tag = {
            ["col size-full-0 auto-y"] = v12.orientation == v3.Vertical, 
            ["row auto-x"] = v12.orientation == v3.Horizontal, 
            ["gap-small"] = true
        }, 
        ref = v11
    }), {
        OptionSelectorGroupContext = v2.createElement(v8.Provider, {
            value = {
                value = v13, 
                onValueChanged = v16, 
                orientation = v12.orientation, 
                Selectable = v12.Selectable, 
                testId = v12.testId
            }
        }, v12.children)
    });
end));