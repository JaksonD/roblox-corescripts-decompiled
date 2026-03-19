local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceTopBar");
return {
    GetTopBarStore = if require(l_script_FirstAncestor_0.Flags).FFlagTopBarSignalizeSetCores then require(script.GetTopBarStore) else nil
};