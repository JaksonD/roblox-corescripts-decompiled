return function(v0) --[[ Line: 4 ]] --[[ Name: bindingValidator ]]
    return function(v1) --[[ Line: 5 ]]
        -- upvalues: v0 (copy)
        local v2 = string.match(tostring(v1), "RoactBinding");
        if typeof(v1) ~= "table" or not v2 then
            warn(string.format("RoactBinding expected, got %s", (typeof(v1))));
            return false;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 13 ]]
                -- upvalues: v1 (copy)
                return v1:getValue();
            end);
            if not l_status_0 then
                warn("getValue() not defined");
                return false;
            else
                local v5, v6 = v0(l_result_0);
                if not v5 then
                    warn(string.format("RoactBinding value: %s", v6));
                    return false;
                else
                    return true;
                end;
            end;
        end;
    end;
end;