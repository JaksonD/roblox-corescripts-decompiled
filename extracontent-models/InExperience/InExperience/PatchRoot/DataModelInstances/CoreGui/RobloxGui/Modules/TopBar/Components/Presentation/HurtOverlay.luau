local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_StarterGui_0 = game:GetService("StarterGui");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Packages.Signals);
local v7 = require(l_CorePackages_0.Packages.Otter);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v9 = require(l_CorePackages_0.Workspace.Packages.CachedPolicyService);
local _ = l_RobloxGui_0:FindFirstChild("Modules"):FindFirstChild("Common");
local l_Parent_0 = script.Parent.Parent.Parent;
local v12 = require(l_Parent_0.Constants);
local v13 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon);
local l_FFlagTopBarSignalizeHealthBar_0 = v13.Flags.FFlagTopBarSignalizeHealthBar;
local l_FFlagUseNewHurtOverlayImage_0 = v13.Flags.FFlagUseNewHurtOverlayImage;
local l_FFlagUseNewHurtOverlayAnimation_0 = v13.Flags.FFlagUseNewHurtOverlayAnimation;
local v17 = {
    frequency = 0.75, 
    dampingRatio = 1
};
local v18 = Color3.fromRGB(187, 0, 4);
local v19 = Color3.new(1, 1, 1);
local v20 = v3.PureComponent:extend("HurtOverlay");
v20.validateProps = v5.strictInterface(if l_FFlagTopBarSignalizeHealthBar_0 then {} else {
    healthEnabled = v5.boolean, 
    health = v5.number, 
    maxHealth = v5.number, 
    isDead = v5.boolean
});
v20.init = function(v21) --[[ Line: 46 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), l_FFlagUseNewHurtOverlayAnimation_0 (copy), l_FFlagTopBarSignalizeHealthBar_0 (copy), v12 (copy), v7 (copy), v17 (copy), v13 (copy), v6 (copy), l_StarterGui_0 (copy)
    local v22, v23 = v3.createBinding(0);
    v21.animationBinding = v22;
    v21.animationBindingUpdate = v23;
    if not l_FFlagUseNewHurtOverlayAnimation_0 then
        v21.positionBinding = v21.animationBinding:map(function(v24) --[[ Line: 51 ]]
            return UDim2.new(-10 * v24, 0, -10 * v24, 0);
        end);
        v21.sizeBinding = v21.animationBinding:map(function(v25) --[[ Line: 54 ]]
            return UDim2.new(1 + 19 * v25, 0, 1 + 19 * v25, 0);
        end);
    end;
    if l_FFlagTopBarSignalizeHealthBar_0 then
        v22, v23 = v3.createBinding(false);
        v21.isAnimating = v22;
        v21.setIsAnimating = v23;
        v22, v23 = v3.createBinding(v12.InitialHealth);
        v21.health = v22;
        v21.setHealth = v23;
        v22, v23 = v3.createBinding(v12.InitialHealth);
        v21.maxHealth = v22;
        v21.setMaxHealth = v23;
        v22, v23 = v3.createBinding(false);
        v21.isDead = v22;
        v21.setIsDead = v23;
        v21.prevHealth = v21.health:getValue();
        v21.prevIsDead = v21.isDead:getValue();
        v21.showHurtOverlay = v3.joinBindings({
            v21.isAnimating, 
            v21.health, 
            v21.maxHealth, 
            v21.isDead
        }):map(function(v26) --[[ Line: 67 ]]
            -- upvalues: v21 (copy), v12 (ref), l_FFlagUseNewHurtOverlayAnimation_0 (ref), v7 (ref), v17 (ref)
            local v27 = v26[1];
            local v28 = v26[2];
            local v29 = v26[3];
            local v30 = v26[4];
            local l_prevHealth_0 = v21.prevHealth;
            local l_prevIsDead_0 = v21.prevIsDead;
            v21.prevHealth = v28;
            v21.prevIsDead = v30;
            if v28 < l_prevHealth_0 and (not v30 or not l_prevIsDead_0) and (l_prevHealth_0 - v28) / v29 >= v12.HealthPercentForOverlay then
                if l_FFlagUseNewHurtOverlayAnimation_0 then
                    v21.setIsAnimating(true);
                    v21.motor:setGoal(v7.ease(0, {
                        duration = 0.1
                    }));
                    v21.motor:start();
                else
                    v21.motor:setGoal(v7.instant(0));
                    v21.motor:step(0);
                    v21.motor:setGoal(v7.spring(1, v17));
                    v21.motor:start();
                    v21.setIsAnimating(true);
                end;
                return true;
            else
                return v27;
            end;
        end);
        if v13.Stores.GetLocalHumanoidStore then
            v21.localHumanoidStore = v13.Stores.GetLocalHumanoidStore(false);
            v21.disposeHealthConnection = v6.createEffect(function(v33) --[[ Line: 104 ]]
                -- upvalues: v21 (copy), v12 (ref)
                local v34 = v21.localHumanoidStore.getHealthValue(v33);
                v21.setHealth(v34.health or v12.InitialHealth);
                v21.setMaxHealth(v34.maxHealth or v12.InitialHealth);
                v21.setIsDead(v34.isDead);
            end);
        end;
    else
        v21.state = {
            isAnimating = false
        };
    end;
    v21.motor = v7.createSingleMotor(l_FFlagUseNewHurtOverlayAnimation_0 and 1 or 0);
    v21.motor:onStep(function(v35) --[[ Line: 119 ]]
        -- upvalues: v21 (copy)
        v21.animationBindingUpdate(v35);
    end);
    v21.motor:onComplete(l_FFlagUseNewHurtOverlayAnimation_0 and function(v36) --[[ Line: 123 ]]
        -- upvalues: v21 (copy), v7 (ref), l_FFlagTopBarSignalizeHealthBar_0 (ref)
        if v36 == 0 then
            v21.motor:setGoal(v7.ease(1, {
                duration = 0.5
            }));
            v21.motor:start();
            return;
        else
            if v36 == 1 then
                if l_FFlagTopBarSignalizeHealthBar_0 then
                    v21.setIsAnimating(false);
                    return;
                else
                    v21:setState({
                        isAnimating = false
                    });
                end;
            end;
            return;
        end;
    end or function() --[[ Line: 138 ]]
        -- upvalues: l_FFlagTopBarSignalizeHealthBar_0 (ref), v21 (copy)
        if l_FFlagTopBarSignalizeHealthBar_0 then
            v21.setIsAnimating(false);
            return;
        else
            v21:setState({
                isAnimating = false
            });
            return;
        end;
    end);
    if l_FFlagTopBarSignalizeHealthBar_0 then
        v22 = function() --[[ Line: 149 ]] --[[ Name: getHealthEnabled ]]
            -- upvalues: l_StarterGui_0 (ref)
            return l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Health);
        end;
        v21.coreGuiChangedSignalConn = l_StarterGui_0.CoreGuiChangedSignal:Connect(function(v37, v38) --[[ Line: 154 ]]
            -- upvalues: v21 (copy)
            if v37 == Enum.CoreGuiType.Health or v37 == Enum.CoreGuiType.All then
                v21:setState({
                    mountHurtOverlay = v38
                });
            end;
        end);
        v21:setState({
            mountHurtOverlay = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Health)
        });
    end;
end;
v20.renderOverlay = function(v39) --[[ Line: 168 ]] --[[ Name: renderOverlay ]]
    -- upvalues: l_FFlagTopBarSignalizeHealthBar_0 (copy), l_FFlagUseNewHurtOverlayImage_0 (copy), v18 (copy), v9 (copy), v19 (copy), v3 (copy), l_FFlagUseNewHurtOverlayAnimation_0 (copy)
    local v40 = nil;
    if not l_FFlagTopBarSignalizeHealthBar_0 then
        v40 = v39.props.healthEnabled and v39.state.isAnimating;
    end;
    local v41 = l_FFlagUseNewHurtOverlayImage_0 and "rbxasset://textures/ui/TopBar/HurtOverlayAsset.png" or "rbxasset://textures/ui/TopBar/WhiteOverlayAsset.png";
    local l_v18_0 = v18;
    if v9:IsSubjectToChinaPolicies() then
        l_v18_0 = v19;
    end;
    return v3.createElement("ImageLabel", {
        Visible = if l_FFlagTopBarSignalizeHealthBar_0 then v39.showHurtOverlay else v40, 
        BackgroundTransparency = 1, 
        Image = v41, 
        ImageColor3 = l_v18_0, 
        ImageTransparency = if l_FFlagUseNewHurtOverlayAnimation_0 then v39.animationBinding else nil, 
        Size = if l_FFlagUseNewHurtOverlayAnimation_0 then UDim2.fromScale(1, 1) else v39.sizeBinding, 
        AnchorPoint = if l_FFlagUseNewHurtOverlayAnimation_0 then Vector2.new(0.5, 0.5) else nil, 
        Position = if l_FFlagUseNewHurtOverlayAnimation_0 then UDim2.fromScale(0.5, 0.5) else v39.positionBinding
    });
end;
v20.render = function(v43) --[[ Line: 194 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagTopBarSignalizeHealthBar_0 (copy)
    if l_FFlagTopBarSignalizeHealthBar_0 then
        if v43.state.mountHurtOverlay then
            return (v43:renderOverlay());
        else
            return nil;
        end;
    else
        return v43:renderOverlay();
    end;
end;
v20.didUpdate = function(v44, v45, _) --[[ Line: 202 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_FFlagTopBarSignalizeHealthBar_0 (copy), v12 (copy), v7 (copy), v17 (copy)
    if l_FFlagTopBarSignalizeHealthBar_0 then
        return;
    else
        if v44.props.health < v45.health and (not v44.props.isDead or not v45.isDead) and (v45.health - v44.props.health) / v44.props.maxHealth >= v12.HealthPercentForOverlay then
            v44.motor:setGoal(v7.instant(0));
            v44.motor:step(0);
            v44.motor:setGoal(v7.spring(1, v17));
            v44.motor:start();
            v44:setState({
                isAnimating = true
            });
        end;
        return;
    end;
end;
if l_FFlagTopBarSignalizeHealthBar_0 then
    v20.onUnmount = function(v47) --[[ Line: 224 ]] --[[ Name: onUnmount ]]
        v47.coreGuiChangedSignalConn:Disconnect();
        v47.disposeHealthConnection();
    end;
end;
local function v49(v48) --[[ Line: 230 ]] --[[ Name: mapStateToProps ]]
    return {
        health = v48.health.currentHealth, 
        maxHealth = v48.health.maxHealth, 
        isDead = v48.health.isDead, 
        healthEnabled = v48.coreGuiEnabled[Enum.CoreGuiType.Health]
    };
end;
if l_FFlagTopBarSignalizeHealthBar_0 then
    return v20;
else
    return v4.UNSTABLE_connect2(v49, nil)(v20);
end;