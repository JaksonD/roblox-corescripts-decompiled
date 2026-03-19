local v0 = require(script.Parent.contactImporterModalInfo);
return function(v1) --[[ Line: 14 ]]
    -- upvalues: v0 (copy)
    local l_appStorageService_0 = v1.appStorageService;
    local l_userid_0 = v1.userid;
    if v0:isUserOptedInLocalStorage(l_appStorageService_0, l_userid_0) then
        return false;
    else
        return v0:shouldUserSeeModalPotentiallyAgain(l_appStorageService_0, l_userid_0);
    end;
end;