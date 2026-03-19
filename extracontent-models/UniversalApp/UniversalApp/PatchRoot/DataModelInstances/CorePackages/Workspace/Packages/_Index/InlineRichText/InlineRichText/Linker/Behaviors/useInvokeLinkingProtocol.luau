local l_script_FirstAncestor_0 = script:FindFirstAncestor("InlineRichText");
local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_default_0 = require(l_Parent_0.LinkingProtocol).LinkingProtocol.default;
local v5 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local _ = require(l_script_FirstAncestor_0.Types);
local v7 = l_RunService_0:IsStudio();
return function(_) --[[ Line: 15 ]]
    -- upvalues: v3 (copy), l_default_0 (copy), v7 (copy), v5 (copy)
    return v3.useCallback(function(v9) --[[ Line: 16 ]]
        -- upvalues: l_default_0 (ref), v7 (ref), v5 (ref)
        l_default_0:isURLRegistered(v9):andThen(function(v10) --[[ Line: 17 ]]
            -- upvalues: v7 (ref), v9 (copy), l_default_0 (ref), v5 (ref)
            if v10 then
                if v7 then
                    print((("[OnActivated Debug] Detected URL with LinkingProtocol: %*"):format(v9)));
                end;
                l_default_0:detectURL(v9);
                return;
            else
                l_default_0:openURL(v9):catch(function(v11) --[[ Line: 24 ]]
                    -- upvalues: v5 (ref), v9 (ref)
                    v5:error("Failed to open URL: ", v9, " with error: ", v11);
                end);
                return;
            end;
        end);
    end, {});
end;