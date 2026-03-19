local l_CoreGui_0 = game:GetService("CoreGui");
return function(v1) --[[ Line: 4 ]]
    -- upvalues: l_CoreGui_0 (copy)
    local l_l_CoreGui_0_GuiObjectsAtPosition_0 = l_CoreGui_0:GetGuiObjectsAtPosition(v1.X, v1.Y);
    if #l_l_CoreGui_0_GuiObjectsAtPosition_0 == 0 then
        return nil;
    else
        local v3 = 1;
        local v4 = nil;
        local v5 = -1;
        local v6 = nil;
        local v7 = -1;
        local v8 = nil;
        while true do
            if v3 <= #l_l_CoreGui_0_GuiObjectsAtPosition_0 then
                v8 = l_l_CoreGui_0_GuiObjectsAtPosition_0[v3];
                if not v8.Visible or not v8:IsA("ScrollingFrame") then
                    if v8.Selectable then
                        if not v6 then
                            v6 = v8;
                            v7 = v3;
                            if not v4 or v8:IsAncestorOf(v4) then
                                return v6;
                            end;
                        end;
                    elseif v8:IsA("TextLabel") and not v4 then
                        v4 = v8;
                        v5 = v3;
                    end;
                end;
                v3 = v3 + 1;
                if v8.Interactable and v8.Active then
                    v3 = #l_l_CoreGui_0_GuiObjectsAtPosition_0 + 1;
                end;
            elseif v5 > 0 and v7 > 0 then
                if v5 < v7 then
                    return v4;
                else
                    return v6;
                end;
            elseif v4 or v6 then
                return v4 or v6;
            else
                return nil;
            end;
        end;
    end;
end;