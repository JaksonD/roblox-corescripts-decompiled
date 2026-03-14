local l_script_FirstAncestor_0 = script:FindFirstAncestor("SceneUnderstanding");
local _ = require(l_script_FirstAncestor_0.wiring.types);
return function(v2) --[[ Line: 7 ]] --[[ Name: getOutputWires ]]
    local v3 = {};
    for _, v5 in (v2:GetOutputPins()) do
        for _, v7 in v2:GetConnectedWires(v5) do
            table.insert(v3, v7);
        end;
    end;
    return v3;
end;