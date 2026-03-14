local l_Parent_0 = script:FindFirstAncestor("ContactImporter").Parent;
local v1 = require(l_Parent_0.RoactAppExperiment);
local v2 = game:DefineFastString("ContactImportLayer", "Social.ContactList");
local v3 = game:DefineFastString("ContactImportGreenFindFriendsButtonExperimentVariable", "green_find_friends_button");
local v4 = game:DefineFastString("ContactImportRemoveCloseButtonExperimentVariable", "remove_close_button");
local l_useUserExperiment_0 = v1.useUserExperiment;
local function v7(v6) --[[ Line: 12 ]]
    -- upvalues: v2 (copy), v3 (copy)
    return ((v6 or {})[v2] or {})[v3] == true;
end;
local function v9(v8) --[[ Line: 18 ]]
    -- upvalues: v2 (copy), v4 (copy)
    return ((v8 or {})[v2] or {})[v4] == true;
end;
return {
    isGreenFindFriendsButtonExperimentEnabled = v7, 
    isRemoveCloseButtonExperimentEnabled = v9, 
    useIsGreenFindFriendsButtonExperimentEnabled = function(v10) --[[ Line: 27 ]] --[[ Name: useIsGreenFindFriendsButtonExperimentEnabled ]]
        -- upvalues: l_useUserExperiment_0 (copy), v2 (copy), v7 (copy)
        return l_useUserExperiment_0({
            v2
        }, v7, v10.isExposureEnabled);
    end, 
    useIsRemoveCloseButtonExperimentEnabled = function(v11) --[[ Line: 34 ]] --[[ Name: useIsRemoveCloseButtonExperimentEnabled ]]
        -- upvalues: l_useUserExperiment_0 (copy), v2 (copy), v9 (copy)
        return l_useUserExperiment_0({
            v2
        }, v9, v11.isExposureEnabled);
    end
};