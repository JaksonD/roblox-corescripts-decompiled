local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(script.Parent.Parent.EventType);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(script.Parent.Parent.Parent.Components.Tooltips.VRFTUXToolTips);
local v5 = require(script.Parent.Parent.Parent.Parent.Common.renderWithCoreScriptsStyleProvider);
local v6 = {
    Name = "PerspectiveTooltipEvent"
};
local v7 = nil;
v6.StartEvent = function() --[[ Line: 27 ]] --[[ Name: StartEvent ]]
    -- upvalues: v3 (copy), v4 (copy), v5 (copy), v7 (ref), l_CoreGui_0 (copy)
    local v8 = v3.createElement(v4, {
        tooltipButtons = {
            {
                Text = "Press", 
                Controller = Enum.UserCFrame.RightHand, 
                ButtonKeycode = Enum.KeyCode.ButtonR3
            }
        }
    });
    local v9 = v5({
        v8
    });
    v7 = v3.mount(v9, l_CoreGui_0:FindFirstChild("FTUXMenu"), "PerspectiveTooltip");
end;
v6.StopEvent = function() --[[ Line: 48 ]] --[[ Name: StopEvent ]]
    -- upvalues: v7 (ref), v3 (copy)
    if v7 then
        v3.unmount(v7);
    end;
end;
return v6;