local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0:WaitForChild("ChatSettings"));
local l_Util_0 = require(script.Parent:WaitForChild("Util"));
CreateUnknownMessageLabel = function(v3) --[[ Line: 13 ]] --[[ Name: CreateUnknownMessageLabel ]]
    print("No message creator for message: " .. v3.Message);
end;
return {
    [l_Util_0.KEY_MESSAGE_TYPE] = "UnknownMessage", 
    [l_Util_0.KEY_CREATOR_FUNCTION] = CreateUnknownMessageLabel
};