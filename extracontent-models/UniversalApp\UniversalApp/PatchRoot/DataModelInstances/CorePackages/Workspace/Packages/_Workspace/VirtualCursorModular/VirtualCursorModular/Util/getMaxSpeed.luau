local l_Parent_0 = script.Parent.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local v2 = require(l_Parent_0.Properties);
return function() --[[ Line: 8 ]] --[[ Name: getMaxSpeed ]]
    -- upvalues: l_GuiService_0 (copy), v2 (copy)
    return l_GuiService_0:GetScreenResolution().Magnitude * v2.MaxSpeedRelative;
end;