local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(script.Parent.AdsEuDsaPromptHandler);
return function() --[[ Line: 9 ]] --[[ Name: starterScript ]]
    -- upvalues: v2 (copy), v3 (copy), l_CoreGui_0 (copy)
    v2.mount(v2.createElement(v3), l_CoreGui_0, "AdsEuDsaPromptHandler");
end;