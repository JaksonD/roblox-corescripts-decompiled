local l_Parent_0 = script:FindFirstAncestor("DataHydration").Parent;
local _ = require(l_Parent_0.Signals);
return {
    DataStatus = {
        NotReady = "NotReady", 
        Ready = "Ready", 
        Failed = "Failed"
    }
};