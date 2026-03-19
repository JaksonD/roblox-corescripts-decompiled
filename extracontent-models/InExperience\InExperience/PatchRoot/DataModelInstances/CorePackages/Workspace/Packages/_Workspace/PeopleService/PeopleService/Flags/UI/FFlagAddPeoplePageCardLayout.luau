game:DefineFastFlag("AddPeoplePageCardLayout4", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("AddPeoplePageLayoutSettings");
return function() --[[ Line: 5 ]]
    -- upvalues: l_game_EngineFeature_0 (copy)
    return game:GetFastFlag("AddPeoplePageCardLayout4") and l_game_EngineFeature_0;
end;