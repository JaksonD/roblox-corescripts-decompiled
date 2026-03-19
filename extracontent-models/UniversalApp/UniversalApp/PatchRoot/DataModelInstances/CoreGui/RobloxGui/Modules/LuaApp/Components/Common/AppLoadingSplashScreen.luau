local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_CorePackages_0.Packages.React);
local l_useIsFPSAtTarget_0 = require(l_CorePackages_0.Workspace.Packages.SplashScreenManager).useIsFPSAtTarget;
return v4.memo(function() --[[ Line: 12 ]] --[[ Name: AppLoadingSplashScreen ]]
    -- upvalues: l_useIsFPSAtTarget_0 (copy), v4 (copy), l_RunService_0 (copy), v3 (copy)
    local v6 = l_useIsFPSAtTarget_0();
    local v7 = v4.useRef(nil);
    local v8 = v4.useRef(tick());
    local v9 = v4.useRef(0);
    local v10 = v4.useRef(nil);
    v4.useEffect(function() --[[ Line: 20 ]]
        -- upvalues: v6 (copy), v10 (copy), l_RunService_0 (ref), v8 (copy), v9 (copy), v7 (copy)
        if not v6 then
            v10.current = l_RunService_0.RenderStepped:Connect(function(_) --[[ Line: 22 ]]
                -- upvalues: v8 (ref), v9 (ref), v7 (ref)
                local v12 = tick();
                local v13 = (v12 - v8.current) * 0.5 * 360;
                v9.current = v9.current + v13;
                if v7.current and v7.current.Rotation ~= nil then
                    v7.current.Rotation = v9.current;
                end;
                v8.current = v12;
            end);
            return;
        else
            if v10.current then
                v10.current:Disconnect();
            end;
            return;
        end;
    end, {
        v6
    });
    if not v6 then
        return (v3.createElement("ScreenGui", {}, {
            Spinner = v3.createElement("ImageLabel", {
                Size = UDim2.new(0.05, 0, 0.05, 0), 
                SizeConstraint = Enum.SizeConstraint.RelativeYY, 
                Position = UDim2.new(0.475, 0, 0.425, 0), 
                Image = "rbxasset://textures/ui/LoadingScreen/LoadingSpinner.png", 
                BackgroundTransparency = 1, 
                ref = v7
            })
        }));
    else
        return nil;
    end;
end);