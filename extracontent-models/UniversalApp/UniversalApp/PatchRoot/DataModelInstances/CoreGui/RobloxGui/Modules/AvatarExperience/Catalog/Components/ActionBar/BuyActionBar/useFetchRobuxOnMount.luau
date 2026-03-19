local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v5 = require(l_Modules_0.LuaApp.Thunks.ApiFetchEconomyCurrency);
local v6 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v7 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local function v12(v9) --[[ Line: 13 ]] --[[ Name: selectRobuxFetchInfo ]]
    local l_LocalUserId_0 = v9.LocalUserId;
    local v11 = v9.UserRobux[l_LocalUserId_0];
    return {
        localUserId = v9.LocalUserId, 
        userRobux = v11
    };
end;
return function() --[[ Line: 19 ]] --[[ Name: useFetchRobuxOnMount ]]
    -- upvalues: l_useSelector_0 (copy), v12 (copy), l_getUseSelectorDeepEquals_0 (copy), v6 (copy), v7 (copy), l_useDispatch_0 (copy), v2 (copy), v5 (copy)
    local v13 = l_useSelector_0(v12, l_getUseSelectorDeepEquals_0());
    local v14 = v6(v7);
    local v15 = l_useDispatch_0();
    v2.useEffect(function() --[[ Line: 23 ]]
        -- upvalues: v13 (copy), v15 (copy), v5 (ref), v14 (copy)
        if v13.userRobux == nil then
            v15(v5(v14, v13.localUserId, false));
        end;
    end, {});
end;