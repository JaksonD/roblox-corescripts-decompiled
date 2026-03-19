local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local l_useRouteName_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useRouteName;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v7 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v8 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v10 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullView);
local v11 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
return function() --[[ Line: 27 ]] --[[ Name: useFullView ]]
    -- upvalues: l_useRouteName_0 (copy), v3 (copy), v10 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy), v7 (copy), v8 (copy), l_useDispatch_0 (copy), v11 (copy)
    local v13 = l_useRouteName_0();
    local v15 = v3.useCallback(function(v14) --[[ Line: 29 ]]
        -- upvalues: v10 (ref), v13 (copy)
        return v10(v14, v13);
    end, {
        v13
    });
    local v16 = l_useSelector_0(v15, l_getUseSelectorDeepEquals_0());
    local v17 = v7(v8);
    local v18 = l_useDispatch_0();
    return v16, (v3.useCallback(function(v19) --[[ Line: 38 ]]
        -- upvalues: v18 (copy), v11 (ref), v17 (copy), v13 (copy)
        v18(v11(v17, v13, v19));
    end, {
        v17, 
        v13, 
        v18
    }));
end;