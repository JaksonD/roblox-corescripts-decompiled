local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_script_FirstAncestor_0.Hooks.usePositionOffsetForVirtualKeyboard);
local v4 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
return function(v6) --[[ Line: 16 ]]
    -- upvalues: l_useSelector_0 (copy), v3 (copy), v4 (copy), l_UserInputService_0 (copy)
    local v8 = l_useSelector_0(function(v7) --[[ Line: 17 ]]
        if v7.GlobalGuiInset then
            return v7.GlobalGuiInset.top;
        else
            return 0;
        end;
    end);
    local v9 = if v6.parentViewRef then v6.parentViewRef.current else nil;
    local v10 = v3({
        isNearBottomOfScreen = true
    });
    local v12 = v4.useCallback(function() --[[ Line: 23 ]]
        -- upvalues: l_UserInputService_0 (ref), v10 (copy), v9 (copy), v8 (copy), v6 (copy)
        local v11 = 0;
        if l_UserInputService_0.OnScreenKeyboardVisible then
            if v10 ~= nil then
                v11 = v10;
            elseif v9 then
                v11 = v9.AbsolutePosition.Y + v9.AbsoluteSize.Y - (l_UserInputService_0.OnScreenKeyboardPosition.Y - v8);
            end;
        end;
        if v6.onKeyboardOffsetChanged then
            v6.onKeyboardOffsetChanged(v11);
        end;
    end, {
        v10, 
        v8, 
        v6.onKeyboardOffsetChanged, 
        v9
    });
    v4.useEffect(function() --[[ Line: 40 ]]
        -- upvalues: v12 (copy), l_UserInputService_0 (ref), v9 (copy)
        v12();
        local v13 = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(v12);
        local v14 = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(v12);
        local v15 = nil;
        if v9 then
            v15 = v9:GetPropertyChangedSignal("AbsoluteSize"):Connect(v12);
        end;
        return function() --[[ Line: 53 ]]
            -- upvalues: v13 (copy), v14 (copy), v15 (ref)
            if v13 then
                v13:Disconnect();
            end;
            if v14 then
                v14:Disconnect();
            end;
            if v15 then
                v15:Disconnect();
            end;
        end;
    end, {
        v12, 
        v9
    });
    return nil;
end;