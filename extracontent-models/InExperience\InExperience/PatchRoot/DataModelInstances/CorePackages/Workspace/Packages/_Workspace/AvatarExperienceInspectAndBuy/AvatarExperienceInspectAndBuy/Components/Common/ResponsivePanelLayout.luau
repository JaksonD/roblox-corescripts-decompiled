local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_Divider_0 = v3.Divider;
local l_DividerOrientation_0 = v3.Enums.DividerOrientation;
local _ = require(l_script_FirstAncestor_0.Enums.ViewType);
return function(v7) --[[ Line: 78 ]] --[[ Name: ResponsivePanelLayout ]]
    -- upvalues: v2 (copy), v3 (copy), l_Divider_0 (copy), l_DividerOrientation_0 (copy)
    local l_panelConfig_0 = v7.panelConfig;
    return v2.createElement(v3.View, {
        tag = l_panelConfig_0.tag, 
        LayoutOrder = v7.LayoutOrder, 
        ClipsDescendants = true
    }, {
        FirstPanel = if v7.renderFirstPanel then v2.createElement(v3.View, {
            Size = if v7.renderSecondPanel then l_panelConfig_0.panelSizes.first else UDim2.new(1, 0, 1, 0), 
            LayoutOrder = l_panelConfig_0.layoutOrder.first
        }, {
            RightBorder = if l_panelConfig_0.showRightBorder then v2.createElement(l_Divider_0, {
                orientation = l_DividerOrientation_0.Vertical, 
                Position = UDim2.new(1, -1, 0, 0)
            }) else nil, 
            StartSlot = v7.renderFirstPanel()
        }) else nil, 
        SecondPanel = if v7.renderSecondPanel then v2.createElement(v3.View, {
            Size = if v7.renderFirstPanel then l_panelConfig_0.panelSizes.second else UDim2.new(1, 0, 1, 0), 
            LayoutOrder = l_panelConfig_0.layoutOrder.second
        }, {
            EndSlot = v7.renderSecondPanel()
        }) else nil
    });
end;