local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Boolean_0 = require(l_Parent_0.LuauPolyfill).Boolean;
local v2 = require(l_Parent_0.Promise);
local v3 = {};
local l_Observable_0 = require(script.Parent.Observable).Observable;
v3.asyncMap = function(v5, v6, v7) --[[ Line: 37 ]] --[[ Name: asyncMap ]]
    -- upvalues: l_Observable_0 (copy), v2 (copy), l_Boolean_0 (copy)
    return l_Observable_0.new(function(v8) --[[ Line: 42 ]]
        -- upvalues: v2 (ref), l_Boolean_0 (ref), v6 (copy), v7 (copy), v5 (copy)
        local v9 = nil;
        local l_next_0 = v8.next;
        local l_error_0 = v8.error;
        local l_complete_0 = v8.complete;
        local v13 = 0;
        local v14 = false;
        local v18 = {
            andThen = function(_, v16) --[[ Line: 54 ]] --[[ Name: andThen ]]
                -- upvalues: v2 (ref)
                return v2.new(function(v17) --[[ Line: 55 ]]
                    -- upvalues: v16 (copy)
                    return v17(v16());
                end);
            end
        };
        local _ = function(v19, v20) --[[ Line: 62 ]] --[[ Name: makeCallback ]]
            -- upvalues: l_Boolean_0 (ref), v13 (ref), v18 (ref), v2 (ref), l_next_0 (copy), v8 (copy), v14 (ref), v9 (ref), l_error_0 (copy)
            if l_Boolean_0.toJSBoolean(v19) then
                return function(_, v22) --[[ Line: 67 ]]
                    -- upvalues: v13 (ref), v19 (copy), v18 (ref), v2 (ref), l_Boolean_0 (ref), l_next_0 (ref), v8 (ref), v14 (ref), v9 (ref), l_error_0 (ref)
                    v13 = v13 + 1;
                    local function v23() --[[ Line: 69 ]] --[[ Name: both ]]
                        -- upvalues: v19 (ref), v22 (copy)
                        return v19(v22);
                    end;
                    v18 = v18:andThen(function() --[[ Line: 75 ]]
                        -- upvalues: v2 (ref)
                        return v2.delay(0);
                    end):andThen(v23, v23):andThen(function(v24) --[[ Line: 80 ]]
                        -- upvalues: v13 (ref), l_Boolean_0 (ref), l_next_0 (ref), v8 (ref), v14 (ref), v9 (ref)
                        v13 = v13 - 1;
                        if l_Boolean_0.toJSBoolean(l_next_0) then
                            l_next_0(v8, v24);
                        end;
                        if l_Boolean_0.toJSBoolean(v14) then
                            v9.complete();
                        end;
                    end, function(v25) --[[ Line: 88 ]]
                        -- upvalues: v13 (ref)
                        v13 = v13 - 1;
                        error(v25);
                    end):catch(function(v26) --[[ Line: 92 ]]
                        -- upvalues: l_Boolean_0 (ref), l_error_0 (ref), v8 (ref)
                        if l_Boolean_0.toJSBoolean(l_error_0) then
                            return l_error_0(v8, v26);
                        else
                            return;
                        end;
                    end);
                end;
            else
                return function(_, v28) --[[ Line: 100 ]]
                    -- upvalues: l_Boolean_0 (ref), v20 (copy), v8 (ref)
                    if l_Boolean_0.toJSBoolean(v20) then
                        v20(v8, v28);
                    end;
                end;
            end;
        end;
        local v30 = {};
        local l_v6_0 = v6;
        local l_l_v6_0_0 = l_v6_0 --[[ copy: 11 -> 12 ]];
        v30.next = l_Boolean_0.toJSBoolean(l_v6_0) and function(_, v34) --[[ Line: 67 ]]
            -- upvalues: v13 (ref), l_l_v6_0_0 (copy), v18 (ref), v2 (ref), l_Boolean_0 (ref), l_next_0 (copy), v8 (copy), v14 (ref), v9 (ref), l_error_0 (copy)
            v13 = v13 + 1;
            local function v35() --[[ Line: 69 ]] --[[ Name: both ]]
                -- upvalues: l_l_v6_0_0 (ref), v34 (copy)
                return l_l_v6_0_0(v34);
            end;
            v18 = v18:andThen(function() --[[ Line: 75 ]]
                -- upvalues: v2 (ref)
                return v2.delay(0);
            end):andThen(v35, v35):andThen(function(v36) --[[ Line: 80 ]]
                -- upvalues: v13 (ref), l_Boolean_0 (ref), l_next_0 (ref), v8 (ref), v14 (ref), v9 (ref)
                v13 = v13 - 1;
                if l_Boolean_0.toJSBoolean(l_next_0) then
                    l_next_0(v8, v36);
                end;
                if l_Boolean_0.toJSBoolean(v14) then
                    v9.complete();
                end;
            end, function(v37) --[[ Line: 88 ]]
                -- upvalues: v13 (ref)
                v13 = v13 - 1;
                error(v37);
            end):catch(function(v38) --[[ Line: 92 ]]
                -- upvalues: l_Boolean_0 (ref), l_error_0 (ref), v8 (ref)
                if l_Boolean_0.toJSBoolean(l_error_0) then
                    return l_error_0(v8, v38);
                else
                    return;
                end;
            end);
        end or function(_, v40) --[[ Line: 100 ]]
            -- upvalues: l_Boolean_0 (ref), l_next_0 (copy), v8 (copy)
            if l_Boolean_0.toJSBoolean(l_next_0) then
                l_next_0(v8, v40);
            end;
        end;
        l_v6_0 = v7;
        v30.error = l_Boolean_0.toJSBoolean(l_v6_0) and function(_, v42) --[[ Line: 67 ]]
            -- upvalues: v13 (ref), l_v6_0 (copy), v18 (ref), v2 (ref), l_Boolean_0 (ref), l_next_0 (copy), v8 (copy), v14 (ref), v9 (ref), l_error_0 (copy)
            v13 = v13 + 1;
            local function v43() --[[ Line: 69 ]] --[[ Name: both ]]
                -- upvalues: l_v6_0 (ref), v42 (copy)
                return l_v6_0(v42);
            end;
            v18 = v18:andThen(function() --[[ Line: 75 ]]
                -- upvalues: v2 (ref)
                return v2.delay(0);
            end):andThen(v43, v43):andThen(function(v44) --[[ Line: 80 ]]
                -- upvalues: v13 (ref), l_Boolean_0 (ref), l_next_0 (ref), v8 (ref), v14 (ref), v9 (ref)
                v13 = v13 - 1;
                if l_Boolean_0.toJSBoolean(l_next_0) then
                    l_next_0(v8, v44);
                end;
                if l_Boolean_0.toJSBoolean(v14) then
                    v9.complete();
                end;
            end, function(v45) --[[ Line: 88 ]]
                -- upvalues: v13 (ref)
                v13 = v13 - 1;
                error(v45);
            end):catch(function(v46) --[[ Line: 92 ]]
                -- upvalues: l_Boolean_0 (ref), l_error_0 (ref), v8 (ref)
                if l_Boolean_0.toJSBoolean(l_error_0) then
                    return l_error_0(v8, v46);
                else
                    return;
                end;
            end);
        end or function(_, v48) --[[ Line: 100 ]]
            -- upvalues: l_Boolean_0 (ref), l_error_0 (copy), v8 (copy)
            if l_Boolean_0.toJSBoolean(l_error_0) then
                l_error_0(v8, v48);
            end;
        end;
        v30.complete = function() --[[ Line: 111 ]] --[[ Name: complete ]]
            -- upvalues: v14 (ref), l_Boolean_0 (ref), v13 (ref), l_complete_0 (copy), v8 (copy)
            v14 = true;
            if not l_Boolean_0.toJSBoolean(v13) and l_Boolean_0.toJSBoolean(l_complete_0) then
                l_complete_0(v8);
            end;
        end;
        v9 = v30;
        v30 = v5:subscribe(v9);
        return function() --[[ Line: 122 ]]
            -- upvalues: v30 (copy)
            return v30:unsubscribe();
        end;
    end);
end;
return v3;