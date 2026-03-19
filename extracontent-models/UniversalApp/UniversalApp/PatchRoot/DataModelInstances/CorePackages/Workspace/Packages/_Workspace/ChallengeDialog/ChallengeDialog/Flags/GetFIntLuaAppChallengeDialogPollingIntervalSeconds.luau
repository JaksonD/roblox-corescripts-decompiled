game:DefineFastInt("LuaAppChallengeDialogPollingIntervalSeconds", 15);
return function() --[[ Line: 5 ]]
    local l_game_FastInt_0 = game:GetFastInt("LuaAppChallengeDialogPollingIntervalSeconds");
    if l_game_FastInt_0 <= 0 then
        l_game_FastInt_0 = 15;
    end;
    return l_game_FastInt_0;
end;