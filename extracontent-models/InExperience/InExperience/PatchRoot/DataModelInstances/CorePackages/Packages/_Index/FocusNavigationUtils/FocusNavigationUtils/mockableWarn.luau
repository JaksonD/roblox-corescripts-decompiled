local l_warn_0 = warn;
return (setmetatable({
    mock = function(v1) --[[ Line: 4 ]] --[[ Name: mock ]]
        -- upvalues: l_warn_0 (ref)
        l_warn_0 = v1;
    end, 
    unmock = function() --[[ Line: 7 ]] --[[ Name: unmock ]]
        -- upvalues: l_warn_0 (ref)
        l_warn_0 = warn;
    end
}, {
    __call = function(_, ...) --[[ Line: 11 ]] --[[ Name: __call ]]
        -- upvalues: l_warn_0 (ref)
        l_warn_0(...);
    end
}));