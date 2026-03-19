local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v5 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateDownTo3DQRCodePage);
local l_AddFriendsScreen_0 = require(l_CorePackages_0.Workspace.Packages.AddFriends).AddFriendsScreen;
return function() --[[ Line: 14 ]] --[[ Name: AddFriendsUniversalAppWrapper ]]
    -- upvalues: l_useDispatch_0 (copy), v1 (copy), v5 (copy), l_AppPage_0 (copy), l_AddFriendsScreen_0 (copy)
    local v7 = l_useDispatch_0();
    local v8 = v1.useCallback(function(...) --[[ Line: 17 ]]
        -- upvalues: v7 (copy), v5 (ref)
        return v7(v5(...));
    end, {
        v7
    });
    local v9 = v1.useMemo(function() --[[ Line: 21 ]]
        -- upvalues: l_AppPage_0 (ref), v8 (copy)
        return {
            [l_AppPage_0.ProfileQRCodePage] = v8
        };
    end, {
        v8
    });
    return v1.createElement(l_AddFriendsScreen_0, {
        navigateToLuaAppPages = v9
    });
end;