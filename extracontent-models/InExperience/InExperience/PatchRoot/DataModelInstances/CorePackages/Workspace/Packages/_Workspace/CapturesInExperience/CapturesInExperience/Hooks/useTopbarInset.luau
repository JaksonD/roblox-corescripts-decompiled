local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.ReactUtils);
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_Parent_0.React);
local l_useEventConnection_0 = v1.useEventConnection;
return function() --[[ Line: 11 ]]
    -- upvalues: v3 (copy), l_GuiService_0 (copy), l_useEventConnection_0 (copy)
    local v5, v6 = v3.useState(l_GuiService_0.TopbarInset);
    l_useEventConnection_0(l_GuiService_0:GetPropertyChangedSignal("TopbarInset"), function() --[[ Line: 14 ]]
        -- upvalues: v6 (copy), l_GuiService_0 (ref)
        v6(l_GuiService_0.TopbarInset);
    end);
    return v5;
end;