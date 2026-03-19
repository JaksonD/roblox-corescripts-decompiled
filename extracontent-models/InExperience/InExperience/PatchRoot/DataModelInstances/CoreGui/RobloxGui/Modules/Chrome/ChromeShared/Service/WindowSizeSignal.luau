local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local v3 = require(l_script_FirstAncestor_0.Service.ViewportUtil);
local v4 = require(l_script_FirstAncestor_0.Unibar.Constants);
local l_FFlagChromeWindowSignalConstraintsToggle_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagChromeWindowSignalConstraintsToggle;
local function v14(v6, v7, v8) --[[ Line: 14 ]] --[[ Name: getConstrainedWindowSize ]]
    -- upvalues: v3 (copy), l_FFlagChromeWindowSignalConstraintsToggle_0 (copy), v4 (copy)
    local v9 = v3.mobileDevice:get();
    local v10 = v3.screenSize:get();
    local v11 = v10.Y > v10.X;
    local l_v6_0 = v6;
    local l_v7_0 = v7;
    if v9 and (not l_FFlagChromeWindowSignalConstraintsToggle_0 or not v8) then
        if v11 then
            l_v7_0 = math.min(v7, v4.MAX_HEIGHT_PORTRAIT);
            l_v6_0 = math.min(v6, v4.MAX_WIDTH_PORTRAIT);
        elseif not v11 then
            l_v7_0 = math.min(v7, v4.MAX_HEIGHT_LANDSCAPE);
            l_v6_0 = math.min(v6, v4.MAX_WIDTH_LANDSCAPE);
        end;
    end;
    return UDim2.new(0, l_v6_0, 0, l_v7_0);
end;
local v15 = {};
v15.__index = v15;
v15.new = function(v16, v17, v18, v19) --[[ Line: 49 ]] --[[ Name: new ]]
    -- upvalues: l_FFlagChromeWindowSignalConstraintsToggle_0 (copy), v14 (copy), v4 (copy), l_Signal_0 (copy), v15 (copy)
    return (setmetatable({
        _state = if l_FFlagChromeWindowSignalConstraintsToggle_0 then v14(v16 or v4.DEFAULT_WIDTH, v17 or v4.DEFAULT_HEIGHT, v19 or false) else v14(v16 or v4.DEFAULT_WIDTH, v17 or v4.DEFAULT_HEIGHT), 
        _isLarge = v18 or false, 
        _ignoreConstraints = if l_FFlagChromeWindowSignalConstraintsToggle_0 then v19 or false else nil, 
        _changeSignal = l_Signal_0.new()
    }, v15));
end;
v15.connect = function(v20, v21) --[[ Line: 73 ]] --[[ Name: connect ]]
    return v20._changeSignal:connect(v21);
end;
v15.requestSize = function(v22, v23, v24) --[[ Line: 78 ]] --[[ Name: requestSize ]]
    -- upvalues: l_FFlagChromeWindowSignalConstraintsToggle_0 (copy), v14 (copy)
    local v25 = if l_FFlagChromeWindowSignalConstraintsToggle_0 then v14(v23, v24, v22._ignoreConstraints) else v14(v23, v24);
    if v22._state ~= v25 then
        v22._state = v25;
        v22._changeSignal:fire(v25);
    end;
end;
v15.toggleIsLarge = function(v26) --[[ Line: 89 ]] --[[ Name: toggleIsLarge ]]
    local v27 = not v26._isLarge;
    v26._isLarge = v27;
    v26._changeSignal:fire(v27);
end;
v15.get = function(v28) --[[ Line: 95 ]] --[[ Name: get ]]
    return v28._state;
end;
v15.getIsLarge = function(v29) --[[ Line: 99 ]] --[[ Name: getIsLarge ]]
    return v29._isLarge;
end;
v15.updateConstraints = function(v30) --[[ Line: 104 ]] --[[ Name: updateConstraints ]]
    v30:requestSize(v30._state.Width.Offset, v30._state.Height.Offset);
end;
return v15;