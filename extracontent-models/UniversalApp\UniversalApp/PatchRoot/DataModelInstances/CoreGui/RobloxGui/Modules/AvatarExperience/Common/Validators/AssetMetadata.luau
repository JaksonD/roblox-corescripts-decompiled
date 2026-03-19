local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.t);
return v1.interface({
    version = v1.string, 
    order = v1.optional(v1.number), 
    type = v1.optional(v1.enum(Enum.AccessoryType)), 
    isLayered = v1.optional(v1.boolean)
});