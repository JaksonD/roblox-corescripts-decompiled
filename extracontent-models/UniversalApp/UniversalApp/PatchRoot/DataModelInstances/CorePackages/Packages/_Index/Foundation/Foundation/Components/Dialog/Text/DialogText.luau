local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Text);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local l_useDialogVariants_0 = require(script.Parent.Parent.useDialogVariants).useDialogVariants;
local v6 = require(script.Parent.Parent.useDialog);
return function(v7) --[[ Line: 17 ]] --[[ Name: DialogText ]]
    -- upvalues: l_useDialogVariants_0 (copy), v6 (copy), v2 (copy), v3 (copy)
    local v8 = l_useDialogVariants_0();
    local v9 = v6();
    return v2.createElement(v3, {
        Text = v7.Text, 
        RichText = true, 
        tag = v8.contentText.tag, 
        LayoutOrder = v7.LayoutOrder, 
        testId = ("%*--text"):format(v9.testId)
    });
end;