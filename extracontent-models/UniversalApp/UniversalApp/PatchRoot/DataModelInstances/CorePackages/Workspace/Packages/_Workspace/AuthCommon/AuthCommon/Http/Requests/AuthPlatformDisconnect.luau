local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Http);
local v3 = require(l_script_FirstAncestor_0.Utils.getSingleSignOnUrls);
local l_ConsoleAuthRequestWrapper_0 = require(l_Parent_0.Http).Utils.ConsoleAuthRequestWrapper;
local v5 = require(l_Parent_0.Promise);
return function(v6) --[[ Line: 9 ]]
    -- upvalues: v3 (copy), l_ConsoleAuthRequestWrapper_0 (copy), v5 (copy)
    local l_disconnect_0 = v3().disconnect;
    if l_disconnect_0 then
        return l_ConsoleAuthRequestWrapper_0(v6, l_disconnect_0(), "POST", {
            postBody = "", 
            maxRetryCount = 0
        });
    else
        return v5.reject({});
    end;
end;