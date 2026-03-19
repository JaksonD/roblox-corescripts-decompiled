local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_RobloxGui_0.Modules.CaptureNotification);
local v5 = require(l_RobloxGui_0.Modules.shouldSaveScreenshotToAlbum);
local v6 = {};
v6.__index = v6;
v6.new = function() --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy), v5 (copy), v2 (copy), v4 (copy)
    local v7 = {};
    setmetatable(v7, v6);
    v7.init = false;
    v7.captureEvent = Instance.new("BindableEvent");
    v7.permissionEvent = Instance.new("BindableEvent");
    if v5() then
        v7.captureNotification = v2.createElement(v4, {
            permissionEvent = v7.permissionEvent
        });
    end;
    return v7;
end;
v6.Start = function(v8) --[[ Line: 36 ]] --[[ Name: Start ]]
    -- upvalues: v5 (copy), v2 (copy), l_CoreGui_0 (copy)
    if v8.init then
        return;
    else
        v8.init = true;
        if v5() then
            v8.captureNotificationInstance = v2.mount(v8.captureNotification, l_CoreGui_0, "RobloxCaptureNotificationGui");
        end;
        return;
    end;
end;
local v9 = v6.new();
v6.DismissNotification = function(v10) --[[ Line: 50 ]] --[[ Name: DismissNotification ]]
    -- upvalues: v9 (copy), v5 (copy), v2 (copy), v4 (copy)
    if not v10.init then
        v9:Start();
        return;
    else
        if v5() then
            v2.update(v10.captureNotificationInstance, v2.createElement(v4, {
                permissionEvent = v10.permissionEvent, 
                forceDismissToast = {
                    onDismissed = function() --[[ Line: 59 ]] --[[ Name: onDismissed ]]
                        -- upvalues: v2 (ref), v10 (copy), v4 (ref)
                        v2.update(v10.captureNotificationInstance, v2.createElement(v4, {
                            permissionEvent = v10.permissionEvent, 
                            forceDismissToast = nil
                        }));
                    end
                }
            }));
        end;
        return;
    end;
end;
v6.ShowPermissionToast = function(v11) --[[ Line: 74 ]] --[[ Name: ShowPermissionToast ]]
    -- upvalues: v9 (copy)
    if not v11.init then
        v9:Start();
    end;
    v11.permissionEvent:Fire();
end;
v6.Capture = function(v12) --[[ Line: 81 ]] --[[ Name: Capture ]]
    v12:DismissNotification();
    v12.captureEvent:Fire();
end;
return v9;