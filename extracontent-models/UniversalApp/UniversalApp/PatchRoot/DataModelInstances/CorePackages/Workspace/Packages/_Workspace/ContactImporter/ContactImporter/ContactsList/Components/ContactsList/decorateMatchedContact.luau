local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactImporter");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Dash_0 = v1.Dash;
local _ = require(l_script_FirstAncestor_0.Common.LocalTypes);
local l_getDeepValue_0 = v1.SocialLibraries.Dictionary.getDeepValue;
return function(v5, v6) --[[ Line: 8 ]]
    -- upvalues: l_getDeepValue_0 (copy), l_Dash_0 (copy)
    local v7 = l_getDeepValue_0(v6 or {}, "hasSentRequest") or {};
    return l_Dash_0.map(v5 or {}, function(v8) --[[ Line: 11 ]]
        -- upvalues: l_Dash_0 (ref), v7 (copy)
        return l_Dash_0.join(v8, {
            hasSentRequest = v7[v8.contactId], 
            isMatchedContact = true
        });
    end);
end;