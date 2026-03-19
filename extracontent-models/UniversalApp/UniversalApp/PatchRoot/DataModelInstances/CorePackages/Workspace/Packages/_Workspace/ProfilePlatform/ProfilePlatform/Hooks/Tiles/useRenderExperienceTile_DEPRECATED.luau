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
local l_getRbxthumbWithTypeSizeAndOptions_0 = v11.Utils.getRbxthumbWithTypeSizeAndOptions;
return function(v15, v16, _) --[[ Line: 28 ]] --[[ Name: useRenderSquareExperienceTile ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useStyle_0 (copy), v2 (copy), l_OpenGameDetails_0 (copy), l_Constants_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_ExperienceTileV3_0 (copy), l_dependencyArray_0 (copy)
    local v18 = l_useDispatch_0();
    local v19 = l_useNavigation_0();
    local v20 = l_useStyle_0();
    v15 = v15 or "ProfileExperienceTile_";
    return (v2.useCallback(function(v21, v22, _, v24) --[[ Line: 45 ]]
        -- upvalues: v16 (copy), v18 (copy), l_OpenGameDetails_0 (ref), v19 (copy), l_Constants_0 (ref), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), v2 (ref), l_ExperienceTileV3_0 (ref), v20 (copy), v15 (ref)
        local function v25() --[[ Line: 46 ]]
            -- upvalues: v16 (ref), v21 (copy), v22 (copy), v24 (copy), v18 (ref), l_OpenGameDetails_0 (ref), v19 (ref)
            if v16 then
                v16(v21, v22, v24);
            end;
            v18(l_OpenGameDetails_0(v21.experienceId, v19, {
                mountAsFullView = false, 
                showBackButton = true
            }));
        end;
        local l_GameIcon_0 = l_Constants_0.RbxthumbTypes.GameIcon;
        local v27 = l_getRbxthumbWithTypeSizeAndOptions_0(v21.experienceId, l_GameIcon_0, 150);
        return v2.createElement("Frame", {
            LayoutOrder = v22, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            Tile = v2.createElement(l_ExperienceTileV3_0, {
                contextTextLineCount = 1, 
                experienceName = v21.name, 
                thumbnail = v27, 
                hasBackground = false, 
                isHoverEnabled = false, 
                hasOutline = false, 
                onActivated = v25, 
                styleProps = {
                    bottomContentPadding = {
                        Left = 0, 
                        Right = 0, 
                        Top = v20.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing.Top, 
                        Bottom = v20.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing.Bottom
                    }
                }
            })
        }), (("%*%*_"):format(v15, v21.experienceId));
    end, l_dependencyArray_0(v18, v19, v20.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing, v16, v15)));
end;