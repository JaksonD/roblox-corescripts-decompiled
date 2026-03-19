local l_CorePackages_0 = game:GetService("CorePackages");
local l_FFlagAXTimedOptionsSalesTypeFilter_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXTimedOptionsSalesTypeFilter;
return {
    All = "All", 
    Collectibles = "Collectibles", 
    Premium = "Premium", 
    TimedOptions = l_FFlagAXTimedOptionsSalesTypeFilter_0 and "TimedOptions" or nil
};