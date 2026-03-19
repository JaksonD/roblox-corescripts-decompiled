local l_Parent_0 = script:FindFirstAncestor("AccountRecovery").Parent;
local v1 = require(l_Parent_0.React);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
return function() --[[ Line: 9 ]] --[[ Name: useClearFocusOnUnmount ]]
    -- upvalues: v1 (copy), l_UserInputService_0 (copy), l_GuiService_0 (copy)
    return v1.useEffect(function() --[[ Line: 10 ]]
        -- upvalues: l_UserInputService_0 (ref), l_GuiService_0 (ref)
        return function() --[[ Line: 11 ]]
            -- upvalues: l_UserInputService_0 (ref), l_GuiService_0 (ref)
            local l_l_UserInputService_0_FocusedTextBox_0 = l_UserInputService_0:GetFocusedTextBox();
            if l_l_UserInputService_0_FocusedTextBox_0 then
                l_l_UserInputService_0_FocusedTextBox_0:ReleaseFocus();
            end;
            if l_GuiService_0.SelectedObject ~= nil then
                l_GuiService_0.SelectedObject = nil;
            end;
        end;
    end, {});
end;