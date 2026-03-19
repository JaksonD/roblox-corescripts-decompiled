local l_MemStorageService_0 = game:GetService("MemStorageService");
return function(v1, v2) --[[ Line: 6 ]]
    -- upvalues: l_MemStorageService_0 (copy)
    if v2 == nil then
        return;
    elseif l_MemStorageService_0:HasItem(v1) then
        return;
    else
        l_MemStorageService_0:SetItem(v1, "true");
        v2();
        return;
    end;
end;