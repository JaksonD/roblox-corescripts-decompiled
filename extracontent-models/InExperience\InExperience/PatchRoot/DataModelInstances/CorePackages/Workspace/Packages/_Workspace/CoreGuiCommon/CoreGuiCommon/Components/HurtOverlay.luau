local l_StarterGui_0 = game:GetService("StarterGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CoreGuiCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.Constants);
local v4 = require(l_Parent_0.CachedPolicyService);
local v5 = require(l_Parent_0.Foundation);
local v6 = require(l_Parent_0.Motion);
local v7 = require(l_Parent_0.React);
local v8 = require(l_Parent_0.Signals);
local v9 = require(l_Parent_0.SignalsReact);
local l_FFlagUseNewHurtOverlayImage_0 = require(l_script_FirstAncestor_0.Flags).FFlagUseNewHurtOverlayImage;
local l_FFlagUseNewHurtOverlayAnimation_0 = require(l_script_FirstAncestor_0.Flags).FFlagUseNewHurtOverlayAnimation;
local l_GetLocalHumanoidStore_0 = require(l_script_FirstAncestor_0.Stores).GetLocalHumanoidStore;
local l_Image_0 = v5.Image;
local v14 = Color3.fromRGB(187, 0, 4);
local v15 = Color3.new(1, 1, 1);
local v16 = {
    showOverlay = v6.createState({
        size = if l_FFlagUseNewHurtOverlayAnimation_0 then nil else UDim2.fromScale(1.5, 1.5), 
        transparency = 0
    }, {
        default = v6.transition(v6.TransitionPreset.Default, {
            duration = l_FFlagUseNewHurtOverlayAnimation_0 and 0.1 or 0
        })
    }), 
    hideOverlay = v6.createState({
        size = if l_FFlagUseNewHurtOverlayAnimation_0 then nil else UDim2.fromScale(3, 3), 
        transparency = 1
    }, {
        default = v6.transition(v6.TransitionPreset.Default, {
            duration = l_FFlagUseNewHurtOverlayAnimation_0 and 0.5 or 0.3
        })
    })
};
HurtOverlay = function(v17) --[[ Line: 51 ]] --[[ Name: HurtOverlay ]]
    -- upvalues: l_StarterGui_0 (copy), v6 (copy), v16 (copy), v7 (copy), v9 (copy), l_GetLocalHumanoidStore_0 (copy), v8 (copy), v3 (copy), l_FFlagUseNewHurtOverlayImage_0 (copy), v14 (copy), v4 (copy), v15 (copy), l_Image_0 (copy), l_FFlagUseNewHurtOverlayAnimation_0 (copy)
    local v18 = v17.mockStarterGui or l_StarterGui_0;
    local v19, v20 = v6.useMotion(v16.hideOverlay);
    local v21, v22 = v7.useState(v18:GetCoreGuiEnabled(Enum.CoreGuiType.Health));
    local v23 = v9.useSignalState(l_GetLocalHumanoidStore_0);
    local v24 = v7.useRef(v23.getHealthValue(false));
    v7.useEffect(function() --[[ Line: 60 ]]
        -- upvalues: v8 (ref), v23 (copy), v24 (copy), v3 (ref), v20 (copy), v16 (ref), v18 (copy), v22 (copy)
        local v29 = v8.createEffect(function(v25) --[[ Line: 61 ]]
            -- upvalues: v23 (ref), v24 (ref), v3 (ref), v20 (ref), v16 (ref)
            local v26 = v23.getHealthValue(v25);
            local l_current_0 = v24.current;
            v24.current = v26;
            if not v26.health or not v26.maxHealth or not l_current_0.health or v26.isDead and l_current_0.isDead then
                return;
            elseif (l_current_0.health - v26.health) / v26.maxHealth < v3.HealthPercentForOverlay then
                return;
            else
                v20(v16.showOverlay, {
                    onAnimationComplete = function(v28) --[[ Line: 79 ]] --[[ Name: onAnimationComplete ]]
                        -- upvalues: v20 (ref), v16 (ref)
                        if v28 == true then
                            v20(v16.hideOverlay);
                        end;
                    end
                });
                return;
            end;
        end);
        local v32 = v18.CoreGuiChangedSignal:Connect(function(v30, v31) --[[ Line: 88 ]]
            -- upvalues: v22 (ref)
            if v30 == Enum.CoreGuiType.Health or v30 == Enum.CoreGuiType.All then
                v22(v31);
            end;
        end);
        return function() --[[ Line: 95 ]]
            -- upvalues: v29 (copy), v32 (copy)
            v29();
            v32:Disconnect();
        end;
    end, {
        v23
    });
    local v33 = l_FFlagUseNewHurtOverlayImage_0 and "rbxasset://textures/ui/TopBar/HurtOverlayAsset.png" or "rbxasset://textures/ui/TopBar/WhiteOverlayAsset.png";
    local l_v14_0 = v14;
    if v4:IsSubjectToChinaPolicies() then
        l_v14_0 = v15;
    end;
    return if v21 then v7.createElement(l_Image_0, {
        tag = "anchor-center-center position-center-center", 
        testId = "hurt-overlay", 
        Image = v33, 
        imageStyle = v19.transparency:map(function(v35) --[[ Line: 114 ]]
            -- upvalues: l_v14_0 (ref)
            return {
                Color3 = l_v14_0, 
                Transparency = v35
            };
        end), 
        ScaleType = Enum.ScaleType.Crop, 
        Size = if l_FFlagUseNewHurtOverlayAnimation_0 then UDim2.fromScale(1, 1) else v19.size
    }) else nil;
end;
return v7.memo(HurtOverlay);