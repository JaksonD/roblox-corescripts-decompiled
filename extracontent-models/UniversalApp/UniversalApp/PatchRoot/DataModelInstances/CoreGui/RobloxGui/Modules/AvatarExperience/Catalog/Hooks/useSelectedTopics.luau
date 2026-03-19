local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetSelectedTopics);
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local v8 = {};
local function v10(v9) --[[ Line: 26 ]] --[[ Name: selectSelectedTopics ]]
    -- upvalues: v8 (copy)
    return v9.AvatarExperience.Catalog.SortAndFilters.SelectedTopics or v8;
end;
return function() --[[ Line: 33 ]] --[[ Name: useSelectedTopics ]]
    -- upvalues: l_useSelector_0 (copy), v10 (copy), l_getUseSelectorDeepEquals_0 (copy), l_useDispatch_0 (copy), v3 (copy), v6 (copy)
    local v11 = l_useSelector_0(v10, l_getUseSelectorDeepEquals_0());
    local v12 = l_useDispatch_0();
    return v11, (v3.useCallback(function(v13) --[[ Line: 37 ]]
        -- upvalues: v12 (copy), v6 (ref)
        v12(v6(v13));
    end));
end;