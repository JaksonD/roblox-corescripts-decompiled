local l_Parent_0 = script.Parent.Parent.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_Parent_0.React);
local l_useEventConnection_0 = require(l_Parent_0.ReactUtils).useEventConnection;
local function _() --[[ Line: 12 ]]
    -- upvalues: l_GuiService_0 (copy)
    local l_l_GuiService_0_GuiInset_0, v6 = l_GuiService_0:GetGuiInset();
    return {
        bottom = v6.Y, 
        left = l_l_GuiService_0_GuiInset_0.X, 
        right = v6.X, 
        top = l_l_GuiService_0_GuiInset_0.Y
    };
end;
return function() --[[ Line: 22 ]]
    -- upvalues: v3 (copy), l_GuiService_0 (copy), l_useEventConnection_0 (copy), l_UserInputService_0 (copy)
    local l_useState_0 = v3.useState;
    local l_l_GuiService_0_GuiInset_1, v10 = l_GuiService_0:GetGuiInset();
    local v11;
    l_useState_0, v11 = l_useState_0({
        bottom = v10.Y, 
        left = l_l_GuiService_0_GuiInset_1.X, 
        right = v10.X, 
        top = l_l_GuiService_0_GuiInset_1.Y
    });
    l_l_GuiService_0_GuiInset_1 = function() --[[ Line: 25 ]]
        -- upvalues: v11 (copy), l_GuiService_0 (ref)
        local l_v11_0 = v11;
        local l_l_GuiService_0_GuiInset_2, v14 = l_GuiService_0:GetGuiInset();
        l_v11_0({
            bottom = v14.Y, 
            left = l_l_GuiService_0_GuiInset_2.X, 
            right = v14.X, 
            top = l_l_GuiService_0_GuiInset_2.Y
        });
    end;
    l_useEventConnection_0(l_GuiService_0.SafeZoneOffsetsChanged, l_l_GuiService_0_GuiInset_1);
    l_useEventConnection_0(l_UserInputService_0:GetPropertyChangedSignal("BottomBarSize"), l_l_GuiService_0_GuiInset_1);
    l_useEventConnection_0(l_UserInputService_0:GetPropertyChangedSignal("RightBarSize"), l_l_GuiService_0_GuiInset_1);
    return l_useState_0;
end;