local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AmpUpsell);
local v3 = require(l_script_FirstAncestor_0.Constants);
local l_InExpAmpWizardController_0 = v2.InExpAmpWizardController;
local l_AccessResponseEnum_0 = v2.AmpEnums.AccessResponseEnum;
local l_DEFAULT_FAE_ENTRY_POINT_EVENT_CTX_0 = v3.DEFAULT_FAE_ENTRY_POINT_EVENT_CTX;
local v7 = require(l_script_FirstAncestor_0.Flag.FStringCommsFAEFeatureName);
local v8 = require(l_script_FirstAncestor_0.Flag.FStringCommsFAENamespace);
return function(v9, v10, v11) --[[ Line: 14 ]]
    -- upvalues: l_DEFAULT_FAE_ENTRY_POINT_EVENT_CTX_0 (copy), l_InExpAmpWizardController_0 (copy), v7 (copy), l_AccessResponseEnum_0 (copy), v8 (copy)
    local v12 = v9 or l_DEFAULT_FAE_ENTRY_POINT_EVENT_CTX_0;
    return l_InExpAmpWizardController_0.OpenAmpWizardContainerInExp(v7, function(v13, _) --[[ Line: 18 ]]
        -- upvalues: l_AccessResponseEnum_0 (ref), v10 (copy), v11 (copy)
        if v13 == l_AccessResponseEnum_0.Granted then
            if v10 then
                v10();
                return;
            end;
        elseif v11 then
            v11();
        end;
    end, nil, v12, nil, v8);
end;