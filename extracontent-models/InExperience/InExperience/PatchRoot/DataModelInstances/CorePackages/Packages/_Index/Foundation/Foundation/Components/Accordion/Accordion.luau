local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v4 = require(l_script_FirstAncestor_0.Components.View);
local v5 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v6 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v7 = require(script.Parent.AccordionContext);
local _ = require(script.Parent.useAccordion);
local v9 = {
    size = require(l_script_FirstAncestor_0.Enums.InputSize).Medium, 
    width = UDim.new(1, 0), 
    testId = "--foundation-accordion"
};
return v2.memo(v2.forwardRef(function(v10, v11) --[[ Line: 35 ]] --[[ Name: Accordion ]]
    -- upvalues: v6 (copy), v9 (copy), v2 (copy), v4 (copy), v5 (copy), v7 (copy)
    local v12 = v6(v10, v9);
    return v2.createElement(v4, v5(v12, {
        tag = "col flex-y-evenly auto-y", 
        Size = UDim2.new(v12.width, UDim.new(0, 0)), 
        ref = v11
    }), {
        AccordionContext = v2.createElement(v7.Provider, {
            value = {
                onAccordionItemActivated = v12.onActivated, 
                itemSize = v12.size, 
                testId = v12.testId
            }
        }, v12.children)
    });
end));