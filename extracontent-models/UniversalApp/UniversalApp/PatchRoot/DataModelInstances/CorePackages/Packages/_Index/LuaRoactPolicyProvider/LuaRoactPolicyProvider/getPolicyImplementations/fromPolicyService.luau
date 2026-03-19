local l_PolicyService_0 = game:GetService("PolicyService");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v4 = require(l_Parent_1.Promise);
local v5 = require(l_Parent_0.Logger);
return function(v6) --[[ Line: 10 ]]
    -- upvalues: l_PolicyService_0 (copy), l_Players_0 (copy), v4 (copy), v5 (copy)
    v6 = v6 or {};
    v6.PolicyService = v6.PolicyService or l_PolicyService_0;
    v6.PlayersService = v6.PlayersService or l_Players_0;
    assert(v6.PolicyService, "expected dependencies.PolicyService");
    assert(v6.PlayersService, "expected dependencies.PlayersService");
    local l_PolicyService_1 = v6.PolicyService;
    local l_PlayersService_0 = v6.PlayersService;
    return function() --[[ Line: 21 ]]
        -- upvalues: v4 (ref), l_PlayersService_0 (copy), l_PolicyService_1 (copy), v5 (ref)
        return {
            read = function() --[[ Line: 23 ]] --[[ Name: read ]]
                return nil;
            end, 
            onPolicyChanged = function(v9) --[[ Line: 27 ]] --[[ Name: onPolicyChanged ]]
                -- upvalues: v4 (ref), l_PlayersService_0 (ref), l_PolicyService_1 (ref), v5 (ref)
                local l_BindableEvent_0 = Instance.new("BindableEvent");
                local v11 = l_BindableEvent_0.Event:Connect(v9);
                v4.new(function(v12, v13) --[[ Line: 33 ]]
                    -- upvalues: l_PlayersService_0 (ref), l_PolicyService_1 (ref)
                    local l_LocalPlayer_0 = l_PlayersService_0.LocalPlayer;
                    if l_LocalPlayer_0 then
                        local l_status_0, l_result_0 = pcall(function() --[[ Line: 36 ]]
                            -- upvalues: l_PolicyService_1 (ref), l_LocalPlayer_0 (copy)
                            return l_PolicyService_1:GetPolicyInfoForPlayerAsync(l_LocalPlayer_0);
                        end);
                        if l_status_0 then
                            if l_result_0 then
                                v12(l_result_0);
                                return;
                            else
                                v13("GetPolicyInfoForPlayerAsync return nil value");
                                return;
                            end;
                        else
                            v13("GetPolicyInfoForPlayerAsync had an error when calling");
                            return;
                        end;
                    else
                        v13("LocalPlayer not found");
                        return;
                    end;
                end):andThen(function(v17) --[[ Line: 52 ]]
                    -- upvalues: l_BindableEvent_0 (copy)
                    l_BindableEvent_0:Fire(v17);
                end):catch(function(v18) --[[ Line: 55 ]]
                    -- upvalues: v5 (ref)
                    v5:warning("Could not fetch from PolicyService due to error: {}", v18);
                end);
                return v11;
            end
        };
    end;
end;