local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = {};
local v4 = v2.interface({
    bundleId = v2.number, 
    userOutfitId = v2.number
});
v3.new = function() --[[ Line: 20 ]] --[[ Name: new ]]
    return {
        bundleId = "", 
        userOutfitId = ""
    };
end;
v3.mock = function() --[[ Line: 27 ]] --[[ Name: mock ]]
    -- upvalues: v3 (copy)
    local v5 = v3.new();
    v5.bundleId = "23452";
    v5.userOutfitId = "65234";
    return v5;
end;
v3.fromData = function(v6) --[[ Line: 36 ]] --[[ Name: fromData ]]
    -- upvalues: v3 (copy), v4 (copy), v1 (copy)
    local v7 = v3.new();
    local v8, v9 = v4(v6);
    if v8 then
        v7.bundleId = tostring(v6.bundleId);
        v7.userOutfitId = tostring(v6.userOutfitId);
        return v7;
    else
        v1.assert(false, v9);
        return v7;
    end;
end;
return v3;