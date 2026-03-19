local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Logger):new(script:GetFullName() .. ":EditChatGroupNameDialogScreen");
v1:setContext({
    screen = "EditChatGroupNameDialogScreen"
});
return v1;