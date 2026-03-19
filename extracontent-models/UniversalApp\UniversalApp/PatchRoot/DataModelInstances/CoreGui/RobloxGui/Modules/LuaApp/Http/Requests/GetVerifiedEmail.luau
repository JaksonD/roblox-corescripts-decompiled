local l_CorePackages_0 = game:GetService("CorePackages");
local l_UrlBuilder_0 = require(l_CorePackages_0.Packages.UrlBuilder).UrlBuilder;
return function(v2) --[[ Line: 15 ]]
    -- upvalues: l_UrlBuilder_0 (copy)
    return v2(l_UrlBuilder_0.static.email.getSetEmail(), "GET");
end;