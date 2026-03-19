local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
local _ = require(script.Parent.MessageFtuxTooltipVariant);
local v3 = {
    dismissed = l_Signal_0.new()
};
v3.dismiss = function(v4) --[[ Line: 17 ]] --[[ Name: dismiss ]]
    -- upvalues: v3 (copy)
    v3.dismissed:fire(v4);
end;
return v3;