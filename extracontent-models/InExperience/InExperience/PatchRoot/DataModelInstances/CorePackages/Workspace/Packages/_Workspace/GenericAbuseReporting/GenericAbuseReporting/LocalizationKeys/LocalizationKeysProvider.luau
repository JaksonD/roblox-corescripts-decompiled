local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.LocalizationKeys.LocalizationKeysContext);
local v4 = require(l_script_FirstAncestor_0.LocalizationKeys.DefaultLocalizationKeys);
return function(v5) --[[ Line: 25 ]] --[[ Name: LocalizationKeysProvider ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy)
    local v7 = v2.useMemo(function() --[[ Line: 26 ]]
        -- upvalues: v5 (copy), v4 (ref)
        local l_localizationKeys_0 = v5.localizationKeys;
        return {
            formTitle = l_localizationKeys_0 and l_localizationKeys_0.formTitle or v4.formTitle, 
            formSubmit = l_localizationKeys_0 and l_localizationKeys_0.formSubmit or v4.formSubmit, 
            completeTitle = l_localizationKeys_0 and l_localizationKeys_0.completeTitle or v4.completeTitle, 
            completeDescription = l_localizationKeys_0 and l_localizationKeys_0.completeDescription or v4.completeDescription, 
            completeClose = l_localizationKeys_0 and l_localizationKeys_0.completeClose or v4.completeClose, 
            failedTitle = l_localizationKeys_0 and l_localizationKeys_0.failedTitle or v4.failedTitle, 
            failedDescription = l_localizationKeys_0 and l_localizationKeys_0.failedDescription or v4.failedDescription, 
            failedClose = l_localizationKeys_0 and l_localizationKeys_0.failedClose or v4.failedClose
        };
    end, {
        v5.localizationKeys
    });
    return v2.createElement(v3.Provider, {
        value = v7
    }, v5.children);
end;