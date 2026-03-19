local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperienceVoice");
local v1 = require(l_script_FirstAncestor_0.Hooks.useCrossExperienceVoice);
local l_FFlagEnableCEVForceInitialize_0 = require(l_script_FirstAncestor_0.Flags).FFlagEnableCEVForceInitialize;
return function() --[[ Line: 6 ]] --[[ Name: CrossExperienceVoiceComponent ]]
    -- upvalues: v1 (copy), l_FFlagEnableCEVForceInitialize_0 (copy)
    v1({
        handleRCCConnectionTimeout = nil, 
        forceInitializeStoreOnMount = l_FFlagEnableCEVForceInitialize_0 and true or nil
    });
    return nil;
end;