local l_GuiService_0 = game:GetService("GuiService");
return function() --[[ Line: 10 ]] --[[ Name: getGlobalGuiInset ]]
    -- upvalues: l_GuiService_0 (copy)
    local l_l_GuiService_0_GuiInset_0, v2 = l_GuiService_0:GetGuiInset();
    return {
        top = l_l_GuiService_0_GuiInset_0.Y, 
        left = l_l_GuiService_0_GuiInset_0.X, 
        bottom = v2.Y, 
        right = v2.X
    };
end;