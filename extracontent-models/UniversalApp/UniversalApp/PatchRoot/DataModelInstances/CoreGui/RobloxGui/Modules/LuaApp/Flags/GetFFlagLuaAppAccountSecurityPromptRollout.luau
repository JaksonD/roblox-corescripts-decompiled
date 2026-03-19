game:DefineFastInt("LuaAppAccountSecurityPromptRollout", 0);
game:DefineFastFlag("LuaAppAccountSecurityPromptRolloutEnabledForAll", false);
return function(v0) --[[ Line: 5 ]]
    if game:GetFastFlag("LuaAppAccountSecurityPromptRolloutEnabledForAll") then
        return true;
    else
        local l_game_FastInt_0 = game:GetFastInt("LuaAppAccountSecurityPromptRollout");
        if l_game_FastInt_0 <= 0 then
            return false;
        elseif not v0 or v0 == "" then
            return false;
        else
            return (v0 + 37) % 100 < l_game_FastInt_0;
        end;
    end;
end;