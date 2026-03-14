local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.RoactGamepad);
return (require(l_CorePackages_0.Packages.Roact).createContext(v1.createRefCache()));