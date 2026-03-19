local l_UserInputService_0 = game:GetService("UserInputService");
return function() --[[ Line: 3 ]] --[[ Name: getUserInputIsSelectionOnly ]]
    -- upvalues: l_UserInputService_0 (copy)
    return not l_UserInputService_0.TouchEnabled and not l_UserInputService_0.MouseEnabled;
end;