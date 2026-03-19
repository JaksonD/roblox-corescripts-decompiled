local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.Settings.getCamMicPermissions);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default;
if require(l_RobloxGui_0.Modules.Flags.getFFlagDoNotPromptCameraPermissionsOnMount)() then
    return function(v6, v7, v8) --[[ Line: 18 ]]
        -- upvalues: l_default_0 (copy), v3 (copy)
        local v9 = nil;
        if v7 then
            if v7 == "camera" then
                v9 = {
                    l_default_0.Permissions.CAMERA_ACCESS
                };
            elseif v7 == "microphone" then
                v9 = {
                    l_default_0.Permissions.MICROPHONE_ACCESS
                };
            end;
        end;
        v3(function(v10) --[[ Line: 29 ]]
            -- upvalues: v6 (copy)
            v6(v10.hasCameraPermissions, v10.hasMicPermissions);
        end, v9, v8, "ExperienceChat.getPermissions");
    end;
else
    return function(v11) --[[ Line: 37 ]]
        -- upvalues: v3 (copy)
        v3(function(v12) --[[ Line: 38 ]]
            -- upvalues: v11 (copy)
            v11(v12.hasCameraPermissions, v12.hasMicPermissions);
        end);
    end;
end;