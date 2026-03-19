local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceDetailsPrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_Sheet_0 = v3.Sheet;
local l_useScaledValue_0 = v3.Hooks.useScaledValue;
local _ = require(l_Parent_0.DataHydration);
local v7 = require(l_script_FirstAncestor_0.Features.InExperienceDetailsPromptErrorContent);
local v8 = require(l_script_FirstAncestor_0.Features.InExperienceDetailsPromptHeader);
local v9 = require(l_script_FirstAncestor_0.Features.InExperienceDetailsPromptContent);
local v10 = require(l_script_FirstAncestor_0.Features.InExperienceDetailsPromptActions);
local l_FFlagLuaAppIedpOverlayAndNavigationFix_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppIedpOverlayAndNavigationFix;
local l_FFlagLuaAppIedpFixPlayButton_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppIedpFixPlayButton;
local function v14(v13) --[[ Line: 42 ]] --[[ Name: sheetChildren ]]
    -- upvalues: v2 (copy), l_Sheet_0 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), l_FFlagLuaAppIedpFixPlayButton_0 (copy)
    if v13.errorType then
        return {
            Content = v2.createElement(l_Sheet_0.Content, nil, {
                ErrorContent = v2.createElement(v7, {
                    errorType = v13.errorType
                })
            })
        };
    else
        return {
            Header = v2.createElement(v8, {
                name = v13.name, 
                imageUri = v13.imageUri, 
                creator = v13.creator
            }), 
            Content = v2.createElement(l_Sheet_0.Content, nil, {
                MainContent = v2.createElement(v9, {
                    ageRecommendation = v13.ageRecommendation, 
                    rating = v13.rating
                })
            }), 
            Actions = v2.createElement(v10, {
                playability = v13.playability, 
                onJoin = v13.onJoin, 
                rootPlaceId = if l_FFlagLuaAppIedpFixPlayButton_0 then v13.rootPlaceId else nil, 
                playabilityRetrievalStatus = v13.playabilityRetrievalStatus
            })
        };
    end;
end;
return function(v15) --[[ Line: 74 ]] --[[ Name: InExperienceDetailsPrompt ]]
    -- upvalues: l_useScaledValue_0 (copy), v2 (copy), l_Sheet_0 (copy), l_FFlagLuaAppIedpOverlayAndNavigationFix_0 (copy), v14 (copy)
    local v16 = l_useScaledValue_0(260);
    return v2.createElement(l_Sheet_0.Root, {
        ref = v15.focusRootRef, 
        sheetRef = if l_FFlagLuaAppIedpOverlayAndNavigationFix_0 then v15.sheetRef else nil, 
        preferCenterSheet = true, 
        snapPoints = {
            v16
        }, 
        onClose = v15.onClose
    }, (v14(v15)));
end;