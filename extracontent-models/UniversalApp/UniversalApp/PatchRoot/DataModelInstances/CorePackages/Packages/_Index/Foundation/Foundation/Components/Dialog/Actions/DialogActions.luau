local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Components.Button);
local _ = require(l_script_FirstAncestor_0.Enums.ButtonVariant);
local v6 = require(l_script_FirstAncestor_0.Enums.DialogSize);
local v7 = require(l_script_FirstAncestor_0.Enums.FillBehavior);
local v8 = require(l_script_FirstAncestor_0.Enums.Orientation);
local v9 = require(l_script_FirstAncestor_0.Components.Text);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v11 = require(l_script_FirstAncestor_0.Components.View);
local v12 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local l_useDialogVariants_0 = require(script.Parent.Parent.useDialogVariants).useDialogVariants;
local v14 = require(script.Parent.Parent.useDialog);
local v15 = {
    orientation = v8.Horizontal
};
return function(v16) --[[ Line: 44 ]] --[[ Name: DialogActions ]]
    -- upvalues: v12 (copy), v15 (copy), l_useDialogVariants_0 (copy), v14 (copy), v3 (copy), v2 (copy), v4 (copy), v7 (copy), v6 (copy), v8 (copy), v11 (copy), v9 (copy)
    local v17 = v12(v16, v15);
    local v18 = l_useDialogVariants_0();
    local v19 = v14();
    local v22 = v3.useMemo(function() --[[ Line: 49 ]]
        -- upvalues: v17 (copy), v3 (ref), v2 (ref), v4 (ref), v7 (ref)
        if not v17.actions then
            return nil;
        else
            return v3.createElement(v3.Fragment, nil, v2.map(v17.actions, function(v20, v21) --[[ Line: 56 ]]
                -- upvalues: v3 (ref), v4 (ref), v2 (ref), v7 (ref)
                return v3.createElement(v4, v2.join(v20, {
                    key = ("%*-%*"):format(v21, v20.text), 
                    Name = v20.text, 
                    LayoutOrder = v21, 
                    fillBehavior = v7.Fill
                }));
            end));
        end;
    end, {
        v17.actions
    });
    local v23 = v19.responsiveSize == v6.Small;
    local v24 = true;
    if v17.orientation ~= v8.Horizontal then
        v24 = not v23;
    end;
    local v25 = false;
    if v17.orientation == v8.Vertical then
        v25 = v23;
    end;
    return v3.createElement(v11, {
        tag = "col auto-y size-full-0", 
        LayoutOrder = v17.LayoutOrder, 
        testId = ("%*--actions"):format(v19.testId)
    }, {
        ActionsContainer = v3.createElement(v11, {
            tag = {
                ["auto-y size-full-0 gap-small"] = true, 
                ["row wrap"] = v24, 
                ["col flex-x-fill"] = v25
            }, 
            LayoutOrder = 1, 
            testId = ("%*--actions-container"):format(v19.testId)
        }, {
            Actions = v22
        }), 
        ActionsLabel = if v17.label then v3.createElement(v9, {
            Text = v17.label, 
            tag = v18.actionsLabel.tag, 
            LayoutOrder = 2, 
            testId = ("%*--actions-label"):format(v19.testId)
        }) else nil
    });
end;