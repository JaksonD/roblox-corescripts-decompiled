game:DefineFastInt("LuaAppAccountSecurityPromptPollingIntervalSecondsVisible", 15);
return function() --[[ Line: 5 ]]
    local l_game_FastInt_0 = game:GetFastInt("LuaAppAccountSecurityPromptPollingIntervalSecondsVisible");
    if l_game_FastInt_0 <= 0 then
        l_game_FastInt_0 = 15;
    end;
    return l_game_FastInt_0;
end;