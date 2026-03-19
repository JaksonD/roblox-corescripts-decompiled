local l_HttpService_0 = game:GetService("HttpService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
return {
    getTableAppStorageKey = function(v2) --[[ Line: 4 ]] --[[ Name: getTableAppStorageKey ]]
        -- upvalues: l_AppStorageService_0 (copy), l_HttpService_0 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 5 ]]
            -- upvalues: l_AppStorageService_0 (ref), v2 (copy)
            return l_AppStorageService_0:GetItem(v2);
        end);
        if not l_status_0 or l_result_0 == nil then
            return {};
        else
            return l_HttpService_0:JSONDecode(l_result_0);
        end;
    end, 
    setTableAppStorageKey = function(v5, v6) --[[ Line: 16 ]] --[[ Name: setTableAppStorageKey ]]
        -- upvalues: l_AppStorageService_0 (copy)
        pcall(function() --[[ Line: 17 ]]
            -- upvalues: l_AppStorageService_0 (ref), v5 (copy), v6 (copy)
            l_AppStorageService_0:SetItem(v5, (tostring(v6)));
            l_AppStorageService_0:Flush();
        end);
    end
};