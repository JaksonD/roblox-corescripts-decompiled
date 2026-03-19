return function(v0, v1, v2) --[[ Line: 3 ]] --[[ Name: StringTrim ]]
    if not v1 then
        v1 = "%s";
    end;
    if #v1 == 0 then
        return v0;
    else
        if not v2 then
            v2 = {
                left = true, 
                right = true
            };
        end;
        local l_v0_0 = v0;
        if v2.left then
            local v4 = string.find(l_v0_0, "[^" .. v1 .. "]");
            if not v4 then
                return "";
            else
                l_v0_0 = string.sub(l_v0_0, v4);
            end;
        end;
        if v2.right then
            local v5 = string.find(l_v0_0, "[" .. v1 .. "]+$");
            if not v5 then
                return l_v0_0;
            else
                l_v0_0 = string.sub(l_v0_0, 1, v5 - 1);
            end;
        end;
        return l_v0_0;
    end;
end;