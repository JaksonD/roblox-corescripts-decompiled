local v0 = {};
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v5 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create("ImageLabel")({
    Name = "NotificationObject", 
    Position = UDim2.new(0.5, -860, 1, -301), 
    Size = UDim2.new(0, 1700, 0, 1000), 
    BackgroundTransparency = 1, 
    Image = "rbxasset://textures/ui/VR/notifier_glow.png", 
    ImageTransparency = 0, 
    BorderSizePixel = 0
});
v0.DEFAULT_DURATION = 5;
local v13 = (function() --[[ Line: 30 ]] --[[ Name: CreateNotificationEffect ]]
    -- upvalues: l_RunService_0 (copy), v5 (copy), l_RobloxGui_0 (copy)
    local v6 = {};
    local v7 = nil;
    v6.Init = function(v8, v9) --[[ Line: 39 ]] --[[ Name: Init ]]
        -- upvalues: v7 (ref), l_RunService_0 (ref), v5 (ref), l_RobloxGui_0 (ref)
        local v10 = tick();
        local v11 = v10 + v9;
        if v7 then
            v7:disconnect();
            v7 = nil;
        end;
        v7 = l_RunService_0.RenderStepped:connect(function() --[[ Line: 47 ]]
            -- upvalues: v11 (copy), v8 (copy), v5 (ref), l_RobloxGui_0 (ref), v10 (copy)
            if tick() >= v11 then
                v8:Cancel();
                return;
            else
                v5.Parent = l_RobloxGui_0;
                v5.ImageTransparency = (math.sin((tick() - v10) * 2.5 + 1.5707963267948966) + 1) / 2 * 0.5 + 0.5;
                return;
            end;
        end);
    end;
    v6.Cancel = function(_) --[[ Line: 62 ]] --[[ Name: Cancel ]]
        -- upvalues: v7 (ref), v5 (ref)
        if v7 then
            v7:disconnect();
            v7 = nil;
        end;
        v5.Parent = nil;
    end;
    return v6;
end)();
v0.BeginNotification = function(v14, v15) --[[ Line: 75 ]] --[[ Name: BeginNotification ]]
    -- upvalues: v13 (copy)
    v14:CancelNotification();
    v13:Init(v15 or v14.DEFAULT_DURATION);
end;
v0.CancelNotification = function(_) --[[ Line: 80 ]] --[[ Name: CancelNotification ]]
    -- upvalues: v13 (copy)
    v13:Cancel();
end;
return v0;