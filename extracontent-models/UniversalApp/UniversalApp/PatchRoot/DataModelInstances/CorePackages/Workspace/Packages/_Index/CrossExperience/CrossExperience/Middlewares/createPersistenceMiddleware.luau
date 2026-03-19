local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_HttpService_0 = game:GetService("HttpService");
return function(v2) --[[ Line: 8 ]]
    -- upvalues: l_MemStorageService_0 (copy), l_HttpService_0 (copy)
    local v12 = {
        persist = function(_, v4) --[[ Line: 10 ]] --[[ Name: persist ]]
            -- upvalues: l_MemStorageService_0 (ref), v2 (copy), l_HttpService_0 (ref)
            local l_status_0, _ = pcall(function() --[[ Line: 11 ]]
                -- upvalues: l_MemStorageService_0 (ref), v2 (ref), l_HttpService_0 (ref), v4 (copy)
                l_MemStorageService_0:SetItem(v2.storeKey, l_HttpService_0:JSONEncode(v4));
            end);
            if not l_status_0 then
                print("PersistenceMiddleware - failed to update the store", v2.storeKey);
            end;
            return l_status_0;
        end, 
        restore = function() --[[ Line: 19 ]] --[[ Name: restore ]]
            -- upvalues: l_MemStorageService_0 (ref), v2 (copy), l_HttpService_0 (ref)
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 20 ]]
                -- upvalues: l_MemStorageService_0 (ref), v2 (ref), l_HttpService_0 (ref)
                local l_l_MemStorageService_0_Item_0 = l_MemStorageService_0:GetItem(v2.storeKey);
                if l_l_MemStorageService_0_Item_0 and l_l_MemStorageService_0_Item_0 ~= "" then
                    return l_HttpService_0:JSONDecode(l_l_MemStorageService_0_Item_0);
                else
                    return nil;
                end;
            end);
            if l_status_1 then
                return l_result_1;
            else
                return nil;
            end;
        end, 
        clean = function() --[[ Line: 32 ]] --[[ Name: clean ]]
            -- upvalues: l_MemStorageService_0 (ref), v2 (copy)
            local l_status_2, _ = pcall(function() --[[ Line: 33 ]]
                -- upvalues: l_MemStorageService_0 (ref), v2 (ref)
                l_MemStorageService_0:SetItem(v2.storeKey, "");
            end);
            if not l_status_2 then
                print("PersistenceMiddleware - failed to clean the store", v2.storeKey);
            end;
            return l_status_2;
        end
    };
    v12.getMiddleware = function(_) --[[ Line: 43 ]]
        -- upvalues: v12 (copy)
        return function(v14, v15) --[[ Line: 44 ]]
            -- upvalues: v12 (ref)
            v15.changed:connect(function(v16, _) --[[ Line: 47 ]]
                -- upvalues: v12 (ref), v15 (copy)
                v12.persist(v15, v16);
            end);
            return function(v18) --[[ Line: 50 ]]
                -- upvalues: v14 (copy)
                return v14(v18);
            end;
        end;
    end;
    return v12;
end;