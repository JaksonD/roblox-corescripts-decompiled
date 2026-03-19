local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script:FindFirstAncestor("Responsive").Parent;
local l_GetFFlagApplyResolutionScale_0 = require(l_Parent_0.SharedFlags).GetFFlagApplyResolutionScale;
getVirtualResolutionScale = function() --[[ Line: 8 ]] --[[ Name: getVirtualResolutionScale ]]
    -- upvalues: l_GetFFlagApplyResolutionScale_0 (copy), l_GuiService_0 (copy)
    if not l_GetFFlagApplyResolutionScale_0() then
        return nil;
    elseif l_GuiService_0:IsTenFootInterface() then
        return 1.5;
    else
        return 1;
    end;
end;
return getVirtualResolutionScale;