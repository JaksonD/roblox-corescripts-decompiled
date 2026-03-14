local l_ContentProvider_0 = game:GetService("ContentProvider");
local v1 = string.gsub(l_ContentProvider_0.BaseUrl:lower(), "/m.", "/www.");
return function() --[[ Line: 4 ]] --[[ Name: getRobuxStoreUrl ]]
    -- upvalues: v1 (copy)
    return ("%sUpgrades/Robux.aspx"):format(v1);
end;