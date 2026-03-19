local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent;
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
local l_FFlagEnableLeftNavOnConsole_0 = require(l_Parent_0.SharedFlags).FFlagEnableLeftNavOnConsole;
local v5 = {
    [Enum.Platform.XBoxOne] = true, 
    [Enum.Platform.XBox360] = true, 
    [Enum.Platform.WiiU] = true, 
    [Enum.Platform.PS3] = true, 
    [Enum.Platform.PS4] = true, 
    [Enum.Platform.PS5] = true, 
    [Enum.Platform.Ouya] = true, 
    [Enum.Platform.AndroidTV] = true
};
local v6 = false;
local v7 = l_Signal_0.new();
local v8 = nil;
local v9 = nil;
local v10 = {
    left = 0, 
    top = 0, 
    right = 0, 
    bottom = 0
};
diffInsets = function(v11, v12) --[[ Line: 43 ]] --[[ Name: diffInsets ]]
    local v13 = true;
    if v11.top == v12.top then
        v13 = true;
        if v11.bottom == v12.bottom then
            v13 = true;
            if v11.left == v12.left then
                v13 = v11.right ~= v12.right;
            end;
        end;
    end;
    return v13;
end;
local v14 = nil;
handleSizeChange = function() --[[ Line: 48 ]] --[[ Name: handleSizeChange ]]
    -- upvalues: v10 (ref), v14 (ref), v7 (copy)
    local v15 = getHardwareSafeAreaInsets();
    if diffInsets(v15, v10) then
        v10 = v15;
        if v14 then
            task.cancel(v14);
        end;
        v14 = task.defer(function() --[[ Line: 55 ]]
            -- upvalues: v14 (ref), v7 (ref), v15 (copy)
            v14 = nil;
            v7:fire(v15);
        end);
    end;
end;
init = function() --[[ Line: 62 ]] --[[ Name: init ]]
    -- upvalues: v6 (ref), v8 (ref), l_CoreGui_0 (copy), v9 (ref)
    if v6 then
        return;
    else
        if not v8 then
            v8 = Instance.new("ScreenGui");
            v8.Name = "_FullscreenTestGui";
            v8.Parent = l_CoreGui_0;
            v8.ScreenInsets = Enum.ScreenInsets.None;
            v8:GetPropertyChangedSignal("AbsoluteSize"):Connect(handleSizeChange);
            v8:GetPropertyChangedSignal("AbsolutePosition"):Connect(handleSizeChange);
        end;
        if not v9 then
            v9 = Instance.new("ScreenGui");
            v9.Name = "_DeviceTestGui";
            v9.Parent = l_CoreGui_0;
            v9.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets;
            v9:GetPropertyChangedSignal("AbsoluteSize"):Connect(handleSizeChange);
            v9:GetPropertyChangedSignal("AbsolutePosition"):Connect(handleSizeChange);
        end;
        handleSizeChange();
        v6 = true;
        return;
    end;
end;
getHardwareSafeAreaInsets = function() --[[ Line: 89 ]] --[[ Name: getHardwareSafeAreaInsets ]]
    -- upvalues: v8 (ref), v9 (ref), v5 (copy), l_UserInputService_0 (copy)
    local l_AbsolutePosition_0 = v8.AbsolutePosition;
    local l_AbsoluteSize_0 = v8.AbsoluteSize;
    local l_AbsolutePosition_1 = v9.AbsolutePosition;
    local v19 = l_AbsolutePosition_1 - l_AbsolutePosition_0;
    local v20 = l_AbsolutePosition_0 + v8.AbsoluteSize - (l_AbsolutePosition_1 + v9.AbsoluteSize);
    if v5[l_UserInputService_0:GetPlatform()] then
        local v21 = l_AbsoluteSize_0 * 0.05;
        v19 = v19 + v21;
        v20 = v20 + v21;
    end;
    return {
        left = math.round(v19.X), 
        top = math.round(v19.Y), 
        right = math.round(v20.X), 
        bottom = math.round(v20.Y)
    };
end;
return {
    connect = function(_, v23) --[[ Line: 113 ]] --[[ Name: connect ]]
        -- upvalues: v7 (copy)
        init();
        return v7:connect(v23);
    end, 
    deviceInsets = function() --[[ Line: 117 ]] --[[ Name: deviceInsets ]]
        -- upvalues: v10 (ref)
        init();
        return v10;
    end, 
    diffInsets = diffInsets, 
    hasExtraPlatformInset = function() --[[ Line: 122 ]] --[[ Name: hasExtraPlatformInset ]]
        -- upvalues: l_FFlagEnableLeftNavOnConsole_0 (copy), v5 (copy), l_UserInputService_0 (copy)
        if l_FFlagEnableLeftNavOnConsole_0 then
            return false;
        else
            return v5[l_UserInputService_0:GetPlatform()];
        end;
    end, 
    fullscreenGui = function() --[[ Line: 128 ]] --[[ Name: fullscreenGui ]]
        -- upvalues: v8 (ref)
        init();
        return v8;
    end
};