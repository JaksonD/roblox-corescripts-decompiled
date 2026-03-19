if not game:GetEngineFeature("CoreAttributes") then
    return false;
else
    return game:DefineFastFlag("LeaderstatsWithASideOfClient", false);
end;