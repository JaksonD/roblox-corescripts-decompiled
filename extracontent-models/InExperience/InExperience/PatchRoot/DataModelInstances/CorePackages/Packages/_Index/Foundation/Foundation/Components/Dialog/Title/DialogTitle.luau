local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Constants);
local v4 = require(l_script_FirstAncestor_0.Components.Text);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v6 = require(l_script_FirstAncestor_0.Components.View);
local v7 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v8 = require(script.Parent.Parent.useDialog);
local l_useDialogVariants_0 = require(script.Parent.Parent.useDialogVariants).useDialogVariants;
local v10 = require(script.Parent.getBottomSpacing);
return function(v11) --[[ Line: 22 ]] --[[ Name: DialogTitle ]]
    -- upvalues: v7 (copy), v8 (copy), l_useDialogVariants_0 (copy), v2 (copy), v6 (copy), v3 (copy), v10 (copy), v4 (copy)
    local v12 = v7();
    local v13 = v8();
    local v14 = l_useDialogVariants_0();
    return v2.createElement(v6, {
        tag = v14.title.tag, 
        LayoutOrder = v3.MIN_LAYOUT_ORDER + 1, 
        padding = {
            right = if v13.hasHeroMedia then nil else UDim.new(0, v14.closeAffordance.offset + v12.Size.Size_1000), 
            top = if v13.hasHeroMedia then nil else UDim.new(0, v12.Size.Size_500), 
            bottom = v10(v12)
        }, 
        testId = ("%*--title"):format(v13.testId)
    }, {
        Title = v2.createElement(v4, {
            tag = v14.titleText.tag, 
            Text = v11.text
        })
    });
end;