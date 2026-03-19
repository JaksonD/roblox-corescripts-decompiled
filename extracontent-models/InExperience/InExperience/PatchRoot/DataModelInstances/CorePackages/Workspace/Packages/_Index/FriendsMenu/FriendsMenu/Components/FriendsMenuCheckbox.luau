local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Context_0 = l_script_FirstAncestor_0.Context;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.Foundation);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local _ = require(l_script_FirstAncestor_0.friendsMenuModalType);
local v8 = require(l_Context_0.SelectedUsersContext);
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local v10 = if l_FFlagEnableAppChatFocusableFixes_0 then v5.Checkbox else v4.App.InputButton.Checkbox;
return function(v11) --[[ Line: 26 ]]
    -- upvalues: v3 (copy), v8 (copy), l_dependencyArray_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v10 (copy)
    local v12 = v3.useContext(v8);
    local v13 = v3.useCallback(function() --[[ Line: 30 ]]
        -- upvalues: v12 (copy), v11 (copy)
        if v12.isFriendSelected(v11.friend.id) then
            v12.removeFriend(v11.friend.id);
            return;
        else
            v12.addFriend(v11.friend.id, v11.friend.displayName);
            return;
        end;
    end, l_dependencyArray_0(v12.isFriendSelected(v11.friend.id), v12.removeFriend, v12.addFriend, v11.friend.id));
    return v3.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        AnchorPoint = v11.anchorPoint, 
        Position = v11.position, 
        BackgroundTransparency = 1, 
        LayoutOrder = v11.layoutOrder
    }, {
        CheckboxAlignment = v3.createElement("UIListLayout", {
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        Button = if l_FFlagEnableAppChatFocusableFixes_0 then v3.createElement(v10, {
            onActivated = v13, 
            isChecked = v12.isFriendSelected(v11.friend.id), 
            label = "", 
            isDisabled = v11.isDisabled, 
            Selectable = v11.selectable
        }) else v3.createElement(v10, {
            onActivated = v13, 
            isSelected = v12.isFriendSelected(v11.friend.id), 
            text = "", 
            isDisabled = v11.isDisabled
        })
    });
end;