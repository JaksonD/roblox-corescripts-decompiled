local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Responsive);
local l_useFocusGuiObject_0 = require(l_Parent_0.ReactFocusNavigation).useFocusGuiObject;
local v6 = v4.GetInputModeStore(false);
return function(v7, v8) --[[ Line: 20 ]] --[[ Name: useFocusOnMountEffect ]]
    -- upvalues: l_useFocusGuiObject_0 (copy), v4 (copy), v3 (copy), v6 (copy), l_UserInputService_0 (copy), l_GuiService_0 (copy)
    local v9 = l_useFocusGuiObject_0();
    local v10 = v4.useIsSpatial();
    v3.useEffect(function() --[[ Line: 24 ]]
        -- upvalues: v8 (copy), v6 (ref), v4 (ref), l_UserInputService_0 (ref), v7 (copy), v9 (copy), v10 (copy), l_GuiService_0 (ref)
        local v11 = if v8 then v8 else 0;
        local v16 = task.delay(v11, function() --[[ Line: 26 ]]
            -- upvalues: v6 (ref), v4 (ref), l_UserInputService_0 (ref), v7 (ref), v9 (ref), v10 (ref), l_GuiService_0 (ref)
            local v12 = v6.getLastInputType(false) == v4.Input.Directional;
            local v13 = l_UserInputService_0.PreferredInput == Enum.PreferredInput.Gamepad or v12;
            if v7.current and v13 and v9 and not v10 then
                local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
                local v15 = true;
                if l_SelectedCoreObject_0 ~= v7.current then
                    v15 = l_SelectedCoreObject_0 and l_SelectedCoreObject_0:IsDescendantOf(v7.current);
                end;
                if not v15 and v7.current:IsDescendantOf(game) then
                    v9(v7.current);
                end;
            end;
        end);
        return function() --[[ Line: 42 ]]
            -- upvalues: v16 (copy)
            task.cancel(v16);
        end;
    end, {});
end;