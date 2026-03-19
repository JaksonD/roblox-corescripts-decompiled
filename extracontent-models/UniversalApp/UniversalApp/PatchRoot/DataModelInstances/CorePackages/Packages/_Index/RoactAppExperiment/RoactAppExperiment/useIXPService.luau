local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoactAppExperiment");
local l_IXPService_0 = game:GetService("IXPService");
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(script.Parent.ExperimentContext);
return function() --[[ Line: 8 ]] --[[ Name: useIXPService ]]
    -- upvalues: v2 (copy), v3 (copy), l_IXPService_0 (copy)
    local v4 = v2.useContext(v3);
    if v4 then
        return v4;
    else
        return l_IXPService_0;
    end;
end;