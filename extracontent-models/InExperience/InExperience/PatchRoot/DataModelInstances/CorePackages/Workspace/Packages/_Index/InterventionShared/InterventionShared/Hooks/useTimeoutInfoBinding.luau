local l_script_FirstAncestor_0 = script:FindFirstAncestor("InterventionShared");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_RunService_0 = game:GetService("RunService");
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v4 = require(l_Parent_0.React);
local l_useBinding_0 = v4.useBinding;
local l_useEffect_0 = v4.useEffect;
local v7 = require(l_script_FirstAncestor_0.Utils.determineChatTimeoutInfo);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function(v9, v10) --[[ Line: 28 ]] --[[ Name: useTimeoutInfoBinding ]]
    -- upvalues: l_useBinding_0 (copy), l_useEffect_0 (copy), v7 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_RunService_0 (copy)
    local v11, v12 = l_useBinding_0("");
    local v13, v14 = l_useBinding_0("");
    local v15 = if v9 and v9 ~= "" then DateTime.fromIsoDate(v9) else nil;
    l_useEffect_0(function() --[[ Line: 35 ]]
        -- upvalues: v7 (ref), v15 (copy), v10 (copy), v12 (copy), v14 (copy)
        local _, v17, v18 = v7(v15, v10);
        v12(v17);
        v14(v18);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v15, 
        v10
    } else l_dependencyArray_0(v15, v10));
    l_useEffect_0(function() --[[ Line: 45 ]]
        -- upvalues: v15 (copy), l_RunService_0 (ref), v7 (ref), v10 (copy), v12 (copy), v14 (copy)
        local v19 = nil;
        if v15 == nil then
            return;
        else
            local v20 = DateTime.now();
            if v15.UnixTimestamp - v20.UnixTimestamp <= 0 then
                return;
            else
                local v21 = 0;
                v19 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 61 ]]
                    -- upvalues: v21 (ref), v7 (ref), v15 (ref), v10 (ref), v12 (ref), v14 (ref), v19 (ref)
                    local v22 = os.clock();
                    if v22 - v21 < 1 then
                        return;
                    else
                        v21 = v22;
                        local v23, v24, v25 = v7(v15, v10);
                        v12(v24);
                        v14(v25);
                        if v23 <= 0 and v19 then
                            v19:Disconnect();
                        end;
                        return;
                    end;
                end);
                return function() --[[ Line: 81 ]]
                    -- upvalues: v19 (ref)
                    if v19 then
                        v19:Disconnect();
                    end;
                end;
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v15
    } else l_dependencyArray_0(v15));
    return {
        heading = v11, 
        description = v13
    };
end;