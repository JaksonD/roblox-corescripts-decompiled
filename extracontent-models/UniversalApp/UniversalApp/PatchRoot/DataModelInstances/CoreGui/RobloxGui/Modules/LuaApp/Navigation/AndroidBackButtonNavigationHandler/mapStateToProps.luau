return function(v0, _) --[[ Line: 1 ]]
    local l_history_0 = v0.Navigation.history;
    return {
        canGoBackInAppRoute = #l_history_0[#l_history_0] > 1
    };
end;