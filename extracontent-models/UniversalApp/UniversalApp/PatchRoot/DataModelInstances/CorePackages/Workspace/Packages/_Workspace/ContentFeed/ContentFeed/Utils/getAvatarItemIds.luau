local l_HttpService_0 = game:GetService("HttpService");
return function(v1) --[[ Line: 3 ]]
    -- upvalues: l_HttpService_0 (copy)
    if not v1 then
        return nil;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 8 ]]
            -- upvalues: l_HttpService_0 (ref), v1 (copy)
            return l_HttpService_0:JSONDecode(v1);
        end);
        if not l_status_0 or not l_result_0 then
            return nil;
        else
            local v4 = {};
            local v5 = {};
            local _ = function(v6) --[[ Line: 19 ]] --[[ Name: addItems ]]
                -- upvalues: v5 (copy), v4 (copy)
                for _, v8 in pairs(v6) do
                    if not v5[v8] then
                        table.insert(v4, v8);
                        v5[v8] = true;
                    end;
                end;
            end;
            if l_result_0.avatarItems then
                local l_avatarItems_0 = l_result_0.avatarItems;
                for _, v12 in pairs(l_avatarItems_0) do
                    if not v5[v12] then
                        table.insert(v4, v12);
                        v5[v12] = true;
                    end;
                end;
            end;
            if l_result_0.userMetadata then
                for _, v14 in pairs(l_result_0.userMetadata) do
                    if v14.avatarItems then
                        local l_avatarItems_1 = v14.avatarItems;
                        for _, v17 in pairs(l_avatarItems_1) do
                            if not v5[v17] then
                                table.insert(v4, v17);
                                v5[v17] = true;
                            end;
                        end;
                    end;
                end;
            end;
            if next(v4) == nil then
                return nil;
            else
                return v4;
            end;
        end;
    end;
end;