local l_script_FirstAncestor_0 = script:FindFirstAncestor("InterventionShared");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_RunService_0 = game:GetService("RunService");
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v4 = require(l_Parent_0.React);
local l_useBinding_0 = v4.useBinding;
local l_useEffect_0 = v4.useEffect;
local v7 = require(l_script_FirstAncestor_0.Utils.determineChatTimeoutInfo);
return function(v8, v9) --[[ Line: 26 ]] --[[ Name: useTimeoutInfoBinding ]]
    -- upvalues: l_useBinding_0 (copy), l_useEffect_0 (copy), v7 (copy), l_dependencyArray_0 (copy), l_RunService_0 (copy)
    local v10, v11 = l_useBinding_0("");
    local v12, v13 = l_useBinding_0("");
    local v14 = if v8 and v8 ~= "" then DateTime.fromIsoDate(v8) else nil;
    l_useEffect_0(function() --[[ Line: 32 ]]
        -- upvalues: v7 (ref), v14 (copy), v9 (copy), v11 (copy), v13 (copy)
        local _, v16, v17 = v7(v14, v9);
        v11(v16);
        v13(v17);
    end, l_dependencyArray_0(v14, v9));
    l_useEffect_0(function() --[[ Line: 38 ]]
        -- upvalues: v14 (copy), l_RunService_0 (ref), v7 (ref), v9 (copy), v11 (copy), v13 (copy)
        local v18 = nil;
        if v14 == nil then
            return;
        else
            local v19 = DateTime.now();
            if v14.UnixTimestamp - v19.UnixTimestamp <= 0 then
                return;
            else
                local v20 = 0;
                v18 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 54 ]]
                    -- upvalues: v20 (ref), v7 (ref), v14 (ref), v9 (ref), v11 (ref), v13 (ref), v18 (ref)
                    local v21 = os.clock();
                    if v21 - v20 < 1 then
                        return;
                    else
                        v20 = v21;
                        local v22, v23, v24 = v7(v14, v9);
                        v11(v23);
                        v13(v24);
                        if v22 <= 0 and v18 then
                            v18:Disconnect();
                        end;
                        return;
                    end;
                end);
                return function() --[[ Line: 74 ]]
                    -- upvalues: v18 (ref)
                    if v18 then
                        v18:Disconnect();
                    end;
                end;
            end;
        end;
    end, l_dependencyArray_0(v14));
    return {
        heading = v10, 
        description = v12
    };
end;