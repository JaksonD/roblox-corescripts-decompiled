local l_script_FirstAncestor_0 = script:FindFirstAncestor("InlineRichText");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Linker.Behaviors.useNavigateToWebview);
local v4 = require(l_script_FirstAncestor_0.Linker.Behaviors.useInvokeLinkingProtocol);
local v5 = require(l_script_FirstAncestor_0.Linker.Behaviors.useShowErrorToast);
local v6 = require(l_script_FirstAncestor_0.Enums.LinkBehavior);
local v7 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local _ = require(l_script_FirstAncestor_0.Types);
return function(v9) --[[ Line: 18 ]] --[[ Name: useLinkerOnActivated ]]
    -- upvalues: v3 (copy), v4 (copy), v5 (copy), v6 (copy), v2 (copy), v7 (copy)
    local v10 = v3();
    local v11 = v4();
    local v12 = v5({
        errorToastTextOverride = v9.errorToastTextOverride
    });
    local v13 = {
        [v6.Webview] = v10, 
        [v6.LinkingProtocol] = v11, 
        [v6.ErrorToast] = v12
    };
    return (v2.useCallback(function(v14) --[[ Line: 31 ]]
        -- upvalues: v13 (copy), v7 (ref)
        local v15 = v13[v14.linkBehavior];
        if v15 then
            v15(v14.url);
            return;
        else
            v7:error((("Link activation failed with invalid link behavior: %*. This behavior is either invalid or doesn't support activation."):format(v14.linkBehavior)));
            return;
        end;
    end, {
        v13
    }));
end;