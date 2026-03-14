local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.SocialLibraries);
local _ = require(l_script_FirstAncestor_0.types);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.React);
local l_Warning_0 = v2.Components.AlertViews.Warning;
local v7 = {
    titleText = "Placeholder title", 
    bodyText = "Placeholder body", 
    cancelText = "TempCancel", 
    confirmText = "TempConfirm", 
    failureTitleText = "FailureTitle", 
    failureBodyText = "FailureBody", 
    failureButtonText = "FailureButton", 
    soakAreaColor3 = Color3.fromRGB(25, 25, 25), 
    soakAreaTransparency = 0.8, 
    width = UDim.new(0.8, 0), 
    displayFailed = false, 
    onActivated = nil, 
    onModalClose = nil
};
LeaveGroupDialog = function(v8) --[[ Line: 54 ]] --[[ Name: LeaveGroupDialog ]]
    -- upvalues: v4 (copy), v7 (copy), v5 (copy), l_Warning_0 (copy)
    local v9 = v4.Dictionary.join(v7, v8);
    return v5.createElement(l_Warning_0, v9);
end;
return LeaveGroupDialog;