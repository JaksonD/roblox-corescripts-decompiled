game:DefineFastFlag("DebugVRModeInStudio", false);
return function() --[[ Line: 4 ]] --[[ Name: isVRModeInStudio ]]
    return game:GetFastFlag("DebugVRModeInStudio") and UserSettings().GameSettings:InStudioMode();
end;