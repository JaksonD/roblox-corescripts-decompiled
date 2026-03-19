local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local l_console_0 = require(l_Parent_0.Shared).console;
local l_inspect_0 = require(l_Parent_0.LuauPolyfill).util.inspect;
local _ = require(l_Parent_0.Shared);
local l_REACT_LAZY_TYPE_0 = require(l_Parent_0.Shared).ReactSymbols.REACT_LAZY_TYPE;
lazyInitializer = function(v6) --[[ Line: 73 ]] --[[ Name: lazyInitializer ]]
    -- upvalues: v1 (copy), l_console_0 (copy), l_inspect_0 (copy)
    if v6._status == -1 then
        local v7 = v6._result();
        v6._status = 0;
        v6._result = v7;
        v7:andThen(function(v8) --[[ Line: 81 ]]
            -- upvalues: v6 (copy), v1 (ref), l_console_0 (ref), l_inspect_0 (ref)
            if v6._status == 0 then
                local l_default_0 = v8.default;
                if v1.__DEV__ and l_default_0 == nil then
                    l_console_0.error("lazy: Expected the result of a dynamic import() call. Instead received: `%s`\n\nYour code should look like: \n  local MyComponent = lazy(function() return reqquire(script.Parent.MyComponent) end)", l_inspect_0(v8));
                end;
                local l_v6_0 = v6;
                l_v6_0._status = 1;
                l_v6_0._result = l_default_0;
            end;
        end, function(v11) --[[ Line: 102 ]]
            -- upvalues: v6 (copy)
            if v6._status == 0 then
                local l_v6_1 = v6;
                l_v6_1._status = 2;
                l_v6_1._result = v11;
            end;
        end);
    end;
    if v6._status == 1 then
        return v6._result;
    else
        error(v6._result);
        return;
    end;
end;
return {
    lazy = function(v13) --[[ Line: 128 ]]
        -- upvalues: l_REACT_LAZY_TYPE_0 (copy), v1 (copy), l_console_0 (copy)
        local v14 = {
            _status = -1, 
            _result = v13
        };
        local v15 = {
            ["$$typeof"] = l_REACT_LAZY_TYPE_0, 
            _payload = v14, 
            _init = lazyInitializer
        };
        if v1.__DEV__ then
            local v16 = nil;
            local v17 = nil;
            do
                local l_v16_0, l_v17_0 = v16, v17;
                setmetatable(v15, {
                    __index = function(_, v21) --[[ Line: 150 ]] --[[ Name: __index ]]
                        -- upvalues: l_v16_0 (ref), l_v17_0 (ref)
                        if v21 == "defaultProps" then
                            return l_v16_0;
                        elseif v21 == "propTypes" then
                            return l_v17_0;
                        else
                            return;
                        end;
                    end, 
                    __newindex = function(v22, v23, v24) --[[ Line: 159 ]] --[[ Name: __newindex ]]
                        -- upvalues: l_console_0 (ref), l_v16_0 (ref), l_v17_0 (ref)
                        if v23 == "defaultProps" then
                            l_console_0.error("React.lazy(...): It is not supported to assign `defaultProps` to a lazy component import. Either specify them where the component is defined, or create a wrapping component around it.");
                            l_v16_0 = v24;
                            setmetatable(v22, {
                                __index = function() --[[ Line: 170 ]] --[[ Name: __index ]]

                                end, 
                                __newindex = function() --[[ Line: 171 ]] --[[ Name: __newindex ]]

                                end
                            });
                        end;
                        if v23 == "propTypes" then
                            l_console_0.error("React.lazy(...): It is not supported to assign `propTypes` to a lazy component import. Either specify them where the component is defined, or create a wrapping component around it.");
                            l_v17_0 = v24;
                            setmetatable(v22, {
                                __index = function() --[[ Line: 184 ]] --[[ Name: __index ]]

                                end, 
                                __newindex = function() --[[ Line: 185 ]] --[[ Name: __newindex ]]

                                end
                            });
                        end;
                    end
                });
            end;
        end;
        return v15;
    end
};