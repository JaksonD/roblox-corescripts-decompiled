local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent;
local _ = require(script.Parent.Parent.Enums.Categories);
local _ = require(script.Parent.Parent.Enums.ScreenLayout);
local _ = require(script.Parent.Parent.Enums.ItemView);
local _ = require(script.Parent.Parent.Stores.createCategoryInventoryStore);
local _ = require(script.Parent.Parent.Stores.createSortAndFiltersStore);
return (require(l_Parent_0.React).createContext(nil));