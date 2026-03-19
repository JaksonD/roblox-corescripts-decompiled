return function(v0, v1, v2) --[[ Line: 15 ]] --[[ Name: safelyAccessProperty ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 16 ]]
        -- upvalues: v0 (copy), v1 (copy)
        return v0[v1];
    end);
    if l_status_0 then
        return l_result_0;
    else
        return v2;
    end;
end;