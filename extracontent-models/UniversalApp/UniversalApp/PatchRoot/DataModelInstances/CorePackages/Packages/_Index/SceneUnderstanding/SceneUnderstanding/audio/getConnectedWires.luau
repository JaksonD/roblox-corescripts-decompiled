return function(v0, v1) --[[ Line: 1 ]] --[[ Name: getConnectedWires ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 2 ]]
        -- upvalues: v0 (copy), v1 (copy)
        return v0:GetConnectedWires(v1);
    end);
    if l_status_0 then
        return l_result_0;
    else
        return {};
    end;
end;