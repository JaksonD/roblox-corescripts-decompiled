local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(script.Parent.Parent.EventType);
local l_VRHub_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).VRHub;
return {
    Name = "LeaveGameIconHighlightEvent", 
    StartEvent = function() --[[ Line: 16 ]] --[[ Name: StartEvent ]]
        -- upvalues: l_VRHub_0 (copy)
        l_VRHub_0:SetShowHighlightedLeaveGameIconToggled(true);
    end, 
    StopEvent = function() --[[ Line: 20 ]] --[[ Name: StopEvent ]]
        -- upvalues: l_VRHub_0 (copy)
        l_VRHub_0:SetShowHighlightedLeaveGameIconToggled(false);
    end
};