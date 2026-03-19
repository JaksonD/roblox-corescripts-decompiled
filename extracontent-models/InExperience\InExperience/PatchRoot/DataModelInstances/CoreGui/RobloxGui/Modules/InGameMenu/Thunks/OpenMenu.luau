local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Actions.SetMenuOpen);
local v3 = require(l_Parent_0.Utility.SendAnalytics);
local v4 = require(l_Parent_0.Resources.Constants);
local v5 = require(l_Parent_0.Actions.SetCurrentPage);
local v6 = {
    v4.ReportDialogKey
};
return function(v7, v8) --[[ Line: 14 ]]
    -- upvalues: v4 (copy), v6 (copy), l_GuiService_0 (copy), v2 (copy), v5 (copy), v3 (copy)
    return function(v9) --[[ Line: 15 ]]
        -- upvalues: v8 (ref), v4 (ref), v6 (ref), l_GuiService_0 (ref), v2 (ref), v5 (ref), v3 (ref), v7 (copy)
        if not v8 then
            v8 = v4.defaultPageKey;
        end;
        if not table.find(v6, v8) then
            if v8 ~= v4.InitalPageKey then
                l_GuiService_0:SetMenuIsOpen(true, "InGameMenu");
            end;
            v9:dispatch(v2(true));
            v9:dispatch(v5(v8));
        end;
        v3(v4.AnalyticsMenuOpenName, v4.AnalyticsMenuActionName, {
            source = v7
        });
    end;
end;