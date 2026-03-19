local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.React);
local l_useEventConnection_0 = require(l_Parent_0.ReactUtils).useEventConnection;
local l_useState_0 = v2.useState;
return function() --[[ Line: 12 ]] --[[ Name: useSystemMenuDetection ]]
    -- upvalues: l_useState_0 (copy), l_useEventConnection_0 (copy), l_GuiService_0 (copy)
    local v5, v6 = l_useState_0(false);
    l_useEventConnection_0(l_GuiService_0.MenuOpened, function() --[[ Line: 15 ]]
        -- upvalues: v6 (copy)
        v6(true);
    end);
    l_useEventConnection_0(l_GuiService_0.MenuClosed, function() --[[ Line: 19 ]]
        -- upvalues: v6 (copy)
        v6(false);
    end);
    return v5;
end;