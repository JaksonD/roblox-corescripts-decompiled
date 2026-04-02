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
local v42 = if v40 then require(l_script_FirstAncestor_0.createNetworking) else l_requestInternalWrapper_0(l_HttpService_0);
local v43 = 7;
game:DefineFastFlag("IncreaseLoadingScreenOrder", false);
if game:GetFastFlag("IncreaseLoadingScreenOrder") then
    v43 = 8;
end;
local v44 = Vector2.new(768, 432);
local v45 = Color3.fromRGB(101, 102, 104);
local v46 = {
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
local v47 = l_GuiService_0:IsTenFootInterface();
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local v49 = true;
if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.IOS then
    v49 = l_l_UserInputService_0_Platform_0 == Enum.Platform.Android;
end;
local v50 = {
    150, 
    256
};
local v51 = nil;
local v52 = 0;
local v53 = 1e999;
local function _(v54) --[[ Line: 90 ]] --[[ Name: getPadding ]]
    -- upvalues: v49 (copy), v46 (copy), v47 (copy)
    if v49 then
        return v54 and v46.MOBILE_PORTRAIT or v46.MOBILE_LANDSCAPE;
    elseif v47 then
        return v46.CONSOLE;
    else
        return v46.DESKTOP;
    end;
end;
local function _(v56, v57) --[[ Line: 100 ]] --[[ Name: lerp ]]
    if type(v56) == "table" and #v56 >= 2 then
        local v58 = math.clamp(v57, 0, 1);
        return v56[1] * (1 - v58) + v56[2] * v58;
    else
        return 0;
    end;
end;
local v96 = {
    FadeIn = function(v60, _, v62, v63) --[[ Line: 109 ]] --[[ Name: FadeIn ]]
        local v64 = {
            1, 
            1
        };
        local v65 = {
            1, 
            0
        };
        local v66 = {
            1, 
            0.2
        };
        if v60 <= 0.6 then
            local v67 = v60 / 0.6;
            local l_iconTransparency_0 = v62.iconTransparency;
            local v69;
            if type(v65) == "table" and #v65 >= 2 then
                local v70 = math.clamp(v67, 0, 1);
                v69 = v65[1] * (1 - v70) + v65[2] * v70;
            else
                v69 = 0;
            end;
            l_iconTransparency_0(v69);
            l_iconTransparency_0 = v62.iconSize;
            if type(v64) == "table" and #v64 >= 2 then
                local v71 = math.clamp(v67, 0, 1);
                v69 = v64[1] * (1 - v71) + v64[2] * v71;
            else
                v69 = 0;
            end;
            l_iconTransparency_0(v69);
            l_iconTransparency_0 = v62.infoFrameTransparency;
            if type(v66) == "table" and #v66 >= 2 then
                local v72 = math.clamp(v67, 0, 1);
                v69 = v66[1] * (1 - v72) + v66[2] * v72;
            else
                v69 = 0;
            end;
            l_iconTransparency_0(v69);
            l_iconTransparency_0 = v62.thumbnailTransparency;
            if type(v65) == "table" and #v65 >= 2 then
                local v73 = math.clamp(v67, 0, 1);
                v69 = v65[1] * (1 - v73) + v65[2] * v73;
            else
                v69 = 0;
            end;
            l_iconTransparency_0(v69);
            l_iconTransparency_0 = v62.placeTextTransparency;
            if type(v65) == "table" and #v65 >= 2 then
                local v74 = math.clamp(v67, 0, 1);
                v69 = v65[1] * (1 - v74) + v65[2] * v74;
            else
                v69 = 0;
            end;
            l_iconTransparency_0(v69);
            l_iconTransparency_0 = v62.placeTextSize;
            if type(v64) == "table" and #v64 >= 2 then
                local v75 = math.clamp(v67, 0, 1);
                v69 = v64[1] * (1 - v75) + v64[2] * v75;
            else
                v69 = 0;
            end;
            l_iconTransparency_0(v69);
            l_iconTransparency_0 = v62.creatorTextTransparency;
            if type(v65) == "table" and #v65 >= 2 then
                local v76 = math.clamp(v67, 0, 1);
                v69 = v65[1] * (1 - v76) + v65[2] * v76;
            else
                v69 = 0;
            end;
            l_iconTransparency_0(v69);
            l_iconTransparency_0 = v62.creatorTextSize;
            if type(v64) == "table" and #v64 >= 2 then
                local v77 = math.clamp(v67, 0, 1);
                v69 = v64[1] * (1 - v77) + v64[2] * v77;
            else
                v69 = 0;
            end;
            l_iconTransparency_0(v69);
            return;
        else
            v62.iconTransparency(if type(v65) == "table" and #v65 >= 2 then v65[1] * 0 + v65[2] * 1 else 0);
            v62.iconSize(if type(v64) == "table" and #v64 >= 2 then v64[1] * 0 + v64[2] * 1 else 0);
            v62.infoFrameTransparency(if type(v66) == "table" and #v66 >= 2 then v66[1] * 0 + v66[2] * 1 else 0);
            v62.thumbnailTransparency(if type(v65) == "table" and #v65 >= 2 then v65[1] * 0 + v65[2] * 1 else 0);
            v62.placeTextTransparency(if type(v65) == "table" and #v65 >= 2 then v65[1] * 0 + v65[2] * 1 else 0);
            v62.placeTextSize(if type(v64) == "table" and #v64 >= 2 then v64[1] * 0 + v64[2] * 1 else 0);
            v62.creatorTextTransparency(if type(v65) == "table" and #v65 >= 2 then v65[1] * 0 + v65[2] * 1 else 0);
            v62.creatorTextSize(if type(v64) == "table" and #v64 >= 2 then v64[1] * 0 + v64[2] * 1 else 0);
            v63();
            return;
        end;
    end, 
    FadeOut = function(v78, _, v80, v81) --[[ Line: 138 ]] --[[ Name: FadeOut ]]
        -- upvalues: l_RunService_0 (copy)
        local v82 = {
            1, 
            0.6
        };
        local v83 = {
            0, 
            1
        };
        local v84 = {
            0.2, 
            1
        };
        if v78 <= 0.6 then
            local v85 = v78 / 0.6;
            local l_iconTransparency_1 = v80.iconTransparency;
            local v87;
            if type(v83) == "table" and #v83 >= 2 then
                local v88 = math.clamp(v85, 0, 1);
                v87 = v83[1] * (1 - v88) + v83[2] * v88;
            else
                v87 = 0;
            end;
            l_iconTransparency_1(v87);
            l_iconTransparency_1 = v80.iconSize;
            if type(v82) == "table" and #v82 >= 2 then
                local v89 = math.clamp(v85, 0, 1);
                v87 = v82[1] * (1 - v89) + v82[2] * v89;
            else
                v87 = 0;
            end;
            l_iconTransparency_1(v87);
            l_iconTransparency_1 = v80.infoFrameTransparency;
            if type(v84) == "table" and #v84 >= 2 then
                local v90 = math.clamp(v85, 0, 1);
                v87 = v84[1] * (1 - v90) + v84[2] * v90;
            else
                v87 = 0;
            end;
            l_iconTransparency_1(v87);
            l_iconTransparency_1 = v80.thumbnailTransparency;
            if type(v83) == "table" and #v83 >= 2 then
                local v91 = math.clamp(v85, 0, 1);
                v87 = v83[1] * (1 - v91) + v83[2] * v91;
            else
                v87 = 0;
            end;
            l_iconTransparency_1(v87);
            l_iconTransparency_1 = v80.placeTextTransparency;
            if type(v83) == "table" and #v83 >= 2 then
                local v92 = math.clamp(v85, 0, 1);
                v87 = v83[1] * (1 - v92) + v83[2] * v92;
            else
                v87 = 0;
            end;
            l_iconTransparency_1(v87);
            l_iconTransparency_1 = v80.placeTextSize;
            if type(v82) == "table" and #v82 >= 2 then
                local v93 = math.clamp(v85, 0, 1);
                v87 = v82[1] * (1 - v93) + v82[2] * v93;
            else
                v87 = 0;
            end;
            l_iconTransparency_1(v87);
            l_iconTransparency_1 = v80.creatorTextTransparency;
            if type(v83) == "table" and #v83 >= 2 then
                local v94 = math.clamp(v85, 0, 1);
                v87 = v83[1] * (1 - v94) + v83[2] * v94;
            else
                v87 = 0;
            end;
            l_iconTransparency_1(v87);
            l_iconTransparency_1 = v80.creatorTextSize;
            if type(v82) == "table" and #v82 >= 2 then
                local v95 = math.clamp(v85, 0, 1);
                v87 = v82[1] * (1 - v95) + v82[2] * v95;
            else
                v87 = 0;
            end;
            l_iconTransparency_1(v87);
            return;
        else
            l_RunService_0:SetRobloxGuiFocused(false);
            v80.iconTransparency(if type(v83) == "table" and #v83 >= 2 then v83[1] * 0 + v83[2] * 1 else 0);
            v80.iconSize(if type(v82) == "table" and #v82 >= 2 then v82[1] * 0 + v82[2] * 1 else 0);
            v80.infoFrameTransparency(if type(v84) == "table" and #v84 >= 2 then v84[1] * 0 + v84[2] * 1 else 0);
            v80.thumbnailTransparency(if type(v83) == "table" and #v83 >= 2 then v83[1] * 0 + v83[2] * 1 else 0);
            v80.placeTextTransparency(if type(v83) == "table" and #v83 >= 2 then v83[1] * 0 + v83[2] * 1 else 0);
            v80.placeTextSize(if type(v82) == "table" and #v82 >= 2 then v82[1] * 0 + v82[2] * 1 else 0);
            v80.creatorTextTransparency(if type(v83) == "table" and #v83 >= 2 then v83[1] * 0 + v83[2] * 1 else 0);
            v80.creatorTextSize(if type(v82) == "table" and #v82 >= 2 then v82[1] * 0 + v82[2] * 1 else 0);
            v81();
            return;
        end;
    end
};
local function _() --[[ Line: 171 ]] --[[ Name: disconnectAndCloseHealthStat ]]
    -- upvalues: v51 (ref), l_GuiService_0 (copy)
    if v51 then
        v51:disconnect();
        v51 = nil;
        l_GuiService_0:CloseStatsBasedOnInputString("ConnectionHealth");
    end;
end;
local v98 = l_Roact_0.Component:extend("LoadingScreen");
v98.playAnimation = function(v99, v100, v101, v102) --[[ Line: 182 ]] --[[ Name: playAnimation ]]
    -- upvalues: l_RunService_0 (copy)
    v99.animationStartTime = tick();
    v99.animationFunction = v100;
    if not v99.renderSteppedConnection then
        v99.renderSteppedConnection = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 187 ]]
            -- upvalues: v99 (copy), v101 (copy), v102 (copy)
            v99.animationFunction(tick() - v99.animationStartTime, v101, v99.updateBindings, function() --[[ Line: 188 ]]
                -- upvalues: v99 (ref), v102 (ref)
                v99:stopAnimation();
                if v102 then
                    v102();
                end;
            end);
        end);
    end;
end;
v98.stopAnimation = function(v103) --[[ Line: 198 ]] --[[ Name: stopAnimation ]]
    if v103.renderSteppedConnection then
        v103.renderSteppedConnection:Disconnect();
        v103.renderSteppedConnection = nil;
    end;
end;
v98.renderBackground = function(v104, v105) --[[ Line: 205 ]] --[[ Name: renderBackground ]]
    -- upvalues: l_Roact_0 (copy), v43 (ref), l_ExternalEventConnection_0 (copy), l_RunService_0 (copy)
    local l_thumbnailScaledWidth_0 = v104.state.thumbnailScaledWidth;
    local l_thumbnailScaledHeight_0 = v104.state.thumbnailScaledHeight;
    local l_thumbnailPositionX_0 = v104.state.thumbnailPositionX;
    local v109 = "";
    if v104.props.placeId and v104.props.placeId > 0 then
        v109 = ("rbxthumb://type=GameThumbnail&id=%d&w=768&h=432"):format(v104.props.placeId);
    end;
    local l_ReducedMotion_0 = v105.Settings.ReducedMotion;
    return l_Roact_0.createElement("ScreenGui", {
        DisplayOrder = v43, 
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, {
        l_Roact_0.createElement("Frame", {
            Name = "BackgroundFrame", 
            [l_Roact_0.Change.AbsoluteSize] = v104.onAbsoluteSizeChange, 
            BackgroundColor3 = v105.Theme.BackgroundUIDefault.Color, 
            BackgroundTransparency = 0, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Active = true
        }, {
            ThumbnailImage = l_Roact_0.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Image = v109, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(l_thumbnailPositionX_0, 0.5), 
                Size = UDim2.fromOffset(l_thumbnailScaledWidth_0, l_thumbnailScaledHeight_0), 
                ImageTransparency = v104.bindings.thumbnailTransparency
            }), 
            renderStepped = not l_ReducedMotion_0 and l_Roact_0.createElement(l_ExternalEventConnection_0, {
                event = l_RunService_0.renderStepped, 
                callback = v104.renderBackgroundSteppedCallback
            })
        })
    });
end;
v98.showConnnectionHealthDebugMenu = function(_, _) --[[ Line: 247 ]] --[[ Name: showConnnectionHealthDebugMenu ]]
    -- upvalues: v52 (ref), v53 (ref), v49 (copy), l_GuiService_0 (copy)
    if v52 == 0 then
        v52 = 1;
        v53 = tick();
        return;
    else
        if v49 and tick() - v53 <= 0.5 then
            l_GuiService_0:ShowStatsBasedOnInputString("ConnectionHealth");
        end;
        v52 = 0;
        v53 = 1e999;
        return;
    end;
end;
v98.renderPlaceIcon = function(v113, v114) --[[ Line: 264 ]] --[[ Name: renderPlaceIcon ]]
    -- upvalues: l_Roact_0 (copy), v45 (copy), l_ExternalEventConnection_0 (copy), l_RunService_0 (copy)
    local l_shimPos_0 = v113.state.shimPos;
    local v116 = v113.bindings.iconTransparency:getValue();
    local v117 = "";
    if v113.props.universeId and v113.props.universeId > 0 then
        v117 = ("rbxthumb://type=GameIcon&id=%d&w=256&h=256"):format(v113.props.universeId);
    end;
    local l_ReducedMotion_1 = v114.Settings.ReducedMotion;
    local l_createElement_0 = l_Roact_0.createElement;
    local v120 = "Frame";
    local v121 = {
        Name = "IconFrame", 
        BackgroundTransparency = v113.bindings.iconTransparency, 
        BackgroundColor3 = v45, 
        BorderSizePixel = 0, 
        Size = v113.bindings.iconSize, 
        Position = UDim2.fromScale(0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Active = true
    };
    local v122 = {};
    local v123 = not l_ReducedMotion_1;
    if v123 then
        v123 = l_Roact_0.createElement;
        local v124 = "Frame";
        local v125 = {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = Color3.new(1, 1, 1), 
            BackgroundTransparency = 0, 
            ZIndex = 2
        };
        local v126 = {
            Corner = l_Roact_0.createElement("UICorner")
        };
        local l_createElement_1 = l_Roact_0.createElement;
        local v128 = "UIGradient";
        local v129 = {
            Rotation = 25, 
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new(0.5, 0.5, 0.5)), 
                ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)), 
                ColorSequenceKeypoint.new(1, Color3.new(0.5, 0.5, 0.5))
            })
        };
        local l_new_0 = NumberSequence.new;
        local v131 = {};
        local l_new_1 = NumberSequenceKeypoint.new;
        local v133 = 0;
        local v134 = {
            0.7, 
            1
        };
        local v135;
        if type(v134) == "table" and #v134 >= 2 then
            local v136 = math.clamp(v116, 0, 1);
            v135 = v134[1] * (1 - v136) + v134[2] * v136;
        else
            v135 = 0;
        end;
        l_new_1 = l_new_1(v133, v135);
        v133 = NumberSequenceKeypoint.new;
        v135 = 0.5;
        local v137 = {
            0.3, 
            1
        };
        if type(v137) == "table" and #v137 >= 2 then
            local v138 = math.clamp(v116, 0, 1);
            v134 = v137[1] * (1 - v138) + v137[2] * v138;
        else
            v134 = 0;
        end;
        v133 = v133(v135, v134);
        v135 = NumberSequenceKeypoint.new;
        v134 = 1;
        local v139 = {
            0.7, 
            1
        };
        if type(v139) == "table" and #v139 >= 2 then
            local v140 = math.clamp(v116, 0, 1);
            v137 = v139[1] * (1 - v140) + v139[2] * v140;
        else
            v137 = 0;
        end;
        v6(v131, 1, l_new_1, v133, v135(v134, v137));
        v129.Transparency = l_new_0(v131);
        v129.Offset = Vector2.new(l_shimPos_0, 0);
        v126.Gradient = l_createElement_1(v128, v129);
        v126.renderStepped = l_Roact_0.createElement(l_ExternalEventConnection_0, {
            event = l_RunService_0.renderStepped, 
            callback = v113.renderShimmerCallback
        });
        v123 = v123(v124, v125, v126);
    end;
    v122.LoadingOverlay = v123;
    v122.GameIconImage = l_Roact_0.createElement("ImageLabel", {
        BackgroundTransparency = 1, 
        Image = v117, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = UDim2.fromScale(1, 1), 
        ImageTransparency = v113.bindings.iconTransparency
    }, {
        Corner = l_Roact_0.createElement("UICorner")
    });
    v122.Corner = l_Roact_0.createElement("UICorner");
    return l_createElement_0(v120, v121, v122);
end;
v98.renderInfoFrame = function(v141, v142) --[[ Line: 325 ]] --[[ Name: renderInfoFrame ]]
    -- upvalues: v25 (copy), v50 (copy), l_Roact_0 (copy), v40 (copy), v49 (copy)
    local l_productInfo_0 = v141.props.productInfo;
    local v144 = l_productInfo_0 and l_productInfo_0.Name or "";
    local v145 = l_productInfo_0 and l_productInfo_0.Creator.Name or "";
    if l_productInfo_0 and l_productInfo_0.Creator.HasVerifiedBadge then
        v145 = v25.appendVerifiedBadge(v145);
    end;
    local v146 = math.clamp(math.max(v141.state.absoluteSize.X, v141.state.absoluteSize.Y) / 1024 * v50[1], v50[1], v50[2]);
    return l_Roact_0.createElement("Frame", {
        Name = "InfoFrame", 
        BackgroundColor3 = v142.Theme.BackgroundMuted.Color, 
        BackgroundTransparency = v141.bindings.infoFrameTransparency, 
        BorderSizePixel = 0, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = v141.isPortrait and UDim2.fromScale(1, 0) or UDim2.fromScale(0.6, 0), 
        Active = true, 
        [l_Roact_0.Change.AbsoluteSize] = v40 and function(v147) --[[ Line: 349 ]]
            -- upvalues: v141 (copy)
            v141.updateBindings.updateInfoFrameAbsoluteSize(v147.AbsoluteSize);
        end or nil
    }, {
        PlaceIcon = v141:renderPlaceIcon(v142), 
        TextLayoutFrame = l_Roact_0.createElement("Frame", {
            Name = "TextLayout", 
            BackgroundColor3 = v142.Theme.BackgroundMuted.Color, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            AnchorPoint = Vector2.new(0.5, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Position = UDim2.new(0.5, 0, 0, v146 / 2), 
            Size = UDim2.fromScale(1, 0), 
            Active = true
        }, {
            PlaceLabel = l_Roact_0.createElement("TextLabel", {
                Name = "PlaceLabel", 
                BackgroundTransparency = 1, 
                TextTransparency = v141.bindings.placeTextTransparency, 
                Size = UDim2.fromScale(0.8, 0), 
                AnchorPoint = Vector2.new(0.5, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Font = v142.Font.Title.Font, 
                TextSize = v141.bindings.placeTextSize, 
                TextScaled = false, 
                TextWrapped = true, 
                TextColor3 = v142.Theme.TextEmphasis.Color, 
                TextStrokeTransparency = 1, 
                Text = v144, 
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
                TextTransparency = v141.bindings.creatorTextTransparency, 
                Size = UDim2.fromScale(0.6, 0), 
                AnchorPoint = Vector2.new(0.5, 1), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Font = v142.Font.CaptionBody.Font, 
                TextSize = v141.bindings.creatorTextSize, 
                TextWrapped = true, 
                TextScaled = false, 
                TextColor3 = v142.Theme.TextDefault.Color, 
                TextStrokeTransparency = 1, 
                Text = v145, 
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
                Padding = UDim.new(0, v49 and 12 or 36)
            }), 
            Padding = l_Roact_0.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v49 and 12 or 36), 
                PaddingBottom = UDim.new(0, v49 and 12 or 36)
            })
        }), 
        Corner = l_Roact_0.createElement("UICorner")
    });
end;
v98.renderMain = function(v148, v149) --[[ Line: 423 ]] --[[ Name: renderMain ]]
    -- upvalues: v49 (copy), v46 (copy), v47 (copy), l_Roact_0 (copy), v43 (ref), l_LoadingSpinner_0 (copy), v40 (copy)
    local l_isPortrait_0 = v148.isPortrait;
    local v151 = if v49 then l_isPortrait_0 and v46.MOBILE_PORTRAIT or v46.MOBILE_LANDSCAPE else if v47 then v46.CONSOLE else v46.DESKTOP;
    l_isPortrait_0 = v149.Settings.ReducedMotion;
    return l_Roact_0.createElement("ScreenGui", {
        DisplayOrder = v43 + 1, 
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
            infoFrame = v148:renderInfoFrame(v149), 
            AutoTranslate = v40 and v148:renderAutoTranslate() or nil, 
            serverFrame = v148:renderServerFrame(v149), 
            closeBtn = v148:renderCloseBtn(v149), 
            gamepadCancelBtn = v148:renderGamepadCancelBtn(v149), 
            Padding = l_Roact_0.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v151.LEFT), 
                PaddingRight = UDim.new(0, v151.RIGHT), 
                PaddingTop = UDim.new(0, v151.TOP), 
                PaddingBottom = UDim.new(0, v151.BOTTOM)
            })
        })
    });
end;
v98.renderCloseBtn = function(v152, _) --[[ Line: 481 ]] --[[ Name: renderCloseBtn ]]
    -- upvalues: v30 (copy), l_Roact_0 (copy), v39 (copy), v26 (copy)
    if v152.props.preferredInputRef.current ~= v30.Input.Directional and not v152.state.showCloseBtn and tick() - v152.startTime > 5 then
        v152:setState({
            showCloseBtn = true
        });
    end;
    return v152.state.showCloseBtn and l_Roact_0.createElement("ImageButton", {
        Name = "CloseButton", 
        Image = "rbxasset://textures/loading/cancelButton.png", 
        ImageTransparency = 0, 
        BackgroundTransparency = 1, 
        Position = UDim2.fromOffset(0, 0), 
        Size = UDim2.fromOffset(32, 32), 
        Active = false, 
        ZIndex = 10, 
        [l_Roact_0.Event.MouseButton1Click] = function() --[[ Line: 501 ]]
            -- upvalues: v39 (ref), v26 (ref)
            if v39 then
                v26.default:logEventOnce("first_experience_cancelled");
            end;
            game:Shutdown();
        end
    });
end;
v98.renderServerFrame = function(v154, v155) --[[ Line: 510 ]] --[[ Name: renderServerFrame ]]
    -- upvalues: v47 (copy), l_Roact_0 (copy), v37 (copy), l_CoreGui_0 (copy)
    local l_serverStatusText_0 = v154.state.serverStatusText;
    local l_isSubjectToChinaPolicies_0 = v154.props.isSubjectToChinaPolicies;
    local v158 = v47 and 16 or 12;
    local v159 = v47 and 16 or 12;
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
            Size = UDim2.new(1, 0, 0, 2 * v159), 
            Position = UDim2.new(0, 0, 1, -4 * v158 - 2 * v159), 
            Font = v155.Font.Footer.Font, 
            TextSize = v159, 
            TextWrapped = true, 
            TextScaled = false, 
            TextColor3 = v155.Theme.TextDefault.Color, 
            TextStrokeTransparency = 1, 
            Text = v37:Format("Authentication.Login.WeChat.AntiAddictionText"), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 2
        }), 
        JoinServerLabel = l_Roact_0.createElement("TextLabel", {
            Name = "JoinText", 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 4 * v158), 
            Position = UDim2.new(0, 0, 1, -2 * v158), 
            Font = v155.Font.Footer.Font, 
            TextSize = v158, 
            TextWrapped = true, 
            TextScaled = false, 
            TextColor3 = v155.Theme.TextDefault.Color, 
            TextStrokeTransparency = 1, 
            Text = l_serverStatusText_0, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 2, 
            RootLocalizationTable = l_CoreGui_0.CoreScriptLocalization, 
            [l_Roact_0.Event.InputBegan] = not v154.props.isSubjectToChinaPolicies and v154.showConnnectionHealthDebugMenu or nil
        })
    });
end;
v98.renderGamepadCancelBtn = function(v160, v161) --[[ Line: 563 ]] --[[ Name: renderGamepadCancelBtn ]]
    -- upvalues: v30 (copy), l_Roact_0 (copy), v37 (copy)
    local v162 = false;
    if v160.props.preferredInputRef.current == v30.Input.Directional then
        v162 = not v160.state.gamepadCancelPressed and l_Roact_0.createElement("Frame", {
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
                Font = v161.Font.SubHeader1.Font, 
                TextSize = 24, 
                TextWrapped = true, 
                TextColor3 = v161.Theme.TextEmphasis.Color, 
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
    return v162;
end;
v98.init = function(v163) --[[ Line: 609 ]] --[[ Name: init ]]
    -- upvalues: v44 (copy), v47 (copy), l_ContextActionService_0 (copy), v96 (copy), l_Roact_0 (copy), v40 (copy), v50 (copy), v49 (copy), l_GuiService_0 (copy)
    v163.thumbnailMoveSpd = 0.05;
    v163.fadeinComplete = false;
    v163.isPortrait = false;
    v163.startTime = tick();
    v163.numberOfTaps = 0;
    v163.lastTapTime = 1e999;
    v163:setState({
        visible = true, 
        absoluteSize = Vector2.new(0, 0), 
        thumbnailPositionX = 0.5, 
        thumbnailScaledWidth = v44.x, 
        thumbnailScaledHeight = v44.y, 
        shimPos = 0, 
        serverStatusText = "", 
        showCloseBtn = false, 
        showTenFootCancelBtn = v47, 
        gamepadCancelPressed = false
    });
    v163.onAbsoluteSizeChange = function(v164) --[[ Line: 634 ]]
        -- upvalues: v163 (copy)
        v163:setState({
            absoluteSize = v164.AbsoluteSize
        });
        v163.isPortrait = v164.AbsoluteSize.X < v164.AbsoluteSize.Y;
        v163.updateBindings.iconSize(1);
    end;
    game.Loaded:Connect(function() --[[ Line: 643 ]]
        -- upvalues: v47 (ref), l_ContextActionService_0 (ref), v163 (copy), v96 (ref)
        if v47 then
            l_ContextActionService_0:UnbindCoreAction("CancelGameLoad");
        end;
        while not v163.fadeinComplete do
            wait();
        end;
        v163:stopAnimation();
        v163:playAnimation(v96.FadeOut, {}, function() --[[ Line: 651 ]]
            -- upvalues: v163 (ref)
            v163:setState({
                visible = false
            });
        end);
    end);
    local v165, v166 = l_Roact_0.createBinding(1);
    local v167, v168 = l_Roact_0.createBinding(1);
    local v169, v170 = l_Roact_0.createBinding(0);
    local v171, v172 = l_Roact_0.createBinding(1);
    local v173, v174 = l_Roact_0.createBinding(0);
    local v175, v176 = l_Roact_0.createBinding(1);
    local v177, v178 = l_Roact_0.createBinding(0);
    local v179, v180 = l_Roact_0.createBinding(1);
    local v181 = nil;
    local v182 = nil;
    if v40 then
        local v183, v184 = l_Roact_0.createBinding(Vector2.new(0, 0));
        v181 = v183;
        v182 = v184;
    end;
    v163.bindings = {
        thumbnailTransparency = v165, 
        iconTransparency = v167, 
        iconSize = v169:map(function(v185) --[[ Line: 675 ]]
            -- upvalues: v163 (copy), v50 (ref)
            local v186 = math.clamp(math.max(v163.state.absoluteSize.X, v163.state.absoluteSize.Y) / 1024 * v50[1], v50[1], v50[2]);
            return UDim2.fromOffset(v186 * v185, v186 * v185);
        end), 
        placeTextTransparency = v171, 
        placeTextSize = v173:map(function(v187) --[[ Line: 681 ]]
            -- upvalues: v49 (ref)
            return (v49 and 20 or 36) * v187;
        end), 
        creatorTextTransparency = v175, 
        creatorTextSize = v177:map(function(v188) --[[ Line: 685 ]]
            return 20 * v188;
        end), 
        infoFrameTransparency = v179, 
        infoFrameAbsoluteSize = if v40 then v181 else nil
    };
    v163.updateBindings = {
        thumbnailTransparency = v166, 
        iconTransparency = v168, 
        iconSize = v170, 
        placeTextTransparency = v172, 
        placeTextSize = v174, 
        creatorTextTransparency = v176, 
        creatorTextSize = v178, 
        infoFrameTransparency = v180, 
        updateInfoFrameAbsoluteSize = if v40 then v182 else nil
    };
    v163.renderBackgroundSteppedCallback = function(v189) --[[ Line: 705 ]]
        -- upvalues: v163 (copy), v44 (ref)
        local l_absoluteSize_0 = v163.state.absoluteSize;
        local v191 = l_absoluteSize_0.x * 1.5;
        local v192 = v191 / v44.x * v44.y;
        if v192 < l_absoluteSize_0.y then
            v191 = l_absoluteSize_0.y / v44.y * v44.x;
            v192 = l_absoluteSize_0.y;
        end;
        local v193 = v191 / l_absoluteSize_0.x / 2;
        local v194 = math.max(v193, 1 - v193);
        local v195 = math.min(v193, 1 - v193);
        local v196 = v163.state.thumbnailPositionX + v163.thumbnailMoveSpd * v189;
        if v194 <= v196 or v196 <= v195 then
            v163.thumbnailMoveSpd = -v163.thumbnailMoveSpd;
            v196 = math.clamp(v196, v195, v194);
        end;
        v163:setState({
            thumbnailPositionX = v196, 
            thumbnailScaledHeight = v192, 
            thumbnailScaledWidth = v191
        });
    end;
    v163.renderShimmerCallback = function(v197) --[[ Line: 732 ]]
        -- upvalues: v163 (copy)
        local v198 = v163.state.shimPos + v197 * 1;
        if v198 > 1 then
            v198 = -1;
        end;
        v163:setState({
            shimPos = v198
        });
    end;
    if l_GuiService_0:GetUiMessage() ~= "" then
        v163:setState({
            serverStatusText = l_GuiService_0:GetUiMessage()
        });
    end;
    l_GuiService_0.UiMessageChanged:Connect(function(v199, v200) --[[ Line: 749 ]]
        -- upvalues: v163 (copy)
        if v199 == Enum.UiMessageType.UiMessageInfo then
            v163:setState({
                serverStatusText = v200
            });
        end;
    end);
    local v201 = false;
    l_ContextActionService_0:BindCoreAction("CancelGameLoad", function(_, v203, _) --[[ Line: 757 ]]
        -- upvalues: v201 (ref), v163 (copy), l_ContextActionService_0 (ref)
        if v203 == Enum.UserInputState.Begin then
            v201 = true;
            return;
        else
            if v203 == Enum.UserInputState.End and v201 then
                v163:setState({
                    showTenFootCancelBtn = false
                });
                v163:setState({
                    gamepadCancelPressed = true
                });
                l_ContextActionService_0:UnbindCoreAction("CancelGameLoad");
                if not game:IsLoaded() then
                    game:Shutdown();
                end;
            end;
            return;
        end;
    end, false, Enum.KeyCode.ButtonB);
end;
v98.renderAutoTranslate = function(v205) --[[ Line: 777 ]] --[[ Name: renderAutoTranslate ]]
    -- upvalues: v41 (copy), v36 (copy), l_Roact_0 (copy), v35 (copy)
    if v41 and v205.props.universeId <= 0 then
        v36.countAutoTranslateZeroUniverseId();
        return nil;
    else
        return l_Roact_0.createElement(v35, {
            universeId = v205.props.universeId, 
            positionBinding = v205.bindings.infoFrameAbsoluteSize, 
            transparencyBinding = v205.bindings.infoFrameTransparency
        });
    end;
end;
v98.renderMainWithProviders = function(v206, v207) --[[ Line: 789 ]] --[[ Name: renderMainWithProviders ]]
    -- upvalues: l_Roact_0 (copy), l_FoundationProvider_0 (copy), v31 (copy), l_LocalizationProvider_0 (copy), v37 (copy)
    return l_Roact_0.createElement(l_FoundationProvider_0, {
        theme = v31.Enums.Theme.Dark
    }, {
        l_Roact_0.createElement(l_LocalizationProvider_0, {
            localization = v37
        }, v206:renderMain(v207))
    });
end;
v98.render = function(v208) --[[ Line: 799 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_Roact_0 (copy), v40 (copy)
    return l_withStyle_0(function(v209) --[[ Line: 802 ]]
        -- upvalues: v208 (copy), l_Roact_0 (ref), v40 (ref)
        return v208.state.visible and l_Roact_0.createElement("Folder", {}, {
            BackgroundScreen = v208:renderBackground(v209), 
            MainScreen = if v40 then v208:renderMainWithProviders(v209) else v208:renderMain(v209)
        });
    end);
end;
v98.willUpdate = function(_, _, _) --[[ Line: 813 ]] --[[ Name: willUpdate ]]

end;
v98.didMount = function(v213) --[[ Line: 815 ]] --[[ Name: didMount ]]
    -- upvalues: l_RunService_0 (copy), v96 (copy)
    l_RunService_0:SetRobloxGuiFocused(true);
    v213.props.fetchUniverseId(v213.props.placeId);
    v213.props.fetchGameProductInfo(v213.props.placeId);
    v213.props.fetchSubjectToChinaPolicies();
    v213:playAnimation(v96.FadeIn, {}, function() --[[ Line: 824 ]]
        -- upvalues: v213 (copy)
        v213.fadeinComplete = true;
    end);
end;
v98.willUnmount = function(_) --[[ Line: 829 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_ContextActionService_0 (copy), l_RunService_0 (copy), v51 (ref), l_UserInputService_0 (copy), l_GuiService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("CancelGameLoad");
    l_RunService_0:SetRobloxGuiFocused(false);
    if not v51 then
        v51 = l_UserInputService_0.InputBegan:Connect(function() --[[ Line: 833 ]]
            -- upvalues: v51 (ref), l_GuiService_0 (ref)
            if v51 then
                v51:disconnect();
                v51 = nil;
                l_GuiService_0:CloseStatsBasedOnInputString("ConnectionHealth");
            end;
        end);
    end;
end;
v98 = l_RoactRodux_0.connect(function(v215, v216) --[[ Line: 839 ]]
    return {
        productInfo = v215.productInfo, 
        isSubjectToChinaPolicies = v215.isSubjectToChinaPolicies, 
        placeId = v215.gameIds and v215.gameIds.placeId or v216.placeId, 
        universeId = v215.gameIds and v215.gameIds.universeId or 0, 
        settings = v215.settings
    };
end, function(v217) --[[ Line: 847 ]]
    -- upvalues: v22 (copy), v23 (copy), v24 (copy), v42 (copy)
    return {
        fetchGameProductInfo = function(v218) --[[ Line: 849 ]] --[[ Name: fetchGameProductInfo ]]
            -- upvalues: v217 (copy), v22 (ref)
            v217(v22(v218));
        end, 
        fetchSubjectToChinaPolicies = function() --[[ Line: 852 ]] --[[ Name: fetchSubjectToChinaPolicies ]]
            -- upvalues: v217 (copy), v23 (ref)
            v217(v23());
        end, 
        fetchUniverseId = function(v219) --[[ Line: 855 ]] --[[ Name: fetchUniverseId ]]
            -- upvalues: v217 (copy), v24 (ref), v42 (ref)
            v217(v24(v42, v219));
        end
    };
end)(v98);
return function(v220) --[[ Line: 860 ]]
    -- upvalues: v16 (copy), v30 (copy), v98 (ref), l_Cryo_0 (copy)
    local v221 = v16.useRef(nil);
    v221.current = v30.usePreferredInput();
    return v16.createElement(v98, l_Cryo_0.Dictionary.join(v220, {
        preferredInputRef = v221
    }));
end;