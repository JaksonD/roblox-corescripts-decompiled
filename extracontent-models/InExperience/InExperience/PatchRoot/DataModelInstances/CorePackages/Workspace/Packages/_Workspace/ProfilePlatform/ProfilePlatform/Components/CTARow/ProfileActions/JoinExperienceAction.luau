local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ButtonVariant_0 = require(l_Parent_0.Foundation).Enums.ButtonVariant;
local v3 = require(l_script_FirstAncestor_0.Common.Enums);
local _ = require(l_script_FirstAncestor_0.Components.CTARow.Types);
return {
    [v3.ProfileActions.JoinExperience] = function(v5) --[[ Line: 12 ]]
        -- upvalues: l_ButtonVariant_0 (copy), v3 (copy)
        return {
            variant = l_ButtonVariant_0.Emphasis, 
            isLoading = v5.experienceUtilities.isLoading, 
            isDisabled = not v5.experienceUtilities.isInExperience, 
            text = v5.localized[v3.ProfileActions.JoinExperience], 
            onActivated = function() --[[ Line: 18 ]] --[[ Name: onActivated ]]
                -- upvalues: v5 (copy)
                v5.experienceUtilities.joinExperience();
            end
        };
    end
};