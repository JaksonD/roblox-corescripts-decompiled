return {
    config = function(v0) --[[ Line: 7 ]] --[[ Name: config ]]
        local v1 = v0 or {};
        local v2 = v1.state or {};
        return {
            dispatch = v1.dispatch or function(v3, v4) --[[ Line: 12 ]]
                if type(v4) == "function" then
                    v4(v3);
                end;
            end, 
            getState = function() --[[ Line: 18 ]] --[[ Name: getState ]]
                -- upvalues: v2 (ref)
                return v2;
            end, 
            setState = function(_, v6) --[[ Line: 22 ]] --[[ Name: setState ]]
                -- upvalues: v2 (ref)
                v2 = v6;
            end
        };
    end
};