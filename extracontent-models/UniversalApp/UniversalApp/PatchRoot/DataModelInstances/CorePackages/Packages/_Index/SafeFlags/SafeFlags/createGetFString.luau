return function(v0, v1) --[[ Line: 1 ]] --[[ Name: createGetFString ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 2 ]]
        -- upvalues: v0 (copy), v1 (copy)
        game:DefineFastString(v0, v1);
    end);
    if not l_status_0 and l_result_0:match("The current thread cannot call") then
        return function() --[[ Line: 7 ]]
            -- upvalues: v1 (copy)
            return v1;
        end;
    else
        return function() --[[ Line: 12 ]]
            -- upvalues: v0 (copy)
            return game:GetFastString(v0);
        end;
    end;
end;