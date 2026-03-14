local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_SpringAnimatedItem_0 = require(l_CorePackages_0.Packages.UIBlox).Utility.SpringAnimatedItem;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_ScrollingPickerDirection_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Enums.ScrollingPickerDirection;
local v7 = require(l_Modules_0.LuaApp.Components.Authentication.SignUpCharacter);
local l_ScrollingPicker_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Components.ScrollingPicker;
local v9 = Color3.fromRGB(255, 255, 255);
local v10 = Color3.fromRGB(150, 150, 150);
local v11 = v2.PureComponent:extend("CharacterSelector");
v11.defaultProps = {
    bundleIds = {}
};
v11.init = function(v12) --[[ Line: 31 ]] --[[ Name: init ]]
    -- upvalues: l_FormFactor_0 (copy), v10 (copy), v9 (copy), v2 (copy), l_SpringAnimatedItem_0 (copy), v7 (copy)
    local l_bundleIds_0 = v12.props.bundleIds;
    local l_selectedBundleId_0 = v12.props.selectedBundleId;
    local l_onSelectedCharacterChanged_0 = v12.props.onSelectedCharacterChanged;
    local v16 = (#l_bundleIds_0 + 1) / 2;
    local v17 = nil;
    for v18, v19 in pairs(l_bundleIds_0) do
        if v19 == l_selectedBundleId_0 then
            v16 = v18;
            v17 = l_selectedBundleId_0;
            if l_onSelectedCharacterChanged_0 then
                l_onSelectedCharacterChanged_0(v17);
                break;
            else
                break;
            end;
        end;
    end;
    v12.state = {
        currentIndex = v16, 
        currentBundleId = v17, 
        entryWidth = 100, 
        containerAbsoluteSize = Vector2.new(100, 100)
    };
    v12.isMounted = false;
    v12.calculateEntryWidth = function(v20, v21) --[[ Line: 62 ]]
        -- upvalues: v12 (copy), l_FormFactor_0 (ref)
        local l_formFactor_0 = v12.props.formFactor;
        v21 = math.max(1, v21);
        local _ = nil;
        if l_formFactor_0 == l_FormFactor_0.COMPACT then
            return v20 / v21 * 1;
        else
            return v20 / v21 * 0.8;
        end;
    end;
    v12.updateEntryWidth = function() --[[ Line: 76 ]]
        -- upvalues: v12 (copy)
        local l_X_0 = v12.state.containerAbsoluteSize.X;
        local v25 = #v12.props.bundleIds;
        local v26 = v12.calculateEntryWidth(l_X_0, v25);
        spawn(function() --[[ Line: 81 ]]
            -- upvalues: v12 (ref), v26 (copy)
            if v12.isMounted then
                v12:setState({
                    entryWidth = v26
                });
            end;
        end);
    end;
    v12.onContainerAbsoluteSizeChange = function(v27) --[[ Line: 90 ]]
        -- upvalues: v12 (copy)
        local l_X_1 = v27.AbsoluteSize.X;
        local v29 = #v12.props.bundleIds;
        local v30 = v12.calculateEntryWidth(l_X_1, v29);
        spawn(function() --[[ Line: 96 ]]
            -- upvalues: v12 (ref), v30 (copy), v27 (copy)
            if v12.isMounted then
                v12:setState({
                    entryWidth = v30, 
                    containerAbsoluteSize = v27.AbsoluteSize
                });
            end;
        end);
    end;
    v12.onSelectedIndexChanged = function(v31, v32) --[[ Line: 106 ]]
        -- upvalues: v12 (copy)
        local l_bundleIds_1 = v12.props.bundleIds;
        local l_onSelectedCharacterChanged_1 = v12.props.onSelectedCharacterChanged;
        local l_currentBundleId_0 = v12.state.currentBundleId;
        local v36 = l_bundleIds_1[v31];
        if l_currentBundleId_0 ~= v36 and v32 then
            spawn(function() --[[ Line: 113 ]]
                -- upvalues: v12 (ref), l_onSelectedCharacterChanged_1 (copy), v36 (copy), v31 (copy)
                if v12.isMounted then
                    if l_onSelectedCharacterChanged_1 then
                        l_onSelectedCharacterChanged_1(v36);
                    end;
                    v12:setState({
                        currentIndex = v31, 
                        currentBundleId = v36
                    });
                end;
            end);
        end;
    end;
    v12.renderCharacter = function(v37) --[[ Line: 128 ]]
        -- upvalues: v12 (copy), v10 (ref), v9 (ref), v2 (ref), l_SpringAnimatedItem_0 (ref), v7 (ref)
        local l_entryWidth_0 = v12.state.entryWidth;
        local l_Y_0 = v12.state.containerAbsoluteSize.Y;
        local l_currentBundleId_1 = v12.state.currentBundleId;
        local v41 = v37 == l_currentBundleId_1;
        if l_entryWidth_0 * 4 < l_Y_0 then
            l_Y_0 = l_entryWidth_0 * 3.5;
        end;
        local v42 = l_Y_0 * 0.8;
        local v43 = l_currentBundleId_1 and v10 or v9;
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            AvatarPlaceholder = v2.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
                regularProps = {
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    [v2.Children] = {
                        AspectRatioConstraint = v2.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1, 
                            AspectType = Enum.AspectType.FitWithinMaxSize
                        }), 
                        Character = v2.createElement(v7, {
                            bundleId = v37, 
                            characterColor = v41 and v9 or v43
                        })
                    }
                }, 
                animatedValues = {
                    sizeOffset = v41 and l_Y_0 or v42
                }, 
                mapValuesToProps = function(v44) --[[ Line: 170 ]] --[[ Name: mapValuesToProps ]]
                    return {
                        Size = UDim2.new(0, v44.sizeOffset, 0, v44.sizeOffset)
                    };
                end, 
                springOptions = {
                    frequency = 3
                }
            })
        });
    end;
end;
v11.didMount = function(v45) --[[ Line: 183 ]] --[[ Name: didMount ]]
    v45.isMounted = true;
end;
v11.willUnmount = function(v46) --[[ Line: 187 ]] --[[ Name: willUnmount ]]
    v46.isMounted = false;
end;
v11.render = function(v47) --[[ Line: 191 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_ScrollingPicker_0 (copy), l_ScrollingPickerDirection_0 (copy)
    local l_bundleIds_2 = v47.props.bundleIds;
    local l_entryWidth_1 = v47.state.entryWidth;
    local l_currentIndex_0 = v47.state.currentIndex;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        [v2.Change.AbsoluteSize] = v47.onContainerAbsoluteSizeChange
    }, {
        Wheel = v2.createElement(l_ScrollingPicker_0, {
            size = UDim2.new(1, 0, 1, 0), 
            renderEntry = v47.renderCharacter, 
            entries = l_bundleIds_2, 
            entrySizeOnScrollingAxis = l_entryWidth_1, 
            onSelectedIndexChanged = v47.onSelectedIndexChanged, 
            scrollDirection = l_ScrollingPickerDirection_0.Horizontal, 
            clipsDescendants = false, 
            parentSpecifiedTarget = l_currentIndex_0, 
            getEntryWrapperProps = function(v51) --[[ Line: 211 ]] --[[ Name: getEntryWrapperProps ]]
                -- upvalues: v47 (copy)
                return {
                    ZIndex = v51 == v47.state.currentBundleId and 2 or 1
                };
            end
        })
    });
end;
v11.didUpdate = function(v52, v53) --[[ Line: 221 ]] --[[ Name: didUpdate ]]
    if #v53.bundleIds ~= #v52.props.bundleIds then
        v52.updateEntryWidth();
    end;
end;
return (v3.connect(function(v54, _) --[[ Line: 230 ]]
    return {
        formFactor = v54.FormFactor, 
        selectedBundleId = v54.SignUpInfo.SignUpSelectedBundleId
    };
end)(v11));