game:DefineFastFlag("OpenURLUseRequestResponseLua", false);
return function() --[[ Line: 3 ]]
    return game:GetFastFlag("OpenURLUseRequestResponseLua") and game:GetEngineFeature("OpenURLUseRequestResponseEnabled");
end;