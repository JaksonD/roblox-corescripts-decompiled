local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_RunService_0 = game:GetService("RunService");
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.ReactOtter);
local v5 = require(l_Parent_1.RoactUtils);
local v6 = require(l_Parent_0.Constants);
local l_useAnimatedBinding_0 = v4.useAnimatedBinding;
local v8 = require(l_Parent_0.Hooks.useBindCaptureShortcut);
local l_useEffect_0 = v3.useEffect;
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local v11 = require(l_Parent_0.Hooks.useShowFlashOverlay);
local v12 = require(l_Parent_0.Hooks.useTopbarInsetHeight);
local l_instant_0 = v4.instant;
local l_spring_0 = v4.spring;
return function(_) --[[ Line: 26 ]]
    -- upvalues: v8 (copy), v12 (copy), l_useSelector_0 (copy), v6 (copy), v11 (copy), l_useAnimatedBinding_0 (copy), l_useEffect_0 (copy), l_instant_0 (copy), l_RunService_0 (copy), l_spring_0 (copy), v3 (copy)
    v8();
    local v16 = v12();
    local v18 = l_useSelector_0(function(v17) --[[ Line: 31 ]]
        -- upvalues: v6 (ref)
        return v17[v6.RoduxKey].IsOverlayActive;
    end);
    local v19, v20 = v11();
    local v21, v22 = l_useAnimatedBinding_0(1);
    l_useEffect_0(function() --[[ Line: 38 ]]
        -- upvalues: v19 (copy), v20 (copy), v22 (copy), l_instant_0 (ref), l_RunService_0 (ref), l_spring_0 (ref)
        if v19 then
            v20();
            v22((l_instant_0(0)));
            task.defer(function() --[[ Line: 48 ]]
                -- upvalues: l_RunService_0 (ref), v22 (ref), l_spring_0 (ref)
                l_RunService_0.RenderStepped:Wait();
                l_RunService_0.RenderStepped:Wait();
                v22(l_spring_0(1));
            end);
        end;
    end, {
        v19
    });
    return v3.createElement("Frame", {
        Active = false, 
        BackgroundColor3 = Color3.new(0, 0, 0), 
        BackgroundTransparency = if v19 then v21 else 1, 
        Position = UDim2.fromOffset(0, -v16), 
        Size = UDim2.new(1, 0, 1, v16), 
        Visible = v18, 
        ZIndex = v6.ZIndex.Entrypoint
    }, {});
end;