return {
    new = function(v0) --[[ Line: 7 ]] --[[ Name: new ]]
        local v1 = {};
        setmetatable(v1, {
            __tostring = function() --[[ Line: 11 ]] --[[ Name: __tostring ]]
                return "Service(PublicBindables)";
            end
        });
        v1.getWindowStateChangedBindable = function() --[[ Line: 16 ]] --[[ Name: getWindowStateChangedBindable ]]
            -- upvalues: v0 (copy)
            return v0.windowStateChangedBindable;
        end;
        return v1;
    end
};