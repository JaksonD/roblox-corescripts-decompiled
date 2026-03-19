local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.BuilderIcons);
local v3 = require(l_Parent_0.React);
local l_Components_0 = l_script_FirstAncestor_0.Components;
local _ = require(l_Components_0.BaseMenu);
local v6 = require(l_Components_0.View);
local v7 = require(l_Components_0.Icon);
local v8 = require(l_Components_0.InputField);
local v9 = require(l_script_FirstAncestor_0.Enums.StateLayerAffordance);
local v10 = require(l_Components_0.Text);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v12 = require(l_script_FirstAncestor_0.Utility.Flags);
local v13 = require(l_script_FirstAncestor_0.Utility.getInputTextSize);
local v14 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v15 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v16 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v17 = require(script.Parent.useDropdownVariants);
local _ = require(l_script_FirstAncestor_0.Enums.InputSize);
local v19 = require(l_script_FirstAncestor_0.Enums.ControlState);
local _ = require(l_script_FirstAncestor_0.Enums.CursorType);
local v21 = {
    isMenuOpen = false, 
    placeholder = ""
};
return v3.memo(v3.forwardRef(function(v22, v23) --[[ Line: 53 ]] --[[ Name: DropdownControl ]]
    -- upvalues: v16 (copy), v21 (copy), v14 (copy), v3 (copy), v19 (copy), v17 (copy), v12 (copy), v2 (copy), v8 (copy), v15 (copy), v13 (copy), v6 (copy), v9 (copy), v10 (copy), v7 (copy)
    local v24 = v16(v22, v21);
    local v25 = v14();
    local v26, v27 = v3.useState(v19.Initialize);
    local v28 = v24.item == nil;
    local v29 = v17(v25, v24.size, v26, v28, v24.hasError or false);
    local v30 = v3.useMemo(function() --[[ Line: 61 ]]
        -- upvalues: v25 (copy)
        return {
            radius = UDim.new(0, v25.Radius.Small), 
            offset = v25.Size.Size_200, 
            borderWidth = v25.Stroke.Thicker
        };
    end, {
        v25
    });
    local v31 = if v12.FoundationDropdownControlIconFix then v2.Icon.ChevronLargeUp else "truncate_arrows/actions_truncationCollapse";
    local v32 = if v12.FoundationDropdownControlIconFix then v2.Icon.ChevronLargeDown else "truncate_arrows/actions_truncationExpand";
    return v3.createElement(v8, v15(v24, {
        size = v13(v24.size), 
        hasError = v24.hasError, 
        isDisabled = v24.isDisabled, 
        label = v24.label, 
        hint = v24.hint, 
        ref = v23, 
        width = v24.width, 
        input = function(_) --[[ Line: 87 ]] --[[ Name: input ]]
            -- upvalues: v3 (ref), v6 (ref), v27 (copy), v24 (copy), v30 (copy), v9 (ref), v29 (copy), v10 (ref), v7 (ref), v31 (copy), v32 (copy)
            return v3.createElement(v6, {
                onStateChanged = v27, 
                isDisabled = v24.isDisabled, 
                onActivated = v24.onActivated, 
                selection = {
                    Selectable = not v24.isDisabled
                }, 
                cursor = v30, 
                stateLayer = {
                    affordance = v9.None
                }, 
                tag = v29.container.tag, 
                ref = v24.inputRef, 
                testId = ("%*--control"):format(v24.testId)
            }, {
                Text = v3.createElement(v10, {
                    LayoutOrder = 1, 
                    Text = if v24.item then v24.item.text else v24.placeholder, 
                    tag = v29.text.tag
                }), 
                Arrow = v3.createElement(v7, {
                    LayoutOrder = 2, 
                    name = if v24.isMenuOpen then v31 else v32, 
                    size = v29.arrow.size, 
                    tag = v29.text.tag
                })
            });
        end
    }));
end));