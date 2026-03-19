local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script:FindFirstAncestor("CoreGuiCommon").Parent;
local v2 = require(l_Parent_0.Signals);
local v3 = require(l_Parent_0.Cryo);
local l_createSignal_0 = v2.createSignal;
return function() --[[ Line: 24 ]]
    -- upvalues: l_createSignal_0 (copy), v3 (copy), l_Players_0 (copy)
    local v5, v6 = l_createSignal_0(nil);
    local v7, v8 = l_createSignal_0({}, v3.Dictionary.equals);
    local v9 = nil;
    local v10 = nil;
    local v11 = nil;
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    while not l_LocalPlayer_0 do
        l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
        l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    end;
    local l_l_LocalPlayer_0_0 = l_LocalPlayer_0;
    local function v15() --[[ Line: 41 ]] --[[ Name: updateHealthValue ]]
        -- upvalues: v5 (copy), v8 (copy)
        local v14 = v5(false);
        v8(if v14 then {
            health = v14.Health, 
            maxHealth = v14.MaxHealth, 
            isDead = v14.Health <= 0
        } else {});
    end;
    local function _() --[[ Line: 52 ]] --[[ Name: unobserveHumanoid ]]
        -- upvalues: v11 (ref), v9 (ref), v10 (ref), v6 (copy)
        if v11 then
            v11:Disconnect();
            v11 = nil;
        end;
        if v9 then
            v9:Disconnect();
            v9 = nil;
        end;
        if v10 then
            v10:Disconnect();
            v10 = nil;
        end;
        v6(nil);
    end;
    local function v17() --[[ Line: 69 ]] --[[ Name: observeHumanoid ]]
        -- upvalues: v11 (ref), v9 (ref), v10 (ref), v6 (copy), l_l_LocalPlayer_0_0 (copy), v15 (copy), v17 (copy)
        if v11 then
            v11:Disconnect();
            v11 = nil;
        end;
        if v9 then
            v9:Disconnect();
            v9 = nil;
        end;
        if v10 then
            v10:Disconnect();
            v10 = nil;
        end;
        v6(nil);
        local l_Character_0 = l_l_LocalPlayer_0_0.Character;
        if l_Character_0 then
            local l_Humanoid_0 = l_Character_0:FindFirstChildOfClass("Humanoid");
            if l_Humanoid_0 then
                v6(l_Humanoid_0);
                v9 = l_Humanoid_0.HealthChanged:Connect(v15);
                v10 = l_Humanoid_0.Died:Connect(v15);
            else
                v11 = l_Character_0.ChildAdded:Connect(function(v20) --[[ Line: 79 ]]
                    -- upvalues: v17 (ref)
                    if v20:IsA("Humanoid") then
                        v17();
                    end;
                end);
            end;
        end;
        v15();
    end;
    local v21 = l_l_LocalPlayer_0_0.CharacterAdded:Connect(v17);
    local v22 = l_l_LocalPlayer_0_0.CharacterRemoving:Connect(v17);
    v17();
    local function v23() --[[ Line: 93 ]] --[[ Name: cleanup ]]
        -- upvalues: v21 (copy), v22 (copy), v11 (ref), v9 (ref), v10 (ref), v6 (copy)
        v21:Disconnect();
        v22:Disconnect();
        if v11 then
            v11:Disconnect();
            v11 = nil;
        end;
        if v9 then
            v9:Disconnect();
            v9 = nil;
        end;
        if v10 then
            v10:Disconnect();
            v10 = nil;
        end;
        v6(nil);
    end;
    return {
        getLocalHumanoid = v5, 
        getHealthValue = v7, 
        cleanup = v23
    };
end;