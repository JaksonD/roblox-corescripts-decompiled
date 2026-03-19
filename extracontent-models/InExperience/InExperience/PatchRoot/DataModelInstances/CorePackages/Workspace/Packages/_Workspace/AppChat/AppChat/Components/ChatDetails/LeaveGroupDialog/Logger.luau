local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Logger):new(script:GetFullName() .. ":LeaveGroupDialogScreen");
v1:setContext({
    screen = "LeaveGroupDialogScreen"
});
return v1;