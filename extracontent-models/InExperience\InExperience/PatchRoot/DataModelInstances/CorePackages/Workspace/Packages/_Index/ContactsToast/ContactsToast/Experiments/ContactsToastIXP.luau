local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactsToast");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local v3 = require(l_script_FirstAncestor_0.Flags.FStringSocialFriendsLayer);
local v4 = require(l_script_FirstAncestor_0.Flags.FStringContactsToastButtonKey);
local v5 = game:DefineFastFlag("ContactsToastExperimentEnabledv1", false);
local function v7(v6) --[[ Line: 13 ]]
    -- upvalues: v5 (copy), v3 (copy), v4 (copy)
    if not v5 then
        return false;
    else
        return (v6[v3] or {})[v4];
    end;
end;
return {
    FFlagContactsToastExperimentEnabled = v5, 
    useContactsToastVariant = function() --[[ Line: 24 ]] --[[ Name: useContactsToastVariant ]]
        -- upvalues: v5 (copy), l_useUserExperiment_0 (copy), v3 (copy), v7 (copy)
        if not v5 then
            return false;
        else
            return (l_useUserExperiment_0({
                v3
            }, v7));
        end;
    end
};