local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ButtonVariant_0 = require(l_Parent_0.Foundation).Enums.ButtonVariant;
local v3 = require(l_script_FirstAncestor_0.Common.Enums);
local _ = require(l_script_FirstAncestor_0.Components.CTARow.Types);
return {
    [v3.ProfileActions.PendingFriendRequest] = function(v5) --[[ Line: 12 ]]
        -- upvalues: l_ButtonVariant_0 (copy), v3 (copy)
        return {
            variant = l_ButtonVariant_0.Subtle, 
            text = v5.localized[v3.ProfileActions.PendingFriendRequest], 
            onActivated = function() --[[ Line: 16 ]] --[[ Name: onActivated ]]

            end, 
            isDisabled = true
        };
    end
};