local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local v3 = require(l_script_FirstAncestor_0.SduiErrors);
local v4 = require(l_script_FirstAncestor_0.SduiLogger);
local v5 = require(l_script_FirstAncestor_0.ClientBinding.tryGetPathFromData);
local v6 = require(l_script_FirstAncestor_0.ClientBinding.getSduiTokensStore);
return {
    createTokenComputed = function(v7, v8, v9) --[[ Line: 20 ]] --[[ Name: createTokenComputed ]]
        -- upvalues: v2 (copy), v6 (copy), v5 (copy), v4 (copy), v3 (copy)
        return v2.createComputed(function(v10) --[[ Line: 25 ]]
            -- upvalues: v6 (ref), v8 (copy), v5 (ref), v7 (copy), v4 (ref), v3 (ref), v9 (copy)
            local v11 = v6().getTokens(v10, v8);
            local v12, v13 = v5(v11, v7);
            if not v12 then
                local v14 = table.concat(v7, ".");
                v4.reportError(v3.SduiErrorType.TokenBindingFailed, {
                    message = ("Could not find token with tokenPath %*"):format(v14)
                }, v8);
                return nil;
            elseif v9 and typeof(v13) ~= v9 then
                local v15 = table.concat(v7, ".");
                v4.reportError(v3.SduiErrorType.TokenBindingFailed, {
                    message = ("Token type did not match expected %* ~= %* for tokenPath %*"):format(typeof(v13), v9, v15)
                }, v8);
                return nil;
            else
                return v13;
            end;
        end);
    end
};