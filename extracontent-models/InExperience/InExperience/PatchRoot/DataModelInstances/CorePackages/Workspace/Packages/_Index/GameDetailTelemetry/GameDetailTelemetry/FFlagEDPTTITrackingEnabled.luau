local l_Parent_0 = script:FindFirstAncestor("GameDetailTelemetry").Parent;
local l_FFlagAXTTIEnableMilestones_0 = require(l_Parent_0.SharedFlags).FFlagAXTTIEnableMilestones;
return game:DefineFastFlag("EDPTTITrackingEnabled", false) and l_FFlagAXTTIEnableMilestones_0;