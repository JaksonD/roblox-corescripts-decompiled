return function() --[[ Line: 4 ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 5 ]]
        return game:GetFastString("AccountSwitcherFalsyVariantId");
    end);
    if l_status_0 then
        return l_result_0;
    else
        return "0";
    end;
end;