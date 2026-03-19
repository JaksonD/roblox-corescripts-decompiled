local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.UIBlox);
local l_Tokens_0 = v4.App.Style.Tokens;
local l_Constants_0 = v4.App.Style.Constants;
local v7 = require(l_Parent_0.SharedFlags).getFFlagSettingsHubIndependentBackgroundVisibility();
local v8 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatInExperienceTabBarAdjustment);
local v9 = {};
v9.__index = v9;
v9._new = function() --[[ Line: 52 ]] --[[ Name: _new ]]
    -- upvalues: v9 (copy)
    local v10 = {
        _visible = false, 
        _wasVisible = false, 
        visibilitySignal = Instance.new("BindableEvent"), 
        unreadCount = 0, 
        unreadCountSignal = Instance.new("BindableEvent"), 
        currentSquadId = "", 
        currentSquadIdSignal = Instance.new("BindableEvent"), 
        topMargin = 12
    };
    setmetatable(v10, v9);
    return v10;
end;
v9.initialize = function(v11, v12, v13, v14, v15, v16) --[[ Line: 68 ]] --[[ Name: initialize ]]
    -- upvalues: l_Tokens_0 (copy), l_Constants_0 (copy), v8 (copy)
    if v12 then
        v11.topMargin = v12;
    end;
    v11.settingsHub = v13;
    v11._foundationTokens = l_Tokens_0.getFoundationTokensDefaultScale(l_Constants_0.ThemeName.Dark);
    if v8() then
        v11.viewportUtil = v14;
    end;
    v11.chatSelector = v15;
    v11.playerListManager = v16;
end;
v9.setVisible = function(v17, v18) --[[ Line: 92 ]] --[[ Name: setVisible ]]
    -- upvalues: l_CoreGui_0 (copy), v8 (copy), l_GuiService_0 (copy), v7 (copy)
    if v18 == v17._visible then
        return;
    else
        v17._visible = v18;
        v17.visibilitySignal:Fire(v18);
        if v18 then
            if v17.chatSelector then
                v17.chatSelector:HideTemp("AppChat", true);
            end;
            if v17.playerListManager then
                v17.playerListManager:HideTemp("AppChat", true);
            end;
            local l_ScreenGui_0 = Instance.new("ScreenGui");
            l_ScreenGui_0.DisplayOrder = game:DefineFastInt("AppChatInExperienceStandaloneContainerDisplayOrder", 4);
            l_ScreenGui_0.Parent = l_CoreGui_0;
            l_ScreenGui_0.Name = "InExperienceAppChatModal";
            local l_UIPadding_0 = Instance.new("UIPadding");
            l_UIPadding_0.PaddingTop = UDim.new(0, v17.topMargin);
            l_UIPadding_0.PaddingRight = UDim.new(0, 12);
            l_UIPadding_0.PaddingBottom = UDim.new(0, 0);
            l_UIPadding_0.PaddingLeft = UDim.new(0, 12);
            l_UIPadding_0.Parent = l_ScreenGui_0;
            local l_UIListLayout_0 = Instance.new("UIListLayout");
            l_UIListLayout_0.HorizontalAlignment = Enum.HorizontalAlignment.Center;
            l_UIListLayout_0.VerticalAlignment = Enum.VerticalAlignment.Center;
            l_UIListLayout_0.Parent = l_ScreenGui_0;
            local l_ImageButton_0 = Instance.new("ImageButton");
            l_ImageButton_0.BorderSizePixel = 0;
            l_ImageButton_0.AutoButtonColor = false;
            l_ImageButton_0.Modal = true;
            l_ImageButton_0.BackgroundTransparency = v17._foundationTokens.Color.OverMedia.OverMedia_0.Transparency;
            l_ImageButton_0.BackgroundColor3 = v17._foundationTokens.Color.OverMedia.OverMedia_0.Color3;
            l_ImageButton_0.Size = UDim2.fromScale(1, 1);
            l_ImageButton_0.Visible = true;
            l_ImageButton_0.Parent = l_ScreenGui_0;
            if v8() and v17.viewportUtil then
                local function v24() --[[ Line: 137 ]]
                    -- upvalues: v17 (copy), l_UIPadding_0 (copy), l_GuiService_0 (ref)
                    local v23 = v17.viewportUtil.screenSize:get();
                    if not v23 or not v23.X or not v23.Y then
                        return;
                    elseif v23.Y > v23.X then
                        l_UIPadding_0.PaddingBottom = UDim.new(0, 0);
                        return;
                    else
                        l_UIPadding_0.PaddingBottom = UDim.new(0, l_GuiService_0:GetSafeZoneOffsets().bottom);
                        return;
                    end;
                end;
                v17.viewportUtil.screenSize:connect(v24);
                v24();
            end;
            local l_UISizeConstraint_0 = Instance.new("UISizeConstraint");
            l_UISizeConstraint_0.MaxSize = Vector2.new(850, 780);
            l_UISizeConstraint_0.Parent = l_ImageButton_0;
            local l_UICorner_0 = Instance.new("UICorner");
            l_UICorner_0.CornerRadius = UDim.new(0, 8);
            l_UICorner_0.Parent = l_ImageButton_0;
            v17.frame = l_ImageButton_0;
        else
            if v17.frame and v17.frame.Parent then
                v17.frame.Parent:Destroy();
                v17.frame = nil;
            end;
            if v17.chatSelector then
                v17.chatSelector:HideTemp("AppChat", false);
            end;
            if v17.playerListManager then
                v17.playerListManager:HideTemp("AppChat", false);
            end;
        end;
        if v17.settingsHub and v7 then
            v17.settingsHub:SetBackgroundVisibility(v18, false);
        end;
        return;
    end;
end;
v9.toggleVisibility = function(v27) --[[ Line: 188 ]] --[[ Name: toggleVisibility ]]
    if v27.default then
        local v28 = not v27.default._visible;
        v27.default:setVisible(v28);
    end;
end;
v9.getVisible = function(v29) --[[ Line: 196 ]] --[[ Name: getVisible ]]
    return v29.default._visible;
end;
v9.setUnreadCount = function(v30, v31) --[[ Line: 201 ]] --[[ Name: setUnreadCount ]]
    v30.default.unreadCount = v31;
    v30.default.unreadCountSignal:Fire(v31);
end;
v9.setCurrentSquadId = function(v32, v33) --[[ Line: 206 ]] --[[ Name: setCurrentSquadId ]]
    v32.default.currentSquadId = v33;
    v32.default.currentSquadIdSignal:Fire(v33);
end;
v9.default = v9._new();
return v9;