local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.React);
local _ = require(l_Parent_0.UnifiedLogging);
local _ = require(l_Parent_0.Foundation);
local _ = require(l_Parent_0.CollectionViews);
local _ = require(l_Parent_0.Signals);
local _ = require(l_script_FirstAncestor_0.SduiActionType);
local _ = require(l_script_FirstAncestor_0.SduiComponentType);
local _ = require(l_script_FirstAncestor_0.SduiErrors);
local _ = require(l_script_FirstAncestor_0.SduiConfigTypes);
local _ = require(l_script_FirstAncestor_0.SduiDataStoreTypes);
local _ = require(l_Parent_0.DataHydration);
return {
    SduiBuilderProcessingPhase = {
        Eager = "Eager", 
        Render = "Render", 
        Lazy = "Lazy"
    }
};