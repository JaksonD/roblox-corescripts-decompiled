local _ = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local _ = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
return {
    Capability = ({
        Capability = {
            fromNumber = function(v2) --[[ Line: 18 ]] --[[ Name: fromNumber ]]
                if v2 == 0 then
                    return "CAPABILITY_INVALID";
                else
                    return nil;
                end;
            end, 
            toNumber = function(v3) --[[ Line: 26 ]] --[[ Name: toNumber ]]
                if v3 == "CAPABILITY_INVALID" then
                    return 0;
                else
                    return v3;
                end;
            end, 
            fromName = function(v4) --[[ Line: 34 ]] --[[ Name: fromName ]]
                if v4 == "CAPABILITY_INVALID" then
                    return "CAPABILITY_INVALID";
                else
                    return nil;
                end;
            end
        }
    }).Capability
};