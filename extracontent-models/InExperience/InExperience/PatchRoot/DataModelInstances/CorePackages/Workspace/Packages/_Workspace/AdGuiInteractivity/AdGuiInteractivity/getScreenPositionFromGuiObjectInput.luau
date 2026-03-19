local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AdGuiInteractivity");
local v2 = require(l_script_FirstAncestor_0.guiPositionToScreenPosition);
return function(v3, v4) --[[ Line: 7 ]]
    -- upvalues: l_GuiService_0 (copy), v2 (copy)
    local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
    if not l_CurrentCamera_0 then
        return Vector2.zero;
    else
        local l_v3_FirstAncestorWhichIsA_0 = v3:FindFirstAncestorWhichIsA("LayerCollector");
        if l_v3_FirstAncestorWhichIsA_0 then
            local v7 = v3.AbsolutePosition + v3.AbsoluteSize / 2;
            local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
            local v10 = Vector2.new(v4.Position.X, v4.Position.Y);
            local v11 = v2(l_v3_FirstAncestorWhichIsA_0, if v10 ~= Vector2.zero then v10 + l_l_GuiService_0_GuiInset_0 else v7, l_CurrentCamera_0);
            if v11 then
                return v11;
            end;
        end;
        return l_CurrentCamera_0.ViewportSize / 2;
    end;
end;