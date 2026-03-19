return function(v0) --[[ Line: 2 ]] --[[ Name: createUnimplemented ]]
    return function() --[[ Line: 3 ]]
        -- upvalues: v0 (copy)
        error((("Calling unimplemented function %*"):format(v0)));
    end;
end;