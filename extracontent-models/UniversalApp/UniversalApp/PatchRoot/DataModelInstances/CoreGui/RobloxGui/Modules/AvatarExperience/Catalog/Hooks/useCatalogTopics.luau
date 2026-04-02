local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_dependencyArray_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.dependencyArray;
local v7 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchTopics);
local v9 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v10 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local _ = require(l_CorePackages_0.Workspace.Packages.Http);
local v12 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_getUseSelectorDeepEquals_0 = v12.Utils.getUseSelectorDeepEquals;
local v15 = game:DefineFastInt("AXGetTopicsExpirationSeconds", 600);
local v16 = {
    "____", 
    "______", 
    "_____", 
    "___", 
    "_________"
};
local function v23(v17, v18, v19) --[[ Line: 43 ]] --[[ Name: useCachedTopics ]]
    -- upvalues: v7 (copy), v3 (copy), v15 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy)
    local v20 = v7.getTopicRequestKey(v17, v18, v19);
    local v22 = v3.useCallback(function(v21) --[[ Line: 46 ]]
        -- upvalues: v20 (copy), v15 (ref)
        if (v21.AvatarExperience.Catalog.TopicsFetchTimes[v20] or 0) + v15 <= tick() then
            return nil;
        else
            return v21.AvatarExperience.Catalog.Topics[v20];
        end;
    end, {
        v20
    });
    return l_useSelector_0(v22, l_getUseSelectorDeepEquals_0());
end;
return function(v24, v25, v26) --[[ Line: 61 ]] --[[ Name: useCatalogTopics ]]
    -- upvalues: v9 (copy), v10 (copy), l_useDispatch_0 (copy), v3 (copy), v16 (copy), v23 (copy), v8 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
    local v27 = v9(v10);
    local v28 = l_useDispatch_0();
    local v29, v30 = v3.useState(v16);
    local v31 = v23(v24, v25, v26);
    local v32 = v31 == nil;
    if v31 ~= nil and v31 ~= v29 then
        v30(v31);
    end;
    v3.useEffect(function() --[[ Line: 76 ]]
        -- upvalues: v31 (copy), v28 (copy), v8 (ref), v27 (copy), v24 (copy), v25 (copy), v26 (copy)
        if v31 == nil then
            v28(v8(v27, v24, v25, v26));
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v31, 
        v24, 
        v25, 
        v26
    } else l_dependencyArray_0(v31, v24, v25, v26));
    return v31 or v29, v32;
end;