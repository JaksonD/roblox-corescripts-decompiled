local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Logger):new("RoactChat.CreateNewChat");
v1:setContext({
    screen = "CreateNewChat"
});
return v1;