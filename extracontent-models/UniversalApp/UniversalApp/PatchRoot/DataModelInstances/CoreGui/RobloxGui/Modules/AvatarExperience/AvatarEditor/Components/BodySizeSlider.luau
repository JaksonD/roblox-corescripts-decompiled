local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Foundation);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useTokens_0 = v4.Hooks.useTokens;
local v9 = require(l_CorePackages_0.Packages.tutils);
local v10 = require(l_Modules_0.AvatarExperience.Common.Context.useBodyDataCallbacksContext);
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAvatarScales);
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.TwoAxisSlider);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v5.App.ImageSet.Images;
local v17 = Vector2.new(224, 224);
local v18 = l_Images_0["component_assets/circle_17"];
local function v25(v19, v20, v21) --[[ Line: 49 ]] --[[ Name: mapPositionToScales ]]
    local v22 = v20.max - v20.min;
    local v23 = math.clamp(v19.X * v22 + v20.min, v20.min, v20.max);
    local v24 = v21.max - v21.min;
    return v23, (math.clamp((1 - v19.Y) * v24 + v21.min, v21.min, v21.max));
end;
local function v34(v26, v27, v28, v29) --[[ Line: 62 ]] --[[ Name: mapScalesToPosition ]]
    local v30 = v28.max - v28.min;
    local v31 = (v26 - v28.min) / v30;
    local v32 = v29.max - v29.min;
    local v33 = (v27 - v29.min) / v32;
    return Vector2.new(v31, 1 - v33);
end;
local function v38(v35) --[[ Line: 72 ]] --[[ Name: selectScalesState ]]
    -- upvalues: v11 (copy)
    local l_AvatarScales_0 = v35.AvatarExperience.AvatarEditor.Character.AvatarScales;
    local v37 = v35.AvatarExperience.AvatarEditor.AvatarSettings[v11.AvatarSettings.scalesRules];
    return {
        width = l_AvatarScales_0.width, 
        height = l_AvatarScales_0.height, 
        widthRules = v37.width, 
        heightRules = v37.height
    };
end;
return v3.memo(v3.forwardRef(function(v39, v40) --[[ Line: 85 ]] --[[ Name: BodySizeSlider ]]
    -- upvalues: l_useTokens_0 (copy), l_useDispatch_0 (copy), v10 (copy), l_useSelector_0 (copy), v38 (copy), v9 (copy), v3 (copy), v25 (copy), v34 (copy), v12 (copy), l_ImageSetLabel_0 (copy), v18 (copy), v17 (copy), v13 (copy)
    local v41 = l_useTokens_0();
    local v42 = l_useDispatch_0();
    local v43 = v10();
    local v44 = l_useSelector_0(v38, v9.deepEqual);
    local l_width_0 = v44.width;
    local l_height_0 = v44.height;
    local l_widthRules_0 = v44.widthRules;
    local l_heightRules_0 = v44.heightRules;
    local v49, v50 = v3.useState({
        width = l_width_0, 
        height = l_height_0
    });
    local v52 = v3.useCallback(function(v51) --[[ Line: 99 ]]
        -- upvalues: v25 (ref), l_widthRules_0 (copy), l_heightRules_0 (copy)
        return v25(v51, l_widthRules_0, l_heightRules_0);
    end, {
        l_widthRules_0, 
        l_heightRules_0
    });
    local v55 = v3.useCallback(function(v53, v54) --[[ Line: 103 ]]
        -- upvalues: v34 (ref), l_widthRules_0 (copy), l_heightRules_0 (copy)
        return v34(v53, v54, l_widthRules_0, l_heightRules_0);
    end, {
        l_widthRules_0, 
        l_heightRules_0
    });
    local v58 = v3.useCallback(function(v56, v57) --[[ Line: 107 ]]
        -- upvalues: v43 (copy), v50 (copy)
        v43.setAvatarScales({
            width = v56, 
            height = v57
        });
        v50({
            width = v56, 
            height = v57
        });
    end, {
        v43
    });
    local v59 = v3.useCallback(function() --[[ Line: 114 ]]
        -- upvalues: v40 (copy)
        if v40 and v40.current then
            return v40.current.AbsolutePosition;
        else
            return nil;
        end;
    end, {});
    local v60 = v3.useCallback(function() --[[ Line: 121 ]]
        -- upvalues: v40 (copy)
        if v40 and v40.current then
            return v40.current.AbsoluteSize;
        else
            return nil;
        end;
    end, {});
    local v61 = v3.useCallback(function() --[[ Line: 128 ]]
        -- upvalues: v39 (copy)
        if v39.lockNavigationCallback then
            v39.lockNavigationCallback();
        end;
    end, {
        v39.lockNavigationCallback
    });
    local v62 = v3.useCallback(function() --[[ Line: 134 ]]
        -- upvalues: v39 (copy), v43 (copy), v42 (copy), v12 (ref), v49 (copy)
        if v39.unlockNavigationCallback then
            v39.unlockNavigationCallback();
        end;
        v43.setAvatarScales(nil);
        v42(v12({
            width = v49.width, 
            height = v49.height
        }));
    end, {
        v39.unlockNavigationCallback, 
        v49, 
        v43, 
        v42
    });
    return v3.createElement(l_ImageSetLabel_0, {
        Image = v18, 
        Size = UDim2.new(0, v17.X, 0, v17.Y), 
        BackgroundTransparency = 1, 
        ImageColor3 = v41.Semantic.Color.BackgroundUi.Default.Color3, 
        ImageTransparency = v39.isDisabled and 0.5 or v41.Semantic.Color.BackgroundUi.Default.Transparency, 
        LayoutOrder = v39.LayoutOrder, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(9, 9, 9, 9), 
        ZIndex = 2, 
        ref = v40
    }, {
        TwoAxisSlider = v3.createElement(v13, {
            mapPositionToScales = v52, 
            mapScalesToPosition = v55, 
            setScales = v58, 
            xScaleRules = l_widthRules_0, 
            yScaleRules = l_heightRules_0, 
            xScale = v49.width, 
            yScale = v49.height, 
            getBackgroundAbsolutePosition = v59, 
            getBackgroundAbsoluteSize = v60, 
            isDisabled = v39.isDisabled, 
            onDragStart = v61, 
            onDragEnd = v62
        })
    });
end));