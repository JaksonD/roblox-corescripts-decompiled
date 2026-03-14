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
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local v13 = game:DefineFastInt("AXGetTopicsExpirationSeconds", 600);
local v14 = {
    "____", 
    "______", 
    "_____", 
    "___", 
    "_________"
};
local function v21(v15, v16, v17) --[[ Line: 40 ]] --[[ Name: useCachedTopics ]]
    -- upvalues: v7 (copy), v3 (copy), v13 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy)
    local v18 = v7.getTopicRequestKey(v15, v16, v17);
    local v20 = v3.useCallback(function(v19) --[[ Line: 43 ]]
        -- upvalues: v18 (copy), v13 (ref)
        if (v19.AvatarExperience.Catalog.TopicsFetchTimes[v18] or 0) + v13 <= tick() then
            return nil;
        else
            return v19.AvatarExperience.Catalog.Topics[v18];
        end;
    end, {
        v18
    });
    return l_useSelector_0(v20, l_getUseSelectorDeepEquals_0());
end;
return function(v22, v23, v24) --[[ Line: 58 ]] --[[ Name: useCatalogTopics ]]
    -- upvalues: v9 (copy), v10 (copy), l_useDispatch_0 (copy), v3 (copy), v14 (copy), v21 (copy), v8 (copy), l_dependencyArray_0 (copy)
    local v25 = v9(v10);
    local v26 = l_useDispatch_0();
    local v27, v28 = v3.useState(v14);
    local v29 = v21(v22, v23, v24);
    local v30 = v29 == nil;
    if v29 ~= nil and v29 ~= v27 then
        v28(v29);
    end;
    v3.useEffect(function() --[[ Line: 72 ]]
        -- upvalues: v29 (copy), v26 (copy), v8 (ref), v25 (copy), v22 (copy), v23 (copy), v24 (copy)
        if v29 == nil then
            v26(v8(v25, v22, v23, v24));
        end;
    end, l_dependencyArray_0(v29, v22, v23, v24));
    return v29 or v27, v30;
end;