game:DefineFastInt("LuaAppCredentialsProtocolAvailableTimeout", 2);
return function() --[[ Line: 5 ]]
    local l_game_FastInt_0 = game:GetFastInt("LuaAppCredentialsProtocolAvailableTimeout");
    if l_game_FastInt_0 <= 0 then
        return 2;
    else
        return l_game_FastInt_0;
    end;
end;