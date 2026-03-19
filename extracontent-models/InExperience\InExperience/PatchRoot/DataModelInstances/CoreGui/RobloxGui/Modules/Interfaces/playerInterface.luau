local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.t);
return v1.union(v1.instanceIsA("Player"), v1.interface({
    UserId = v1.integer, 
    Name = v1.string, 
    DisplayName = v1.string
}));