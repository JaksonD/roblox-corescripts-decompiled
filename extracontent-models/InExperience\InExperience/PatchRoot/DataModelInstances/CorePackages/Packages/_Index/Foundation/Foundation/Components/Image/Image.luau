local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utility.Flags);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_Parent_0.FoundationCloudAssets);
local v5 = require(l_Parent_0.FoundationImages);
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.ReactIs);
local l_Assets_0 = v4.Assets;
local v9 = require(l_script_FirstAncestor_0.Components.Interactable);
local l_Images_0 = v5.Images;
local v11 = require(script.Parent.ImageSet.getScaledSlice);
local v12 = require(script.Parent.CloudAsset.isCloudAsset);
local v13 = require(script.Parent.ImageSet.isFoundationImage);
local v14 = require(l_script_FirstAncestor_0.Utility.GuiObjectChildren);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v16 = require(l_script_FirstAncestor_0.Utility.indexBindable);
local v17 = require(l_script_FirstAncestor_0.Utility.useDefaultTags);
local v18 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v19 = require(l_script_FirstAncestor_0.Utility.withGuiObjectProps);
local v20 = require(l_script_FirstAncestor_0.Providers.Style.useStyleTags);
local v21 = {
    AutoLocalize = false, 
    AutoButtonColor = false, 
    BorderSizePixel = 0, 
    isDisabled = false
};
local function _(v22) --[[ Line: 56 ]] --[[ Name: getAspectRatio ]]
    return v22.X / v22.Y;
end;
return v6.memo(v6.forwardRef(function(v24, v25) --[[ Line: 63 ]] --[[ Name: Image ]]
    -- upvalues: v18 (copy), v21 (copy), v6 (copy), v2 (copy), v7 (copy), v13 (copy), v12 (copy), l_Assets_0 (copy), l_Images_0 (copy), v11 (copy), v17 (copy), v20 (copy), v19 (copy), v16 (copy), v9 (copy), v14 (copy), v3 (copy)
    local v26 = v18(v24, v21);
    local v27 = true;
    if v26.onStateChanged == nil then
        v27 = true;
        if v26.onActivated == nil then
            v27 = v26.onSecondaryActivated ~= nil;
        end;
    end;
    local l_aspectRatio_0 = v26.aspectRatio;
    local v65, v66, v67, v68 = v6.useMemo(function() --[[ Line: 70 ]]
        -- upvalues: v26 (copy), v2 (ref), l_aspectRatio_0 (copy), v7 (ref), v13 (ref), v12 (ref), l_Assets_0 (ref), l_Images_0 (ref)
        local l_Image_0 = v26.Image;
        local v30 = if v26.imageRect then v26.imageRect.offset else nil;
        local v31 = if v26.imageRect then v26.imageRect.size else nil;
        local v32 = if v2.FoundationFixAspectRatioBindingHandling then l_aspectRatio_0 else v26.aspectRatio;
        if v7.isBinding(v26.Image) then
            local function _(v33) --[[ Line: 83 ]] --[[ Name: getImageBindingValue ]]
                -- upvalues: v26 (ref), v13 (ref), v12 (ref), l_Assets_0 (ref), v2 (ref), v32 (ref), l_Images_0 (ref), l_aspectRatio_0 (ref)
                return v26.Image:map(function(v34) --[[ Line: 84 ]]
                    -- upvalues: v13 (ref), v12 (ref), l_Assets_0 (ref), v2 (ref), v32 (ref), v33 (copy), l_Images_0 (ref), l_aspectRatio_0 (ref), v26 (ref)
                    if v13(v34) then
                        local v35 = nil;
                        if v12(v34) then
                            v35 = l_Assets_0[v34];
                            if not v2.FoundationFixAspectRatioBindingHandling then
                                local l_size_0 = v35.size;
                                v32 = l_size_0.X / l_size_0.Y;
                            end;
                            if v33 == "Image" then
                                return v35.assetId;
                            elseif v2.FoundationFixAspectRatioBindingHandling and v33 == "AspectRatio" then
                                local l_size_1 = v35.size;
                                return l_size_1.X / l_size_1.Y;
                            else
                                return nil;
                            end;
                        else
                            v35 = l_Images_0[v34];
                            if v2.FoundationFixAspectRatioBindingHandling and v33 == "AspectRatio" then
                                return l_aspectRatio_0;
                            elseif v35 then
                                return v35[v33];
                            else
                                return nil;
                            end;
                        end;
                    elseif v33 == "Image" then
                        return v34;
                    elseif v33 == "ImageRectOffset" and v26.imageRect then
                        return v26.imageRect.offset;
                    elseif v33 == "ImageRectSize" and v26.imageRect then
                        return v26.imageRect.size;
                    else
                        return nil;
                    end;
                end);
            end;
            if v2.FoundationFixAspectRatioBindingHandling then
                local l_Image_1 = v26.Image;
                local v40 = "AspectRatio";
                local l_v40_0 = v40 --[[ copy: 8 -> 11 ]];
                v32 = l_Image_1:map(function(v42) --[[ Line: 84 ]]
                    -- upvalues: v13 (ref), v12 (ref), l_Assets_0 (ref), v2 (ref), v32 (ref), l_v40_0 (copy), l_Images_0 (ref), l_aspectRatio_0 (ref), v26 (ref)
                    if v13(v42) then
                        local v43 = nil;
                        if v12(v42) then
                            v43 = l_Assets_0[v42];
                            if not v2.FoundationFixAspectRatioBindingHandling then
                                local l_size_2 = v43.size;
                                v32 = l_size_2.X / l_size_2.Y;
                            end;
                            if l_v40_0 == "Image" then
                                return v43.assetId;
                            elseif v2.FoundationFixAspectRatioBindingHandling and l_v40_0 == "AspectRatio" then
                                local l_size_3 = v43.size;
                                return l_size_3.X / l_size_3.Y;
                            else
                                return nil;
                            end;
                        else
                            v43 = l_Images_0[v42];
                            if v2.FoundationFixAspectRatioBindingHandling and l_v40_0 == "AspectRatio" then
                                return l_aspectRatio_0;
                            elseif v43 then
                                return v43[l_v40_0];
                            else
                                return nil;
                            end;
                        end;
                    elseif l_v40_0 == "Image" then
                        return v42;
                    elseif l_v40_0 == "ImageRectOffset" and v26.imageRect then
                        return v26.imageRect.offset;
                    elseif l_v40_0 == "ImageRectSize" and v26.imageRect then
                        return v26.imageRect.size;
                    else
                        return nil;
                    end;
                end);
            end;
            local l_Image_2 = v26.Image;
            local v47 = "Image";
            local l_v47_0 = v47 --[[ copy: 8 -> 9 ]];
            l_Image_0 = l_Image_2:map(function(v49) --[[ Line: 84 ]]
                -- upvalues: v13 (ref), v12 (ref), l_Assets_0 (ref), v2 (ref), v32 (ref), l_v47_0 (copy), l_Images_0 (ref), l_aspectRatio_0 (ref), v26 (ref)
                if v13(v49) then
                    local v50 = nil;
                    if v12(v49) then
                        v50 = l_Assets_0[v49];
                        if not v2.FoundationFixAspectRatioBindingHandling then
                            local l_size_4 = v50.size;
                            v32 = l_size_4.X / l_size_4.Y;
                        end;
                        if l_v47_0 == "Image" then
                            return v50.assetId;
                        elseif v2.FoundationFixAspectRatioBindingHandling and l_v47_0 == "AspectRatio" then
                            local l_size_5 = v50.size;
                            return l_size_5.X / l_size_5.Y;
                        else
                            return nil;
                        end;
                    else
                        v50 = l_Images_0[v49];
                        if v2.FoundationFixAspectRatioBindingHandling and l_v47_0 == "AspectRatio" then
                            return l_aspectRatio_0;
                        elseif v50 then
                            return v50[l_v47_0];
                        else
                            return nil;
                        end;
                    end;
                elseif l_v47_0 == "Image" then
                    return v49;
                elseif l_v47_0 == "ImageRectOffset" and v26.imageRect then
                    return v26.imageRect.offset;
                elseif l_v47_0 == "ImageRectSize" and v26.imageRect then
                    return v26.imageRect.size;
                else
                    return nil;
                end;
            end);
            l_Image_2 = v26.Image;
            v47 = "ImageRectOffset";
            local l_v47_1 = v47 --[[ copy: 8 -> 10 ]];
            v30 = l_Image_2:map(function(v54) --[[ Line: 84 ]]
                -- upvalues: v13 (ref), v12 (ref), l_Assets_0 (ref), v2 (ref), v32 (ref), l_v47_1 (copy), l_Images_0 (ref), l_aspectRatio_0 (ref), v26 (ref)
                if v13(v54) then
                    local v55 = nil;
                    if v12(v54) then
                        v55 = l_Assets_0[v54];
                        if not v2.FoundationFixAspectRatioBindingHandling then
                            local l_size_6 = v55.size;
                            v32 = l_size_6.X / l_size_6.Y;
                        end;
                        if l_v47_1 == "Image" then
                            return v55.assetId;
                        elseif v2.FoundationFixAspectRatioBindingHandling and l_v47_1 == "AspectRatio" then
                            local l_size_7 = v55.size;
                            return l_size_7.X / l_size_7.Y;
                        else
                            return nil;
                        end;
                    else
                        v55 = l_Images_0[v54];
                        if v2.FoundationFixAspectRatioBindingHandling and l_v47_1 == "AspectRatio" then
                            return l_aspectRatio_0;
                        elseif v55 then
                            return v55[l_v47_1];
                        else
                            return nil;
                        end;
                    end;
                elseif l_v47_1 == "Image" then
                    return v54;
                elseif l_v47_1 == "ImageRectOffset" and v26.imageRect then
                    return v26.imageRect.offset;
                elseif l_v47_1 == "ImageRectSize" and v26.imageRect then
                    return v26.imageRect.size;
                else
                    return nil;
                end;
            end);
            l_Image_2 = v26.Image;
            v47 = "ImageRectSize";
            v31 = l_Image_2:map(function(v58) --[[ Line: 84 ]]
                -- upvalues: v13 (ref), v12 (ref), l_Assets_0 (ref), v2 (ref), v32 (ref), v47 (copy), l_Images_0 (ref), l_aspectRatio_0 (ref), v26 (ref)
                if v13(v58) then
                    local v59 = nil;
                    if v12(v58) then
                        v59 = l_Assets_0[v58];
                        if not v2.FoundationFixAspectRatioBindingHandling then
                            local l_size_8 = v59.size;
                            v32 = l_size_8.X / l_size_8.Y;
                        end;
                        if v47 == "Image" then
                            return v59.assetId;
                        elseif v2.FoundationFixAspectRatioBindingHandling and v47 == "AspectRatio" then
                            local l_size_9 = v59.size;
                            return l_size_9.X / l_size_9.Y;
                        else
                            return nil;
                        end;
                    else
                        v59 = l_Images_0[v58];
                        if v2.FoundationFixAspectRatioBindingHandling and v47 == "AspectRatio" then
                            return l_aspectRatio_0;
                        elseif v59 then
                            return v59[v47];
                        else
                            return nil;
                        end;
                    end;
                elseif v47 == "Image" then
                    return v58;
                elseif v47 == "ImageRectOffset" and v26.imageRect then
                    return v26.imageRect.offset;
                elseif v47 == "ImageRectSize" and v26.imageRect then
                    return v26.imageRect.size;
                else
                    return nil;
                end;
            end);
        elseif typeof(v26.Image) == "string" and v13(v26.Image) then
            if v12(v26.Image) then
                local v62 = l_Assets_0[v26.Image];
                l_Image_0 = v62.assetId;
                local l_size_10 = v62.size;
                v32 = l_size_10.X / l_size_10.Y;
            else
                local v64 = l_Images_0[v26.Image];
                if v64 then
                    l_Image_0 = v64.Image;
                    v30 = v64.ImageRectOffset;
                    v31 = v64.ImageRectSize;
                end;
            end;
        end;
        return l_Image_0, v30, v31, v32;
    end, {
        v26.Image, 
        v26.imageRect, 
        if v2.FoundationFixAspectRatioBindingHandling then l_aspectRatio_0 else v26.aspectRatio, 
        l_Images_0
    });
    local v69 = nil;
    local v70 = nil;
    local l_ScaleType_0 = v26.ScaleType;
    if v26.slice then
        if v7.isBinding(v26.Image) then
            local v73 = v26.Image:map(function(v72) --[[ Line: 151 ]]
                -- upvalues: v13 (ref), v11 (ref), v26 (copy)
                if v13(v72) then
                    return v11(v26.slice.center, v26.slice.scale);
                else
                    return v26.slice;
                end;
            end);
            v69 = v73:map(function(v74) --[[ Line: 158 ]]
                return v74.center;
            end);
            v70 = v73:map(function(v75) --[[ Line: 161 ]]
                return v75.scale;
            end);
        elseif typeof(v26.Image) == "string" then
            if v13(v26.Image) then
                local v76 = v11(v26.slice.center, v26.slice.scale);
                v69 = v76.center;
                v70 = v76.scale;
            else
                v69 = v26.slice.center;
                v70 = v26.slice.scale;
            end;
        end;
        l_ScaleType_0 = Enum.ScaleType.Slice;
    end;
    v26.aspectRatio = v68;
    local v77 = v26.backgroundStyle ~= nil and "gui-object-defaults x-default-transparency" or "gui-object-defaults";
    local v78 = v17(v26.tag, v77);
    local v79 = v20(v78);
    local v80 = v27 and "ImageButton" or "ImageLabel";
    local v81 = v19(v26, {
        AutoButtonColor = if v80 == "ImageButton" then v26.AutoButtonColor else nil, 
        Image = v65, 
        ImageColor3 = if v26.imageStyle then v16(v26.imageStyle, "Color3") else nil, 
        ImageTransparency = if v26.imageStyle then v16(v26.imageStyle, "Transparency") else nil, 
        ImageRectOffset = v66, 
        ImageRectSize = v67, 
        ResampleMode = v26.ResampleMode, 
        ScaleType = l_ScaleType_0, 
        SliceCenter = v69, 
        SliceScale = v70, 
        TileSize = v26.TileSize, 
        ref = v25, 
        [v6.Tag] = v79
    });
    if v2.FoundationBuildingBlocksRemoveDashUnion then
        local l_v80_0 = v80;
        if v27 then
            l_v80_0 = v9;
            v81.component = v80;
            v81.onActivated = v26.onActivated;
            v81.onSecondaryActivated = v26.onSecondaryActivated;
            v81.onStateChanged = v26.onStateChanged;
            v81.stateLayer = v26.stateLayer;
            v81.isDisabled = v26.isDisabled;
            v81.cursor = v26.cursor;
        end;
        return v6.createElement(l_v80_0, v81, v14(v26));
    else
        local v83 = if v27 then v9 else v80;
        local v84 = {
            component = v80, 
            onActivated = v26.onActivated, 
            onSecondaryActivated = v26.onSecondaryActivated, 
            onStateChanged = v26.onStateChanged, 
            stateLayer = v26.stateLayer, 
            isDisabled = v26.isDisabled, 
            cursor = v26.cursor
        };
        local v85 = if v27 then v3.union(v81, v84) else v81;
        return v6.createElement(v83, v85, v14(v26));
    end;
end));