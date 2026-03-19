local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local _ = require(l_Parent_0.Foundation);
local v4 = require(l_script_FirstAncestor_0.SduiErrors);
local v5 = require(l_script_FirstAncestor_0.SduiLogger);
local function _() --[[ Line: 22 ]] --[[ Name: createSduiTokensStore ]]
    -- upvalues: v2 (copy), v5 (copy), v4 (copy)
    local v6, v7 = v2.createSignal(nil);
    return {
        getTokens = function(v8, v9) --[[ Line: 25 ]] --[[ Name: getTokens ]]
            -- upvalues: v6 (copy), v5 (ref), v4 (ref)
            local v10 = v6(v8);
            if v10 == nil then
                v5.reportError(v4.SduiErrorType.GetNilTokens, {
                    message = "Getting tokens before they were set"
                }, v9);
            end;
            return v10;
        end, 
        setTokens = v7
    };
end;
local v12 = nil;
return function() --[[ Line: 43 ]] --[[ Name: getSduiTokensStore ]]
    -- upvalues: v12 (ref), v2 (copy), v5 (copy), v4 (copy)
    if v12 == nil then
        local v13, v14 = v2.createSignal(nil);
        v12 = {
            getTokens = function(v15, v16) --[[ Line: 25 ]] --[[ Name: getTokens ]]
                -- upvalues: v13 (copy), v5 (ref), v4 (ref)
                local v17 = v13(v15);
                if v17 == nil then
                    v5.reportError(v4.SduiErrorType.GetNilTokens, {
                        message = "Getting tokens before they were set"
                    }, v16);
                end;
                return v17;
            end, 
            setTokens = v14
        };
    end;
    return v12;
end;