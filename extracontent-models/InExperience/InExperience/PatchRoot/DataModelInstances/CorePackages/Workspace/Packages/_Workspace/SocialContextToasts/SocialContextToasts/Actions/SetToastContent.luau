local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialContextToasts");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local _ = require(l_script_FirstAncestor_0.ToastRoot);
return v2.makeActionCreator(script.Name, function(v4) --[[ Line: 7 ]]
    return {
        toastContent = v4
    };
end);