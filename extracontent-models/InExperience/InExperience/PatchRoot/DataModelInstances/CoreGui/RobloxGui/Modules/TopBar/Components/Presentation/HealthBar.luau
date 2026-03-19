local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local _ = game:GetService("Workspace");
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_CorePackages_0.Packages.Signals);
local v9 = require(l_CorePackages_0.Workspace.Packages.Display);
local l_Parent_0 = script.Parent.Parent.Parent;
local v11 = require(l_Parent_0.Constants);
local v12 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon);
local v13 = require(l_RobloxGui_0.Modules.TenFootInterface);
local v14 = require(l_Parent_0.Actions.SetKeepOutArea);
local v15 = require(l_Parent_0.Actions.RemoveKeepOutArea);
local _ = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagTopBarSignalizeHealthBar_0 = v12.Flags.FFlagTopBarSignalizeHealthBar;
local l_FFlagTopBarSignalizeKeepOutAreas_0 = v12.Flags.FFlagTopBarSignalizeKeepOutAreas;
local l_FFlagTopBarSignalizeScreenSize_0 = v12.Flags.FFlagTopBarSignalizeScreenSize;
local l_FFlagClampHealthPercentage_0 = v12.Flags.FFlagClampHealthPercentage;
local l_Chrome_0 = l_Parent_0.Parent.Chrome;
local l_Enabled_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled;
local _ = if l_Enabled_0() then require(l_Chrome_0.Service) else nil;
local v24 = l_Enabled_0();
local v25 = UDim2.new(0, 80, 0, 6);
if v24 then
    v25 = UDim2.new(0, 125, 0, 20);
end;
local v26 = UDim2.new(0, 50, 0, 16);
local v27 = UDim2.new(0, 80, 0, 20);
local v28 = UDim2.new(0, 220, 0, 16);
local v29 = v5.PureComponent:extend("HealthBar");
v29.validateProps = v7.strictInterface({
    layoutOrder = v7.optional(v7.integer), 
    screenSize = if l_FFlagTopBarSignalizeScreenSize_0 then nil else v7.Vector2, 
    healthEnabled = if l_FFlagTopBarSignalizeHealthBar_0 then nil else v7.boolean, 
    health = if l_FFlagTopBarSignalizeHealthBar_0 then nil else v7.number, 
    maxHealth = if l_FFlagTopBarSignalizeHealthBar_0 then nil else v7.number, 
    setKeepOutArea = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else v7.callback, 
    removeKeepOutArea = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else v7.callback
});
local function _(v30) --[[ Line: 64 ]] --[[ Name: color3ToVector3 ]]
    return (Vector3.new(v30.r, v30.g, v30.b));
end;
local v32 = {};
local l_HealthRedColor_0 = v11.HealthRedColor;
v32[Vector3.new(l_HealthRedColor_0.r, l_HealthRedColor_0.g, l_HealthRedColor_0.b)] = 0.1;
l_HealthRedColor_0 = v11.HealthYellowColor;
v32[Vector3.new(l_HealthRedColor_0.r, l_HealthRedColor_0.g, l_HealthRedColor_0.b)] = 0.5;
l_HealthRedColor_0 = v11.HealthGreenColor;
v32[Vector3.new(l_HealthRedColor_0.r, l_HealthRedColor_0.g, l_HealthRedColor_0.b)] = 0.8;
local l_HealthRedColor_1 = v11.HealthRedColor;
l_HealthRedColor_0 = v11.HealthGreenColor;
local function v43(v35) --[[ Line: 78 ]] --[[ Name: getHealthBarColor ]]
    -- upvalues: l_HealthRedColor_1 (copy), l_HealthRedColor_0 (copy), v32 (copy)
    if v35 <= 0.1 then
        return l_HealthRedColor_1;
    elseif v35 >= 0.8 then
        return l_HealthRedColor_0;
    else
        local v36 = Vector3.new(0, 0, 0, 0);
        local v37 = 0;
        for v38, v39 in pairs(v32) do
            local v40 = v35 - v39;
            if v40 == 0 then
                return Color3.new(v38.x, v38.y, v38.z);
            else
                local v41 = 1 / (v40 * v40);
                v36 = v36 + v41 * v38;
                v37 = v37 + v41;
            end;
        end;
        local v42 = v36 / v37;
        return Color3.new(v42.x, v42.y, v42.z);
    end;
end;
v29.init = function(v44) --[[ Line: 103 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), l_FFlagTopBarSignalizeHealthBar_0 (copy), v11 (copy), l_FFlagClampHealthPercentage_0 (copy), v12 (copy), v8 (copy), l_StarterGui_0 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (copy), l_FFlagTopBarSignalizeScreenSize_0 (copy), v9 (copy), v13 (copy), v28 (copy), v24 (copy), v26 (copy), v27 (copy), v25 (ref)
    v44.rootRef = v5.createRef();
    if l_FFlagTopBarSignalizeHealthBar_0 then
        local v45, v46 = v5.createBinding(v11.InitialHealth);
        v44.health = v45;
        v44.setHealth = v46;
        v45, v46 = v5.createBinding(v11.InitialHealth);
        v44.maxHealth = v45;
        v44.setMaxHealth = v46;
        v45, v46 = v5.createBinding(false);
        v44.isDead = v45;
        v44.setIsDead = v46;
        v44.healthPercent = v5.joinBindings({
            v44.health, 
            v44.maxHealth, 
            v44.isDead
        }):map(function(v47) --[[ Line: 109 ]]
            -- upvalues: l_FFlagClampHealthPercentage_0 (ref)
            local v48 = v47[1];
            local v49 = v47[2];
            local v50 = v47[3];
            local v51 = 1;
            if v50 then
                return 0;
            else
                if v49 > 0 then
                    if l_FFlagClampHealthPercentage_0 then
                        return (math.clamp(v48 / v49, 0, 1));
                    else
                        v51 = v48 / v49;
                    end;
                end;
                return v51;
            end;
        end);
        v44.healthVisible = v5.joinBindings({
            v44.health, 
            v44.maxHealth
        }):map(function(v52) --[[ Line: 127 ]]
            return v52[1] < v52[2];
        end);
        if v12.Stores.GetLocalHumanoidStore then
            v44.localHumanoidStore = v12.Stores.GetLocalHumanoidStore(false);
            v44.disposeHealthConnection = v8.createEffect(function(v53) --[[ Line: 133 ]]
                -- upvalues: v44 (copy), v11 (ref)
                local v54 = v44.localHumanoidStore.getHealthValue(v53);
                v44.setHealth(v54.health or v11.InitialHealth);
                v44.setMaxHealth(v54.maxHealth or v11.InitialHealth);
                v44.setIsDead(v54.isDead);
            end);
        end;
        v45 = function() --[[ Line: 142 ]] --[[ Name: getHealthEnabled ]]
            -- upvalues: l_StarterGui_0 (ref)
            return l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Health);
        end;
        v44.coreGuiChangedSignalConn = l_StarterGui_0.CoreGuiChangedSignal:Connect(function(v55, v56) --[[ Line: 147 ]]
            -- upvalues: v44 (copy)
            if v55 == Enum.CoreGuiType.Health or v55 == Enum.CoreGuiType.All then
                v44:setState({
                    mountHealthBar = v56
                });
            end;
        end);
        v44:setState({
            mountHealthBar = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Health)
        });
    end;
    if l_FFlagTopBarSignalizeKeepOutAreas_0 then
        v44.keepOutAreasStore = v12.Stores.GetKeepOutAreasStore(false);
    end;
    if l_FFlagTopBarSignalizeScreenSize_0 then
        local l_getViewportSize_0 = v9.GetDisplayStore(false).getViewportSize;
        local v58, v59 = v5.createBinding(l_getViewportSize_0(false));
        v44.screenSizeBinding = v58;
        v44.setScreenSizeBinding = v59;
        v44.disposeScreenSize = v8.createEffect(function(v60) --[[ Line: 167 ]]
            -- upvalues: v44 (copy), l_getViewportSize_0 (copy)
            v44.setScreenSizeBinding(l_getViewportSize_0(v60));
        end);
        v44.healthbarSizeBinding = v44.screenSizeBinding:map(function(v61) --[[ Line: 171 ]]
            -- upvalues: v13 (ref), v28 (ref), v24 (ref), v26 (ref), v27 (ref), v25 (ref)
            if v13:IsEnabled() then
                return v28;
            elseif v24 and v61.X <= 320 then
                return v26;
            elseif v24 and v61.X <= 393 then
                return v27;
            else
                return v25;
            end;
        end);
    end;
end;
v29.onUnmount = function(v62) --[[ Line: 185 ]] --[[ Name: onUnmount ]]
    -- upvalues: l_FFlagTopBarSignalizeHealthBar_0 (copy), l_FFlagTopBarSignalizeScreenSize_0 (copy)
    if l_FFlagTopBarSignalizeHealthBar_0 then
        v62.coreGuiChangedSignalConn:Disconnect();
        v62.disposeHealthConnection();
    end;
    if l_FFlagTopBarSignalizeScreenSize_0 then
        v62.disposeScreenSize();
    end;
end;
v29.renderHealth = function(v63) --[[ Line: 194 ]] --[[ Name: renderHealth ]]
    -- upvalues: l_FFlagTopBarSignalizeHealthBar_0 (copy), l_FFlagClampHealthPercentage_0 (copy), l_FFlagTopBarSignalizeScreenSize_0 (copy), v24 (copy), v26 (copy), v27 (copy), v25 (ref), v13 (copy), v28 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (copy), v11 (copy), v43 (copy), v5 (copy), l_Enabled_0 (copy)
    local v64 = nil;
    if not l_FFlagTopBarSignalizeHealthBar_0 then
        v64 = v63.props.healthEnabled and v63.props.health < v63.props.maxHealth;
    end;
    local v65 = 1;
    if not l_FFlagTopBarSignalizeHealthBar_0 then
        if v63.props.isDead then
            v65 = 0;
        elseif v63.props.maxHealth > 0 then
            v65 = if l_FFlagClampHealthPercentage_0 then math.clamp(v63.props.health / v63.props.maxHealth, 0, 1) else v63.props.health / v63.props.maxHealth;
        end;
    end;
    local v66 = nil;
    if not l_FFlagTopBarSignalizeScreenSize_0 then
        if v24 then
            v66 = if v63.props.screenSize.X <= 320 then v26 else if v63.props.screenSize.X <= 393 then v27 else v25;
            if v13:IsEnabled() then
                v66 = v28;
            end;
        else
            v66 = v25;
            if v13:IsEnabled() then
                v66 = v28;
            end;
        end;
    end;
    local v67 = 4;
    if v13:IsEnabled() then
        v67 = 0;
    end;
    local v68 = nil;
    local v69 = nil;
    local v70 = nil;
    if v24 then
        v68 = "rbxasset://textures/ui/TopBar/HealthBarBaseTV.png";
        v69 = "rbxasset://textures/ui/TopBar/HealthBarTV.png";
        v70 = Rect.new(8, 8, 9, 9);
    else
        v68 = "rbxasset://textures/ui/TopBar/HealthBarBase.png";
        v69 = "rbxasset://textures/ui/TopBar/HealthBar.png";
        v70 = Rect.new(3, 3, 4, 4);
        if v13:IsEnabled() then
            v68 = "rbxasset://textures/ui/TopBar/HealthBarBaseTV.png";
            v69 = "rbxasset://textures/ui/TopBar/HealthBarTV.png";
            v70 = Rect.new(8, 8, 9, 9);
        end;
    end;
    local function v72(v71) --[[ Line: 258 ]]
        -- upvalues: v24 (ref), l_FFlagTopBarSignalizeHealthBar_0 (ref), v63 (copy), v64 (ref), l_FFlagTopBarSignalizeKeepOutAreas_0 (ref), v11 (ref)
        if not v24 then
            if (l_FFlagTopBarSignalizeHealthBar_0 and v63.healthVisible or not l_FFlagTopBarSignalizeHealthBar_0 and v64) and v71 then
                if l_FFlagTopBarSignalizeKeepOutAreas_0 then
                    v63.keepOutAreasStore.setKeepOutArea(v11.HealthBarKeepOutAreaId, v71.AbsolutePosition, v71.AbsoluteSize);
                    return;
                else
                    v63.props.setKeepOutArea(v11.HealthBarKeepOutAreaId, v71.AbsolutePosition, v71.AbsoluteSize);
                    return;
                end;
            elseif l_FFlagTopBarSignalizeKeepOutAreas_0 then
                v63.keepOutAreasStore.removeKeepOutArea(v11.HealthBarKeepOutAreaId);
                return;
            else
                v63.props.removeKeepOutArea(v11.HealthBarKeepOutAreaId);
            end;
        end;
    end;
    if v63.rootRef.current then
        v72(v63.rootRef.current);
    end;
    local v73 = if l_FFlagTopBarSignalizeHealthBar_0 then v63.healthPercent:map(v43) else v43(v65);
    return v5.createElement("Frame", {
        AnchorPoint = if v24 then Vector2.new(1, 0) else nil, 
        Position = if v24 then UDim2.new(1, 0, 0, 0) else nil, 
        Visible = if l_FFlagTopBarSignalizeHealthBar_0 then v63.healthVisible else v64, 
        BackgroundTransparency = 1, 
        Size = if l_FFlagTopBarSignalizeScreenSize_0 then v63.healthbarSizeBinding:map(function(v74) --[[ Line: 286 ]]
            return UDim2.new(v74.X, UDim.new(1, 0));
        end) else UDim2.new(v66.X, UDim.new(1, 0)), 
        LayoutOrder = v63.props.layoutOrder, 
        [v5.Change.AbsoluteSize] = v72, 
        [v5.Change.AbsolutePosition] = v72, 
        [v5.Ref] = v63.rootRef
    }, {
        Padding = not l_Enabled_0 and v5.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v67)
        }) or nil, 
        HealthBar = v5.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Image = v68, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v70, 
            Size = if l_FFlagTopBarSignalizeScreenSize_0 then v63.healthbarSizeBinding else v66, 
            Position = UDim2.fromScale(0, 0.5), 
            AnchorPoint = Vector2.new(0, 0.5)
        }, {
            Fill = v5.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Image = v69, 
                ImageColor3 = v73, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v70, 
                Size = if l_FFlagTopBarSignalizeHealthBar_0 then v63.healthPercent:map(function(v75) --[[ Line: 314 ]]
                    return UDim2.fromScale(v75, 1);
                end) else UDim2.fromScale(v65, 1)
            })
        })
    });
end;
v29.render = function(v76) --[[ Line: 322 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagTopBarSignalizeHealthBar_0 (copy)
    if l_FFlagTopBarSignalizeHealthBar_0 then
        if v76.state.mountHealthBar then
            return (v76:renderHealth());
        else
            return nil;
        end;
    else
        return v76:renderHealth();
    end;
end;
local function v78(v77) --[[ Line: 330 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_FFlagTopBarSignalizeScreenSize_0 (copy), l_FFlagTopBarSignalizeHealthBar_0 (copy)
    return {
        screenSize = if l_FFlagTopBarSignalizeScreenSize_0 then nil else v77.displayOptions.screenSize, 
        health = if l_FFlagTopBarSignalizeHealthBar_0 then nil else v77.health.currentHealth, 
        maxHealth = if l_FFlagTopBarSignalizeHealthBar_0 then nil else v77.health.maxHealth, 
        healthEnabled = if l_FFlagTopBarSignalizeHealthBar_0 then nil else v77.coreGuiEnabled[Enum.CoreGuiType.Health]
    };
end;
local function v84(v79) --[[ Line: 339 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: l_FFlagTopBarSignalizeKeepOutAreas_0 (copy), v14 (copy), v15 (copy)
    if l_FFlagTopBarSignalizeKeepOutAreas_0 then
        return {};
    else
        return {
            setKeepOutArea = function(v80, v81, v82) --[[ Line: 344 ]] --[[ Name: setKeepOutArea ]]
                -- upvalues: v79 (copy), v14 (ref)
                return v79(v14(v80, v81, v82));
            end, 
            removeKeepOutArea = function(v83) --[[ Line: 347 ]] --[[ Name: removeKeepOutArea ]]
                -- upvalues: v79 (copy), v15 (ref)
                return v79(v15(v83));
            end
        };
    end;
end;
return v6.UNSTABLE_connect2(v78, if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else v84)(v29);