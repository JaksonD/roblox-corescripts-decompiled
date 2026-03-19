local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_Modules_0.LuaApp.AppPage);
local l_AvatarScreenProperties_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties;
local v5 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
return function(v6, v7, v8) --[[ Line: 16 ]] --[[ Name: NavigateDownToAvatarScreen ]]
    -- upvalues: l_AvatarScreenProperties_0 (copy), v3 (copy), v2 (copy), v5 (copy)
    local v9 = l_AvatarScreenProperties_0[v6];
    local v10 = v9 and v9.isTransparent;
    return function(v11) --[[ Line: 19 ]]
        -- upvalues: v10 (copy), v3 (ref), v7 (copy), v6 (copy), v2 (ref), v8 (copy), v5 (ref)
        local v12 = {
            name = v10 and v3.AvatarExperienceWrapperTransparent or v3.AvatarExperienceWrapper, 
            detail = v7, 
            extraProps = {
                routeName = v6, 
                params = v2.Dictionary.join(v8 or {}, {
                    detail = v7
                })
            }
        };
        return v11:dispatch(v5(v12));
    end;
end;