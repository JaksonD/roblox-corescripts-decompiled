local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local l_FFlagAXMigrateResellersInputBindingsToRoactGamepad_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMigrateResellersInputBindingsToRoactGamepad;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_Overlay_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Components.Overlay;
local v10 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus and game:DefineFastFlag("AXMigrateCenteredModalViewToAutoFocus", false);
local v11 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagCenteredModalViewAbsorbsInputs);
local l_withStyle_0 = v4.Style.withStyle;
local _ = require(l_CorePackages_0.Packages.React);
local function v16(v14) --[[ Line: 48 ]] --[[ Name: getWindowSize ]]
    -- upvalues: l_getSafeAreaSize_0 (copy)
    if v14.wideMode then
        local v15 = math.min(l_getSafeAreaSize_0(v14.screenSize, v14.globalGuiInset).X.Offset, 640);
        return UDim2.new(0, v15, 1, 0);
    else
        return UDim2.fromScale(1, 1);
    end;
end;
return (v3.connect(function(v17, _) --[[ Line: 114 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_FormFactor_0 (copy)
    return {
        wideMode = v17.FormFactor == l_FormFactor_0.WIDE, 
        screenSize = v17.ScreenSize, 
        globalGuiInset = v17.GlobalGuiInset
    };
end, nil)(function(v19) --[[ Line: 60 ]]
    -- upvalues: v16 (copy), v2 (copy), l_withStyle_0 (copy), v11 (copy), l_FFlagAXMigrateResellersInputBindingsToRoactGamepad_0 (copy), v10 (copy), l_Overlay_0 (copy)
    local v20 = v16(v19);
    local v21 = v19[v2.Children];
    if not v19.wideMode then
        return v2.createFragment(v21);
    else
        return l_withStyle_0(function(v22) --[[ Line: 68 ]]
            -- upvalues: v11 (ref), v2 (ref), l_FFlagAXMigrateResellersInputBindingsToRoactGamepad_0 (ref), v19 (copy), v10 (ref), l_Overlay_0 (ref), v20 (copy), v21 (copy)
            if v11() then
                return v2.createElement("TextButton", {
                    ref = if l_FFlagAXMigrateResellersInputBindingsToRoactGamepad_0 then v19.forwardRef else nil, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = v22.Theme.Overlay.Transparency, 
                    BackgroundColor3 = v22.Theme.Overlay.Color, 
                    Active = true, 
                    AutoButtonColor = false, 
                    Text = " ", 
                    Selectable = not v10 and nil
                }, {
                    Window = v2.createElement(if v10 then l_Overlay_0 else "Frame", {
                        AnchorPoint = Vector2.new(0.5, 0), 
                        Position = UDim2.new(0.5, 0, 0, 0), 
                        Size = v20, 
                        BackgroundTransparency = if v19.backgroundTransparency then v19.backgroundTransparency else v22.Theme.BackgroundDefault.Transparency, 
                        BackgroundColor3 = v22.Theme.BackgroundDefault.Color, 
                        BorderSizePixel = 0
                    }, v21)
                });
            else
                return v2.createElement("Frame", {
                    ref = if l_FFlagAXMigrateResellersInputBindingsToRoactGamepad_0 then v19.forwardRef else nil, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = v22.Theme.Overlay.Transparency, 
                    BackgroundColor3 = v22.Theme.Overlay.Color, 
                    Active = true
                }, {
                    Window = v2.createElement("Frame", {
                        AnchorPoint = Vector2.new(0.5, 0), 
                        Position = UDim2.new(0.5, 0, 0, 0), 
                        Size = v20, 
                        BackgroundTransparency = if v19.backgroundTransparency then v19.backgroundTransparency else v22.Theme.BackgroundDefault.Transparency, 
                        BackgroundColor3 = v22.Theme.BackgroundDefault.Color, 
                        BorderSizePixel = 0
                    }, v21)
                });
            end;
        end);
    end;
end));