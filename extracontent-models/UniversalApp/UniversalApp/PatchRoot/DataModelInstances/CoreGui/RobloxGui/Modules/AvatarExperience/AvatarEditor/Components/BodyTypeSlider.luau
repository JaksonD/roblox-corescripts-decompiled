local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Foundation);
local v5 = require(l_CorePackages_0.Packages.tutils);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useTokens_0 = v4.Hooks.useTokens;
local v9 = require(l_Modules_0.AvatarExperience.Common.Context.useBodyDataCallbacksContext);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAvatarScales);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.TwoAxisSlider);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v14 = Vector2.new(224, 195);
local function v21(v15, v16, v17) --[[ Line: 47 ]] --[[ Name: mapPositionToScales ]]
    local v18 = v16.max - v16.min;
    local v19 = math.clamp((1 - v15.Y) * v18 + v16.min, v16.min, v16.max);
    local v20 = v17.max - v17.min;
    return math.clamp((1 - (v19 == 0 and 0.5 or (v15.X - 0.5 * v15.Y) / v19)) * v20 + v17.min, v17.min, v17.max), v19;
end;
local function v30(v22, v23, v24, v25) --[[ Line: 64 ]] --[[ Name: mapScalesToPosition ]]
    local v26 = v24.max - v24.min;
    local v27 = (v23 - v24.min) / v26;
    local v28 = v25.max - v25.min;
    local v29 = (v22 - v25.min) / v28;
    return Vector2.new((1 - v29) * v27 + (1 - v27) * 0.5, 1 - v27);
end;
local function v34(v31) --[[ Line: 82 ]] --[[ Name: selectScalesState ]]
    -- upvalues: v10 (copy)
    local l_AvatarScales_0 = v31.AvatarExperience.AvatarEditor.Character.AvatarScales;
    local v33 = v31.AvatarExperience.AvatarEditor.AvatarSettings[v10.AvatarSettings.scalesRules];
    return {
        bodyType = l_AvatarScales_0.bodyType, 
        proportion = l_AvatarScales_0.proportion, 
        bodyTypeScaleRules = v33.bodyType, 
        proportionScaleRules = v33.proportion
    };
end;
return v3.memo(v3.forwardRef(function(v35, v36) --[[ Line: 95 ]] --[[ Name: BodyTypeSlider ]]
    -- upvalues: l_useTokens_0 (copy), l_useSelector_0 (copy), v34 (copy), v5 (copy), v9 (copy), l_useDispatch_0 (copy), v3 (copy), v21 (copy), v30 (copy), v11 (copy), v14 (copy), v12 (copy)
    local v37 = l_useTokens_0();
    local v38 = l_useSelector_0(v34, v5.deepEqual);
    local v39 = v9();
    local v40 = l_useDispatch_0();
    local l_proportion_0 = v38.proportion;
    local l_bodyType_0 = v38.bodyType;
    local l_bodyTypeScaleRules_0 = v38.bodyTypeScaleRules;
    local l_proportionScaleRules_0 = v38.proportionScaleRules;
    local v45, v46 = v3.useState({
        proportion = l_proportion_0, 
        bodyType = l_bodyType_0
    });
    local v48 = v3.useCallback(function(v47) --[[ Line: 113 ]]
        -- upvalues: v21 (ref), l_bodyTypeScaleRules_0 (copy), l_proportionScaleRules_0 (copy)
        return v21(v47, l_bodyTypeScaleRules_0, l_proportionScaleRules_0);
    end, {
        l_bodyTypeScaleRules_0, 
        l_proportionScaleRules_0
    });
    local v51 = v3.useCallback(function(v49, v50) --[[ Line: 117 ]]
        -- upvalues: v30 (ref), l_bodyTypeScaleRules_0 (copy), l_proportionScaleRules_0 (copy)
        return v30(v49, v50, l_bodyTypeScaleRules_0, l_proportionScaleRules_0);
    end, {
        l_bodyTypeScaleRules_0, 
        l_proportionScaleRules_0
    });
    local v54 = v3.useCallback(function(v52, v53) --[[ Line: 121 ]]
        -- upvalues: v39 (copy), v46 (copy)
        v39.setAvatarScales({
            proportion = v52, 
            bodyType = v53
        });
        v46({
            proportion = v52, 
            bodyType = v53
        });
    end, {
        v39
    });
    local v55 = v3.useCallback(function() --[[ Line: 126 ]]
        -- upvalues: v36 (copy)
        if v36 and v36.current then
            return v36.current.AbsolutePosition;
        else
            return nil;
        end;
    end, {});
    local v56 = v3.useCallback(function() --[[ Line: 133 ]]
        -- upvalues: v36 (copy)
        if v36 and v36.current then
            return v36.current.AbsoluteSize;
        else
            return nil;
        end;
    end, {});
    local v57 = v3.useCallback(function() --[[ Line: 140 ]]
        -- upvalues: v35 (copy)
        if v35.lockNavigationCallback then
            v35.lockNavigationCallback();
        end;
    end, {
        v35.lockNavigationCallback
    });
    local v58 = v3.useCallback(function() --[[ Line: 146 ]]
        -- upvalues: v35 (copy), v39 (copy), v40 (copy), v11 (ref), v45 (copy)
        if v35.unlockNavigationCallback then
            v35.unlockNavigationCallback();
        end;
        v39.setAvatarScales(nil);
        v40(v11({
            proportion = v45.proportion, 
            bodyType = v45.bodyType
        }));
    end, {
        v35.unlockNavigationCallback, 
        v45, 
        v39, 
        v40
    });
    local v59 = v14.X / v14.Y;
    local v60 = v14.X / v59;
    return v3.createElement("ImageLabel", {
        AnchorPoint = Vector2.new(0.5, 0), 
        Position = UDim2.new(0.5, 0, 0, 0), 
        Image = "rbxasset://textures/AvatarEditorImages/Sliders/body-type-slider-background.png", 
        LayoutOrder = v35.LayoutOrder, 
        Size = UDim2.new(0, v14.X, 0, v60), 
        BackgroundTransparency = 1, 
        ImageColor3 = v37.Semantic.Color.BackgroundUi.Default.Color3, 
        ImageTransparency = v35.isDisabled and 0.5 or v37.Semantic.Color.BackgroundUi.Default.Transparency, 
        ref = v36
    }, {
        TwoAxisSlider = v3.createElement(v12, {
            mapPositionToScales = v48, 
            mapScalesToPosition = v51, 
            setScales = v54, 
            xScaleRules = l_proportionScaleRules_0, 
            yScaleRules = l_bodyTypeScaleRules_0, 
            xScale = v45.proportion, 
            yScale = v45.bodyType, 
            getBackgroundAbsolutePosition = v55, 
            getBackgroundAbsoluteSize = v56, 
            invertDPadX = true, 
            isDisabled = v35.isDisabled, 
            onDragStart = v57, 
            onDragEnd = v58
        })
    });
end));