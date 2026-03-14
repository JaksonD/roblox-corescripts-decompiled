local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local l_console_0 = require(l_Parent_0.Shared).console;
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local l_REACT_PROVIDER_TYPE_0 = l_ReactSymbols_0.REACT_PROVIDER_TYPE;
local l_REACT_CONTEXT_TYPE_0 = l_ReactSymbols_0.REACT_CONTEXT_TYPE;
return {
    createContext = function(v6, v7) --[[ Line: 34 ]]
        -- upvalues: l_REACT_CONTEXT_TYPE_0 (copy), l_REACT_PROVIDER_TYPE_0 (copy), v1 (copy), l_console_0 (copy)
        local v8 = {
            ["$$typeof"] = l_REACT_CONTEXT_TYPE_0, 
            _calculateChangedBits = v7, 
            _currentValue = v6, 
            _currentValue2 = v6, 
            _threadCount = 0, 
            Provider = nil, 
            Consumer = nil, 
            displayName = nil, 
            _currentRenderer = nil, 
            _currentRenderer2 = nil
        };
        v8.Provider = {
            ["$$typeof"] = l_REACT_PROVIDER_TYPE_0, 
            _context = v8
        };
        local v9 = false;
        if v1.__DEV__ then
            local v10 = {
                ["$$typeof"] = l_REACT_CONTEXT_TYPE_0, 
                _context = v8, 
                _calculateChangedBits = v8._calculateChangedBits
            };
            setmetatable(v10, {
                __index = function(_, v12) --[[ Line: 79 ]] --[[ Name: __index ]]
                    -- upvalues: v8 (copy)
                    if v12 == "_currentValue" then
                        return v8._currentValue;
                    elseif v12 == "_currentValue2" then
                        return v8._currentValue2;
                    elseif v12 == "_threadCount" then
                        return v8._threadCount;
                    elseif v12 == "displayName" then
                        return v8.displayName;
                    else
                        return nil;
                    end;
                end, 
                __newindex = function(_, v14, v15) --[[ Line: 92 ]] --[[ Name: __newindex ]]
                    -- upvalues: v8 (copy), v9 (ref), l_console_0 (ref)
                    if v14 == "_currentValue" then
                        v8._currentValue = v15;
                        return;
                    elseif v14 == "_currentValue2" then
                        v8._currentValue2 = v15;
                        return;
                    elseif v14 == "_threadCount" then
                        v8._threadCount = v15;
                        return;
                    else
                        if v14 == "displayName" and not v9 then
                            l_console_0.warn("Setting `displayName` on Context.Consumer has no effect. " .. "You should set it directly on the context with Context.displayName = " .. v15 .. ".");
                            v9 = true;
                        end;
                        return;
                    end;
                end
            });
            v8.Consumer = v10;
        else
            v8.Consumer = v8;
        end;
        if v1.__DEV__ then
            v8._currentRenderer = nil;
            v8._currentRenderer2 = nil;
        end;
        return v8;
    end
};