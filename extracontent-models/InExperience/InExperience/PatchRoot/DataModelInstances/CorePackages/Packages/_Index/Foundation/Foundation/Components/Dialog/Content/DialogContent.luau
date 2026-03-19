local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.ScrollView);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v5 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v6 = require(script.Parent.useScrollBarPadding);
local l_useDialogVariants_0 = require(script.Parent.Parent.useDialogVariants).useDialogVariants;
local v8 = require(script.Parent.Parent.useDialog);
return function(v9) --[[ Line: 18 ]] --[[ Name: DialogContent ]]
    -- upvalues: v6 (copy), l_useDialogVariants_0 (copy), v8 (copy), v2 (copy), v3 (copy), v5 (copy)
    local v10, v11, v12 = v6();
    local v13 = l_useDialogVariants_0();
    v9.testId = ("%*--content"):format(v8().testId);
    local v14 = (v9.Selectable == nil or v9.Selectable) and v10;
    return v2.createElement(v3, v5(v9, {
        scroll = {
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            CanvasSize = UDim2.new(0, 0, 0, 0)
        }, 
        selection = {
            Selectable = v14, 
            NextSelectionUp = v9.NextSelectionUp, 
            NextSelectionDown = v9.NextSelectionDown, 
            NextSelectionLeft = v9.NextSelectionLeft, 
            NextSelectionRight = v9.NextSelectionRight
        }, 
        onAbsoluteCanvasSizeChanged = v12, 
        onAbsoluteWindowSizeChanged = v12, 
        tag = v13.content.tag
    }), {
        ScrollPadding = v2.createElement("UIPadding", {
            PaddingRight = UDim.new(0, v11)
        }), 
        ScrollContent = v2.createElement(v2.Fragment, nil, v9.children)
    });
end;