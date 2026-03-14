local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoactPaginator");
local v1 = require(l_script_FirstAncestor_0.fetchInitSymbol);
local v2 = require(l_script_FirstAncestor_0.fetchWithCursorSymbol);
local v3 = require(l_script_FirstAncestor_0.loadNextSymbol);
local v4 = require(l_script_FirstAncestor_0.loadPreviousSymbol);
local v5 = require(l_script_FirstAncestor_0.Logger);
local v6 = require(l_script_FirstAncestor_0.Parent.dependencies);
local l_Roact_0 = v6.Roact;
local l_Cryo_0 = v6.Cryo;
local l_GenericPagination_0 = v6.GenericPagination;
local function _(v10, v11) --[[ Line: 16 ]] --[[ Name: formatMessage ]]
    return table.concat(v10, "\n"):format(unpack(v11 or {}));
end;
return function(v13) --[[ Line: 20 ]] --[[ Name: connect ]]
    -- upvalues: l_Roact_0 (copy), l_GenericPagination_0 (copy), v1 (copy), v2 (copy), l_Cryo_0 (copy), v3 (copy), v5 (copy), v4 (copy)
    assert(v13 and type(v13) == "function", "RoactPaginator.connect: parameters expected to be a function");
    local v14 = debug.traceback();
    return function(v15) --[[ Line: 24 ]]
        -- upvalues: v14 (copy), l_Roact_0 (ref), v13 (copy), l_GenericPagination_0 (ref), v1 (ref), v2 (ref), l_Cryo_0 (ref), v3 (ref), v5 (ref), v4 (ref)
        if v15 == nil then
            local v16 = {
                "connect returns a function that must be passed a component.", 
                "Check the connection at:", 
                "%s"
            };
            local v17 = {
                v14
            };
            local v18 = table.concat(v16, "\n"):format(unpack(v17 or {}));
            error(v18, 2);
        end;
        local v19 = ("PaginatorConnection(%s)"):format((tostring(v15)));
        local v20 = l_Roact_0.Component:extend(v19);
        v20.init = function(v21) --[[ Line: 41 ]] --[[ Name: init ]]
            -- upvalues: v13 (ref), l_GenericPagination_0 (ref), v1 (ref), v2 (ref)
            local v22 = v13();
            assert(v22, "RoactPaginator.connect: Expected parameters to return an object");
            v21.paginator = l_GenericPagination_0.new({
                pageSize = v22.pageSize, 
                fetchInit = v21.props[v1], 
                fetchWithCursor = v21.props[v2]
            });
        end;
        v20.render = function(v23) --[[ Line: 52 ]] --[[ Name: render ]]
            -- upvalues: l_Cryo_0 (ref), v3 (ref), v5 (ref), v4 (ref), l_Roact_0 (ref), v15 (copy)
            local v26 = l_Cryo_0.Dictionary.join(v23.props, {
                [v3] = function() --[[ Line: 54 ]]
                    -- upvalues: v23 (copy), v5 (ref)
                    if v23.paginator:isFetching() then
                        return;
                    else
                        v23.paginator:getNext():catch(function(v24) --[[ Line: 59 ]]
                            -- upvalues: v5 (ref)
                            v5:error("Could not getNext. Got error: {}", v24);
                        end);
                        return;
                    end;
                end, 
                [v4] = function() --[[ Line: 63 ]]
                    -- upvalues: v23 (copy), v5 (ref)
                    if v23.paginator:isFetching() then
                        return;
                    else
                        v23.paginator:getPrevious():catch(function(v25) --[[ Line: 68 ]]
                            -- upvalues: v5 (ref)
                            v5:error("Could not getPrevious. Got error: {}", v25);
                        end);
                        return;
                    end;
                end
            });
            return l_Roact_0.createElement(v15, v26);
        end;
        return v20;
    end;
end;