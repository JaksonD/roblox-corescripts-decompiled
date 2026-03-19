local l_Parent_0 = script:FindFirstAncestor("CoreScriptsRoactCommon").Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.Impressions);
local v3 = require(l_Parent_0.Localization);
local v4 = require(l_Parent_0.React);
local l_View_0 = v1.View;
local l_Text_0 = v1.Text;
local l_Image_0 = v1.Image;
local l_ImpressionsTagUtility_0 = v2.ImpressionsTagUtility;
local l_useLocalization_0 = v3.Hooks.useLocalization;
local l_FFlagTraversalExpCardFontSizeFix_0 = require(script.Parent.Flags).FFlagTraversalExpCardFontSizeFix;
return v4.memo(v4.forwardRef(function(v11, v12) --[[ Line: 27 ]] --[[ Name: TraversalExperienceCard ]]
    -- upvalues: v1 (copy), l_useLocalization_0 (copy), v4 (copy), l_ImpressionsTagUtility_0 (copy), l_View_0 (copy), l_Image_0 (copy), l_Text_0 (copy), l_FFlagTraversalExpCardFontSizeFix_0 (copy)
    local v13 = v1.Hooks.useTokens();
    local l_Foreground_0 = v13.Color.ActionStandard.Foreground;
    local l_Size_2500_0 = v13.Size.Size_2500;
    local v17 = if typeof(v11.width) == "table" then v11.width:map(function(v16) --[[ Line: 33 ]]
        -- upvalues: l_Size_2500_0 (copy)
        return UDim2.fromOffset(v16 or l_Size_2500_0, 0);
    end) else UDim2.fromOffset(v11.width or l_Size_2500_0, 0);
    local v18 = if v11.rating then l_useLocalization_0({
        ratingText = {
            "Feature.GameDetails.RatingPercentOnly"; 
            percentRating = v11.rating
        }
    }) else nil;
    local v19 = v4.useRef(nil);
    local v21 = v4.useCallback(function(v20) --[[ Line: 48 ]]
        -- upvalues: v19 (copy), v12 (copy)
        v19.current = v20;
        if typeof(v12) == "function" then
            v12(v20);
            return;
        else
            if typeof(v12) == "table" then
                v12.current = v20;
            end;
            return;
        end;
    end, {});
    v4.useEffect(function() --[[ Line: 57 ]]
        -- upvalues: v19 (copy), v11 (copy), l_ImpressionsTagUtility_0 (ref)
        if not v19.current or not v11.impressionTag or not v11.impressionIndex then
            return;
        else
            l_ImpressionsTagUtility_0.AddTag(v19, v11.impressionTag, v11.impressionIndex);
            return function() --[[ Line: 63 ]]
                -- upvalues: l_ImpressionsTagUtility_0 (ref), v19 (ref), v11 (ref)
                l_ImpressionsTagUtility_0.RemoveTag(v19, v11.impressionTag, v11.impressionIndex);
            end;
        end;
    end, {
        v11.impressionTag, 
        v11.impressionIndex
    });
    return v4.createElement(l_View_0, {
        tag = "auto-y align-x-center align-y-top col radius-medium", 
        Size = v17, 
        onActivated = v11.onActivated, 
        ref = v21
    }, {
        PlaceIcon = if v11.image then v4.createElement(l_Image_0, {
            Image = v11.image, 
            tag = "size-full-full radius-medium aspect-1-1", 
            style = l_Foreground_0
        }) else nil, 
        Text = v4.createElement(l_View_0, {
            tag = "size-full-0 auto-y col gap-xsmall padding-y-medium", 
            textStyle = l_Foreground_0
        }, {
            Name = v4.createElement(l_Text_0, {
                tag = "size-full-0 auto-y text-truncate-split text-title-medium text-align-x-left", 
                Text = v11.name
            }), 
            Rating = v11.rating and v4.createElement(l_Text_0, {
                tag = "size-full-0 auto-y text-truncate-end text-align-x-left " .. (l_FFlagTraversalExpCardFontSizeFix_0 and "text-body-medium " or "text-body-small "), 
                Text = v18.ratingText
            })
        })
    });
end));