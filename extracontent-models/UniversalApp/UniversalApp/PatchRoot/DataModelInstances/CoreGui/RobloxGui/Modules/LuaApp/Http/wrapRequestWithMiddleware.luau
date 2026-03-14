local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Thunks.CheckHttpErrorStatus);
local v2 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.CheckChallengeHeaders);
local v3 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppAttachChallengeInterceptor);
local v4 = game:DefineFastFlag("SilentlyFailIfChallenge", true);
local function _(v5, v6) --[[ Line: 10 ]] --[[ Name: wrapRequestWithChallengeMiddleware ]]
    -- upvalues: v2 (copy)
    return function(v7, v8, v9) --[[ Line: 11 ]] --[[ Name: makeRequest ]]
        -- upvalues: v5 (copy), v6 (copy), v2 (ref)
        local v10, v11 = v5(v7, v8, v9);
        return v10:andThen(nil, function(v12) --[[ Line: 14 ]]
            -- upvalues: v6 (ref), v2 (ref), v5 (ref), v7 (copy), v8 (copy), v9 (copy)
            return v6:dispatch(v2(v5, v7, v8, v9, v12));
        end), v11;
    end;
end;
return function(v14, v15, v16) --[[ Line: 22 ]] --[[ Name: wrapRequestWithMiddleware ]]
    -- upvalues: v4 (copy), v3 (copy), v1 (copy), v2 (copy)
    return function(v17, v18, v19, v20) --[[ Line: 23 ]] --[[ Name: makeRequest ]]
        -- upvalues: v14 (copy), v4 (ref), v3 (ref), v15 (copy), v1 (ref), v2 (ref), v16 (copy)
        local v21, v22 = v14(v17, v18, v19);
        if v4 and v20 then
            return v21, v22;
        else
            return v21:andThen(nil, function(v23) --[[ Line: 30 ]]
                -- upvalues: v3 (ref), v15 (ref), v1 (ref), v14 (ref), v2 (ref), v17 (copy), v16 (ref)
                if v3() then
                    local l_v15_0 = v15;
                    local l_v1_0 = v1;
                    local l_v14_0 = v14;
                    local l_v15_1 = v15;
                    return l_v15_0:dispatch(l_v1_0(function(v28, v29, v30) --[[ Line: 11 ]] --[[ Name: makeRequest ]]
                        -- upvalues: l_v14_0 (copy), l_v15_1 (copy), v2 (ref)
                        local v31, v32 = l_v14_0(v28, v29, v30);
                        return v31:andThen(nil, function(v33) --[[ Line: 14 ]]
                            -- upvalues: l_v15_1 (ref), v2 (ref), l_v14_0 (ref), v28 (copy), v29 (copy), v30 (copy)
                            return l_v15_1:dispatch(v2(l_v14_0, v28, v29, v30, v33));
                        end), v32;
                    end, v17, v23, v16));
                else
                    return v15:dispatch(v1(v14, v17, v23, v16));
                end;
            end):andThen(nil, function(v34) --[[ Line: 40 ]]
                -- upvalues: v15 (ref), v2 (ref), v14 (ref), v17 (copy), v18 (copy), v19 (copy)
                return v15:dispatch(v2(v14, v17, v18, v19, v34));
            end), v22;
        end;
    end;
end;