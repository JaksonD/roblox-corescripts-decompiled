local l_script_FirstAncestor_0 = script:FindFirstAncestor("VrSpatialUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.UIManager);
local l_InExperienceUIVRIXP_0 = require(l_Parent_0.SharedExperimentDefinition).InExperienceUIVRIXP;
local function _(v5, v6) --[[ Line: 7 ]] --[[ Name: checkAndScalePart ]]
    -- upvalues: v3 (copy)
    local v7 = v3.getInstance():getAdditionalCameraScaleIfNeeded();
    if v5 and v5.current then
        v5.current.Size = Vector3.new(v6.X * v7, v6.Y * v7, v5.current.Size.Z);
    end;
end;
return function(v9, v10) --[[ Line: 15 ]] --[[ Name: useHeadScale ]]
    -- upvalues: v2 (copy), v3 (copy), l_InExperienceUIVRIXP_0 (copy)
    local v11, v12 = v2.useState(function() --[[ Line: 16 ]]
        -- upvalues: v3 (ref)
        return v3.getInstance():getAdditionalCameraScaleIfNeeded();
    end);
    v2.useEffect(function() --[[ Line: 19 ]]
        -- upvalues: l_InExperienceUIVRIXP_0 (ref), v9 (copy), v10 (copy), v3 (ref), v12 (copy)
        if l_InExperienceUIVRIXP_0:isSpatialUIScalingFixEnabled() then
            local l_v9_0 = v9;
            local l_v10_0 = v10;
            local v15 = v3.getInstance():getAdditionalCameraScaleIfNeeded();
            if l_v9_0 and l_v9_0.current then
                l_v9_0.current.Size = Vector3.new(l_v10_0.X * v15, l_v10_0.Y * v15, l_v9_0.current.Size.Z);
            end;
        else
            v12(v3.getInstance():getAdditionalCameraScaleIfNeeded());
        end;
        local v19 = workspace.CurrentCamera:GetPropertyChangedSignal("HeadScale"):Connect(function() --[[ Line: 26 ]]
            -- upvalues: l_InExperienceUIVRIXP_0 (ref), v9 (ref), v10 (ref), v3 (ref), v12 (ref)
            if l_InExperienceUIVRIXP_0:isSpatialUIScalingFixEnabled() then
                local l_v9_1 = v9;
                local l_v10_1 = v10;
                local v18 = v3.getInstance():getAdditionalCameraScaleIfNeeded();
                if l_v9_1 and l_v9_1.current then
                    l_v9_1.current.Size = Vector3.new(l_v10_1.X * v18, l_v10_1.Y * v18, l_v9_1.current.Size.Z);
                    return;
                end;
            else
                v12(v3.getInstance():getAdditionalCameraScaleIfNeeded());
            end;
        end);
        return function() --[[ Line: 33 ]]
            -- upvalues: v19 (copy)
            v19:Disconnect();
        end;
    end, if l_InExperienceUIVRIXP_0:isSpatialUIScalingFixEnabled() then {
        v9, 
        v10
    } else {});
    return v11, v12;
end;