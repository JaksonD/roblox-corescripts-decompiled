local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceUIKit").Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_Image_0 = v3.Image;
local l_Skeleton_0 = v3.Skeleton;
local l_Radius_0 = v3.Enums.Radius;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_Parent_0.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local function v21(v9, v10) --[[ Line: 25 ]] --[[ Name: ItemCardThumbnail ]]
    -- upvalues: v2 (copy), l_useDesignTokens_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_RunService_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_Image_0 (copy)
    local v11, v12 = v2.useState(false);
    local v13 = l_useDesignTokens_0();
    local v20 = v2.useCallback(function(v14) --[[ Line: 30 ]]
        -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v10 (copy), v12 (copy), v9 (copy), l_RunService_0 (ref)
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            if typeof(v10) == "function" then
                v10(v14);
            elseif typeof(v10) == "table" then
                v10.current = v14;
            end;
        end;
        v12(false);
        if v14 and v9.url then
            local v15 = nil;
            local v16 = tick();
            do
                local l_v15_0, l_v16_0 = v15, v16;
                l_v15_0 = l_RunService_0.Heartbeat:Connect(function(v19) --[[ Line: 42 ]]
                    -- upvalues: l_v16_0 (ref), v14 (copy), v12 (ref), v9 (ref), l_v15_0 (ref)
                    l_v16_0 = l_v16_0 + v19;
                    if v14.IsLoaded then
                        v12(true);
                        if v9.onLoaded then
                            v9.onLoaded(l_v16_0);
                        end;
                        l_v15_0:Disconnect();
                        return;
                    else
                        if not v14.Parent then
                            l_v15_0:Disconnect();
                        end;
                        return;
                    end;
                end);
            end;
        end;
    end, {
        v9.onLoaded, 
        v9.url
    });
    return v2.createElement(v2.Fragment, nil, {
        ItemCardThumbnailSkeleton = if not v11 then v2.createElement(l_Skeleton_0, {
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 2, 
            testId = ("item-card-thumbnail-skeleton-%*"):format(v9.url), 
            radius = l_Radius_0.Medium
        }) else nil, 
        ItemCardThumbnailImage = v2.createElement(l_Image_0, {
            imageRect = v9.imageRect, 
            Image = v9.url, 
            Size = UDim2.fromScale(1, 1), 
            ScaleType = Enum.ScaleType.Crop, 
            ref = v20, 
            testId = ("item-card-thumbnail-image-%*"):format(v9.url), 
            tag = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v9.tag else nil
        }, {
            CornerRadius = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, v13.Semantic.Radius.Medium)
            })
        })
    });
end;
if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
    return (v2.forwardRef(v21));
else
    return v21;
end;