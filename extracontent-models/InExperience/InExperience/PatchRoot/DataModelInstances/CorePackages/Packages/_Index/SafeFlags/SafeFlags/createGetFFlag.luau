return function(v0, v1) --[[ Line: 1 ]] --[[ Name: createGetFFlag ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 2 ]]
        -- upvalues: v0 (copy), v1 (copy)
        game:DefineFastFlag(v0, if v1 then v1 else false);
    end);
    if not l_status_0 and l_result_0:match("The current thread cannot call") then
        return function() --[[ Line: 7 ]]
            -- upvalues: v0 (copy)
            return v0:match("^Debug") == nil;
        end;
    else
        return function() --[[ Line: 13 ]]
            -- upvalues: v0 (copy)
            return game:GetFastFlag(v0);
        end;
    end;
end;