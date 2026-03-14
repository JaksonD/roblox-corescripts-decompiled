local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_Parent_0.AppCommonLib);
return function(v4) --[[ Line: 7 ]]
    -- upvalues: v3 (copy), l_GuiService_0 (copy), v1 (copy)
    if v3.IsVRAppBuild() or l_GuiService_0:IsTenFootInterface() then
        return v4;
    else
        return v1.createElement("ScreenGui", {
            Enabled = true, 
            ZIndexBehavior = Enum.ZIndexBehavior.Global, 
            DisplayOrder = 10, 
            IgnoreGuiInset = true
        }, {
            Component = v4
        });
    end;
end;