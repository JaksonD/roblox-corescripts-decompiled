local v0 = {
    None = "0", 
    All = "1", 
    Partial = "2"
};
local v1 = {
    PackagesByPatch = {}
};
v1.AddPackageStatus = function(v2, v3, v4) --[[ Line: 13 ]] --[[ Name: AddPackageStatus ]]
    -- upvalues: v1 (copy)
    if not v2 then
        return;
    elseif not v3 then
        return;
    else
        if not v1.PackagesByPatch[v2] then
            v1.PackagesByPatch[v2] = {};
        end;
        v1.PackagesByPatch[v2][v3] = v4 or false;
        return;
    end;
end;
v1.AllPatchPackagesLoaded = function(v5) --[[ Line: 29 ]] --[[ Name: AllPatchPackagesLoaded ]]
    -- upvalues: v1 (copy), v0 (copy)
    if not v5 then
        return nil;
    else
        local v6 = v1.PackagesByPatch[v5];
        if not v6 then
            return nil;
        else
            local v7 = 0;
            local v8 = 0;
            for _, v10 in v6 do
                if v10 then
                    v7 = v7 + 1;
                else
                    v8 = v8 + 1;
                end;
            end;
            if v7 == 0 then
                return v0.None;
            elseif v8 == 0 then
                assert(v7 > 0, "Success <=0, should be impossible");
                return v0.All;
            else
                assert(v7 > 0, "Success <=0, should be impossible");
                assert(v8 > 0, "Failed <= 0, should be impossible");
                return v0.Partial;
            end;
        end;
    end;
end;
return v1;