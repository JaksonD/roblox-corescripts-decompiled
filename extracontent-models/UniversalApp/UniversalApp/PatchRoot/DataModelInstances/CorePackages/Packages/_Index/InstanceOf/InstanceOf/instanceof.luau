local l___DEV___0 = _G.__DEV__;
return function(v1, v2) --[[ Line: 20 ]] --[[ Name: instanceof ]]
    -- upvalues: l___DEV___0 (copy)
    if l___DEV___0 then
        assert(typeof(v2) == "table", "Received a non-table as the second argument for instanceof");
    end;
    if typeof(v1) ~= "table" then
        return false;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 29 ]]
            -- upvalues: v2 (copy), v1 (ref)
            local v3 = false;
            if v2.new ~= nil then
                v3 = v1.new == v2.new;
            end;
            return v3;
        end);
        if l_status_0 and l_result_0 then
            return true;
        else
            local v6 = {
                [v1] = true
            };
            while true do
                if v1 and typeof(v1) == "table" then
                    v1 = getmetatable(v1);
                    if typeof(v1) == "table" then
                        v1 = v1.__index;
                        if v1 == v2 then
                            return true;
                        end;
                    end;
                    if typeof(v1) == "table" then
                        if v6[v1] then
                            return false;
                        else
                            v6[v1] = true;
                        end;
                    end;
                else
                    return false;
                end;
            end;
        end;
    end;
end;