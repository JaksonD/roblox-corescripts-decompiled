local l_Boolean_0 = require((nil).LuauPolyfill).Boolean;
return {
    observableToAsyncIterable = function(v1) --[[ Line: 15 ]] --[[ Name: observableToAsyncIterable ]]
        -- upvalues: l_Boolean_0 (copy)
        local v2 = {};
        local v3 = {};
        local v4 = true;
        local function v6(v5) --[[ Line: 19 ]] --[[ Name: pushValue ]]
            -- upvalues: v2 (copy), v3 (copy)
            if v2.length ~= 0 then
                table.remove(v2, 1)({
                    value = v5, 
                    done = false
                });
                return;
            else
                table.insert(v3, {
                    value = v5, 
                    done = false
                });
                return;
            end;
        end;
        local function v8(v7) --[[ Line: 30 ]] --[[ Name: pushError ]]
            -- upvalues: v2 (copy), v3 (copy)
            if v2.length ~= 0 then
                table.remove(v2, 1)({
                    value = {
                        errors = {
                            v7
                        }
                    }, 
                    done = false
                });
                return;
            else
                table.insert(v3, {
                    value = {
                        errors = {
                            v7
                        }
                    }, 
                    done = false
                });
                return;
            end;
        end;
        local function v9() --[[ Line: 41 ]] --[[ Name: pushDone ]]
            -- upvalues: v2 (copy), v3 (copy)
            if v2.length ~= 0 then
                table.remove(v2, 1)({
                    done = true
                });
                return;
            else
                table.insert(v3, {
                    done = true
                });
                return;
            end;
        end;
        local function _() --[[ Line: 49 ]] --[[ Name: pullValue ]]
            -- upvalues: v3 (copy), v2 (copy)
            return Promise.new(function(v10) --[[ Line: 50 ]]
                -- upvalues: v3 (ref), v2 (ref)
                if v3.length ~= 0 then
                    v10((table.remove(v3, 1)));
                    return;
                else
                    table.insert(v2, v10);
                    return;
                end;
            end);
        end;
        local v17 = v1:subscribe({
            next = function(_, v13) --[[ Line: 60 ]] --[[ Name: next ]]
                -- upvalues: v6 (copy)
                v6(v13);
            end, 
            error = function(_, v15) --[[ Line: 63 ]] --[[ Name: error ]]
                -- upvalues: v8 (copy)
                v8(v15);
            end, 
            complete = function(_) --[[ Line: 66 ]] --[[ Name: complete ]]
                -- upvalues: v9 (copy)
                v9();
            end
        });
        local function v20() --[[ Line: 70 ]] --[[ Name: emptyQueue ]]
            -- upvalues: l_Boolean_0 (ref), v4 (ref), v17 (copy), v2 (copy), v3 (copy)
            if l_Boolean_0.toJSBoolean(v4) then
                v4 = false;
                v17:unsubscribe();
                for _, v19 in v2 do
                    v19({
                        value = nil, 
                        done = true
                    });
                end;
                v2.length = 0;
                v3.length = 0;
            end;
        end;
        return {
            next = function(v21) --[[ Line: 82 ]] --[[ Name: next ]]
                -- upvalues: l_Boolean_0 (ref), v4 (ref), v3 (copy), v2 (copy)
                if l_Boolean_0.toJSBoolean(v4) then
                    return (Promise.new(function(v22) --[[ Line: 50 ]]
                        -- upvalues: v3 (ref), v2 (ref)
                        if v3.length ~= 0 then
                            v22((table.remove(v3, 1)));
                            return;
                        else
                            table.insert(v2, v22);
                            return;
                        end;
                    end));
                else
                    return (v21["return"]());
                end;
            end, 
            ["return"] = function(_) --[[ Line: 86 ]]
                -- upvalues: v20 (copy)
                v20();
                return Promise.resolve({
                    value = nil, 
                    done = true
                });
            end, 
            throw = function(_, v25) --[[ Line: 90 ]] --[[ Name: throw ]]
                -- upvalues: v20 (copy)
                v20();
                return Promise.reject(v25);
            end, 
            [tostring(Symbol.asyncIterator)] = function(v26) --[[ Line: 94 ]]
                return v26;
            end
        };
    end
};