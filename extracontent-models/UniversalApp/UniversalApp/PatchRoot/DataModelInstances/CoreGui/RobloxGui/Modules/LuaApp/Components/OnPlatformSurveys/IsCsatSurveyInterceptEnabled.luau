local l_GuiService_0 = game:GetService("GuiService");
game:DefineFastFlag("UniversalAppCsat4", false);
return function() --[[ Line: 4 ]]
    -- upvalues: l_GuiService_0 (copy)
    return game:GetEngineFeature("UniversalAppCsatAppStorageKey") and game:GetFastFlag("UniversalAppCsat4") and not l_GuiService_0:IsTenFootInterface();
end;