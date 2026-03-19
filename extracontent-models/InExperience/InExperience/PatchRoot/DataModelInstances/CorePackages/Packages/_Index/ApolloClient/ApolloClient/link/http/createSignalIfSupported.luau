return {
    createSignalIfSupported = function() --[[ Line: 11 ]] --[[ Name: createSignalIfSupported ]]
        local l_AbortController_0 = _G.AbortController;
        if typeof(l_AbortController_0) == "nil" then
            return {
                controller = false, 
                signal = false
            };
        else
            local v1 = l_AbortController_0.new();
            local l_signal_0 = v1.signal;
            return {
                controller = v1, 
                signal = l_signal_0
            };
        end;
    end
};