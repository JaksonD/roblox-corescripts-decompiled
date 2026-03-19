local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.Otter);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v5 = require(l_script_FirstAncestor_0.Config);
local l_Helpers_0 = l_script_FirstAncestor_0.BubbleChat.Helpers;
local v7 = require(l_Helpers_0.getSpringFromSettings);
local v8 = require(l_Helpers_0.getAbsolutePaddingbyDimension);
local v9 = require(l_script_FirstAncestor_0.ClientSettings.ClientSettingsUtility);
local v10 = v2.Component:extend("ChatBubbleDistant");
v10.defaultProps = {
    width = 32, 
    height = 16
};
local function v16(v11) --[[ Line: 21 ]] --[[ Name: getFullHeight ]]
    -- upvalues: v8 (copy)
    local l_height_0 = v11.height;
    if v11.renderInsert then
        l_height_0 = math.max(l_height_0, v11.insertSize.Y);
    end;
    if v11.chatSettings.UIPadding then
        local l_UIPadding_0 = v11.chatSettings.UIPadding;
        local v14 = v8(l_UIPadding_0.PaddingTop, l_height_0);
        local v15 = v8(l_UIPadding_0.PaddingBottom, l_height_0);
        if v11.renderInsert then
            l_height_0 = math.max(l_height_0, v11.insertSize.Y);
        end;
        return l_height_0 + (v14 + v15);
    else
        if v11.renderInsert then
            l_height_0 = math.max(l_height_0, v11.insertSize.Y);
        end;
        return l_height_0 + v11.chatSettings.Padding * 2;
    end;
end;
v10.init = function(v17) --[[ Line: 49 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v3 (copy), v16 (copy)
    v17.state = {};
    local v18, v19 = v2.createBinding(0);
    v17.width = v18;
    v17.updateWidth = v19;
    v17.widthMotor = v3.createSingleMotor(0);
    v17.widthMotor:onStep(function(v20) --[[ Line: 54 ]]
        -- upvalues: v17 (copy)
        v17.updateWidth((math.round(v20)));
    end);
    v18, v19 = v2.createBinding((v16(v17.props)));
    v17.height = v18;
    v17.updateHeight = v19;
    v17.frameSize = v2.joinBindings({
        v17.width, 
        v17.height
    }):map(function(v21) --[[ Line: 60 ]]
        return UDim2.fromOffset(v21[1], v21[2]);
    end);
    v18, v19 = v2.createBinding(1);
    v17.transparency = v18;
    v17.updateTransparency = v19;
    v17.transparencyMotor = v3.createSingleMotor(1);
    v17.transparencyMotor:onStep(v17.updateTransparency);
    v18, v19 = v2.createBinding(1);
    v17.backgroundTransparency = v18;
    v17.updateBackgroundTransparency = v19;
    v17.backgroundTransparencyMotor = v3.createSingleMotor(1);
    v17.backgroundTransparencyMotor:onStep(v17.updateBackgroundTransparency);
    if v17.props.fadingOut then
        v17:fadeOut();
    end;
end;
v10.getDerivedStateFromProps = function(v22, v23) --[[ Line: 79 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v8 (copy), v16 (copy)
    local v24 = nil;
    if v22.chatSettings.UIPadding then
        v24 = v22.width;
        if v22.renderInsert then
            v24 = v24 + v22.insertSize.X;
        end;
        local l_UIPadding_1 = v22.chatSettings.UIPadding;
        v24 = v24 + (v8(l_UIPadding_1.PaddingLeft, v24) + v8(l_UIPadding_1.PaddingRight, v24));
    else
        v24 = if v22.renderInsert then v22.width + v22.insertSize.X + v22.chatSettings.Padding * 2 else v22.width + v22.chatSettings.Padding * 2;
    end;
    local v26 = v16(v22);
    if v24 ~= v23.fullWidth or v26 ~= v23.fullHeight then
        return {
            fullWidth = v24, 
            fullHeight = v26
        };
    else
        return nil;
    end;
end;
v10.render = function(v27) --[[ Line: 112 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v2 (copy), l_Dictionary_0 (copy)
    local l_chatSettings_0 = v27.props.chatSettings;
    local v29 = nil;
    local v30 = nil;
    local v31 = nil;
    local v32 = nil;
    if v27.props.isTextChatServiceOn then
        v29 = l_chatSettings_0.ImageLabel;
        v30 = l_chatSettings_0.UIGradient;
        v31 = l_chatSettings_0.UICorner;
        v32 = l_chatSettings_0.UIPadding;
    else
        v29 = l_chatSettings_0.BackgroundImage;
        v30 = l_chatSettings_0.BackgroundGradient;
        if l_chatSettings_0.CornerEnabled then
            v31 = {
                CornerRadius = l_chatSettings_0.CornerRadius
            };
        elseif l_chatSettings_0.CornerEnabled == false then
            v31 = {
                CornerRadius = UDim.new(0, 0)
            };
        end;
        v32 = l_chatSettings_0.Padding and {
            PaddingTop = UDim.new(0, l_chatSettings_0.Padding), 
            PaddingRight = UDim.new(0, l_chatSettings_0.Padding), 
            PaddingBottom = UDim.new(0, l_chatSettings_0.Padding), 
            PaddingLeft = UDim.new(0, l_chatSettings_0.Padding)
        } or nil;
    end;
    local l_CornerRadius_0 = v5.DefaultBubbleChatChildrenCustomizationProperties.UICorner.CornerRadius;
    local l_UIPadding_2 = v5.DefaultBubbleChatChildrenCustomizationProperties.UIPadding;
    local v35 = v27.props.renderInsert and v27.props.insertSize.X or 0;
    local v36 = v27.props.chatSettings.TailVisible and v27.props.showCaret;
    local l_createElement_0 = v2.createElement;
    local v38 = "Frame";
    local v39 = {
        AnchorPoint = Vector2.new(0.5, 1), 
        Size = UDim2.fromOffset(v27.state.fullWidth, v27.state.fullHeight), 
        Position = UDim2.new(0.5, 0, 1, -8), 
        Transparency = 1
    };
    local v40 = {
        Scale = v2.createElement("UIScale", {
            Scale = 0.75
        })
    };
    local l_TailVisible_0 = v27.props.chatSettings.TailVisible;
    if l_TailVisible_0 then
        l_TailVisible_0 = v36;
        if l_TailVisible_0 then
            l_TailVisible_0 = v2.createElement;
            local v42 = "ImageLabel";
            local v43 = {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, 0, 1, -1), 
                Size = UDim2.fromOffset(12, 8), 
                Image = "rbxasset://textures/ui/InGameChat/Caret.png", 
                ImageColor3 = l_chatSettings_0.BackgroundColor3, 
                ImageTransparency = v27.backgroundTransparency
            };
            local v44 = {};
            local v45 = false;
            if v30 ~= nil then
                v45 = v2.createElement("UIGradient", v30);
            end;
            v44.Gradient = v45;
            l_TailVisible_0 = l_TailVisible_0(v42, v43, v44);
        end;
    end;
    v40.Carat = l_TailVisible_0;
    l_TailVisible_0 = v2.createElement;
    local v46 = "ImageLabel";
    local v47 = l_Dictionary_0.join(v29, {
        Size = v27.frameSize, 
        BackgroundColor3 = l_chatSettings_0.BackgroundColor3, 
        BackgroundTransparency = v29 and v29.Image ~= "" and 1 or v27.backgroundTransparency or v27.transparency, 
        BorderSizePixel = 0, 
        AnchorPoint = Vector2.new(0.5, 0), 
        Position = UDim2.new(0.5, 0, 0, 0), 
        ClipsDescendants = true, 
        ImageTransparency = v27.backgroundTransparency or v27.transparency, 
        Image = v29 and v29.Image or ""
    });
    local v48 = {
        UICorner = v31 and v2.createElement("UICorner", {
            CornerRadius = v31.CornerRadius
        }) or v2.createElement("UICorner", {
            CornerRadius = l_CornerRadius_0
        }), 
        Contents = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }, {
            Padding = v32 and v2.createElement("UIPadding", v32) or v2.createElement("UIPadding", l_UIPadding_2), 
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Insert = v27.props.renderInsert and v27.props.renderInsert(), 
            Ellipsis = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Text = "\226\128\166", 
                TextColor3 = l_chatSettings_0.TextColor3, 
                TextTransparency = v27.transparency, 
                Font = Enum.Font.BuilderSansExtraBold, 
                TextScaled = false, 
                TextSize = l_chatSettings_0.TextSize, 
                Size = UDim2.new(1, -v35, 1, 0), 
                LayoutOrder = 2
            })
        })
    };
    local v49 = false;
    if v30 ~= nil then
        v49 = v2.createElement("UIGradient", v30);
    end;
    v48.Gradient = v49;
    v40.RoundedFrame = l_TailVisible_0(v46, v47, v48);
    return l_createElement_0(v38, v39, v40);
end;
v10.fadeIn = function(v50) --[[ Line: 229 ]] --[[ Name: fadeIn ]]
    -- upvalues: v7 (copy), v9 (copy)
    local v51 = v7(v50.props.chatSettings, "transparency");
    v50.transparencyMotor:setGoal(v51(v50.props.chatSettings.Transparency));
    local v52 = v9.getBackgroundTransparency(v50.props.chatSettings, v50.props.clientSettings);
    v50.backgroundTransparencyMotor:setGoal(v51(v52));
    local v53 = v7(v50.props.chatSettings, "size");
    v50.widthMotor:setGoal(v53(v50.state.fullWidth));
end;
v10.fadeOut = function(v54) --[[ Line: 243 ]] --[[ Name: fadeOut ]]
    -- upvalues: v7 (copy)
    v54.transparencyMotor:onComplete(function() --[[ Line: 244 ]]
        -- upvalues: v54 (copy)
        if v54.props.onFadeOut then
            v54.props.onFadeOut();
        end;
    end);
    local v55 = v7(v54.props.chatSettings, "transparency");
    v54.transparencyMotor:setGoal(v55(1));
    v54.backgroundTransparencyMotor:setGoal(v55(1));
end;
v10.didUpdate = function(v56, v57, v58) --[[ Line: 255 ]] --[[ Name: didUpdate ]]
    -- upvalues: v7 (copy)
    if v57.fadingOut ~= v56.props.fadingOut then
        if v56.props.fadingOut then
            v56:fadeOut();
            return;
        else
            v56:fadeIn();
            return;
        end;
    else
        if v56.state.fullHeight ~= v58.fullHeight then
            v56.updateHeight(v56.state.fullHeight);
        end;
        if v56.state.fullWidth ~= v58.fullWidth then
            local v59 = v7(v56.props.chatSettings, "size");
            v56.widthMotor:setGoal(v59(v56.state.fullWidth));
        end;
        return;
    end;
end;
v10.didMount = function(v60) --[[ Line: 273 ]] --[[ Name: didMount ]]
    -- upvalues: v7 (copy), v9 (copy)
    if not v60.props.fadingOut then
        local v61 = v7(v60.props.chatSettings, "size");
        local v62 = v7(v60.props.chatSettings, "transparency");
        v60.transparencyMotor:setGoal(v62(v60.props.chatSettings.Transparency));
        local v63 = v9.getBackgroundTransparency(v60.props.chatSettings, v60.props.clientSettings);
        v60.backgroundTransparencyMotor:setGoal(v62(v63));
        v60.widthMotor:setGoal(v61(v60.state.fullWidth));
    end;
end;
v10.willUnmount = function(v64) --[[ Line: 289 ]] --[[ Name: willUnmount ]]
    v64.transparencyMotor:destroy();
    v64.backgroundTransparencyMotor:destroy();
    v64.widthMotor:destroy();
end;
return v10;