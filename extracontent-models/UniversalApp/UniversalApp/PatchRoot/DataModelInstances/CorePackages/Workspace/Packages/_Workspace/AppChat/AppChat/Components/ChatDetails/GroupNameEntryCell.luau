local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local l_memo_0 = v3.memo;
local v5 = require(l_script_FirstAncestor_0.Components.Cells.IconWithTextCell);
local v6 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableDomLocators);
local v7 = require(l_script_FirstAncestor_0.Utils.DomLocators);
local v8 = {
    groupNameText = "groupName", 
    iconImage = nil, 
    onActivated = nil, 
    LayoutOrder = 1, 
    iconCellWidth = 60, 
    isDisabled = false, 
    cellHeight = 36, 
    style = nil, 
    paddingBottom = 12
};
GroupNameEntryCell = function(v9) --[[ Line: 40 ]] --[[ Name: GroupNameEntryCell ]]
    -- upvalues: v2 (copy), v8 (copy), v3 (copy), v5 (copy), v6 (copy), v7 (copy)
    local v10 = v2.Dictionary.join(v8, v9);
    local v11 = if v10.isDisabled then v10.style.Tokens.Global.Size_150 else 0;
    return v3.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v10.LayoutOrder, 
        Size = UDim2.fromScale(1, 0)
    }, {
        padding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v11), 
            PaddingBottom = UDim.new(0, v10.paddingBottom)
        })
    }, {
        IconWithText = v3.createElement(v5, {
            primaryIcon = if v10.isDisabled then nil else v10.iconImage, 
            Text = v10.groupNameText, 
            iconCellWidth = v10.iconCellWidth, 
            showDivider = false, 
            isDisabled = v10.isDisabled, 
            onActivated = v10.onActivated, 
            LayoutOrder = 1, 
            Size = UDim2.new(1, -v11, 0, v10.cellHeight), 
            style = v10.style, 
            testId = if v6 then v7.chatDetailsListActionButton(v10.groupNameText) else nil
        })
    });
end;
return l_memo_0(GroupNameEntryCell);