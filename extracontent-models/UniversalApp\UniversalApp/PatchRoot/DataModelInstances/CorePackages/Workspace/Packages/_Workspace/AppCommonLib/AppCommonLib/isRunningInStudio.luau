return function() --[[ Line: 1 ]] --[[ Name: isRunningInStudio ]]
    return game:GetService("RunService"):IsStudio() and not _G.__TESTEZ_RUNNING_TEST__;
end;