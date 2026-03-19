local l_Parent_0 = script.Parent.Parent;
local l_ReactCurrentBatchConfig_0 = require(l_Parent_0.Shared).ReactSharedInternals.ReactCurrentBatchConfig;
return {
    NoTransition = 0, 
    requestCurrentTransition = function() --[[ Line: 20 ]] --[[ Name: requestCurrentTransition ]]
        -- upvalues: l_ReactCurrentBatchConfig_0 (copy)
        return l_ReactCurrentBatchConfig_0.transition;
    end
};