local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.SocialLibraries);
local _ = require(l_script_FirstAncestor_0.types);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.React);
local l_TextInput_0 = v2.Components.AlertViews.TextInput;
local v7 = require(l_script_FirstAncestor_0.Hooks.usePositionOffsetForVirtualKeyboard);
local v8 = {
    titleText = "Placeholder", 
    cancelText = "CancelText", 
    confirmText = "ConfirmText", 
    warningText = nil, 
    inputText = nil, 
    placeholderText = nil, 
    soakAreaColor3 = Color3.fromRGB(25, 25, 25), 
    soakAreaTransparency = 0.8, 
    onActivated = nil, 
    onModalClose = nil
};
EditChatGroupNameDialog = function(v9) --[[ Line: 46 ]] --[[ Name: EditChatGroupNameDialog ]]
    -- upvalues: v4 (copy), v8 (copy), v7 (copy), v5 (copy), l_TextInput_0 (copy)
    local v10 = v4.Dictionary.join(v8, v9);
    local v11 = v7({
        isNearBottomOfScreen = false
    });
    return v5.createElement(l_TextInput_0, v4.Dictionary.join(v10, {
        shouldAdjustForKeyboard = v11 == nil
    }));
end;
return EditChatGroupNameDialog;