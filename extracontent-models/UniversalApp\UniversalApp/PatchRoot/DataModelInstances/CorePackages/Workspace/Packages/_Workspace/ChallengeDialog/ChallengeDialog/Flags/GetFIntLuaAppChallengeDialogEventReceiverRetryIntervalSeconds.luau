game:DefineFastInt("LuaAppChallengeDialogEventReceiverRetryIntervalSeconds", 1);
return function() --[[ Line: 6 ]]
    local l_game_FastInt_0 = game:GetFastInt("LuaAppChallengeDialogEventReceiverRetryIntervalSeconds");
    if l_game_FastInt_0 <= 0 then
        l_game_FastInt_0 = 1;
    end;
    return l_game_FastInt_0;
end;