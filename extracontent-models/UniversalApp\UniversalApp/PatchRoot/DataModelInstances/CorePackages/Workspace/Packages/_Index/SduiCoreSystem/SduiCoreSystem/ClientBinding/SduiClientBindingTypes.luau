local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.ServiceContractsProto);
local _ = require(l_Parent_0.Signals);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local _ = require(l_script_FirstAncestor_0.SduiActionType);
local _ = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBindingContentType);
return {
    PropResultCategory = {
        Literal = "Literal", 
        PropSignal = "PropSignal", 
        NestedComponentConfig = "NestedComponentConfig", 
        Failed = "Failed"
    }
};