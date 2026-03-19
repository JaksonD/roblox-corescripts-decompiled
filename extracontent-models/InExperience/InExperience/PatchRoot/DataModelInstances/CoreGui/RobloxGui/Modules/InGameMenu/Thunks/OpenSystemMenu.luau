local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Actions.SetMenuOpen);
local v3 = require(l_Parent_0.Utility.SendAnalytics);
local v4 = require(l_Parent_0.Resources.Constants);
local v5 = require(l_Parent_0.Actions.SetCurrentPage);
local v6 = require(l_Parent_0.Actions.SetMenuIconTooltipOpen);
return function(v7) --[[ Line: 10 ]]
    -- upvalues: l_GuiService_0 (copy), v2 (copy), v5 (copy), v4 (copy), v6 (copy), v3 (copy)
    return function(v8) --[[ Line: 11 ]]
        -- upvalues: l_GuiService_0 (ref), v2 (ref), v5 (ref), v4 (ref), v6 (ref), v3 (ref), v7 (copy)
        l_GuiService_0:SetMenuIsOpen(true, "InGameMenu");
        v8:dispatch(v2(true));
        v8:dispatch(v5(v4.MainPagePageKey));
        if v8:getState().nativeClosePrompt.menuIconTooltipOpen then
            v8:dispatch(v6(false));
        end;
        v3(v4.AnalyticsMenuOpenName, v4.AnalyticsMenuActionName, {
            source = v7
        });
    end;
end;