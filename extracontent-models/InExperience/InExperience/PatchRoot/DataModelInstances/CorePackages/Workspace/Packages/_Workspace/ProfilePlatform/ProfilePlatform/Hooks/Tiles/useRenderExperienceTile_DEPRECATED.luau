local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_dependencyArray_0 = v3.Hooks.dependencyArray;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_OpenGameDetails_0 = require(l_Parent_0.GameDetail).OpenGameDetails;
local v8 = require(l_Parent_0.UIBlox);
local l_ExperienceTileV3_0 = v8.App.Tile.ExperienceTileV3;
local l_useStyle_0 = v8.Core.Style.useStyle;
local v11 = require(l_Parent_0.UserLib);
local l_Constants_0 = v11.Utils.Constants;
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v11.Utils.getRbxthumbWithTypeSizeAndOptions;
return function(v16, v17, _) --[[ Line: 30 ]] --[[ Name: useRenderSquareExperienceTile ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useStyle_0 (copy), v2 (copy), l_OpenGameDetails_0 (copy), l_Constants_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_ExperienceTileV3_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
    local v19 = l_useDispatch_0();
    local v20 = l_useNavigation_0();
    local v21 = l_useStyle_0();
    v16 = v16 or "ProfileExperienceTile_";
    return (v2.useCallback(function(v22, v23, _, v25) --[[ Line: 47 ]]
        -- upvalues: v17 (copy), v19 (copy), l_OpenGameDetails_0 (ref), v20 (copy), l_Constants_0 (ref), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), v2 (ref), l_ExperienceTileV3_0 (ref), v21 (copy), v16 (ref)
        local function v26() --[[ Line: 48 ]]
            -- upvalues: v17 (ref), v22 (copy), v23 (copy), v25 (copy), v19 (ref), l_OpenGameDetails_0 (ref), v20 (ref)
            if v17 then
                v17(v22, v23, v25);
            end;
            v19(l_OpenGameDetails_0(v22.experienceId, v20, {
                mountAsFullView = false, 
                showBackButton = true
            }));
        end;
        local l_GameIcon_0 = l_Constants_0.RbxthumbTypes.GameIcon;
        local v28 = l_getRbxthumbWithTypeSizeAndOptions_0(v22.experienceId, l_GameIcon_0, 150);
        return v2.createElement("Frame", {
            LayoutOrder = v23, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            Tile = v2.createElement(l_ExperienceTileV3_0, {
                contextTextLineCount = 1, 
                experienceName = v22.name, 
                thumbnail = v28, 
                hasBackground = false, 
                isHoverEnabled = false, 
                hasOutline = false, 
                onActivated = v26, 
                styleProps = {
                    bottomContentPadding = {
                        Left = 0, 
                        Right = 0, 
                        Top = v21.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing.Top, 
                        Bottom = v21.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing.Bottom
                    }
                }
            })
        }), (("%*%*_"):format(v16, v22.experienceId));
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v19, 
        v20, 
        v21.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing, 
        v17, 
        v16
    } else l_dependencyArray_0(v19, v20, v21.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing, v17, v16)));
end;