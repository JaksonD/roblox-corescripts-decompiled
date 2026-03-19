local l_MemStorageService_0 = game:GetService("MemStorageService");
return function(v1) --[[ Line: 3 ]]
    -- upvalues: l_MemStorageService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 4 ]]
        -- upvalues: l_MemStorageService_0 (ref), v1 (copy)
        return l_MemStorageService_0:GetItem(v1);
    end);
    if l_status_0 and l_result_0 and l_result_0 ~= "" then
        return l_result_0;
    else
        return nil;
    end;
end;