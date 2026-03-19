local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_VRService_0 = game:GetService("VRService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Parent_0 = script.Parent.Parent;
local l_Actions_0 = l_Parent_0.Actions;
local l_Parent_1 = l_Parent_0.Parent;
local l_EventStream_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventStream;
local v8 = require(l_Parent_0.Analytics);
local v9 = require(l_Parent_1.BackpackScript);
local v10 = require(l_Actions_0.ShowMenu);
local v11 = v8.new():withEventStream(l_EventStream_0.new(l_RbxAnalyticsService_0));
return function(_) --[[ Line: 21 ]] --[[ Name: OpenMenu ]]
    -- upvalues: l_GuiService_0 (copy), l_VRService_0 (copy), v9 (copy), v11 (copy), v10 (copy)
    return function(v13) --[[ Line: 22 ]]
        -- upvalues: l_GuiService_0 (ref), l_VRService_0 (ref), v9 (ref), v11 (ref), v10 (ref)
        if l_GuiService_0.MenuIsOpen then
            if l_VRService_0.VREnabled then
                l_GuiService_0:SetMenuIsOpen(false, "VRMenu");
            else
                return;
            end;
        end;
        if v9.IsOpen then
            v9.OpenClose();
        end;
        if v9.IsOpen then
            return;
        else
            v11:onMenuOpened();
            v13:dispatch(v10());
            return;
        end;
    end;
end;