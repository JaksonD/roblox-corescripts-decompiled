local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.UIBlox);
local l_FormFactor_0 = require(l_Parent_0.FormFactor).Enums.FormFactor;
local v5 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v8 = require(l_script_FirstAncestor_0.Common.Enums);
local v9 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local v10 = require(l_script_FirstAncestor_0.Hooks.useProfileFormFactor);
local v11 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v12 = require(l_script_FirstAncestor_0.Contexts.ProfileScrollContext.useProfileScrollContext);
local v13 = require(l_script_FirstAncestor_0.Utils.getPeekViewOpenHeightByProfileType);
local v14 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableCommunityProfilePage);
local l_FFlagProfilePlatformEnableImpressions_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableImpressions;
local v16 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableCoverPhoto);
local v17 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformFixWideModeUI);
return function(v18) --[[ Line: 32 ]] --[[ Name: ProfilePlatformPage ]]
    -- upvalues: v14 (copy), v11 (copy), v16 (copy), v12 (copy), v17 (copy), v10 (copy), v8 (copy), l_useSelector_0 (copy), l_FormFactor_0 (copy), l_useStyle_0 (copy), l_FFlagProfilePlatformEnableImpressions_0 (copy), v9 (copy), v2 (copy), v5 (copy), v13 (copy)
    local v19 = if v14 then v11() else nil;
    local v20 = if v14 then v19.profileType else nil;
    local v21 = if v16 then v12() else nil;
    local v22 = nil;
    local v23 = nil;
    if v16 or v17 then
        local v24 = v10();
        v22 = v24.formFactor == v8.ProfileFormFactor.Wide;
        v23 = if v17 then v24.isFullView else nil;
    else
        local v26 = if v14 then l_useSelector_0(function(v25) --[[ Line: 52 ]]
            return v25.FormFactor;
        end) else nil;
        v22 = if v14 then v26 == l_FormFactor_0.WIDE else nil;
    end;
    local l_Theme_0 = l_useStyle_0().Theme;
    local v28 = if l_FFlagProfilePlatformEnableImpressions_0 then v9() else nil;
    local v29 = if l_FFlagProfilePlatformEnableImpressions_0 then v28.scrollViewPositionChangedSignal else nil;
    local v30 = v2.Dictionary.join({
        bottomPadding = v5.createElement("Frame", {
            Size = UDim2.fromOffset(0, 8), 
            BackgroundTransparency = 1, 
            LayoutOrder = 99999
        })
    }, v18.children);
    return v5.createElement("Frame", {
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 0, v13(v20)), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BorderSizePixel = 0, 
        BackgroundTransparency = if not (not (v14 and v20 == v8.ProfileTypes.Community) or v22) and (not v17 or not v23) then l_Theme_0.BackgroundContrast.Transparency else l_Theme_0.BackgroundDefault.Transparency, 
        BackgroundColor3 = if not (not (v14 and v20 == v8.ProfileTypes.Community) or v22) and (not v17 or not v23) then l_Theme_0.BackgroundContrast.Color else l_Theme_0.BackgroundDefault.Color, 
        [v5.Change.AbsolutePosition] = (not not l_FFlagProfilePlatformEnableImpressions_0 or v16) and function(v31) --[[ Line: 97 ]]
            -- upvalues: v16 (ref), v21 (copy), v29 (copy)
            if v16 then
                v21.setAbsoluteYPosition(v31.AbsolutePosition.Y);
            end;
            v29:fire();
        end or nil
    }, v30);
end;