return function(v0, v1) --[[ Line: 1 ]] --[[ Name: makeHttpServiceMock ]]
    return {
        RequestInternal = function(_) --[[ Line: 3 ]] --[[ Name: RequestInternal ]]
            -- upvalues: v0 (copy), v1 (copy)
            return {
                Start = function(_, v4) --[[ Line: 5 ]] --[[ Name: Start ]]
                    -- upvalues: v0 (ref), v1 (ref)
                    v4(v0, v1);
                end
            };
        end
    };
end;