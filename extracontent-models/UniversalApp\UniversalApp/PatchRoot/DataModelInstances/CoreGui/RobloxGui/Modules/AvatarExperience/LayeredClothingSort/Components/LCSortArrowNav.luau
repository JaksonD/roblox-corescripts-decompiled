local l_RunService_0 = game:GetService("RunService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v7.Style.withStyle;
local l_Images_0 = v7.App.ImageSet.Images;
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
local v11 = require(l_Modules_0.AvatarExperience.AvatarRefinement.Constants);
local v12 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetOrder);
local v13 = require(l_Modules_0.AvatarExperience.Common.Actions.SetOrderForTryOns);
local v14 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetCurrentSort);
local v15 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.LayeredClothingSortUtils);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v17 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Services.Analytics);
local v18 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Thunks.SendRefinementAnalytics);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v20 = l_Images_0["icons/navigation/cycleUp"];
local v21 = l_Images_0["icons/navigation/cycleDown"];
local v22 = v4.PureComponent:extend("LCSortArrowNav");
v22.validateProps = v6.strictInterface({
    Visible = v6.union(v6.boolean, v6.table), 
    index = v6.number, 
    asset = v6.table, 
    currentSort = v6.table, 
    equippedAssets = v6.table, 
    tryOnItems = v6.table, 
    lookType = v6.optional(v6.string), 
    setOrder = v6.callback, 
    setOrderForTryOns = v6.callback, 
    setCurrentSort = v6.callback, 
    sendAnalytics = v6.callback, 
    analytics = v6.table
});
v22.moveTile = function(v23, v24) --[[ Line: 68 ]] --[[ Name: moveTile ]]
    -- upvalues: v15 (copy)
    local v25 = {};
    for v26, v27 in v23.props.currentSort do
        if v26 ~= v23.props.index then
            table.insert(v25, v27);
        end;
    end;
    local v28 = {
        id = v23.props.asset.id, 
        typeId = v23.props.asset.typeId
    };
    table.insert(v25, v23.props.index + v24, v28);
    local v29, v30 = v15.formatForSetOrderWithTryOns(v25, v23.props.equippedAssets, v23.props.tryOnItems, v23.props.lookType);
    v23.props.setOrder(v29);
    v23.props.setOrderForTryOns(v30);
    v23.props.setCurrentSort(v25);
    v23.props.sendAnalytics(v23.props.analytics.avatarRefineAutosaved);
end;
v22.init = function(v31) --[[ Line: 99 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy)
    v31.animLoopConn = nil;
    v31.animOutConn = nil;
    v31.animInConn = nil;
    v31.animating = false;
    local v32, v33 = v4.createBinding(UDim2.fromOffset(0, 4));
    v31.upArrowPos = v32;
    v31.updateUpArrowPos = v33;
    v32, v33 = v4.createBinding(UDim2.fromScale(0, 0));
    v31.downArrowPos = v32;
    v31.updateDownArrowPos = v33;
    v31.onUpActivated = function() --[[ Line: 107 ]]
        -- upvalues: v31 (copy)
        v31:moveTile(-1);
    end;
    v31.onDownActivated = function() --[[ Line: 111 ]]
        -- upvalues: v31 (copy)
        v31:moveTile(1);
    end;
end;
v22.animateOut = function(v34) --[[ Line: 122 ]] --[[ Name: animateOut ]]
    -- upvalues: l_RunService_0 (copy)
    local v35 = 4;
    local v36 = 0;
    v34.animOutConn = l_RunService_0.RenderStepped:connect(function(v37) --[[ Line: 125 ]]
        -- upvalues: v35 (ref), v36 (ref), v34 (copy)
        v35 = v35 - v37 * 14;
        v36 = v36 + v37 * 14;
        local v38 = math.max(v35, 0);
        local v39 = math.min(v36, 4);
        v34.updateUpArrowPos(UDim2.new(0, 0, 0, v38));
        v34.updateDownArrowPos(UDim2.new(0, 0, 0, v39));
        if v38 == 0 then
            v34.animOutConn:Disconnect();
            v34.animOutConn = nil;
            v34:animateIn();
        end;
    end);
end;
v22.animateIn = function(v40) --[[ Line: 148 ]] --[[ Name: animateIn ]]
    -- upvalues: l_RunService_0 (copy)
    local v41 = 0;
    local v42 = 4;
    v40.animInConn = l_RunService_0.RenderStepped:connect(function(v43) --[[ Line: 151 ]]
        -- upvalues: v41 (ref), v42 (ref), v40 (copy)
        v41 = v41 + v43 * 14;
        v42 = v42 - v43 * 14;
        local v44 = math.min(v41, 4);
        local v45 = math.max(v42, 0);
        v40.updateUpArrowPos(UDim2.new(0, 0, 0, v44));
        v40.updateDownArrowPos(UDim2.new(0, 0, 0, v45));
        if v44 == 4 then
            v40.animInConn:Disconnect();
            v40.animInConn = nil;
            v40.timeOfLastAnimation = tick();
            v40.animating = false;
        end;
    end);
end;
v22.render = function(v46) --[[ Line: 168 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v4 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v11 (copy), l_ImageSetLabel_0 (copy), v20 (copy), v21 (copy)
    return l_withStyle_0(function(v47) --[[ Line: 169 ]]
        -- upvalues: v46 (copy), v4 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v11 (ref), l_ImageSetLabel_0 (ref), v20 (ref), v21 (ref)
        local l_Theme_0 = v47.Theme;
        local v49 = v46.props.Visible and v46.props.index ~= 1;
        local v50 = v46.props.Visible and v46.props.index ~= #v46.props.currentSort;
        return v4.createFragment({
            UpArrowButton = v4.createElement("TextButton", {
                Text = "", 
                BackgroundTransparency = 1, 
                Visible = v49, 
                Selectable = not l_FFlagAXMigrateAXToGlobalAutofocus_0 and nil, 
                Size = UDim2.fromOffset(v11.Tile.ArrowSize.X.Offset, v11.Tile.ArrowSize.Y.Offset + 4), 
                AnchorPoint = Vector2.new(0.5, 1), 
                Position = UDim2.fromScale(0.5, 0), 
                [v4.Event.Activated] = v46.onUpActivated
            }, {
                UpArrowIcon = v4.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Size = v11.Tile.ArrowSize, 
                    Position = v46.upArrowPos, 
                    Image = v20, 
                    ImageColor3 = l_Theme_0.IconEmphasis.Color
                })
            }), 
            DownArrowButton = v4.createElement("TextButton", {
                Text = "", 
                BackgroundTransparency = 1, 
                Visible = v50, 
                Selectable = not l_FFlagAXMigrateAXToGlobalAutofocus_0 and nil, 
                Size = UDim2.fromOffset(v11.Tile.ArrowSize.X.Offset, v11.Tile.ArrowSize.Y.Offset + 4), 
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.new(0.5, 0, 0, v11.Tile.SelectedSize), 
                [v4.Event.Activated] = v46.onDownActivated
            }, {
                DownArrowIcon = v4.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Size = v11.Tile.ArrowSize, 
                    Position = v46.downArrowPos, 
                    Image = v21, 
                    ImageColor3 = l_Theme_0.IconEmphasis.Color
                })
            })
        });
    end);
end;
v22.didMount = function(v51) --[[ Line: 222 ]] --[[ Name: didMount ]]
    -- upvalues: l_RunService_0 (copy)
    v51.timeOfLastAnimation = tick();
    v51.animLoopConn = l_RunService_0.RenderStepped:connect(function(_) --[[ Line: 228 ]]
        -- upvalues: v51 (copy)
        if tick() - v51.timeOfLastAnimation >= 1 and not v51.animating then
            v51.animating = true;
            v51:animateOut();
        end;
    end);
end;
v22.willUnmount = function(v53) --[[ Line: 237 ]] --[[ Name: willUnmount ]]
    if v53.animLoopConn then
        v53.animLoopConn:Disconnect();
        v53.animLoopConn = nil;
    end;
    if v53.animOutConn then
        v53.animOutConn:Disconnect();
        v53.animOutConn = nil;
    end;
    if v53.animInConn then
        v53.animInConn:Disconnect();
        v53.animInConn = nil;
    end;
end;
local function v66(v54, _) --[[ Line: 254 ]] --[[ Name: mapStateToProps ]]
    local function _() --[[ Line: 255 ]]
        -- upvalues: v54 (copy)
        local v56 = nil;
        local l_Looks_0 = v54.AvatarExperience.AvatarScene.Looks;
        local l_LookId_0 = v54.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
        if l_LookId_0 ~= nil and l_Looks_0 ~= nil then
            local v59 = l_Looks_0[l_LookId_0];
            if v59 then
                v56 = v59.lookType;
            end;
        end;
        return v56;
    end;
    local v61 = {
        currentSort = v54.AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList, 
        equippedAssets = v54.AvatarExperience.AvatarEditor.Character.EquippedAssets, 
        tryOnItems = v54.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
    };
    local v62 = nil;
    local l_Looks_1 = v54.AvatarExperience.AvatarScene.Looks;
    local l_LookId_1 = v54.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
    if l_LookId_1 ~= nil and l_Looks_1 ~= nil then
        local v65 = l_Looks_1[l_LookId_1];
        if v65 then
            v62 = v65.lookType;
        end;
    end;
    v61.lookType = v62;
    return v61;
end;
local function v72(v67) --[[ Line: 276 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v12 (copy), v13 (copy), v14 (copy), v18 (copy)
    return {
        setOrder = function(v68) --[[ Line: 278 ]] --[[ Name: setOrder ]]
            -- upvalues: v67 (copy), v12 (ref)
            v67(v12(v68));
        end, 
        setOrderForTryOns = function(v69) --[[ Line: 281 ]] --[[ Name: setOrderForTryOns ]]
            -- upvalues: v67 (copy), v13 (ref)
            v67(v13(v69));
        end, 
        setCurrentSort = function(v70) --[[ Line: 284 ]] --[[ Name: setCurrentSort ]]
            -- upvalues: v67 (copy), v14 (ref)
            v67(v14(v70));
        end, 
        sendAnalytics = function(v71) --[[ Line: 287 ]] --[[ Name: sendAnalytics ]]
            -- upvalues: v67 (copy), v18 (ref)
            v67(v18(v71));
        end
    };
end;
v22 = l_RoactServices_0.connect({
    analytics = v17
})(v22);
return (v5.connect(v66, v72)(v22));