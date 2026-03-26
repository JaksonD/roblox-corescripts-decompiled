local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AdGuiInteractivity");
local v2 = require(l_script_FirstAncestor_0.guiPositionToScreenPosition);
local v3 = game:DefineFastFlag("UseCorrectInsetForAdDisclosureMenu", false);
return function(v4, v5) --[[ Line: 9 ]]
    -- upvalues: v3 (copy), l_GuiService_0 (copy), v2 (copy)
    local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
    if not l_CurrentCamera_0 then
        return Vector2.zero;
    else
        local l_v4_FirstAncestorWhichIsA_0 = v4:FindFirstAncestorWhichIsA("LayerCollector");
        if l_v4_FirstAncestorWhichIsA_0 then
            local v8 = v4.AbsolutePosition + v4.AbsoluteSize / 2;
            local v9 = nil;
            v9 = if v3 then -l_GuiService_0:GetInsetArea(Enum.ScreenInsets.None).Min else l_GuiService_0:GetGuiInset();
            local v10 = Vector2.new(v5.Position.X, v5.Position.Y);
            local v11 = v2(l_v4_FirstAncestorWhichIsA_0, if v10 ~= Vector2.zero then v10 + v9 else v8, l_CurrentCamera_0);
            if v11 then
                return v11;
            end;
        end;
        return l_CurrentCamera_0.ViewportSize / 2;
    end;
end;