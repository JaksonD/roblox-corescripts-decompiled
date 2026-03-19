local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceControlBar");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_Popover_0 = v3.Popover;
local l_PopoverSide_0 = v3.Enums.PopoverSide;
local l_PopoverAlign_0 = v3.Enums.PopoverAlign;
local l_Radius_0 = v3.Enums.Radius;
local l_useTokens_0 = v3.Hooks.useTokens;
local _ = require(l_script_FirstAncestor_0.ControlBarTypes);
return function(v10) --[[ Line: 15 ]] --[[ Name: Tooltip ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), l_Popover_0 (copy), l_PopoverAlign_0 (copy), l_PopoverSide_0 (copy), l_Radius_0 (copy), v3 (copy)
    local v11 = l_useTokens_0();
    return v2.createElement(l_Popover_0.Root, {
        isOpen = v10.open or false
    }, {
        Anchor = v2.createElement(l_Popover_0.Anchor, nil, v10.children), 
        Content = v2.createElement(l_Popover_0.Content, {
            align = v10.align or l_PopoverAlign_0.Center, 
            side = v10.side or l_PopoverSide_0.Right, 
            backgroundStyle = v11.Color.OverMedia.OverMedia_0, 
            radius = v10.radius or l_Radius_0.Small
        }, v2.createElement(v3.View, {
            tag = "col gap-small padding-medium auto-xy"
        }, {
            Title = if v10.titleText then v2.createElement(v3.Text, {
                Text = v10.titleText, 
                tag = "auto-xy text-title-medium content-emphasis"
            }) else nil, 
            Subtitle = if v10.bodyText then v2.createElement(v3.Text, {
                Text = v10.bodyText, 
                tag = "auto-xy text-body-small"
            }) else nil
        }))
    });
end;