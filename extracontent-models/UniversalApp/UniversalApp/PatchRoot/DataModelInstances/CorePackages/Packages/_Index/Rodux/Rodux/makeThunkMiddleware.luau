local function v1(v0) --[[ Line: 9 ]] --[[ Name: tracebackReporter ]]
    return debug.traceback(v0);
end;
return function(v2) --[[ Line: 13 ]] --[[ Name: makeThunkMiddleware ]]
    -- upvalues: v1 (copy)
    return function(v3, v4) --[[ Line: 14 ]] --[[ Name: thunkMiddleware ]]
        -- upvalues: v2 (copy), v1 (ref)
        return function(v5) --[[ Line: 15 ]]
            -- upvalues: v4 (copy), v2 (ref), v1 (ref), v3 (copy)
            if typeof(v5) == "function" then
                local v6, v7 = xpcall(function() --[[ Line: 17 ]]
                    -- upvalues: v5 (copy), v4 (ref), v2 (ref)
                    return v5(v4, v2);
                end, v1);
                if not v6 then
                    v4._errorReporter.reportReducerError(v4:getState(), v5, {
                        message = "Caught error in thunk", 
                        thrownValue = v7
                    });
                    return nil;
                else
                    return v7;
                end;
            else
                return v3(v5);
            end;
        end;
    end;
end;