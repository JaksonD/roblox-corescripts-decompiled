game:DefineFastInt("LuaAppChallengeForceWebViewVisibleTimeoutSeconds", 30);
return function() --[[ Line: 5 ]]
    local l_game_FastInt_0 = game:GetFastInt("LuaAppChallengeForceWebViewVisibleTimeoutSeconds");
    if l_game_FastInt_0 <= 0 then
        l_game_FastInt_0 = 30;
    end;
    return l_game_FastInt_0;
end;