local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExperienceLoadingScript");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v16 = require(l_Parent_0.React);
local v17 = require(l_Parent_0.InGameMenuDependencies);
local l_Cryo_0 = v17.Cryo;
local l_Roact_0 = v17.Roact;
local l_RoactRodux_0 = v17.RoactRodux;
local l_ExternalEventConnection_0 = require(l_Parent_0.RoactUtils).ExternalEventConnection;
local v22 = require(l_script_FirstAncestor_0.Thunks.GetGameProductInfo);
local v23 = require(l_script_FirstAncestor_0.Thunks.GetIsSubjectToChinaPolicies);
local v24 = require(l_script_FirstAncestor_0.Thunks.GetUniverseId);
local v25 = require(l_Parent_0.VerifiedBadges);
local v26 = require(l_Parent_0.LoggingProtocol);
local v27 = require(l_Parent_0.UIBlox);
local l_LoadingSpinner_0 = v27.App.Loading.LoadingSpinner;
local l_withStyle_0 = v27.Style.withStyle;
local v30 = require(l_Parent_0.Responsive);
local v31 = require(l_Parent_0.Foundation);
local l_FoundationProvider_0 = v31.FoundationProvider;
local l_Localization_0 = require(l_Parent_0.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local v35 = require(l_script_FirstAncestor_0.AutoTranslateBadge);
local v36 = require(l_script_FirstAncestor_0.LoadingScreenTelemetry);
local v37 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
local l_requestInternalWrapper_0 = require(l_Parent_0.Http).NetworkLayers.requestInternalWrapper;
local v39 = require(l_script_FirstAncestor_0.Flags.GetFFlagReportFirstExperienceCancelled);
local v40 = require(l_script_FirstAncestor_0.Flags.FFlagAddAutoTranslateToLoadingScreen);
local v41 = require(l_script_FirstAncestor_0.Flags.FFlagAutoTranslateSkipZeroUniverseId);
local v42 = game:DefineFastFlag("EnableLoadingScreenBButtonNonTenFoot", false);
local v43 = if v40 then require(l_script_FirstAncestor_0.createNetworking) else l_requestInternalWrapper_0(l_HttpService_0);
local v44 = 7;
game:DefineFastFlag("IncreaseLoadingScreenOrder", false);
if game:GetFastFlag("IncreaseLoadingScreenOrder") then
    v44 = 8;
end;
local v45 = Vector2.new(768, 432);
local v46 = Color3.fromRGB(101, 102, 104);
local v47 = {
    MOBILE_PORTRAIT = {
        TOP = 44, 
        BOTTOM = 44, 
        LEFT = 24, 
        RIGHT = 24
    }, 
    MOBILE_LANDSCAPE = {
        TOP = 24, 
        BOTTOM = 24, 
        LEFT = 44, 
        RIGHT = 44
    }, 
    DESKTOP = {
        TOP = 24, 
        BOTTOM = 24, 
        LEFT = 24, 
        RIGHT = 24
    }, 
    CONSOLE = {
        TOP = 64, 
        BOTTOM = 64, 
        LEFT = 64, 
        RIGHT = 64
    }
};
local v48 = l_GuiService_0:IsTenFootInterface();
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local v50 = true;
if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.IOS then
    v50 = l_l_UserInputService_0_Platform_0 == Enum.Platform.Android;
end;
local v51 = {
    150, 
    256
};
local v52 = nil;
local v53 = 0;
local v54 = 1e999;
local function _(v55) --[[ Line: 91 ]] --[[ Name: getPadding ]]
    -- upvalues: v50 (copy), v47 (copy), v48 (copy)
    if v50 then
        return v55 and v47.MOBILE_PORTRAIT or v47.MOBILE_LANDSCAPE;
    elseif v48 then
        return v47.CONSOLE;
    else
        return v47.DESKTOP;
    end;
end;
local function _(v57, v58) --[[ Line: 101 ]] --[[ Name: lerp ]]
    if type(v57) == "table" and #v57 >= 2 then
        local v59 = math.clamp(v58, 0, 1);
        return v57[1] * (1 - v59) + v57[2] * v59;
    else
        return 0;
    end;
end;
local v97 = {
    FadeIn = function(v61, _, v63, v64) --[[ Line: 110 ]] --[[ Name: FadeIn ]]
        local v65 = {
            1, 
            1
        };
        local v66 = {
            1, 
            0
        };
        local v67 = {
            1, 
            0.2
        };
        if v61 <= 0.6 then
            local v68 = v61 / 0.6;
            local l_iconTransparency_0 = v63.iconTransparency;
            local v70;
            if type(v66) == "table" and #v66 >= 2 then
                local v71 = math.clamp(v68, 0, 1);
                v70 = v66[1] * (1 - v71) + v66[2] * v71;
            else
                v70 = 0;
            end;
            l_iconTransparency_0(v70);
            l_iconTransparency_0 = v63.iconSize;
            if type(v65) == "table" and #v65 >= 2 then
                local v72 = math.clamp(v68, 0, 1);
                v70 = v65[1] * (1 - v72) + v65[2] * v72;
            else
                v70 = 0;
            end;
            l_iconTransparency_0(v70);
            l_iconTransparency_0 = v63.infoFrameTransparency;
            if type(v67) == "table" and #v67 >= 2 then
                local v73 = math.clamp(v68, 0, 1);
                v70 = v67[1] * (1 - v73) + v67[2] * v73;
            else
                v70 = 0;
            end;
            l_iconTransparency_0(v70);
            l_iconTransparency_0 = v63.thumbnailTransparency;
            if type(v66) == "table" and #v66 >= 2 then
                local v74 = math.clamp(v68, 0, 1);
                v70 = v66[1] * (1 - v74) + v66[2] * v74;
            else
                v70 = 0;
            end;
            l_iconTransparency_0(v70);
            l_iconTransparency_0 = v63.placeTextTransparency;
            if type(v66) == "table" and #v66 >= 2 then
                local v75 = math.clamp(v68, 0, 1);
                v70 = v66[1] * (1 - v75) + v66[2] * v75;
            else
                v70 = 0;
            end;
            l_iconTransparency_0(v70);
            l_iconTransparency_0 = v63.placeTextSize;
            if type(v65) == "table" and #v65 >= 2 then
                local v76 = math.clamp(v68, 0, 1);
                v70 = v65[1] * (1 - v76) + v65[2] * v76;
            else
                v70 = 0;
            end;
            l_iconTransparency_0(v70);
            l_iconTransparency_0 = v63.creatorTextTransparency;
            if type(v66) == "table" and #v66 >= 2 then
                local v77 = math.clamp(v68, 0, 1);
                v70 = v66[1] * (1 - v77) + v66[2] * v77;
            else
                v70 = 0;
            end;
            l_iconTransparency_0(v70);
            l_iconTransparency_0 = v63.creatorTextSize;
            if type(v65) == "table" and #v65 >= 2 then
                local v78 = math.clamp(v68, 0, 1);
                v70 = v65[1] * (1 - v78) + v65[2] * v78;
            else
                v70 = 0;
            end;
            l_iconTransparency_0(v70);
            return;
        else
            v63.iconTransparency(if type(v66) == "table" and #v66 >= 2 then v66[1] * 0 + v66[2] * 1 else 0);
            v63.iconSize(if type(v65) == "table" and #v65 >= 2 then v65[1] * 0 + v65[2] * 1 else 0);
            v63.infoFrameTransparency(if type(v67) == "table" and #v67 >= 2 then v67[1] * 0 + v67[2] * 1 else 0);
            v63.thumbnailTransparency(if type(v66) == "table" and #v66 >= 2 then v66[1] * 0 + v66[2] * 1 else 0);
            v63.placeTextTransparency(if type(v66) == "table" and #v66 >= 2 then v66[1] * 0 + v66[2] * 1 else 0);
            v63.placeTextSize(if type(v65) == "table" and #v65 >= 2 then v65[1] * 0 + v65[2] * 1 else 0);
            v63.creatorTextTransparency(if type(v66) == "table" and #v66 >= 2 then v66[1] * 0 + v66[2] * 1 else 0);
            v63.creatorTextSize(if type(v65) == "table" and #v65 >= 2 then v65[1] * 0 + v65[2] * 1 else 0);
            v64();
            return;
        end;
    end, 
    FadeOut = function(v79, _, v81, v82) --[[ Line: 139 ]] --[[ Name: FadeOut ]]
        -- upvalues: l_RunService_0 (copy)
        local v83 = {
            1, 
            0.6
        };
        local v84 = {
            0, 
            1
        };
        local v85 = {
            0.2, 
            1
        };
        if v79 <= 0.6 then
            local v86 = v79 / 0.6;
            local l_iconTransparency_1 = v81.iconTransparency;
            local v88;
            if type(v84) == "table" and #v84 >= 2 then
                local v89 = math.clamp(v86, 0, 1);
                v88 = v84[1] * (1 - v89) + v84[2] * v89;
            else
                v88 = 0;
            end;
            l_iconTransparency_1(v88);
            l_iconTransparency_1 = v81.iconSize;
            if type(v83) == "table" and #v83 >= 2 then
                local v90 = math.clamp(v86, 0, 1);
                v88 = v83[1] * (1 - v90) + v83[2] * v90;
            else
                v88 = 0;
            end;
            l_iconTransparency_1(v88);
            l_iconTransparency_1 = v81.infoFrameTransparency;
            if type(v85) == "table" and #v85 >= 2 then
                local v91 = math.clamp(v86, 0, 1);
                v88 = v85[1] * (1 - v91) + v85[2] * v91;
            else
                v88 = 0;
            end;
            l_iconTransparency_1(v88);
            l_iconTransparency_1 = v81.thumbnailTransparency;
            if type(v84) == "table" and #v84 >= 2 then
                local v92 = math.clamp(v86, 0, 1);
                v88 = v84[1] * (1 - v92) + v84[2] * v92;
            else
                v88 = 0;
            end;
            l_iconTransparency_1(v88);
            l_iconTransparency_1 = v81.placeTextTransparency;
            if type(v84) == "table" and #v84 >= 2 then
                local v93 = math.clamp(v86, 0, 1);
                v88 = v84[1] * (1 - v93) + v84[2] * v93;
            else
                v88 = 0;
            end;
            l_iconTransparency_1(v88);
            l_iconTransparency_1 = v81.placeTextSize;
            if type(v83) == "table" and #v83 >= 2 then
                local v94 = math.clamp(v86, 0, 1);
                v88 = v83[1] * (1 - v94) + v83[2] * v94;
            else
                v88 = 0;
            end;
            l_iconTransparency_1(v88);
            l_iconTransparency_1 = v81.creatorTextTransparency;
            if type(v84) == "table" and #v84 >= 2 then
                local v95 = math.clamp(v86, 0, 1);
                v88 = v84[1] * (1 - v95) + v84[2] * v95;
            else
                v88 = 0;
            end;
            l_iconTransparency_1(v88);
            l_iconTransparency_1 = v81.creatorTextSize;
            if type(v83) == "table" and #v83 >= 2 then
                local v96 = math.clamp(v86, 0, 1);
                v88 = v83[1] * (1 - v96) + v83[2] * v96;
            else
                v88 = 0;
            end;
            l_iconTransparency_1(v88);
            return;
        else
            l_RunService_0:SetRobloxGuiFocused(false);
            v81.iconTransparency(if type(v84) == "table" and #v84 >= 2 then v84[1] * 0 + v84[2] * 1 else 0);
            v81.iconSize(if type(v83) == "table" and #v83 >= 2 then v83[1] * 0 + v83[2] * 1 else 0);
            v81.infoFrameTransparency(if type(v85) == "table" and #v85 >= 2 then v85[1] * 0 + v85[2] * 1 else 0);
            v81.thumbnailTransparency(if type(v84) == "table" and #v84 >= 2 then v84[1] * 0 + v84[2] * 1 else 0);
            v81.placeTextTransparency(if type(v84) == "table" and #v84 >= 2 then v84[1] * 0 + v84[2] * 1 else 0);
            v81.placeTextSize(if type(v83) == "table" and #v83 >= 2 then v83[1] * 0 + v83[2] * 1 else 0);
            v81.creatorTextTransparency(if type(v84) == "table" and #v84 >= 2 then v84[1] * 0 + v84[2] * 1 else 0);
            v81.creatorTextSize(if type(v83) == "table" and #v83 >= 2 then v83[1] * 0 + v83[2] * 1 else 0);
            v82();
            return;
        end;
    end
};
local function _() --[[ Line: 172 ]] --[[ Name: disconnectAndCloseHealthStat ]]
    -- upvalues: v52 (ref), l_GuiService_0 (copy)
    if v52 then
        v52:disconnect();
        v52 = nil;
        l_GuiService_0:CloseStatsBasedOnInputString("ConnectionHealth");
    end;
end;
local v99 = l_Roact_0.Component:extend("LoadingScreen");
v99.playAnimation = function(v100, v101, v102, v103) --[[ Line: 183 ]] --[[ Name: playAnimation ]]
    -- upvalues: l_RunService_0 (copy)
    v100.animationStartTime = tick();
    v100.animationFunction = v101;
    if not v100.renderSteppedConnection then
        v100.renderSteppedConnection = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 188 ]]
            -- upvalues: v100 (copy), v102 (copy), v103 (copy)
            v100.animationFunction(tick() - v100.animationStartTime, v102, v100.updateBindings, function() --[[ Line: 189 ]]
                -- upvalues: v100 (ref), v103 (ref)
                v100:stopAnimation();
                if v103 then
                    v103();
                end;
            end);
        end);
    end;
end;
v99.stopAnimation = function(v104) --[[ Line: 199 ]] --[[ Name: stopAnimation ]]
    if v104.renderSteppedConnection then
        v104.renderSteppedConnection:Disconnect();
        v104.renderSteppedConnection = nil;
    end;
end;
v99.renderBackground = function(v105, v106) --[[ Line: 206 ]] --[[ Name: renderBackground ]]
    -- upvalues: l_Roact_0 (copy), v44 (ref), l_ExternalEventConnection_0 (copy), l_RunService_0 (copy)
    local l_thumbnailScaledWidth_0 = v105.state.thumbnailScaledWidth;
    local l_thumbnailScaledHeight_0 = v105.state.thumbnailScaledHeight;
    local l_thumbnailPositionX_0 = v105.state.thumbnailPositionX;
    local v110 = "";
    if v105.props.placeId and v105.props.placeId > 0 then
        v110 = ("rbxthumb://type=GameThumbnail&id=%d&w=768&h=432"):format(v105.props.placeId);
    end;
    local l_ReducedMotion_0 = v106.Settings.ReducedMotion;
    return l_Roact_0.createElement("ScreenGui", {
        DisplayOrder = v44, 
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, {
        l_Roact_0.createElement("Frame", {
            Name = "BackgroundFrame", 
            [l_Roact_0.Change.AbsoluteSize] = v105.onAbsoluteSizeChange, 
            BackgroundColor3 = v106.Theme.BackgroundUIDefault.Color, 
            BackgroundTransparency = 0, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Active = true
        }, {
            ThumbnailImage = l_Roact_0.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Image = v110, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(l_thumbnailPositionX_0, 0.5), 
                Size = UDim2.fromOffset(l_thumbnailScaledWidth_0, l_thumbnailScaledHeight_0), 
                ImageTransparency = v105.bindings.thumbnailTransparency
            }), 
            renderStepped = not l_ReducedMotion_0 and l_Roact_0.createElement(l_ExternalEventConnection_0, {
                event = l_RunService_0.renderStepped, 
                callback = v105.renderBackgroundSteppedCallback
            })
        })
    });
end;
v99.showConnnectionHealthDebugMenu = function(_, _) --[[ Line: 248 ]] --[[ Name: showConnnectionHealthDebugMenu ]]
    -- upvalues: v53 (ref), v54 (ref), v50 (copy), l_GuiService_0 (copy)
    if v53 == 0 then
        v53 = 1;
        v54 = tick();
        return;
    else
        if v50 and tick() - v54 <= 0.5 then
            l_GuiService_0:ShowStatsBasedOnInputString("ConnectionHealth");
        end;
        v53 = 0;
        v54 = 1e999;
        return;
    end;
end;
v99.renderPlaceIcon = function(v114, v115) --[[ Line: 265 ]] --[[ Name: renderPlaceIcon ]]
    -- upvalues: l_Roact_0 (copy), v46 (copy), l_ExternalEventConnection_0 (copy), l_RunService_0 (copy)
    local l_shimPos_0 = v114.state.shimPos;
    local v117 = v114.bindings.iconTransparency:getValue();
    local v118 = "";
    if v114.props.universeId and v114.props.universeId > 0 then
        v118 = ("rbxthumb://type=GameIcon&id=%d&w=256&h=256"):format(v114.props.universeId);
    end;
    local l_ReducedMotion_1 = v115.Settings.ReducedMotion;
    local l_createElement_0 = l_Roact_0.createElement;
    local v121 = "Frame";
    local v122 = {
        Name = "IconFrame", 
        BackgroundTransparency = v114.bindings.iconTransparency, 
        BackgroundColor3 = v46, 
        BorderSizePixel = 0, 
        Size = v114.bindings.iconSize, 
        Position = UDim2.fromScale(0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Active = true
    };
    local v123 = {};
    local v124 = not l_ReducedMotion_1;
    if v124 then
        v124 = l_Roact_0.createElement;
        local v125 = "Frame";
        local v126 = {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = Color3.new(1, 1, 1), 
            BackgroundTransparency = 0, 
            ZIndex = 2
        };
        local v127 = {
            Corner = l_Roact_0.createElement("UICorner")
        };
        local l_createElement_1 = l_Roact_0.createElement;
        local v129 = "UIGradient";
        local v130 = {
            Rotation = 25, 
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new(0.5, 0.5, 0.5)), 
                ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)), 
                ColorSequenceKeypoint.new(1, Color3.new(0.5, 0.5, 0.5))
            })
        };
        local l_new_0 = NumberSequence.new;
        local v132 = {};
        local l_new_1 = NumberSequenceKeypoint.new;
        local v134 = 0;
        local v135 = {
            0.7, 
            1
        };
        local v136;
        if type(v135) == "table" and #v135 >= 2 then
            local v137 = math.clamp(v117, 0, 1);
            v136 = v135[1] * (1 - v137) + v135[2] * v137;
        else
            v136 = 0;
        end;
        l_new_1 = l_new_1(v134, v136);
        v134 = NumberSequenceKeypoint.new;
        v136 = 0.5;
        local v138 = {
            0.3, 
            1
        };
        if type(v138) == "table" and #v138 >= 2 then
            local v139 = math.clamp(v117, 0, 1);
            v135 = v138[1] * (1 - v139) + v138[2] * v139;
        else
            v135 = 0;
        end;
        v134 = v134(v136, v135);
        v136 = NumberSequenceKeypoint.new;
        v135 = 1;
        local v140 = {
            0.7, 
            1
        };
        if type(v140) == "table" and #v140 >= 2 then
            local v141 = math.clamp(v117, 0, 1);
            v138 = v140[1] * (1 - v141) + v140[2] * v141;
        else
            v138 = 0;
        end;
        v6(v132, 1, l_new_1, v134, v136(v135, v138));
        v130.Transparency = l_new_0(v132);
        v130.Offset = Vector2.new(l_shimPos_0, 0);
        v127.Gradient = l_createElement_1(v129, v130);
        v127.renderStepped = l_Roact_0.createElement(l_ExternalEventConnection_0, {
            event = l_RunService_0.renderStepped, 
            callback = v114.renderShimmerCallback
        });
        v124 = v124(v125, v126, v127);
    end;
    v123.LoadingOverlay = v124;
    v123.GameIconImage = l_Roact_0.createElement("ImageLabel", {
        BackgroundTransparency = 1, 
        Image = v118, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = UDim2.fromScale(1, 1), 
        ImageTransparency = v114.bindings.iconTransparency
    }, {
        Corner = l_Roact_0.createElement("UICorner")
    });
    v123.Corner = l_Roact_0.createElement("UICorner");
    return l_createElement_0(v121, v122, v123);
end;
v99.renderInfoFrame = function(v142, v143) --[[ Line: 326 ]] --[[ Name: renderInfoFrame ]]
    -- upvalues: v25 (copy), v51 (copy), l_Roact_0 (copy), v40 (copy), v50 (copy)
    local l_productInfo_0 = v142.props.productInfo;
    local v145 = l_productInfo_0 and l_productInfo_0.Name or "";
    local v146 = l_productInfo_0 and l_productInfo_0.Creator.Name or "";
    if l_productInfo_0 and l_productInfo_0.Creator.HasVerifiedBadge then
        v146 = v25.appendVerifiedBadge(v146);
    end;
    local v147 = math.clamp(math.max(v142.state.absoluteSize.X, v142.state.absoluteSize.Y) / 1024 * v51[1], v51[1], v51[2]);
    return l_Roact_0.createElement("Frame", {
        Name = "InfoFrame", 
        BackgroundColor3 = v143.Theme.BackgroundMuted.Color, 
        BackgroundTransparency = v142.bindings.infoFrameTransparency, 
        BorderSizePixel = 0, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = v142.isPortrait and UDim2.fromScale(1, 0) or UDim2.fromScale(0.6, 0), 
        Active = true, 
        [l_Roact_0.Change.AbsoluteSize] = v40 and function(v148) --[[ Line: 350 ]]
            -- upvalues: v142 (copy)
            v142.updateBindings.updateInfoFrameAbsoluteSize(v148.AbsoluteSize);
        end or nil
    }, {
        PlaceIcon = v142:renderPlaceIcon(v143), 
        TextLayoutFrame = l_Roact_0.createElement("Frame", {
            Name = "TextLayout", 
            BackgroundColor3 = v143.Theme.BackgroundMuted.Color, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            AnchorPoint = Vector2.new(0.5, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Position = UDim2.new(0.5, 0, 0, v147 / 2), 
            Size = UDim2.fromScale(1, 0), 
            Active = true
        }, {
            PlaceLabel = l_Roact_0.createElement("TextLabel", {
                Name = "PlaceLabel", 
                BackgroundTransparency = 1, 
                TextTransparency = v142.bindings.placeTextTransparency, 
                Size = UDim2.fromScale(0.8, 0), 
                AnchorPoint = Vector2.new(0.5, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Font = v143.Font.Title.Font, 
                TextSize = v142.bindings.placeTextSize, 
                TextScaled = false, 
                TextWrapped = true, 
                TextColor3 = v143.Theme.TextEmphasis.Color, 
                TextStrokeTransparency = 1, 
                Text = v145, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                ZIndex = 2, 
                LayoutOrder = 1, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                RichText = false
            }), 
            CreatorLabel = l_Roact_0.createElement("TextLabel", {
                Name = "CreatorLabel", 
                BackgroundTransparency = 1, 
                TextTransparency = v142.bindings.creatorTextTransparency, 
                Size = UDim2.fromScale(0.6, 0), 
                AnchorPoint = Vector2.new(0.5, 1), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Font = v143.Font.CaptionBody.Font, 
                TextSize = v142.bindings.creatorTextSize, 
                TextWrapped = true, 
                TextScaled = false, 
                TextColor3 = v143.Theme.TextDefault.Color, 
                TextStrokeTransparency = 1, 
                Text = v146, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                ZIndex = 2, 
                LayoutOrder = 2, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                RichText = false
            }), 
            UIListLayout = l_Roact_0.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, v50 and 12 or 36)
            }), 
            Padding = l_Roact_0.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v50 and 12 or 36), 
                PaddingBottom = UDim.new(0, v50 and 12 or 36)
            })
        }), 
        Corner = l_Roact_0.createElement("UICorner")
    });
end;
v99.renderMain = function(v149, v150) --[[ Line: 424 ]] --[[ Name: renderMain ]]
    -- upvalues: v50 (copy), v47 (copy), v48 (copy), l_Roact_0 (copy), v44 (ref), l_LoadingSpinner_0 (copy), v40 (copy), v42 (copy)
    local l_isPortrait_0 = v149.isPortrait;
    local v152 = if v50 then l_isPortrait_0 and v47.MOBILE_PORTRAIT or v47.MOBILE_LANDSCAPE else if v48 then v47.CONSOLE else v47.DESKTOP;
    l_isPortrait_0 = v150.Settings.ReducedMotion;
    return l_Roact_0.createElement("ScreenGui", {
        DisplayOrder = v44 + 1, 
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        OnTopOfCoreBlur = true
    }, {
        DarkGradient = l_Roact_0.createElement("Frame", {
            BackgroundTransparency = 0, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        }, {
            Gradient = l_Roact_0.createElement("UIGradient", {
                Rotation = 90, 
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)), 
                    ColorSequenceKeypoint.new(0.5, Color3.new(0, 0, 0)), 
                    ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
                }), 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(0.5, 1), 
                    NumberSequenceKeypoint.new(1, 0.5)
                })
            }), 
            Spinner = l_isPortrait_0 and l_Roact_0.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                BackgroundTransparency = 1, 
                ZIndex = 20
            }, {
                l_Roact_0.createElement(l_LoadingSpinner_0, {
                    size = UDim2.fromOffset(30, 30), 
                    position = UDim2.new(1, 0, 1, 0), 
                    anchorPoint = Vector2.new(1, 1), 
                    rotationRate = 180
                })
            }), 
            infoFrame = v149:renderInfoFrame(v150), 
            AutoTranslate = v40 and v149:renderAutoTranslate() or nil, 
            serverFrame = v149:renderServerFrame(v150), 
            closeBtn = v149:renderCloseBtn(v150), 
            gamepadCancelBtn = v42 and v149:renderGamepadCancelBtn(v150), 
            tenfootCancelBtn = not v42 and v149:renderTenFootCancelBtn(v150), 
            Padding = l_Roact_0.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v152.LEFT), 
                PaddingRight = UDim.new(0, v152.RIGHT), 
                PaddingTop = UDim.new(0, v152.TOP), 
                PaddingBottom = UDim.new(0, v152.BOTTOM)
            })
        })
    });
end;
v99.renderCloseBtn = function(v153, _) --[[ Line: 483 ]] --[[ Name: renderCloseBtn ]]
    -- upvalues: v42 (copy), v30 (copy), v48 (copy), l_Roact_0 (copy), v39 (copy), v26 (copy)
    if v42 then
        if v153.props.preferredInputRef.current ~= v30.Input.Directional and not v153.state.showCloseBtn and tick() - v153.startTime > 5 then
            v153:setState({
                showCloseBtn = true
            });
        end;
    elseif not v153.state.showCloseBtn and tick() - v153.startTime > 5 and not v48 then
        v153:setState({
            showCloseBtn = true
        });
    end;
    return v153.state.showCloseBtn and l_Roact_0.createElement("ImageButton", {
        Name = "CloseButton", 
        Image = "rbxasset://textures/loading/cancelButton.png", 
        ImageTransparency = 0, 
        BackgroundTransparency = 1, 
        Position = UDim2.fromOffset(0, 0), 
        Size = UDim2.fromOffset(32, 32), 
        Active = false, 
        ZIndex = 10, 
        [l_Roact_0.Event.MouseButton1Click] = function() --[[ Line: 515 ]]
            -- upvalues: v39 (ref), v26 (ref)
            if v39 then
                v26.default:logEventOnce("first_experience_cancelled");
            end;
            game:Shutdown();
        end
    });
end;
v99.renderServerFrame = function(v155, v156) --[[ Line: 524 ]] --[[ Name: renderServerFrame ]]
    -- upvalues: v48 (copy), l_Roact_0 (copy), v37 (copy), l_CoreGui_0 (copy)
    local l_serverStatusText_0 = v155.state.serverStatusText;
    local l_isSubjectToChinaPolicies_0 = v155.props.isSubjectToChinaPolicies;
    local v159 = v48 and 16 or 12;
    local v160 = v48 and 16 or 12;
    return l_Roact_0.createElement("Frame", {
        Name = "ServerFrame", 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        AnchorPoint = Vector2.new(0.5, 1), 
        Position = UDim2.fromScale(0.5, 1), 
        Size = UDim2.new(1, -48, 0.2, 0), 
        Active = true
    }, {
        PolicyLabel = l_isSubjectToChinaPolicies_0 and l_Roact_0.createElement("TextLabel", {
            Name = "PolicyLabel", 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 2 * v160), 
            Position = UDim2.new(0, 0, 1, -4 * v159 - 2 * v160), 
            Font = v156.Font.Footer.Font, 
            TextSize = v160, 
            TextWrapped = true, 
            TextScaled = false, 
            TextColor3 = v156.Theme.TextDefault.Color, 
            TextStrokeTransparency = 1, 
            Text = v37:Format("Authentication.Login.WeChat.AntiAddictionText"), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 2
        }), 
        JoinServerLabel = l_Roact_0.createElement("TextLabel", {
            Name = "JoinText", 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 4 * v159), 
            Position = UDim2.new(0, 0, 1, -2 * v159), 
            Font = v156.Font.Footer.Font, 
            TextSize = v159, 
            TextWrapped = true, 
            TextScaled = false, 
            TextColor3 = v156.Theme.TextDefault.Color, 
            TextStrokeTransparency = 1, 
            Text = l_serverStatusText_0, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 2, 
            RootLocalizationTable = l_CoreGui_0.CoreScriptLocalization, 
            [l_Roact_0.Event.InputBegan] = not v155.props.isSubjectToChinaPolicies and v155.showConnnectionHealthDebugMenu or nil
        })
    });
end;
v99.renderGamepadCancelBtn = function(v161, v162) --[[ Line: 577 ]] --[[ Name: renderGamepadCancelBtn ]]
    -- upvalues: v30 (copy), l_Roact_0 (copy), v37 (copy)
    local v163 = false;
    if v161.props.preferredInputRef.current == v30.Input.Directional then
        v163 = not v161.state.gamepadCancelPressed and l_Roact_0.createElement("Frame", {
            Name = "GamepadCancelFrame", 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.fromScale(0, 1), 
            Size = UDim2.fromOffset(150, 48), 
            Active = true
        }, {
            CancelIcon = l_Roact_0.createElement("ImageLabel", {
                Name = "GamepadCancel", 
                Image = "rbxasset://textures/ui/Controls/DesignSystem/ButtonB@2x.png", 
                BackgroundTransparency = 1, 
                Size = UDim2.fromOffset(24, 24), 
                Active = false, 
                ZIndex = 10, 
                LayoutOrder = 0
            }), 
            CancelLabel = l_Roact_0.createElement("TextLabel", {
                Name = "CancelText", 
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                Font = v162.Font.SubHeader1.Font, 
                TextSize = 24, 
                TextWrapped = true, 
                TextColor3 = v162.Theme.TextEmphasis.Color, 
                TextStrokeTransparency = 1, 
                Text = v37:Format("CoreScripts.TopBar.Back"), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                ZIndex = 2, 
                LayoutOrder = 1
            }), 
            UIListLayout = l_Roact_0.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, 5)
            })
        });
    end;
    return v163;
end;
v99.renderTenFootCancelBtn = function(v164, v165) --[[ Line: 623 ]] --[[ Name: renderTenFootCancelBtn ]]
    -- upvalues: l_Roact_0 (copy), v37 (copy)
    return v164.state.showTenFootCancelBtn and l_Roact_0.createElement("Frame", {
        Name = "TenfootCancelFrame", 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        AnchorPoint = Vector2.new(0, 1), 
        Position = UDim2.fromScale(0, 1), 
        Size = UDim2.fromOffset(150, 48), 
        Active = true
    }, {
        CancelIcon = l_Roact_0.createElement("ImageLabel", {
            Name = "TenfootCancel", 
            Image = "rbxasset://textures/ui/Controls/DesignSystem/ButtonB@2x.png", 
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(24, 24), 
            Active = false, 
            ZIndex = 10, 
            LayoutOrder = 0
        }), 
        CancelLabel = l_Roact_0.createElement("TextLabel", {
            Name = "CancelText", 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Font = v165.Font.SubHeader1.Font, 
            TextSize = 24, 
            TextWrapped = true, 
            TextColor3 = v165.Theme.TextEmphasis.Color, 
            TextStrokeTransparency = 1, 
            Text = v37:Format("CoreScripts.TopBar.Back"), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 2, 
            LayoutOrder = 1
        }), 
        UIListLayout = l_Roact_0.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, 5)
        })
    });
end;
v99.init = function(v166) --[[ Line: 668 ]] --[[ Name: init ]]
    -- upvalues: v45 (copy), v48 (copy), l_ContextActionService_0 (copy), v97 (copy), l_Roact_0 (copy), v40 (copy), v51 (copy), v50 (copy), l_GuiService_0 (copy), v42 (copy)
    v166.thumbnailMoveSpd = 0.05;
    v166.fadeinComplete = false;
    v166.isPortrait = false;
    v166.startTime = tick();
    v166.numberOfTaps = 0;
    v166.lastTapTime = 1e999;
    v166:setState({
        visible = true, 
        absoluteSize = Vector2.new(0, 0), 
        thumbnailPositionX = 0.5, 
        thumbnailScaledWidth = v45.x, 
        thumbnailScaledHeight = v45.y, 
        shimPos = 0, 
        serverStatusText = "", 
        showCloseBtn = false, 
        showTenFootCancelBtn = v48, 
        gamepadCancelPressed = false
    });
    v166.onAbsoluteSizeChange = function(v167) --[[ Line: 693 ]]
        -- upvalues: v166 (copy)
        v166:setState({
            absoluteSize = v167.AbsoluteSize
        });
        v166.isPortrait = v167.AbsoluteSize.X < v167.AbsoluteSize.Y;
        v166.updateBindings.iconSize(1);
    end;
    game.Loaded:Connect(function() --[[ Line: 702 ]]
        -- upvalues: v48 (ref), l_ContextActionService_0 (ref), v166 (copy), v97 (ref)
        if v48 then
            l_ContextActionService_0:UnbindCoreAction("CancelGameLoad");
        end;
        while not v166.fadeinComplete do
            wait();
        end;
        v166:stopAnimation();
        v166:playAnimation(v97.FadeOut, {}, function() --[[ Line: 710 ]]
            -- upvalues: v166 (ref)
            v166:setState({
                visible = false
            });
        end);
    end);
    local v168, v169 = l_Roact_0.createBinding(1);
    local v170, v171 = l_Roact_0.createBinding(1);
    local v172, v173 = l_Roact_0.createBinding(0);
    local v174, v175 = l_Roact_0.createBinding(1);
    local v176, v177 = l_Roact_0.createBinding(0);
    local v178, v179 = l_Roact_0.createBinding(1);
    local v180, v181 = l_Roact_0.createBinding(0);
    local v182, v183 = l_Roact_0.createBinding(1);
    local v184 = nil;
    local v185 = nil;
    if v40 then
        local v186, v187 = l_Roact_0.createBinding(Vector2.new(0, 0));
        v184 = v186;
        v185 = v187;
    end;
    v166.bindings = {
        thumbnailTransparency = v168, 
        iconTransparency = v170, 
        iconSize = v172:map(function(v188) --[[ Line: 734 ]]
            -- upvalues: v166 (copy), v51 (ref)
            local v189 = math.clamp(math.max(v166.state.absoluteSize.X, v166.state.absoluteSize.Y) / 1024 * v51[1], v51[1], v51[2]);
            return UDim2.fromOffset(v189 * v188, v189 * v188);
        end), 
        placeTextTransparency = v174, 
        placeTextSize = v176:map(function(v190) --[[ Line: 740 ]]
            -- upvalues: v50 (ref)
            return (v50 and 20 or 36) * v190;
        end), 
        creatorTextTransparency = v178, 
        creatorTextSize = v180:map(function(v191) --[[ Line: 744 ]]
            return 20 * v191;
        end), 
        infoFrameTransparency = v182, 
        infoFrameAbsoluteSize = if v40 then v184 else nil
    };
    v166.updateBindings = {
        thumbnailTransparency = v169, 
        iconTransparency = v171, 
        iconSize = v173, 
        placeTextTransparency = v175, 
        placeTextSize = v177, 
        creatorTextTransparency = v179, 
        creatorTextSize = v181, 
        infoFrameTransparency = v183, 
        updateInfoFrameAbsoluteSize = if v40 then v185 else nil
    };
    v166.renderBackgroundSteppedCallback = function(v192) --[[ Line: 764 ]]
        -- upvalues: v166 (copy), v45 (ref)
        local l_absoluteSize_0 = v166.state.absoluteSize;
        local v194 = l_absoluteSize_0.x * 1.5;
        local v195 = v194 / v45.x * v45.y;
        if v195 < l_absoluteSize_0.y then
            v194 = l_absoluteSize_0.y / v45.y * v45.x;
            v195 = l_absoluteSize_0.y;
        end;
        local v196 = v194 / l_absoluteSize_0.x / 2;
        local v197 = math.max(v196, 1 - v196);
        local v198 = math.min(v196, 1 - v196);
        local v199 = v166.state.thumbnailPositionX + v166.thumbnailMoveSpd * v192;
        if v197 <= v199 or v199 <= v198 then
            v166.thumbnailMoveSpd = -v166.thumbnailMoveSpd;
            v199 = math.clamp(v199, v198, v197);
        end;
        v166:setState({
            thumbnailPositionX = v199, 
            thumbnailScaledHeight = v195, 
            thumbnailScaledWidth = v194
        });
    end;
    v166.renderShimmerCallback = function(v200) --[[ Line: 791 ]]
        -- upvalues: v166 (copy)
        local v201 = v166.state.shimPos + v200 * 1;
        if v201 > 1 then
            v201 = -1;
        end;
        v166:setState({
            shimPos = v201
        });
    end;
    if l_GuiService_0:GetUiMessage() ~= "" then
        v166:setState({
            serverStatusText = l_GuiService_0:GetUiMessage()
        });
    end;
    l_GuiService_0.UiMessageChanged:Connect(function(v202, v203) --[[ Line: 808 ]]
        -- upvalues: v166 (copy)
        if v202 == Enum.UiMessageType.UiMessageInfo then
            v166:setState({
                serverStatusText = v203
            });
        end;
    end);
    if v42 or v48 then
        local v204 = false;
        do
            local l_v204_0 = v204;
            l_ContextActionService_0:BindCoreAction("CancelGameLoad", function(_, v207, _) --[[ Line: 818 ]]
                -- upvalues: l_v204_0 (ref), v166 (copy), v42 (ref), l_ContextActionService_0 (ref)
                if v207 == Enum.UserInputState.Begin then
                    l_v204_0 = true;
                    return;
                else
                    if v207 == Enum.UserInputState.End and l_v204_0 then
                        v166:setState({
                            showTenFootCancelBtn = false
                        });
                        if v42 then
                            v166:setState({
                                gamepadCancelPressed = true
                            });
                        end;
                        l_ContextActionService_0:UnbindCoreAction("CancelGameLoad");
                        if not game:IsLoaded() then
                            game:Shutdown();
                        end;
                    end;
                    return;
                end;
            end, false, Enum.KeyCode.ButtonB);
        end;
    end;
end;
v99.renderAutoTranslate = function(v209) --[[ Line: 842 ]] --[[ Name: renderAutoTranslate ]]
    -- upvalues: v41 (copy), v36 (copy), l_Roact_0 (copy), v35 (copy)
    if v41 and v209.props.universeId <= 0 then
        v36.countAutoTranslateZeroUniverseId();
        return nil;
    else
        return l_Roact_0.createElement(v35, {
            universeId = v209.props.universeId, 
            positionBinding = v209.bindings.infoFrameAbsoluteSize, 
            transparencyBinding = v209.bindings.infoFrameTransparency
        });
    end;
end;
v99.renderMainWithProviders = function(v210, v211) --[[ Line: 854 ]] --[[ Name: renderMainWithProviders ]]
    -- upvalues: l_Roact_0 (copy), l_FoundationProvider_0 (copy), v31 (copy), l_LocalizationProvider_0 (copy), v37 (copy)
    return l_Roact_0.createElement(l_FoundationProvider_0, {
        theme = v31.Enums.Theme.Dark
    }, {
        l_Roact_0.createElement(l_LocalizationProvider_0, {
            localization = v37
        }, v210:renderMain(v211))
    });
end;
v99.render = function(v212) --[[ Line: 864 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_Roact_0 (copy), v40 (copy)
    return l_withStyle_0(function(v213) --[[ Line: 867 ]]
        -- upvalues: v212 (copy), l_Roact_0 (ref), v40 (ref)
        return v212.state.visible and l_Roact_0.createElement("Folder", {}, {
            BackgroundScreen = v212:renderBackground(v213), 
            MainScreen = if v40 then v212:renderMainWithProviders(v213) else v212:renderMain(v213)
        });
    end);
end;
v99.willUpdate = function(_, _, _) --[[ Line: 878 ]] --[[ Name: willUpdate ]]

end;
v99.didMount = function(v217) --[[ Line: 880 ]] --[[ Name: didMount ]]
    -- upvalues: l_RunService_0 (copy), v97 (copy)
    l_RunService_0:SetRobloxGuiFocused(true);
    v217.props.fetchUniverseId(v217.props.placeId);
    v217.props.fetchGameProductInfo(v217.props.placeId);
    v217.props.fetchSubjectToChinaPolicies();
    v217:playAnimation(v97.FadeIn, {}, function() --[[ Line: 889 ]]
        -- upvalues: v217 (copy)
        v217.fadeinComplete = true;
    end);
end;
v99.willUnmount = function(_) --[[ Line: 894 ]] --[[ Name: willUnmount ]]
    -- upvalues: v42 (copy), v48 (copy), l_ContextActionService_0 (copy), l_RunService_0 (copy), v52 (ref), l_UserInputService_0 (copy), l_GuiService_0 (copy)
    if v42 or v48 then
        l_ContextActionService_0:UnbindCoreAction("CancelGameLoad");
    end;
    l_RunService_0:SetRobloxGuiFocused(false);
    if not v52 then
        v52 = l_UserInputService_0.InputBegan:Connect(function() --[[ Line: 901 ]]
            -- upvalues: v52 (ref), l_GuiService_0 (ref)
            if v52 then
                v52:disconnect();
                v52 = nil;
                l_GuiService_0:CloseStatsBasedOnInputString("ConnectionHealth");
            end;
        end);
    end;
end;
v99 = l_RoactRodux_0.connect(function(v219, v220) --[[ Line: 907 ]]
    return {
        productInfo = v219.productInfo, 
        isSubjectToChinaPolicies = v219.isSubjectToChinaPolicies, 
        placeId = v219.gameIds and v219.gameIds.placeId or v220.placeId, 
        universeId = v219.gameIds and v219.gameIds.universeId or 0, 
        settings = v219.settings
    };
end, function(v221) --[[ Line: 915 ]]
    -- upvalues: v22 (copy), v23 (copy), v24 (copy), v43 (copy)
    return {
        fetchGameProductInfo = function(v222) --[[ Line: 917 ]] --[[ Name: fetchGameProductInfo ]]
            -- upvalues: v221 (copy), v22 (ref)
            v221(v22(v222));
        end, 
        fetchSubjectToChinaPolicies = function() --[[ Line: 920 ]] --[[ Name: fetchSubjectToChinaPolicies ]]
            -- upvalues: v221 (copy), v23 (ref)
            v221(v23());
        end, 
        fetchUniverseId = function(v223) --[[ Line: 923 ]] --[[ Name: fetchUniverseId ]]
            -- upvalues: v221 (copy), v24 (ref), v43 (ref)
            v221(v24(v43, v223));
        end
    };
end)(v99);
if v42 then
    return function(v224) --[[ Line: 930 ]]
        -- upvalues: v16 (copy), v30 (copy), v99 (ref), l_Cryo_0 (copy)
        local v225 = v16.useRef(nil);
        v225.current = v30.usePreferredInput();
        return v16.createElement(v99, l_Cryo_0.Dictionary.join(v224, {
            preferredInputRef = v225
        }));
    end;
else
    return v99;
end;