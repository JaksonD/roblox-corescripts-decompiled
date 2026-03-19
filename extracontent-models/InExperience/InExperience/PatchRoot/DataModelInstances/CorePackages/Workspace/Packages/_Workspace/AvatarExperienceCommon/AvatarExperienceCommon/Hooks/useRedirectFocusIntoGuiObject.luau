local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v2 = require(l_Parent_0.React);
local function _(v3) --[[ Line: 7 ]] --[[ Name: getSelectionIsOutsideGuiObject ]]
    -- upvalues: l_GuiService_0 (copy)
    return l_GuiService_0.SelectedCoreObject and not l_GuiService_0.SelectedCoreObject:IsDescendantOf(v3) and not (l_GuiService_0.SelectedCoreObject == v3);
end;
return function(v5) --[[ Line: 30 ]] --[[ Name: useRedirectFocusIntoGuiObject ]]
    -- upvalues: v2 (copy), l_GuiService_0 (copy)
    v2.useEffect(function() --[[ Line: 31 ]]
        -- upvalues: v5 (copy), l_GuiService_0 (ref)
        local l_current_0 = v5.current;
        if l_current_0 then
            if l_GuiService_0.SelectedCoreObject and not l_GuiService_0.SelectedCoreObject:IsDescendantOf(l_current_0) and not (l_GuiService_0.SelectedCoreObject == l_current_0) then
                l_current_0.Selectable = true;
            else
                l_current_0.Selectable = false;
            end;
        end;
        local v9 = l_GuiService_0.Changed:Connect(function(v7) --[[ Line: 45 ]]
            -- upvalues: v5 (ref), l_GuiService_0 (ref)
            if v7 == "SelectedCoreObject" then
                local l_current_1 = v5.current;
                if l_current_1 then
                    if l_GuiService_0.SelectedCoreObject and not l_GuiService_0.SelectedCoreObject:IsDescendantOf(l_current_1) and not (l_GuiService_0.SelectedCoreObject == l_current_1) then
                        l_current_1.Selectable = true;
                        return;
                    elseif l_GuiService_0.SelectedCoreObject == l_current_1 then
                        l_current_1.Selectable = false;
                        l_GuiService_0:Select(l_current_1);
                        return;
                    elseif l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject:IsDescendantOf(l_current_1) then
                        l_current_1.Selectable = false;
                    end;
                end;
            end;
        end);
        return function() --[[ Line: 68 ]]
            -- upvalues: v9 (copy)
            return v9:Disconnect();
        end;
    end, {});
end;