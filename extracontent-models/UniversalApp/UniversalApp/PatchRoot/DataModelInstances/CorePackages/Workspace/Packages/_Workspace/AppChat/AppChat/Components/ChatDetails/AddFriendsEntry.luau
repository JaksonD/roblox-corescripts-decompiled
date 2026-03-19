local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local l_memo_0 = v3.memo;
local v5 = require(l_script_FirstAncestor_0.Components.Cells.IconWithTextCell);
local l_FFlagAppChatEnableConversationUserTileAvatars_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableConversationUserTileAvatars;
local v7 = {
    Text = "(translated 'add friends' text here)", 
    iconImage = nil, 
    iconSize = 36, 
    iconCellWidth = 60, 
    cellHeight = 64, 
    onActivated = nil, 
    LayoutOrder = 0, 
    style = nil
};
AddFriendsEntry = function(v8) --[[ Line: 35 ]] --[[ Name: AddFriendsEntry ]]
    -- upvalues: v2 (copy), v7 (copy), v3 (copy), v5 (copy), l_FFlagAppChatEnableConversationUserTileAvatars_0 (copy)
    local v9 = v2.Dictionary.join(v7, v8);
    return v3.createElement(v5, {
        Size = UDim2.new(1, 0, 0, v9.cellHeight), 
        primaryIcon = v9.iconImage, 
        primaryIconSize = v9.iconSize, 
        iconCellWidth = v9.iconCellWidth, 
        Text = v9.Text, 
        onActivated = v9.onActivated, 
        LayoutOrder = v9.LayoutOrder, 
        style = v9.style, 
        showDivider = not l_FFlagAppChatEnableConversationUserTileAvatars_0
    });
end;
return l_memo_0(AddFriendsEntry);