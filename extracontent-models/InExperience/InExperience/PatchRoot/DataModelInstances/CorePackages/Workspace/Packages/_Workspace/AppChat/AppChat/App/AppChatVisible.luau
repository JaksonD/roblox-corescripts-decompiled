local l_BindableEvent_0 = Instance.new("BindableEvent");
return {
    BindableEvent = l_BindableEvent_0, 
    setAppChatVisible = function(v1) --[[ Line: 3 ]] --[[ Name: setAppChatVisible ]]
        -- upvalues: l_BindableEvent_0 (copy)
        l_BindableEvent_0:Fire(v1);
    end
};