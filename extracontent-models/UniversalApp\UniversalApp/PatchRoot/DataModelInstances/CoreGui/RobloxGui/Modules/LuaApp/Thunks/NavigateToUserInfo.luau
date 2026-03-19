local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LuaApp_0 = l_Modules_0.LuaApp;
local v3 = require(l_LuaApp_0.Thunks.OpenCentralOverlayForPeopleList);
local v4 = require(l_Modules_0.LuaApp.Thunks.OpenProfilePeekView);
local l_UserModel_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Models.UserModel;
local function v10(v6, v7) --[[ Line: 22 ]]
    -- upvalues: l_UserModel_0 (copy)
    local v8 = v6 and v6.Users[v7] or {};
    local v9 = false;
    if v8.presence == l_UserModel_0.PresenceType.IN_GAME then
        v9 = v8.lastLocation;
    end;
    return v9;
end;
return function(v11, v12) --[[ Line: 27 ]]
    -- upvalues: v10 (copy), v3 (copy), v4 (copy)
    return function(v13) --[[ Line: 28 ]]
        -- upvalues: v12 (copy), v10 (ref), v11 (copy), v3 (ref), v4 (ref)
        local v14 = v13:getState();
        local v15 = v12.userInGame or v10;
        if v12.openJoinable and v12.contextualMenuProps and v15(v14, v11) then
            v13:dispatch(v3(v12.contextualMenuProps));
            return;
        else
            v13:dispatch(v4(v11, v12.profilePeekViewProps));
            return;
        end;
    end;
end;