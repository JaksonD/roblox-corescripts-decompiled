return function(v0) --[[ Line: 1 ]]
    return {
        account = function(v1) --[[ Line: 4 ]]
            -- upvalues: v0 (copy)
            return v0.fromString("auth:v1/" .. v1 .. "/account");
        end, 
        connect = function(v2) --[[ Line: 8 ]]
            -- upvalues: v0 (copy)
            return v0.fromString("auth:v1/" .. v2 .. "/connect");
        end, 
        disconnect = function(v3) --[[ Line: 12 ]]
            -- upvalues: v0 (copy)
            return v0.fromString("auth:v1/" .. v3 .. "/disconnect");
        end, 
        login = function(v4) --[[ Line: 16 ]]
            -- upvalues: v0 (copy)
            return v0.fromString("auth:v1/" .. v4 .. "/login");
        end, 
        signup = function(v5) --[[ Line: 20 ]]
            -- upvalues: v0 (copy)
            return v0.fromString("auth:v1/" .. v5 .. "/signup");
        end
    };
end;