local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_ExperienceTileV3_0 = v3.App.Tile.ExperienceTileV3;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v6 = require(l_Parent_0.UserLib);
local l_Constants_0 = v6.Utils.Constants;
local l_GameStats_0 = require(l_Parent_0.GameTile).GameStats;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableExperiencesFooter);
local l_getDeepValue_0 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue;
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v13 = require(l_script_FirstAncestor_0.Hooks.useSetupImpressionsTileTagging);
local l_getRbxthumbWithTypeSizeAndOptions_0 = v6.Utils.getRbxthumbWithTypeSizeAndOptions;
local v15 = {};
return function(v16) --[[ Line: 41 ]] --[[ Name: ExperienceTile ]]
    -- upvalues: l_useStyle_0 (copy), v2 (copy), v13 (copy), l_Constants_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v10 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), v15 (copy), l_ExperienceTileV3_0 (copy), l_GameStats_0 (copy)
    local v17 = l_useStyle_0();
    local v18 = v2.useRef(nil);
    v13(v18, v16.impressionsTag, v16.index);
    local l_GameIcon_0 = l_Constants_0.RbxthumbTypes.GameIcon;
    local v20 = l_getRbxthumbWithTypeSizeAndOptions_0(v16.item.experienceId, l_GameIcon_0, 150);
    local v21 = nil;
    local v22 = v16.showFooter and v10;
    if v22 then
        v21 = l_useSelector_0(function(v23) --[[ Line: 53 ]]
            -- upvalues: l_getDeepValue_0 (ref), v15 (ref)
            return l_getDeepValue_0(v23, "GameVotes") or v15;
        end)[v16.item.experienceId];
    end;
    return v2.createElement("Frame", {
        LayoutOrder = v16.index, 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ref = v18
    }, {
        Tile = v2.createElement(l_ExperienceTileV3_0, {
            contextTextLineCount = 1, 
            experienceName = v16.item.name, 
            thumbnail = v20, 
            hasBackground = false, 
            isHoverEnabled = false, 
            hasOutline = false, 
            onActivated = v16.onActivated, 
            styleProps = {
                bottomContentPadding = {
                    Left = 0, 
                    Right = 0, 
                    Top = v17.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing.Top, 
                    Bottom = v17.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing.Bottom
                }
            }, 
            footer = if v22 then v2.createElement(l_GameStats_0, {
                isGridTile = true, 
                stats = {
                    totalUpVotes = v21 and v21.upVotes or 0, 
                    totalDownVotes = v21 and v21.downVotes or 0, 
                    playerCount = v16.item.playing
                }
            }) else nil, 
            footerHeight = v22 and 32 or nil
        })
    });
end;