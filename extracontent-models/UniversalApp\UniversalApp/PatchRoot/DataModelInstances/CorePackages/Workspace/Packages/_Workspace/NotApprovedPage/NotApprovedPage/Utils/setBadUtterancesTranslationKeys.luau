local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local _ = require(l_script_FirstAncestor_0.Common.Types);
return function(v2, v3) --[[ Line: 5 ]] --[[ Name: setBadUtterancesTranslationKeys ]]
    for _, v5 in v2.badUtterances do
        local l_labelTranslationKey_0 = v5.labelTranslationKey;
        if l_labelTranslationKey_0 then
            v3[l_labelTranslationKey_0] = "Feature.NotApproved." .. l_labelTranslationKey_0;
        end;
    end;
end;