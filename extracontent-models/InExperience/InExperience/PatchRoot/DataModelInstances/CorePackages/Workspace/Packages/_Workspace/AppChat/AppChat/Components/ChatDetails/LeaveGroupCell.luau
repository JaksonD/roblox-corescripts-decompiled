local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local l_memo_0 = v3.memo;
local v5 = require(l_script_FirstAncestor_0.Components.Cells.IconWithTextCell);
local l_RoactFitComponents_0 = require(l_Parent_0.LuaSocialLibrariesDeps).RoactFitComponents;
local v7 = require(l_script_FirstAncestor_0.Flags.FFlagDebugAppChatEnableDomLocators);
local v8 = require(l_script_FirstAncestor_0.Utils.DomLocators);
local v9 = {
    leaveGroupText = "leaveGroupText", 
    onActivated = nil, 
    iconImage = nil, 
    cellHeight = 64, 
    iconCellWidth = 60, 
    marginTop = 12, 
    LayoutOrder = 0, 
    style = nil
};
LeaveGroupCell = function(v10) --[[ Line: 37 ]] --[[ Name: LeaveGroupCell ]]
    -- upvalues: v2 (copy), v9 (copy), v3 (copy), l_RoactFitComponents_0 (copy), v5 (copy), v7 (copy), v8 (copy)
    local v11 = v2.Dictionary.join(v9, v10);
    return v3.createElement(l_RoactFitComponents_0.FitFrameVertical, {
        BackgroundTransparency = 1, 
        LayoutOrder = v11.LayoutOrder, 
        width = UDim.new(1, 0), 
        margin = {
            top = v11.marginTop, 
            left = 0, 
            right = 0, 
            bottom = 0
        }
    }, {
        LeaveGroupRow = v3.createElement(v5, {
            LayoutOrder = v11.LayoutOrder, 
            onActivated = v11.onActivated, 
            primaryIcon = v11.iconImage, 
            showDivider = false, 
            Size = UDim2.new(1, 0, 0, v11.cellHeight), 
            style = v11.style, 
            Text = v11.leaveGroupText, 
            iconCellWidth = v11.iconCellWidth, 
            testId = if v7 then v8.chatDetailsListActionButton(v11.leaveGroupText) else nil
        })
    });
end;
return l_memo_0(LeaveGroupCell);