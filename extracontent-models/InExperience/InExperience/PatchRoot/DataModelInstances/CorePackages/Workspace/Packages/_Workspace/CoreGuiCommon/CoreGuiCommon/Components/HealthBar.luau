local l_StarterGui_0 = game:GetService("StarterGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CoreGuiCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.Constants);
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.RobloxAppHooks);
local v7 = require(l_Parent_0.RobloxAppEnums);
local v8 = require(l_Parent_0.Signals);
local v9 = require(l_Parent_0.SignalsReact);
local l_FFlagClampHealthPercentage_0 = require(l_script_FirstAncestor_0.Flags).FFlagClampHealthPercentage;
local l_GetLocalHumanoidStore_0 = require(l_script_FirstAncestor_0.Stores).GetLocalHumanoidStore;
local l_View_0 = v4.View;
local l_useDeviceOrientation_0 = v6.useDeviceOrientation;
local l_useTokens_0 = v4.Hooks.useTokens;
local l_HealthBarColors_0 = v3.HealthBarColors;
local function v25(v16) --[[ Line: 28 ]] --[[ Name: getHealthBarColor ]]
    -- upvalues: l_HealthBarColors_0 (copy)
    if v16 <= l_HealthBarColors_0.Red.Fraction then
        return l_HealthBarColors_0.Red.Color;
    elseif l_HealthBarColors_0.Green.Fraction <= v16 then
        return l_HealthBarColors_0.Green.Color;
    else
        local v17 = Vector3.new(0, 0, 0, 0);
        local v18 = 0;
        for _, v20 in l_HealthBarColors_0 do
            local v21 = Vector3.new(v20.Color.R, v20.Color.G, v20.Color.B);
            local v22 = v16 - v20.Fraction;
            if v22 == 0 then
                return Color3.new(v21.X, v21.Y, v21.Z);
            else
                local v23 = 1 / (v22 * v22);
                v17 = v17 + v23 * v21;
                v18 = v18 + v23;
            end;
        end;
        local v24 = v17 / v18;
        return Color3.new(v24.X, v24.Y, v24.Z);
    end;
end;
return v5.memo(function(v26) --[[ Line: 57 ]] --[[ Name: HealthBar ]]
    -- upvalues: l_StarterGui_0 (copy), l_useTokens_0 (copy), l_useDeviceOrientation_0 (copy), v9 (copy), l_GetLocalHumanoidStore_0 (copy), v5 (copy), v3 (copy), l_FFlagClampHealthPercentage_0 (copy), v8 (copy), l_View_0 (copy), v7 (copy), v25 (copy)
    local v27 = v26.mockStarterGui or l_StarterGui_0;
    local v28 = l_useTokens_0();
    local v29 = l_useDeviceOrientation_0();
    local v30 = v9.useSignalState(l_GetLocalHumanoidStore_0);
    local v31, v32 = v5.useState(v27:GetCoreGuiEnabled(Enum.CoreGuiType.Health));
    local v33, v34 = v5.useBinding(v3.InitialHealth);
    local v35, v36 = v5.useBinding(v3.InitialHealth);
    local v37, v38 = v5.useBinding(false);
    local v44 = v5.joinBindings({
        v33, 
        v35, 
        v37
    }):map(function(v39) --[[ Line: 70 ]]
        -- upvalues: l_FFlagClampHealthPercentage_0 (ref)
        local v40 = v39[1];
        local v41 = v39[2];
        local v42 = v39[3];
        local v43 = 1;
        if v42 then
            return 0;
        else
            if v41 > 0 then
                if l_FFlagClampHealthPercentage_0 then
                    return (math.clamp(v40 / v41, 0, 1));
                else
                    v43 = v40 / v41;
                end;
            end;
            return v43;
        end;
    end);
    local v46 = v5.joinBindings({
        v33, 
        v35
    }):map(function(v45) --[[ Line: 89 ]]
        return v45[1] < v45[2];
    end);
    v5.useEffect(function() --[[ Line: 93 ]]
        -- upvalues: v8 (ref), v30 (copy), v34 (copy), v3 (ref), v36 (copy), v38 (copy), v27 (copy), v32 (copy)
        local v49 = v8.createEffect(function(v47) --[[ Line: 94 ]]
            -- upvalues: v30 (ref), v34 (ref), v3 (ref), v36 (ref), v38 (ref)
            local v48 = v30.getHealthValue(v47);
            v34(v48.health or v3.InitialHealth);
            v36(v48.maxHealth or v3.InitialHealth);
            v38(v48.isDead or false);
        end);
        local v52 = v27.CoreGuiChangedSignal:Connect(function(v50, v51) --[[ Line: 103 ]]
            -- upvalues: v32 (ref)
            if v50 == Enum.CoreGuiType.Health or v50 == Enum.CoreGuiType.All then
                v32(v51);
            end;
        end);
        return function() --[[ Line: 110 ]]
            -- upvalues: v49 (copy), v52 (copy)
            v49();
            v52:Disconnect();
        end;
    end, {
        v30
    });
    if v31 then
        return (v5.createElement(l_View_0, {
            tag = "anchor-top-right position-top-right", 
            Visible = v46, 
            Size = UDim2.fromOffset(if v29 == v7.DeviceOrientationMode.Portrait then v28.Size.Size_2000 else v28.Size.Size_3000, v28.Size.Size_400), 
            LayoutOrder = v26.layoutOrder, 
            testId = "health-bar"
        }, {
            HealthBar = v5.createElement(l_View_0, {
                tag = "bg-surface-300 radius-medium size-full", 
                backgroundStyle = {
                    Color3 = v28.Color.Extended.Gray.Gray_700.Color3, 
                    Transparency = 0.2
                }, 
                stroke = {
                    Thickness = v28.Stroke.Thicker, 
                    Transparency = 0.2, 
                    BorderStrokePosition = Enum.BorderStrokePosition.Outer
                }, 
                Position = UDim2.fromScale(0, 0.5), 
                AnchorPoint = Vector2.new(0, 0.5)
            }, {
                Fill = v5.createElement(l_View_0, {
                    tag = "anchor-left-center radius-medium", 
                    backgroundStyle = v44:map(function(v53) --[[ Line: 145 ]]
                        -- upvalues: v25 (ref)
                        return {
                            Color3 = v25(v53), 
                            Transparency = 0
                        };
                    end), 
                    Size = v44:map(function(v54) --[[ Line: 151 ]]
                        return UDim2.fromScale(v54, 1);
                    end), 
                    testId = "health-bar-fill"
                })
            })
        }));
    else
        return nil;
    end;
end);