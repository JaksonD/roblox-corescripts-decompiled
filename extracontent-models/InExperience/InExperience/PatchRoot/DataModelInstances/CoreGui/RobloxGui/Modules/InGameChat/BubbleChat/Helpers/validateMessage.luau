local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.t);
local v2 = require(script.Parent.Parent.Constants);
local v3 = require(script.Parent.maybeAssert);
return function(v4) --[[ Line: 15 ]] --[[ Name: validateMessageText ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    v3(v1.string(v4));
    if utf8.len(v4) == nil then
        return false;
    else
        local v5 = utf8.len(utf8.nfcnormalize(v4));
        if v2.MAX_MESSAGE_LENGTH < v5 then
            return false, v5;
        else
            return true;
        end;
    end;
end;