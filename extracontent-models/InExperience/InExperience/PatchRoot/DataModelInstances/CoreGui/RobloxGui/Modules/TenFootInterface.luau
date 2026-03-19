local v0 = Color3.new(0.10588235294117647, 0.9882352941176471, 0.4196078431372549);
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v6 = l_GuiService_0:IsTenFootInterface();
local function v65() --[[ Line: 30 ]] --[[ Name: CreateModule ]]
    -- upvalues: l_Create_0 (copy), l_RobloxGui_0 (copy), v0 (copy), l_Players_0 (copy)
    local v7 = {
        Container = nil
    };
    local v8 = {};
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local l_BindableEvent_1 = Instance.new("BindableEvent");
    local function v11() --[[ Line: 39 ]] --[[ Name: createContainer ]]
        -- upvalues: v7 (copy), l_Create_0 (ref), l_RobloxGui_0 (ref)
        if not v7.Container then
            v7.Container = l_Create_0("ImageButton")({
                Name = "TopRightContainer", 
                Size = UDim2.new(0, 350, 0, 100), 
                Position = UDim2.new(1, -415, 0, 10), 
                AutoButtonColor = false, 
                Image = "", 
                Active = false, 
                BackgroundTransparency = 1, 
                Parent = l_RobloxGui_0
            });
        end;
    end;
    removeFromDisplayStack = function(v12) --[[ Line: 55 ]] --[[ Name: removeFromDisplayStack ]]
        -- upvalues: v8 (copy), l_BindableEvent_0 (copy)
        local v13 = nil;
        for v14 = 1, #v8 do
            if v8[v14] == v12 then
                v13 = v14 + 1;
                break;
            end;
        end;
        local l_v12_0 = v12;
        for v16 = v13, #v8 do
            local v17 = v8[v16];
            v17.Position = UDim2.new(v17.Position.X.Scale, v17.Position.X.Offset, v17.Position.Y.Scale, l_v12_0.AbsolutePosition.Y);
            l_v12_0 = v17;
        end;
        l_BindableEvent_0:Fire();
    end;
    addBackToDisplayStack = function(v18) --[[ Line: 75 ]] --[[ Name: addBackToDisplayStack ]]
        -- upvalues: v8 (copy), l_BindableEvent_0 (copy)
        local v19 = 0;
        for v20 = 1, #v8 do
            if v8[v20] == v18 then
                v19 = v20 + 1;
                break;
            end;
        end;
        local l_v18_0 = v18;
        for v22 = v19, #v8 do
            local v23 = v8[v22];
            local v24 = l_v18_0.AbsolutePosition.Y + l_v18_0.AbsoluteSize.Y + 4;
            v23.Position = UDim2.new(v23.Position.X.Scale, v23.Position.X.Offset, v23.Position.Y.Scale, v24);
            l_v18_0 = v23;
        end;
        l_BindableEvent_0:Fire();
    end;
    addToDisplayStack = function(v25) --[[ Line: 96 ]] --[[ Name: addToDisplayStack ]]
        -- upvalues: v8 (copy), v11 (copy), v7 (copy), l_BindableEvent_0 (copy)
        local v26 = nil;
        if #v8 > 0 then
            v26 = v8[#v8];
        end;
        v8[#v8 + 1] = v25;
        local v27 = 0;
        if v26 then
            v27 = v26.AbsolutePosition.Y + v26.AbsoluteSize.Y + 4;
        end;
        v25.Position = UDim2.new(v25.Position.X.Scale, v25.Position.X.Offset, v25.Position.Y.Scale, v27);
        v11();
        v25.Parent = v7.Container;
        v25.Changed:connect(function(v28) --[[ Line: 114 ]]
            -- upvalues: v25 (copy)
            if v28 == "Visible" then
                if not v25.Visible then
                    removeFromDisplayStack(v25);
                    return;
                else
                    addBackToDisplayStack(v25);
                end;
            end;
        end);
        l_BindableEvent_0:Fire();
    end;
    v7.CreateHealthBar = function(_) --[[ Line: 126 ]] --[[ Name: CreateHealthBar ]]
        -- upvalues: v7 (copy), l_Create_0 (ref), v0 (ref), v11 (copy), l_BindableEvent_1 (copy)
        v7.HealthContainer = l_Create_0("Frame")({
            Name = "HealthContainer", 
            Size = UDim2.new(1, -86, 0, 50), 
            Position = UDim2.new(0, 92, 0, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = Color3.new(0, 0, 0), 
            BackgroundTransparency = 0.5
        });
        local v30 = l_Create_0("Frame")({
            Name = "HealthFillHolder", 
            Size = UDim2.new(1, -10, 1, -10), 
            Position = UDim2.new(0, 5, 0, 5), 
            BorderSizePixel = 0, 
            BackgroundColor3 = Color3.new(1, 1, 1), 
            BackgroundTransparency = 1, 
            Parent = v7.HealthContainer
        });
        local v31 = l_Create_0("Frame")({
            Name = "HealthFill", 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 0, 
            BackgroundColor3 = v0, 
            Parent = v30
        });
        local _ = l_Create_0("TextLabel")({
            Name = "HealthText", 
            Size = UDim2.new(0, 98, 0, 50), 
            Position = UDim2.new(0, -100, 0, 0), 
            BackgroundTransparency = 0.5, 
            BackgroundColor3 = Color3.new(0, 0, 0), 
            Font = Enum.Font.SourceSans, 
            FontSize = Enum.FontSize.Size36, 
            Text = "Health", 
            TextColor3 = Color3.new(1, 1, 1), 
            BorderSizePixel = 0, 
            Parent = v7.HealthContainer
        });
        local v33 = l_Create_0("TextLabel")({
            Visible = false
        });
        local v34 = l_Create_0("TextLabel")({
            Visible = false
        });
        addToDisplayStack(v7.HealthContainer);
        v11();
        v7.HealthContainer.Changed:connect(function() --[[ Line: 181 ]]
            -- upvalues: l_BindableEvent_1 (ref)
            l_BindableEvent_1:Fire();
        end);
        return v7.Container, v33, v7.HealthContainer, v31, v34;
    end;
    v7.CreateAccountType = function(_, v36) --[[ Line: 188 ]] --[[ Name: CreateAccountType ]]
        -- upvalues: v7 (copy), l_Create_0 (ref), l_RobloxGui_0 (ref)
        v7.AccountTypeContainer = l_Create_0("Frame")({
            Name = "AccountTypeContainer", 
            Size = UDim2.new(0, 50, 0, 50), 
            Position = UDim2.new(1, -55, 0, 10), 
            BorderSizePixel = 0, 
            BackgroundColor3 = Color3.new(0, 0, 0), 
            BackgroundTransparency = 0.5, 
            Parent = l_RobloxGui_0
        });
        local _ = l_Create_0("TextLabel")({
            Name = "AccountTypeText", 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1, 
            BackgroundColor3 = Color3.new(0, 0, 0), 
            Font = Enum.Font.SourceSans, 
            FontSize = Enum.FontSize.Size36, 
            Text = v36, 
            TextColor3 = Color3.new(1, 1, 1), 
            BorderSizePixel = 0, 
            Parent = v7.AccountTypeContainer, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center
        });
    end;
    v7.SetupTopStat = function(_) --[[ Line: 216 ]] --[[ Name: SetupTopStat ]]
        -- upvalues: l_Create_0 (ref), l_Players_0 (ref)
        local v39 = true;
        local v40 = nil;
        local v41 = nil;
        local v42 = nil;
        local v43 = nil;
        local v44 = nil;
        local function v46() --[[ Line: 224 ]] --[[ Name: makeTenFootInterfaceStat ]]
            -- upvalues: v44 (ref), l_Create_0 (ref)
            if v44 then
                return;
            else
                v44 = l_Create_0("Frame")({
                    Name = "OneStatFrame", 
                    Size = UDim2.new(1, 0, 0, 36), 
                    Position = UDim2.new(0, 0, 0, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                });
                local v45 = l_Create_0("TextLabel")({
                    Name = "StatName", 
                    Size = UDim2.new(0.5, 0, 0, 36), 
                    BackgroundTransparency = 1, 
                    Font = Enum.Font.SourceSans, 
                    FontSize = Enum.FontSize.Size36, 
                    TextStrokeColor3 = Color3.new(0.40784313725490196, 0.40784313725490196, 0.40784313725490196), 
                    TextStrokeTransparency = 0, 
                    Text = " StatName:", 
                    TextColor3 = Color3.new(1, 1, 1), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    BorderSizePixel = 0, 
                    ClipsDescendants = true, 
                    Parent = v44
                }):clone();
                v45.Position = UDim2.new(0.5, 0, 0, 0);
                v45.Name = "StatValue";
                v45.Text = "123,643,231";
                v45.TextXAlignment = Enum.TextXAlignment.Right;
                v45.Parent = v44;
                addToDisplayStack(v44);
                return;
            end;
        end;
        local v47 = nil;
        local function v50(v48) --[[ Line: 261 ]] --[[ Name: setDisplayedStat ]]
            -- upvalues: v41 (ref), v42 (ref), v40 (ref), v46 (copy), v47 (ref)
            if v41 then
                v41:disconnect();
                v41 = nil;
            end;
            if v42 then
                v42:disconnect();
                v42 = nil;
            end;
            v40 = v48;
            if v40 then
                v46();
                v47(v40);
                v42 = v40.AncestryChanged:connect(function() --[[ Line: 276 ]]
                    -- upvalues: v47 (ref), v40 (ref)
                    v47(v40, "Parent");
                end);
                v41 = v40.Changed:connect(function(v49) --[[ Line: 277 ]]
                    -- upvalues: v47 (ref), v40 (ref)
                    v47(v40, v49);
                end);
            end;
        end;
        v47 = function(v51, v52) --[[ Line: 281 ]] --[[ Name: updateTenFootStat ]]
            -- upvalues: v44 (ref), v50 (copy), v39 (ref)
            if v52 and v52 == "Parent" then
                v44.StatName.Text = "";
                v44.StatValue.Text = "";
                v50(nil);
                tenFootInterfaceChanged();
                return;
            elseif v39 then
                v44.StatName.Text = " " .. tostring(v51.Name) .. ":";
                v44.StatValue.Text = tostring(v51.Value);
                return;
            else
                v44.StatName.Text = "";
                v44.StatValue.Text = "";
                return;
            end;
        end;
        local function v54(v53) --[[ Line: 299 ]] --[[ Name: isValidStat ]]
            return v53:IsA("StringValue") or v53:IsA("IntValue") or v53:IsA("BoolValue") or v53:IsA("NumberValue") or v53:IsA("DoubleConstrainedValue") or v53:IsA("IntConstrainedValue");
        end;
        local function _(v55) --[[ Line: 304 ]] --[[ Name: tenFootInterfaceNewStat ]]
            -- upvalues: v40 (ref), v54 (copy), v50 (copy)
            if not v40 and v54(v55) then
                v50(v55);
            end;
        end;
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        while not l_LocalPlayer_0 do
            l_Players_0.PlayerAdded:wait();
            l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        end;
        tenFootInterfaceChanged = function() --[[ Line: 316 ]] --[[ Name: tenFootInterfaceChanged ]]
            -- upvalues: l_LocalPlayer_0 (ref), v40 (ref), v54 (copy), v50 (copy), v43 (ref)
            local l_leaderstats_0 = l_LocalPlayer_0:FindFirstChild("leaderstats");
            if l_leaderstats_0 then
                local l_l_leaderstats_0_Children_0 = l_leaderstats_0:GetChildren();
                for v60 = 1, #l_l_leaderstats_0_Children_0 do
                    local v61 = l_l_leaderstats_0_Children_0[v60];
                    if not v40 and v54(v61) then
                        v50(v61);
                    end;
                end;
                if v43 then
                    v43:disconnect();
                end;
                v43 = l_leaderstats_0.ChildAdded:connect(function(v62) --[[ Line: 324 ]]
                    -- upvalues: v40 (ref), v54 (ref), v50 (ref)
                    if not v40 and v54(v62) then
                        v50(v62);
                    end;
                end);
            end;
        end;
        if l_LocalPlayer_0:FindFirstChild("leaderstats") then
            tenFootInterfaceChanged();
        else
            l_LocalPlayer_0.ChildAdded:connect(tenFootInterfaceChanged);
        end;
        return {
            SetTopStatEnabled = function(_, v64) --[[ Line: 341 ]] --[[ Name: SetTopStatEnabled ]]
                -- upvalues: v39 (ref), v40 (ref), v47 (ref)
                v39 = v64;
                if v40 then
                    v47(v40, "");
                end;
            end
        };
    end;
    return v7;
end;
local v66 = {};
local v67 = v65();
v66.IsEnabled = function(_) --[[ Line: 361 ]] --[[ Name: IsEnabled ]]
    -- upvalues: v6 (copy)
    return v6;
end;
v66.CreateHealthBar = function(_) --[[ Line: 365 ]] --[[ Name: CreateHealthBar ]]
    -- upvalues: v67 (copy)
    return v67:CreateHealthBar();
end;
v66.CreateAccountType = function(_, v71) --[[ Line: 369 ]] --[[ Name: CreateAccountType ]]
    -- upvalues: v67 (copy)
    return v67:CreateAccountType(v71);
end;
v66.SetupTopStat = function(_) --[[ Line: 373 ]] --[[ Name: SetupTopStat ]]
    -- upvalues: v67 (copy)
    return v67:SetupTopStat();
end;
return v66;