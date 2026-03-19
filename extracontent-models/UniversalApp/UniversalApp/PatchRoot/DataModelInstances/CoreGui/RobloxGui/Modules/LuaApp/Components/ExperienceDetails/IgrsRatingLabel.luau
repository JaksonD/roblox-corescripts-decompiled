local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes);
local v2 = require(script.Parent.getIgrsImage);
local l_EnumIgrsRating_0 = v1.EnumIgrsRating;
local v4 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.Foundation);
local l_Text_0 = v6.Text;
local l_Image_0 = v6.Image;
local l_View_0 = v6.View;
local l_useScaledValue_0 = v6.Hooks.useScaledValue;
local l_useTokens_0 = v6.Hooks.useTokens;
local l_FFlagLuaAppAllowNoIgrsImage_0 = v4.FFlagLuaAppAllowNoIgrsImage;
local l_FFlagLuaAppAddUnratedIgrsImage_0 = v4.FFlagLuaAppAddUnratedIgrsImage;
local v14 = l_FFlagLuaAppAddUnratedIgrsImage_0 and 0.8775804128660586 or nil;
return function(v15) --[[ Line: 33 ]] --[[ Name: IgrsRatingLabel ]]
    -- upvalues: l_useScaledValue_0 (copy), l_FFlagLuaAppAllowNoIgrsImage_0 (copy), l_useTokens_0 (copy), v2 (copy), v5 (copy), l_View_0 (copy), v6 (copy), l_Image_0 (copy), l_FFlagLuaAppAddUnratedIgrsImage_0 (copy), l_EnumIgrsRating_0 (copy), v14 (copy), l_Text_0 (copy)
    local v16 = l_useScaledValue_0(402);
    local v17 = nil;
    local v18 = nil;
    if l_FFlagLuaAppAllowNoIgrsImage_0 then
        v17 = l_useTokens_0();
        v18 = v2(v15.igrsRating);
    end;
    return v5.createElement(l_View_0, {
        tag = "padding-medium gap-large radius-medium row align-y-center stroke-default size-full-0 auto-y", 
        onActivated = v15.onActivated, 
        stateLayer = {
            affordance = v6.Enums.StateLayerAffordance.None
        }, 
        LayoutOrder = v15.LayoutOrder
    }, {
        SizeConstraint = v5.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(v16, 1e999), 
            MinSize = if l_FFlagLuaAppAllowNoIgrsImage_0 then Vector2.new(0, v17.Size.Size_1700) else nil
        }), 
        RatingImage = if l_FFlagLuaAppAllowNoIgrsImage_0 then if v18 then v5.createElement(l_Image_0, {
            Image = v18, 
            tag = "size-1700-1700", 
            LayoutOrder = 1
        }, {
            AspectRatio = if l_FFlagLuaAppAddUnratedIgrsImage_0 then v5.createElement("UIAspectRatioConstraint", {
                AspectRatio = if v15.igrsRating == l_EnumIgrsRating_0.IgrsUnrated then v14 else 1, 
                AspectType = Enum.AspectType.ScaleWithParentSize, 
                DominantAxis = Enum.DominantAxis.Height
            }) else nil
        }) else nil else v5.createElement(l_Image_0, {
            Image = v2(v15.igrsRating), 
            tag = "size-1700-1700", 
            LayoutOrder = 1
        }), 
        RatingText = v5.createElement(l_Text_0, {
            Text = v15.igrsRatingDisplayMessage or "", 
            tag = if l_FFlagLuaAppAddUnratedIgrsImage_0 then {
                ["fill auto-y text-wrap text-align-x-left"] = true, 
                ["text-body-medium"] = v15.igrsRating ~= l_EnumIgrsRating_0.IgrsUnrated, 
                ["text-title-medium content-emphasis"] = v15.igrsRating == l_EnumIgrsRating_0.IgrsUnrated
            } else "fill auto-y text-wrap text-align-x-left text-body-medium", 
            LayoutOrder = 2
        })
    });
end;