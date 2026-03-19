local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local l_memo_0 = v3.memo;
local v5 = require(l_script_FirstAncestor_0.Components.Cells.IconWithTextCell);
local l_RoactFitComponents_0 = require(l_Parent_0.LuaSocialLibrariesDeps).RoactFitComponents;
local v7 = {
    leaveGroupText = "leaveGroupText", 
    onActivated = nil, 
    iconImage = nil, 
    cellHeight = 64, 
    iconCellWidth = 60, 
    marginTop = 12, 
    LayoutOrder = 0, 
    style = nil
};
LeaveGroupCell = function(v8) --[[ Line: 34 ]] --[[ Name: LeaveGroupCell ]]
    -- upvalues: v2 (copy), v7 (copy), v3 (copy), l_RoactFitComponents_0 (copy), v5 (copy)
    local v9 = v2.Dictionary.join(v7, v8);
    return v3.createElement(l_RoactFitComponents_0.FitFrameVertical, {
        BackgroundTransparency = 1, 
        LayoutOrder = v9.LayoutOrder, 
        width = UDim.new(1, 0), 
        margin = {
            top = v9.marginTop, 
            left = 0, 
            right = 0, 
            bottom = 0
        }
    }, {
        LeaveGroupRow = v3.createElement(v5, {
            LayoutOrder = v9.LayoutOrder, 
            onActivated = v9.onActivated, 
            primaryIcon = v9.iconImage, 
            showDivider = false, 
            Size = UDim2.new(1, 0, 0, v9.cellHeight), 
            style = v9.style, 
            Text = v9.leaveGroupText, 
            iconCellWidth = v9.iconCellWidth
        })
    });
end;
return l_memo_0(LeaveGroupCell);