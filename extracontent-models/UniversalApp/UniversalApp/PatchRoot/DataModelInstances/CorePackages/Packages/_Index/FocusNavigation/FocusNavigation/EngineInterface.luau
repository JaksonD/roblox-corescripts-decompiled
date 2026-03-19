local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent;
local l_mockableWarn_0 = require(l_Parent_0.FocusNavigationUtils).mockableWarn;
local _ = require(script.Parent.types);
local l_status_0, l_result_0 = pcall(function() --[[ Line: 13 ]]
    -- upvalues: l_GuiService_0 (copy)
    return l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject");
end);
local l_status_1, l_result_1 = pcall(function() --[[ Line: 17 ]]
    return game:GetService("CoreGui");
end);
local v9 = {
    Connect = function() --[[ Line: 23 ]] --[[ Name: Connect ]]
        error("Could not access SelectedCoreObject signal; you may not have the correct permissions");
    end
};
local v11 = {
    getSelection = function() --[[ Line: 30 ]] --[[ Name: getSelection ]]
        -- upvalues: l_GuiService_0 (copy)
        return l_GuiService_0.SelectedCoreObject;
    end, 
    setSelection = function(v10) --[[ Line: 33 ]] --[[ Name: setSelection ]]
        -- upvalues: l_status_1 (copy), l_result_1 (copy), l_mockableWarn_0 (copy), l_GuiService_0 (copy)
        if _G.__DEV__ and l_status_1 and v10 ~= nil and not v10:IsDescendantOf(l_result_1) then
            l_mockableWarn_0(string.format("Attempting to focus non-CoreGui descendant '%s' from a CoreGui FocusNavigationService instance. Consider creating this FocusNavigationService with `FocusNavigation.EnginInterface.PlayerGui` instead", v10:GetFullName()));
        end;
        if v10 and not v10.Selectable then
            l_GuiService_0:Select(v10);
            return;
        else
            l_GuiService_0.SelectedCoreObject = v10;
            return;
        end;
    end, 
    SelectionChanged = if l_status_0 then l_result_0 else v9, 
    InputBegan = l_UserInputService_0.InputBegan, 
    InputChanged = l_UserInputService_0.InputChanged, 
    InputEnded = l_UserInputService_0.InputEnded, 
    LastInputTypeChanged = l_UserInputService_0.LastInputTypeChanged
};
local v13 = {
    getSelection = function() --[[ Line: 60 ]] --[[ Name: getSelection ]]
        -- upvalues: l_GuiService_0 (copy)
        return l_GuiService_0.SelectedObject;
    end, 
    setSelection = function(v12) --[[ Line: 63 ]] --[[ Name: setSelection ]]
        -- upvalues: l_status_1 (copy), l_result_1 (copy), l_mockableWarn_0 (copy), l_GuiService_0 (copy)
        if _G.__DEV__ and l_status_1 and v12 ~= nil and v12:IsDescendantOf(l_result_1) then
            l_mockableWarn_0(string.format("Attempting to focus CoreGui descendant '%s' from a non-CoreGui FocusNavigationService instance.Consider creating this FocusNavigationService with `FocusNavigation.EnginInterface.CoreGui` instead", v12:GetFullName()));
        end;
        if v12 and not v12.Selectable then
            l_GuiService_0:Select(v12);
            return;
        else
            l_GuiService_0.SelectedObject = v12;
            return;
        end;
    end, 
    SelectionChanged = l_GuiService_0:GetPropertyChangedSignal("SelectedObject"), 
    InputBegan = l_UserInputService_0.InputBegan, 
    InputChanged = l_UserInputService_0.InputChanged, 
    InputEnded = l_UserInputService_0.InputEnded, 
    LastInputTypeChanged = l_UserInputService_0.LastInputTypeChanged
};
return {
    CoreGui = v11, 
    PlayerGui = v13
};