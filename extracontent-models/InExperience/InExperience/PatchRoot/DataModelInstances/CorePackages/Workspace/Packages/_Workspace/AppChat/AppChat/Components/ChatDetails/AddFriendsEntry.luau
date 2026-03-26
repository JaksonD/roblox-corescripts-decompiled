local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local l_memo_0 = v3.memo;
local v5 = require(l_script_FirstAncestor_0.Components.Cells.IconWithTextCell);
local v6 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableDomLocators);
local v7 = require(l_script_FirstAncestor_0.Utils.DomLocators);
local v8 = {
    Text = "(translated 'add friends' text here)", 
    iconImage = nil, 
    iconSize = 36, 
    iconCellWidth = 60, 
    cellHeight = 64, 
    onActivated = nil, 
    LayoutOrder = 0, 
    style = nil
};
AddFriendsEntry = function(v9) --[[ Line: 36 ]] --[[ Name: AddFriendsEntry ]]
    -- upvalues: v2 (copy), v8 (copy), v3 (copy), v5 (copy), v6 (copy), v7 (copy)
    local v10 = v2.Dictionary.join(v8, v9);
    return v3.createElement(v5, {
        Size = UDim2.new(1, 0, 0, v10.cellHeight), 
        primaryIcon = v10.iconImage, 
        primaryIconSize = v10.iconSize, 
        iconCellWidth = v10.iconCellWidth, 
        Text = v10.Text, 
        onActivated = v10.onActivated, 
        LayoutOrder = v10.LayoutOrder, 
        style = v10.style, 
        showDivider = false, 
        testId = if v6 then v7.chatDetailsListActionButton(v10.Text) else nil
    });
end;
return l_memo_0(AddFriendsEntry);