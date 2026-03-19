local _ = require(script.Parent.VersionedApi);
return function(v1, v2, v3, v4) --[[ Line: 3 ]] --[[ Name: validateVersionedApi ]]
    if not next(v2) then
        return true, "";
    else
        local v5 = getmetatable(v2);
        if not v5 then
            return false, (("could not find api version data for %*"):format(v1));
        else
            local l__minAppVersion_0 = v5._minAppVersion;
            if not l__minAppVersion_0 then
                return false, (("could not find the minimum app version for api %*"):format(v1));
            elseif not v3 or v3 < l__minAppVersion_0 then
                return false, (("%* requires version %* or higher.  Given version is %*"):format(v1, l__minAppVersion_0, v3));
            elseif l__minAppVersion_0 == v3 and v4 then
                return false, (("%* requires a version higher than %*.  Given version is %*"):format(v1, l__minAppVersion_0, v3));
            else
                return true, "";
            end;
        end;
    end;
end;