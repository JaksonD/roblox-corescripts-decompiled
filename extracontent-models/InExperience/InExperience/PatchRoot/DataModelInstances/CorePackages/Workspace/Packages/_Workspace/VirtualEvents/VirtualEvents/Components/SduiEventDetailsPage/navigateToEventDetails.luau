local l_Parent_0 = script:FindFirstAncestor("VirtualEvents").Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_SduiLoadTimer_0 = require(l_Parent_0.SduiSharedUtilities).SduiLoadTimer;
local v3 = require(script.Parent.fetchEventDetailsPage);
return function(v4, v5) --[[ Line: 15 ]] --[[ Name: navigateToEventDetails ]]
    -- upvalues: l_SduiLoadTimer_0 (copy), l_AppPage_0 (copy), v3 (copy)
    local v6 = l_SduiLoadTimer_0.createLoadTimer(l_AppPage_0.EventDetails);
    v6.start("navigate");
    v3(v5, v6);
    v4.navigate(l_AppPage_0.EventDetails, {
        extraProps = {
            eventId = v5, 
            pageTimer = v6
        }
    });
end;