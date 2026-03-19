game:DefineFastInt("FullscreenTitleBarTriggerDelayMillis", 0);
return function() --[[ Line: 5 ]]
    local l_game_FastInt_0 = game:GetFastInt("FullscreenTitleBarTriggerDelayMillis");
    if l_game_FastInt_0 < 0 then
        l_game_FastInt_0 = 0;
    end;
    return l_game_FastInt_0;
end;