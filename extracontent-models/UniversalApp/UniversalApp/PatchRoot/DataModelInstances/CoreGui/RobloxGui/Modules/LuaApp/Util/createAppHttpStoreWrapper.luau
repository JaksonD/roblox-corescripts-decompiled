local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.HttpStore);
local l_StatusCodes_0 = require(l_CorePackages_0.Workspace.Packages.Http).StatusCodes;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.LuaApp.Thunks.LogoutUserOnUnauthorized);
local v6 = require(l_Modules_0.LuaApp.Thunks.Moderation.UserModerationCheck);
local l_Instance_0 = v2.Instance;
createAppHttpStoreWrapper = function(v8, v9, v10) --[[ Line: 18 ]] --[[ Name: createAppHttpStoreWrapper ]]
    -- upvalues: l_Instance_0 (copy), l_StatusCodes_0 (copy), v6 (copy), v5 (copy)
    return l_Instance_0._create({
        [l_StatusCodes_0.UNAUTHORIZED] = function(v11) --[[ Line: 20 ]]
            -- upvalues: v8 (copy), v6 (ref), v9 (copy)
            v8:dispatch(v6(v9, v11));
        end, 
        [l_StatusCodes_0.FORBIDDEN] = function(v12) --[[ Line: 23 ]]
            -- upvalues: v8 (copy), v5 (ref), v9 (copy), v10 (copy)
            v8:dispatch(v5(v9, v10, v12.config.Url));
        end
    });
end;
return createAppHttpStoreWrapper;