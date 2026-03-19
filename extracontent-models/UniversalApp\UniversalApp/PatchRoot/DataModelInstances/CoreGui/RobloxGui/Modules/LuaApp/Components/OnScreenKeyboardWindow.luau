local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Common_0 = l_Modules_0.Common;
local v3 = require(l_Common_0.Roact);
local v4 = v3.PureComponent:extend("OnScreenKeyboardWindow");
v4.init = function(v5) --[[ Line: 11 ]] --[[ Name: init ]]
    v5.state = {
        onScreenKeyboardHeight = 0
    };
end;
v4.didMount = function(v6) --[[ Line: 17 ]] --[[ Name: didMount ]]
    -- upvalues: l_UserInputService_0 (copy)
    v6.keyboardVisibleChanged = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):connect(function() --[[ Line: 19 ]]
        -- upvalues: l_UserInputService_0 (ref), v6 (copy)
        local v7 = l_UserInputService_0.OnScreenKeyboardVisible and l_UserInputService_0.OnScreenKeyboardSize.Y or 0;
        v6:setState({
            onScreenKeyboardHeight = v7
        });
    end);
end;
v4.willUnmount = function(v8) --[[ Line: 29 ]] --[[ Name: willUnmount ]]
    if v8.keyboardVisibleChanged then
        v8.keyboardVisibleChanged:disconnect();
        v8.keyboardVisibleChanged = nil;
    end;
end;
v4.render = function(v9) --[[ Line: 36 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy)
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, -v9.state.onScreenKeyboardHeight), 
        Position = UDim2.new(0.5, 0, 0, 0), 
        AnchorPoint = Vector2.new(0.5, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = 1
    }, v9.props.Contents);
end;
return v4;