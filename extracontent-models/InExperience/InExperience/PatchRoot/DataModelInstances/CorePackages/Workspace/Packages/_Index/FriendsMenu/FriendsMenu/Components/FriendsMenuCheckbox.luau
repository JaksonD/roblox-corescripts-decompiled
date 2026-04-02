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
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v11 = if l_FFlagEnableAppChatFocusableFixes_0 then v5.Checkbox else v4.App.InputButton.Checkbox;
return function(v12) --[[ Line: 27 ]]
    -- upvalues: v3 (copy), v8 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v11 (copy)
    local v13 = v3.useContext(v8);
    local v14 = v3.useCallback(function() --[[ Line: 31 ]]
        -- upvalues: v13 (copy), v12 (copy)
        if v13.isFriendSelected(v12.friend.id) then
            v13.removeFriend(v12.friend.id);
            return;
        else
            v13.addFriend(v12.friend.id, v12.friend.displayName);
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v13.isFriendSelected(v12.friend.id), 
        v13.removeFriend, 
        v13.addFriend, 
        v12.friend.id
    } else l_dependencyArray_0(v13.isFriendSelected(v12.friend.id), v13.removeFriend, v13.addFriend, v12.friend.id));
    return v3.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        AnchorPoint = v12.anchorPoint, 
        Position = v12.position, 
        BackgroundTransparency = 1, 
        LayoutOrder = v12.layoutOrder
    }, {
        CheckboxAlignment = v3.createElement("UIListLayout", {
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        Button = if l_FFlagEnableAppChatFocusableFixes_0 then v3.createElement(v11, {
            onActivated = v14, 
            isChecked = v13.isFriendSelected(v12.friend.id), 
            label = "", 
            isDisabled = v12.isDisabled, 
            Selectable = v12.selectable
        }) else v3.createElement(v11, {
            onActivated = v14, 
            isSelected = v13.isFriendSelected(v12.friend.id), 
            text = "", 
            isDisabled = v12.isDisabled
        })
    });
end;