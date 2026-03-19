local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local l_memo_0 = v3.memo;
local v5 = require(l_script_FirstAncestor_0.Components.Cells.IconWithTextCell);
local v6 = {
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
GroupNameEntryCell = function(v7) --[[ Line: 37 ]] --[[ Name: GroupNameEntryCell ]]
    -- upvalues: v2 (copy), v6 (copy), v3 (copy), v5 (copy)
    local v8 = v2.Dictionary.join(v6, v7);
    local v9 = if v8.isDisabled then v8.style.Tokens.Global.Size_150 else 0;
    return v3.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v8.LayoutOrder, 
        Size = UDim2.fromScale(1, 0)
    }, {
        padding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v9), 
            PaddingBottom = UDim.new(0, v8.paddingBottom)
        })
    }, {
        IconWithText = v3.createElement(v5, {
            primaryIcon = if v8.isDisabled then nil else v8.iconImage, 
            Text = v8.groupNameText, 
            iconCellWidth = v8.iconCellWidth, 
            showDivider = false, 
            isDisabled = v8.isDisabled, 
            onActivated = v8.onActivated, 
            LayoutOrder = 1, 
            Size = UDim2.new(1, -v9, 0, v8.cellHeight), 
            style = v8.style
        })
    });
end;
return l_memo_0(GroupNameEntryCell);