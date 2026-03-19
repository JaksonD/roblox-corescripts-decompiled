return function(v0, v1) --[[ Line: 5 ]]
    if _G.__DEV__ then
        assert(typeof(v1) == "table", "Received a non-table as the second argument for instanceof");
    end;
    if typeof(v0) ~= "table" then
        return false;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 14 ]]
            -- upvalues: v1 (copy), v0 (ref)
            local v2 = false;
            if v1.new ~= nil then
                v2 = v0.new == v1.new;
            end;
            return v2;
        end);
        if l_status_0 and l_result_0 then
            return true;
        else
            local v5 = {
                tbl = true
            };
            while true do
                if v0 and typeof(v0) == "table" then
                    v0 = getmetatable(v0);
                    if typeof(v0) == "table" then
                        v0 = v0.__index;
                        if v0 == v1 then
                            return true;
                        end;
                    end;
                    if typeof(v0) == "table" then
                        if v5[v0] then
                            return false;
                        else
                            v5[v0] = true;
                        end;
                    end;
                else
                    return false;
                end;
            end;
        end;
    end;
end;