game:DefineFastFlag("EnableMultiPageSignupExperimentRelease2", false);
return function() --[[ Line: 3 ]]
    return game:GetFastFlag("EnableMultiPageSignupExperimentRelease2") and game:GetEngineFeature("SignupActionRequiredKeyAvailable");
end;