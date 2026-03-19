local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_Workspace_0 = game:GetService("Workspace");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ObservableValue_0 = require(l_script_FirstAncestor_0.Service.ChromeUtils).ObservableValue;
local v4 = l_ObservableValue_0.new(Vector2.new(0, 0));
local v5 = l_ObservableValue_0.new(false);
local v6 = nil;
createViewportInfo = function(v7) --[[ Line: 25 ]] --[[ Name: createViewportInfo ]]
    -- upvalues: l_UserInputService_0 (copy)
    local v8 = v7.Y > v7.X;
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    local v10 = true;
    if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.IOS then
        v10 = l_l_UserInputService_0_Platform_0 == Enum.Platform.Android;
    end;
    return {
        size = v7, 
        portraitOrientation = v8, 
        tinyPortrait = v10 and v8 and v7.X < 360, 
        isMobileDevice = v10
    };
end;
local v11 = l_ObservableValue_0.new(createViewportInfo(Vector2.zero));
updateViewportSize = function(v12) --[[ Line: 39 ]] --[[ Name: updateViewportSize ]]
    -- upvalues: v4 (copy), v11 (copy)
    local v13 = Vector2.new(v12.X, v12.Y);
    v4:set(v13);
    v11:set(createViewportInfo(v13));
end;
setCurrentCamera = function(v14) --[[ Line: 45 ]] --[[ Name: setCurrentCamera ]]
    -- upvalues: v6 (ref), l_UserInputService_0 (copy), v5 (copy)
    if v6 then
        pcall(function() --[[ Line: 47 ]]
            -- upvalues: v6 (ref)
            v6:Disconnect();
        end);
        v6 = nil;
    end;
    if v14 then
        local l_l_UserInputService_0_Platform_1 = l_UserInputService_0:GetPlatform();
        local l_v5_0 = v5;
        local v17 = true;
        if l_l_UserInputService_0_Platform_1 ~= Enum.Platform.IOS then
            v17 = l_l_UserInputService_0_Platform_1 == Enum.Platform.Android;
        end;
        l_v5_0:set(v17);
        v6 = v14:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 56 ]]
            -- upvalues: v14 (copy)
            updateViewportSize(v14.ViewportSize);
        end);
        updateViewportSize(v14.ViewportSize);
    end;
end;
l_Workspace_0:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 63 ]]
    -- upvalues: l_Workspace_0 (copy)
    setCurrentCamera(l_Workspace_0.CurrentCamera);
end);
setCurrentCamera(l_Workspace_0.CurrentCamera);
return {
    screenSize = v4, 
    mobileDevice = v5, 
    viewport = v11, 
    isSmallTouchScreen = function() --[[ Line: 72 ]] --[[ Name: isSmallTouchScreen ]]
        -- upvalues: v4 (copy), l_UserInputService_0 (copy)
        local v18 = v4:get();
        return l_UserInputService_0.TouchEnabled and (v18.Y < 500 or v18.X < 700);
    end
};