game:DefineFastFlag("LuaAppGameCarouselUseAutoSizing", false);
return function() --[[ Line: 3 ]]
    return game:GetEngineFeature("AutomaticSizing2") and game:GetFastFlag("LuaAppGameCarouselUseAutoSizing") or false;
end;