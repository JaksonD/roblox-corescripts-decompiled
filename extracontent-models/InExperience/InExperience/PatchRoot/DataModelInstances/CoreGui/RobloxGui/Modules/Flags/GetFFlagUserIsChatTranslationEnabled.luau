local l_status_0, l_result_0 = pcall(function() --[[ Line: 1 ]]
    return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2");
end);
return function() --[[ Line: 5 ]]
    -- upvalues: l_status_0 (copy), l_result_0 (copy)
    return l_status_0 and l_result_0;
end;