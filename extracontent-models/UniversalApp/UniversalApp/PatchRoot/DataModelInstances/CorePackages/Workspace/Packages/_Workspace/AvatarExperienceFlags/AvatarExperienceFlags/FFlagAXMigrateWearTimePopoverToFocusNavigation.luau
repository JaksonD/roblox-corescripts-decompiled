local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceFlags").Parent;
local v1 = require(script.Parent.FFlagAXDurablesSupport);
local l_FFlagAXMigrateAXFocusBehaviorRoot_0 = require(l_Parent_0.SharedFlags).FFlagAXMigrateAXFocusBehaviorRoot;
return game:DefineFastFlag("AXMigrateWearTimePopoverToFocusNavigation", false) and v1 and l_FFlagAXMigrateAXFocusBehaviorRoot_0;