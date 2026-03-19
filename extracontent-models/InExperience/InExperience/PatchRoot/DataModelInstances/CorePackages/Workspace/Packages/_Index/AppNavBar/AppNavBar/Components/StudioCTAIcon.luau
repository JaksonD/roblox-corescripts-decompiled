local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.UIBlox);
local l_useStyle_0 = v4.Core.Style.useStyle;
local v6 = require(l_Parent_1.Localization);
local v7 = require(l_Parent_1.Promise);
local v8 = require(l_Parent_1.RobloxAppHooks);
local v9 = require(l_Parent_1.RoactUtils);
local v10 = require(l_Parent_1.RoactServiceTags);
local l_ControlState_0 = v4.Core.Control.Enum.ControlState;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v4.App.ImageSet.Images;
local l_withTooltip_0 = v4.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = v4.App.Dialog.Enum.TooltipOrientation;
local l_useLocalization_0 = v6.Hooks.useLocalization;
local l_useRoactService_0 = v8.useRoactService;
local l_useEffectOnce_0 = v9.Hooks.useEffectOnce;
local l_AppEventIngestService_0 = v10.AppEventIngestService;
local v20 = require(l_Parent_0.Constants);
local v21 = l_Images_0["icons/logo/studiologo"];
local l_game_EngineFeature_0 = game:GetEngineFeature("WebViewRedesignEnabled");
return function(v23) --[[ Line: 41 ]] --[[ Name: StudioCTAIcon ]]
    -- upvalues: l_useStyle_0 (copy), v3 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_useLocalization_0 (copy), l_useEffectOnce_0 (copy), v20 (copy), l_ControlState_0 (copy), v7 (copy), l_TooltipOrientation_0 (copy), l_CoreGui_0 (copy), l_game_EngineFeature_0 (copy), l_withTooltip_0 (copy), l_ImageSetLabel_0 (copy), v21 (copy)
    local _ = nil;
    local v25 = nil;
    v25 = l_useStyle_0().Theme;
    local v26, v27 = v3.useState(false);
    local v28 = l_useRoactService_0(l_AppEventIngestService_0);
    local v29 = l_useLocalization_0({
        titleText = "CommonUI.Features.StudioCTA.Tooltip.Title", 
        bodyText = "CommonUI.Features.StudioCTA.Tooltip.Body"
    });
    local v30 = v3.useRef(nil);
    l_useEffectOnce_0(function() --[[ Line: 56 ]]
        -- upvalues: v28 (copy), v20 (ref)
        v28:setRBXEventStream(v20.STUDIO_CTA_EVENT_CONTEXT, v20.STUDIO_CTA_EVENT_NAME_MOUNT);
    end, {});
    if v23.controlState == l_ControlState_0.Hover or v23.controlState == l_ControlState_0.Selected then
        if not v30.current then
            v30.current = v7.delay(0.4):andThenCall(function() --[[ Line: 64 ]]
                -- upvalues: v30 (copy), v27 (copy)
                v30.current = nil;
                v27(true);
            end);
        end;
    else
        if v30.current then
            v30.current:cancel();
            v30.current = nil;
        end;
        if v26 then
            v27(false);
        end;
    end;
    local v31 = {
        headerText = v29.titleText, 
        bodyText = v29.bodyText
    };
    local v32 = {
        preferredOrientation = l_TooltipOrientation_0.Top, 
        guiTarget = l_CoreGui_0, 
        active = if l_game_EngineFeature_0 then v23.showTooltip and v26 else v26, 
        DisplayOrder = 10
    };
    return l_withTooltip_0(v31, v32, function(v33) --[[ Line: 92 ]]
        -- upvalues: v3 (ref), l_ImageSetLabel_0 (ref), v21 (ref), v25 (ref)
        return v3.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Image = v21, 
            ScaleType = Enum.ScaleType.Fit, 
            ImageColor3 = v25.IconEmphasis.Color, 
            [v3.Change.AbsoluteSize] = v33, 
            [v3.Change.AbsolutePosition] = v33
        });
    end);
end;