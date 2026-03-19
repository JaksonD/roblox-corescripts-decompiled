local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utility.Flags);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_Parent_0.FoundationCloudAssets);
local v5 = require(l_Parent_0.FoundationImages);
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.ReactIs);
local v8 = require(script.Parent.useOnLoaded);
local l_Assets_0 = v4.Assets;
local v10 = require(l_script_FirstAncestor_0.Components.Interactable);
local l_Images_0 = v5.Images;
local v12 = require(script.Parent.ImageSet.getScaledSlice);
local v13 = require(script.Parent.CloudAsset.isCloudAsset);
local v14 = require(script.Parent.ImageSet.isFoundationImage);
local v15 = require(l_script_FirstAncestor_0.Utility.GuiObjectChildren);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v17 = require(l_script_FirstAncestor_0.Utility.indexBindable);
local v18 = require(l_script_FirstAncestor_0.Utility.useDefaultTags);
local v19 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v20 = require(l_script_FirstAncestor_0.Utility.withGuiObjectProps);
local v21 = require(l_script_FirstAncestor_0.Providers.Style.useStyleTags);
local v22 = {
    AutoLocalize = false, 
    AutoButtonColor = false, 
    BorderSizePixel = 0, 
    isDisabled = false
};
local function _(v23) --[[ Line: 61 ]] --[[ Name: getAspectRatio ]]
    return v23.X / v23.Y;
end;
local v25 = _G.__DEV__ == true;
local function _(v26) --[[ Line: 67 ]] --[[ Name: getFoundationImageAsset ]]
    -- upvalues: v25 (copy), l_Images_0 (copy)
    if v25 then
        return l_Images_0[v26];
    else
        return (rawget(l_Images_0, v26));
    end;
end;
local function _(v28) --[[ Line: 78 ]] --[[ Name: shouldUseFoundationSlice ]]
    -- upvalues: v14 (copy), v13 (copy), v25 (copy), l_Images_0 (copy)
    if not v14(v28) then
        return false;
    else
        return v13(v28) or (if v25 then l_Images_0[v28] else rawget(l_Images_0, v28)) ~= nil;
    end;
end;
return v6.memo(v6.forwardRef(function(v30, v31) --[[ Line: 89 ]] --[[ Name: Image ]]
    -- upvalues: v19 (copy), v22 (copy), v6 (copy), v7 (copy), v14 (copy), v13 (copy), l_Assets_0 (copy), v2 (copy), v25 (copy), l_Images_0 (copy), v12 (copy), v18 (copy), v21 (copy), v8 (copy), v20 (copy), v17 (copy), v10 (copy), v15 (copy), v3 (copy)
    local v32 = v19(v30, v22);
    local v33 = true;
    if v32.onStateChanged == nil then
        v33 = true;
        if v32.onActivated == nil then
            v33 = v32.onSecondaryActivated ~= nil;
        end;
    end;
    local l_aspectRatio_0 = v32.aspectRatio;
    local v65, v66, v67, v68 = v6.useMemo(function() --[[ Line: 96 ]]
        -- upvalues: v32 (copy), l_aspectRatio_0 (copy), v7 (ref), v14 (ref), v13 (ref), l_Assets_0 (ref), v2 (ref), v25 (ref), l_Images_0 (ref)
        local l_Image_0 = v32.Image;
        local v36 = if v32.imageRect then v32.imageRect.offset else nil;
        local v37 = if v32.imageRect then v32.imageRect.size else nil;
        local l_l_aspectRatio_0_0 = l_aspectRatio_0;
        if v7.isBinding(v32.Image) then
            local function _(v39) --[[ Line: 107 ]] --[[ Name: getImageBindingValue ]]
                -- upvalues: v32 (ref), v14 (ref), v13 (ref), l_Assets_0 (ref), v2 (ref), v25 (ref), l_Images_0 (ref), l_aspectRatio_0 (ref)
                return v32.Image:map(function(v40) --[[ Line: 108 ]]
                    -- upvalues: v14 (ref), v13 (ref), l_Assets_0 (ref), v39 (copy), v2 (ref), v25 (ref), l_Images_0 (ref), l_aspectRatio_0 (ref), v32 (ref)
                    if v14(v40) then
                        local v41 = nil;
                        if v13(v40) then
                            v41 = l_Assets_0[v40];
                            if v39 == "Image" then
                                return v41.assetId;
                            elseif v39 == "AspectRatio" then
                                local l_size_0 = v41.size;
                                return l_size_0.X / l_size_0.Y;
                            else
                                return nil;
                            end;
                        else
                            v41 = if v2.FoundationImageSafeLookup then if v25 then l_Images_0[v40] else rawget(l_Images_0, v40) else l_Images_0[v40];
                            if v39 == "AspectRatio" then
                                return l_aspectRatio_0;
                            elseif v41 then
                                return v41[v39];
                            elseif v2.FoundationImageSafeLookup and v39 == "Image" then
                                return v40;
                            else
                                return nil;
                            end;
                        end;
                    elseif v39 == "Image" then
                        return v40;
                    elseif v39 == "ImageRectOffset" and v32.imageRect then
                        return v32.imageRect.offset;
                    elseif v39 == "ImageRectSize" and v32.imageRect then
                        return v32.imageRect.size;
                    else
                        return nil;
                    end;
                end);
            end;
            local l_Image_1 = v32.Image;
            local v45 = "AspectRatio";
            local l_v45_0 = v45 --[[ copy: 8 -> 9 ]];
            l_l_aspectRatio_0_0 = l_Image_1:map(function(v47) --[[ Line: 108 ]]
                -- upvalues: v14 (ref), v13 (ref), l_Assets_0 (ref), l_v45_0 (copy), v2 (ref), v25 (ref), l_Images_0 (ref), l_aspectRatio_0 (ref), v32 (ref)
                if v14(v47) then
                    local v48 = nil;
                    if v13(v47) then
                        v48 = l_Assets_0[v47];
                        if l_v45_0 == "Image" then
                            return v48.assetId;
                        elseif l_v45_0 == "AspectRatio" then
                            local l_size_1 = v48.size;
                            return l_size_1.X / l_size_1.Y;
                        else
                            return nil;
                        end;
                    else
                        v48 = if v2.FoundationImageSafeLookup then if v25 then l_Images_0[v47] else rawget(l_Images_0, v47) else l_Images_0[v47];
                        if l_v45_0 == "AspectRatio" then
                            return l_aspectRatio_0;
                        elseif v48 then
                            return v48[l_v45_0];
                        elseif v2.FoundationImageSafeLookup and l_v45_0 == "Image" then
                            return v47;
                        else
                            return nil;
                        end;
                    end;
                elseif l_v45_0 == "Image" then
                    return v47;
                elseif l_v45_0 == "ImageRectOffset" and v32.imageRect then
                    return v32.imageRect.offset;
                elseif l_v45_0 == "ImageRectSize" and v32.imageRect then
                    return v32.imageRect.size;
                else
                    return nil;
                end;
            end);
            l_Image_1 = v32.Image;
            v45 = "Image";
            local l_v45_1 = v45 --[[ copy: 8 -> 10 ]];
            l_Image_0 = l_Image_1:map(function(v51) --[[ Line: 108 ]]
                -- upvalues: v14 (ref), v13 (ref), l_Assets_0 (ref), l_v45_1 (copy), v2 (ref), v25 (ref), l_Images_0 (ref), l_aspectRatio_0 (ref), v32 (ref)
                if v14(v51) then
                    local v52 = nil;
                    if v13(v51) then
                        v52 = l_Assets_0[v51];
                        if l_v45_1 == "Image" then
                            return v52.assetId;
                        elseif l_v45_1 == "AspectRatio" then
                            local l_size_2 = v52.size;
                            return l_size_2.X / l_size_2.Y;
                        else
                            return nil;
                        end;
                    else
                        v52 = if v2.FoundationImageSafeLookup then if v25 then l_Images_0[v51] else rawget(l_Images_0, v51) else l_Images_0[v51];
                        if l_v45_1 == "AspectRatio" then
                            return l_aspectRatio_0;
                        elseif v52 then
                            return v52[l_v45_1];
                        elseif v2.FoundationImageSafeLookup and l_v45_1 == "Image" then
                            return v51;
                        else
                            return nil;
                        end;
                    end;
                elseif l_v45_1 == "Image" then
                    return v51;
                elseif l_v45_1 == "ImageRectOffset" and v32.imageRect then
                    return v32.imageRect.offset;
                elseif l_v45_1 == "ImageRectSize" and v32.imageRect then
                    return v32.imageRect.size;
                else
                    return nil;
                end;
            end);
            l_Image_1 = v32.Image;
            v45 = "ImageRectOffset";
            local l_v45_2 = v45 --[[ copy: 8 -> 11 ]];
            v36 = l_Image_1:map(function(v55) --[[ Line: 108 ]]
                -- upvalues: v14 (ref), v13 (ref), l_Assets_0 (ref), l_v45_2 (copy), v2 (ref), v25 (ref), l_Images_0 (ref), l_aspectRatio_0 (ref), v32 (ref)
                if v14(v55) then
                    local v56 = nil;
                    if v13(v55) then
                        v56 = l_Assets_0[v55];
                        if l_v45_2 == "Image" then
                            return v56.assetId;
                        elseif l_v45_2 == "AspectRatio" then
                            local l_size_3 = v56.size;
                            return l_size_3.X / l_size_3.Y;
                        else
                            return nil;
                        end;
                    else
                        v56 = if v2.FoundationImageSafeLookup then if v25 then l_Images_0[v55] else rawget(l_Images_0, v55) else l_Images_0[v55];
                        if l_v45_2 == "AspectRatio" then
                            return l_aspectRatio_0;
                        elseif v56 then
                            return v56[l_v45_2];
                        elseif v2.FoundationImageSafeLookup and l_v45_2 == "Image" then
                            return v55;
                        else
                            return nil;
                        end;
                    end;
                elseif l_v45_2 == "Image" then
                    return v55;
                elseif l_v45_2 == "ImageRectOffset" and v32.imageRect then
                    return v32.imageRect.offset;
                elseif l_v45_2 == "ImageRectSize" and v32.imageRect then
                    return v32.imageRect.size;
                else
                    return nil;
                end;
            end);
            l_Image_1 = v32.Image;
            v45 = "ImageRectSize";
            return l_Image_0, v36, l_Image_1:map(function(v58) --[[ Line: 108 ]]
                -- upvalues: v14 (ref), v13 (ref), l_Assets_0 (ref), v45 (copy), v2 (ref), v25 (ref), l_Images_0 (ref), l_aspectRatio_0 (ref), v32 (ref)
                if v14(v58) then
                    local v59 = nil;
                    if v13(v58) then
                        v59 = l_Assets_0[v58];
                        if v45 == "Image" then
                            return v59.assetId;
                        elseif v45 == "AspectRatio" then
                            local l_size_4 = v59.size;
                            return l_size_4.X / l_size_4.Y;
                        else
                            return nil;
                        end;
                    else
                        v59 = if v2.FoundationImageSafeLookup then if v25 then l_Images_0[v58] else rawget(l_Images_0, v58) else l_Images_0[v58];
                        if v45 == "AspectRatio" then
                            return l_aspectRatio_0;
                        elseif v59 then
                            return v59[v45];
                        elseif v2.FoundationImageSafeLookup and v45 == "Image" then
                            return v58;
                        else
                            return nil;
                        end;
                    end;
                elseif v45 == "Image" then
                    return v58;
                elseif v45 == "ImageRectOffset" and v32.imageRect then
                    return v32.imageRect.offset;
                elseif v45 == "ImageRectSize" and v32.imageRect then
                    return v32.imageRect.size;
                else
                    return nil;
                end;
            end), l_l_aspectRatio_0_0;
        else
            if typeof(v32.Image) == "string" and v14(v32.Image) then
                if v13(v32.Image) then
                    local v61 = l_Assets_0[v32.Image];
                    l_Image_0 = v61.assetId;
                    local l_size_5 = v61.size;
                    return l_Image_0, v36, v37, l_size_5.X / l_size_5.Y;
                else
                    local v63;
                    if v2.FoundationImageSafeLookup then
                        local l_Image_2 = v32.Image;
                        v63 = if v25 then l_Images_0[l_Image_2] else rawget(l_Images_0, l_Image_2);
                    else
                        v63 = l_Images_0[v32.Image];
                    end;
                    if v63 then
                        l_Image_0 = v63.Image;
                        v36 = v63.ImageRectOffset;
                        v37 = v63.ImageRectSize;
                    end;
                end;
            end;
            return l_Image_0, v36, v37, l_l_aspectRatio_0_0;
        end;
    end, {
        v32.Image, 
        v32.imageRect, 
        l_aspectRatio_0, 
        l_Images_0
    });
    local v69 = nil;
    local v70 = nil;
    local l_ScaleType_0 = v32.ScaleType;
    if v32.slice then
        if v7.isBinding(v32.Image) then
            local v73 = v32.Image:map(function(v72) --[[ Line: 173 ]]
                -- upvalues: v2 (ref), v14 (ref), v13 (ref), v25 (ref), l_Images_0 (ref), v12 (ref), v32 (copy)
                if if v2.FoundationImageSafeLookup then if v14(v72) then v13(v72) or (if v25 then l_Images_0[v72] else rawget(l_Images_0, v72)) ~= nil else false else v14(v72) then
                    return v12(v32.slice.center, v32.slice.scale);
                else
                    return v32.slice;
                end;
            end);
            v69 = v73:map(function(v74) --[[ Line: 184 ]]
                return v74.center;
            end);
            v70 = v73:map(function(v75) --[[ Line: 187 ]]
                return v75.scale;
            end);
        elseif typeof(v32.Image) == "string" then
            local v76;
            if v2.FoundationImageSafeLookup then
                local l_Image_3 = v32.Image;
                v76 = not not v14(l_Image_3) and (v13(l_Image_3) or (if v25 then l_Images_0[l_Image_3] else rawget(l_Images_0, l_Image_3)) ~= nil);
            else
                v76 = v14(v32.Image);
            end;
            if v76 then
                v76 = v12(v32.slice.center, v32.slice.scale);
                v69 = v76.center;
                v70 = v76.scale;
            else
                v69 = v32.slice.center;
                v70 = v32.slice.scale;
            end;
        end;
        l_ScaleType_0 = Enum.ScaleType.Slice;
    end;
    v32.aspectRatio = v68;
    local v78 = v32.backgroundStyle ~= nil and "gui-object-defaults x-default-transparency" or "gui-object-defaults";
    local v79 = v18(v32.tag, v78);
    local v80 = v21(v79);
    if v2.FoundationImageOnLoadedCallback then
        v8(v65, v32.onLoaded);
    end;
    local v81 = v33 and "ImageButton" or "ImageLabel";
    local v82 = v20(v32, {
        AutoButtonColor = if v81 == "ImageButton" then v32.AutoButtonColor else nil, 
        Image = v65, 
        ImageColor3 = if v32.imageStyle then v17(v32.imageStyle, "Color3") else nil, 
        ImageTransparency = if v32.imageStyle then v17(v32.imageStyle, "Transparency") else nil, 
        ImageRectOffset = v66, 
        ImageRectSize = v67, 
        ResampleMode = v32.ResampleMode, 
        ScaleType = l_ScaleType_0, 
        SliceCenter = v69, 
        SliceScale = v70, 
        TileSize = v32.TileSize, 
        ref = v31, 
        [v6.Tag] = v80
    });
    if v2.FoundationBuildingBlocksRemoveDashUnion then
        local l_v81_0 = v81;
        if v33 then
            l_v81_0 = v10;
            v82.component = v81;
            v82.onActivated = v32.onActivated;
            v82.onSecondaryActivated = v32.onSecondaryActivated;
            v82.onStateChanged = v32.onStateChanged;
            v82.stateLayer = v32.stateLayer;
            v82.isDisabled = v32.isDisabled;
            v82.cursor = v32.cursor;
        end;
        return v6.createElement(l_v81_0, v82, v15(v32));
    else
        local v84 = if v33 then v10 else v81;
        local v85 = {
            component = v81, 
            onActivated = v32.onActivated, 
            onSecondaryActivated = v32.onSecondaryActivated, 
            onStateChanged = v32.onStateChanged, 
            stateLayer = v32.stateLayer, 
            isDisabled = v32.isDisabled, 
            cursor = v32.cursor
        };
        local v86 = if v33 then v3.union(v82, v85) else v82;
        return v6.createElement(v84, v86, v15(v32));
    end;
end));