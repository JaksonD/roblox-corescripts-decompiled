local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Enums.StateLayerMode);
local v4 = require(l_script_FirstAncestor_0.Components.Text);
local v5 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
return function(v6) --[[ Line: 21 ]] --[[ Name: CalendarDay ]]
    -- upvalues: v5 (copy), v2 (copy), v4 (copy), v3 (copy)
    local v7 = v5();
    local v8 = if v6.isSelected then v7.Inverse.Content.Emphasis.Color3 else if v6.isSelectable and v6.emphasizeText then v7.Color.Content.Emphasis.Color3 else v7.Color.Content.Muted.Color3;
    local v9 = (not not v6.isSelected or v6.isSelectable and v6.emphasizeText) and 0 or 0.5;
    return v2.createElement(v4, {
        textStyle = {
            Color3 = v8, 
            Transparency = v9
        }, 
        backgroundStyle = if v6.isSelected then v7.Color.System.Contrast else if v6.highlight then v7.Color.ActionStandard.Background else nil, 
        LayoutOrder = v6.LayoutOrder, 
        onActivated = if v6.isSelectable then v6.onActivated else nil, 
        RichText = not v6.isSelectable, 
        stateLayer = {
            mode = if v6.isSelected then v3.Inverse else v3.Default
        }, 
        Text = if v6.isSelectable then v6.Text else ("<s>%*</s>"):format(v6.Text), 
        tag = "text-align-x-center text-align-y-center text-title-small auto-xy", 
        testId = v6.testId
    });
end;