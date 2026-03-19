local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script:FindFirstAncestor("PurchasePrompt").Parent;
local l_Cryo_0 = require(l_Parent_0.PurchasePromptDeps).Cryo;
local v3 = {};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 25 ]] --[[ Name: new ]]
    -- upvalues: l_Cryo_0 (copy), v3 (copy), l_UserInputService_0 (copy)
    v4 = l_Cryo_0.Dictionary.join({
        clickSpeedThreshold = 3, 
        clickTimeWindow = 1, 
        initialDelay = 1, 
        buttonInput = nil
    }, v4 or {});
    local v5 = {
        _inputConnection = nil, 
        _clickCount = 0, 
        _startTime = tick(), 
        _options = v4
    };
    setmetatable(v5, v3);
    v5._inputConnection = l_UserInputService_0.InputBegan:Connect(function(v6) --[[ Line: 50 ]]
        -- upvalues: v5 (copy)
        v5:_onInput(v6);
    end);
    return v5;
end;
v3._onInput = function(v7, v8) --[[ Line: 63 ]] --[[ Name: _onInput ]]
    local l_UserInputType_0 = v8.UserInputType;
    local v10 = false;
    if v7._options.buttonInput ~= nil then
        v10 = v8.KeyCode == v7._options.buttonInput;
    end;
    local v11 = true;
    if l_UserInputType_0 ~= Enum.UserInputType.MouseButton1 then
        v11 = l_UserInputType_0 == Enum.UserInputType.Touch;
    end;
    if v10 or v11 then
        v7._clickCount = v7._clickCount + 1;
        delay(v7._options.clickTimeWindow, function() --[[ Line: 73 ]]
            -- upvalues: v7 (copy)
            v7._clickCount = v7._clickCount - 1;
        end);
    end;
end;
v3.isClickValid = function(v12) --[[ Line: 83 ]] --[[ Name: isClickValid ]]
    -- upvalues: l_UserInputService_0 (copy)
    if l_UserInputService_0.MouseBehavior == Enum.MouseBehavior.LockCurrentPosition then
        return false;
    elseif tick() - v12._startTime < v12._options.initialDelay then
        return false;
    else
        return v12._clickCount / v12._options.clickTimeWindow < v12._options.clickSpeedThreshold;
    end;
end;
v3.destroy = function(v13) --[[ Line: 105 ]] --[[ Name: destroy ]]
    v13._inputConnection:Disconnect();
end;
return v3;