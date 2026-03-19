local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utility.Wrappers);
local l_GuiService_0 = v2.Services.GuiService;
local l_UserInputService_0 = v2.Services.UserInputService;
local v5 = require(l_Parent_0.React);
return function(v6) --[[ Line: 11 ]] --[[ Name: useKeyboardAwareSize ]]
    -- upvalues: v5 (copy), l_UserInputService_0 (copy), l_GuiService_0 (copy)
    local v7, v8 = v5.useBinding(UDim2.fromScale(1, 1));
    v5.useLayoutEffect(function() --[[ Line: 14 ]]
        -- upvalues: v6 (copy), l_UserInputService_0 (ref), v8 (copy), l_GuiService_0 (ref), v7 (copy)
        if not v6 then
            return;
        else
            local function v13() --[[ Line: 19 ]] --[[ Name: updateSafeAreaSize ]]
                -- upvalues: l_UserInputService_0 (ref), v8 (ref), l_GuiService_0 (ref), v6 (ref), v7 (ref)
                if not l_UserInputService_0.OnScreenKeyboardVisible then
                    v8(UDim2.fromScale(1, 1));
                    return;
                else
                    local l_l_GuiService_0_GuiInset_0 = l_GuiService_0:GetGuiInset();
                    local v10 = l_UserInputService_0.OnScreenKeyboardPosition.Y - l_l_GuiService_0_GuiInset_0.Y;
                    local l_AbsoluteSize_0 = v6.AbsoluteSize;
                    local v12 = v6.AbsolutePosition.Y + l_AbsoluteSize_0.Y - v10;
                    v8(v7:getValue() - UDim2.fromOffset(0, v12));
                    return;
                end;
            end;
            v13();
            local v14 = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(v13);
            local v15 = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(v13);
            return function() --[[ Line: 44 ]]
                -- upvalues: v14 (copy), v15 (copy)
                v14:Disconnect();
                v15:Disconnect();
            end;
        end;
    end, {
        v6
    });
    return v7;
end;