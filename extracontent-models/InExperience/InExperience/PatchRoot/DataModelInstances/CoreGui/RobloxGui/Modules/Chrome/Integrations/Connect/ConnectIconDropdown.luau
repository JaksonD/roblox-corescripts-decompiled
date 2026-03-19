local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local v1 = require(l_script_FirstAncestor_0.Service);
local v2 = require(script.Parent.registerConnectIntegration);
local v3 = require(script.Parent.isConnectDropdownEnabled);
local v4 = nil;
if v3() then
    v4 = v2("connect_dropdown", v1.AvailabilitySignal.Available);
end;
return v4;