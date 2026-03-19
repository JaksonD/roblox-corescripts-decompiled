local l_Parent_0 = script:FindFirstAncestor("TrustedContacts").Parent;
local l_httpRequest_0 = require(l_Parent_0.LuaSocialLibrariesDeps).httpRequest;
local v2 = game:DefineFastInt("TrustedContactsHttpRetryCount", 3);
return (l_httpRequest_0.config({
    requestFunction = function(v3, v4, v5) --[[ Line: 8 ]] --[[ Name: requestFunction ]]
        -- upvalues: l_httpRequest_0 (copy)
        return l_httpRequest_0.requestFunctions.RequestInternal(v3, v4, v5);
    end, 
    maxRetryCount = v2
}));