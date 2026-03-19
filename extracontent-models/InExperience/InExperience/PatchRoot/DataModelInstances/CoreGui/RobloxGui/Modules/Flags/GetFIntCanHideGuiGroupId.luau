return function() --[[ Line: 1 ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 2 ]]
        return game:GetFastInt("CanHideGuiGroupId");
    end);
    return l_status_0 and l_result_0;
end;