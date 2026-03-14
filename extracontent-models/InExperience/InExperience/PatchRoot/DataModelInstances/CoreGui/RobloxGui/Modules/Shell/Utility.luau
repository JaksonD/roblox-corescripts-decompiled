local l_RunService_0 = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local l_TextService_0 = game:GetService("TextService");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("CoreGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v6 = nil;
pcall(function() --[[ Line: 10 ]]
    -- upvalues: v6 (ref)
    v6 = game:GetService("PlatformService");
end);
local v9 = {
    IsFinite = function(v7) --[[ Line: 15 ]] --[[ Name: IsFinite ]]
        local v8 = false;
        if v7 == v7 then
            v8 = false;
            if v7 ~= 1e999 then
                v8 = v7 ~= -1e999;
            end;
        end;
        return v8;
    end
};
v9.FindAncestorOfType = function(v10, v11) --[[ Line: 19 ]] --[[ Name: FindAncestorOfType ]]
    -- upvalues: v9 (copy)
    local v12 = v10 and v10.Parent;
    if v12 then
        if v12:IsA(v11) then
            return v12;
        else
            return v9.FindAncestorOfType(v12, v11);
        end;
    else
        return nil;
    end;
end;
v9.CalculateRelativeDimensions = function(v13, v14, v15, _) --[[ Line: 31 ]] --[[ Name: CalculateRelativeDimensions ]]
    -- upvalues: l_GuiService_0 (copy), v9 (copy)
    local l_l_GuiService_0_ScreenResolution_0 = l_GuiService_0:GetScreenResolution();
    local v18 = v9.FindAncestorOfType(v13, "SurfaceGui");
    if v18 then
        l_l_GuiService_0_ScreenResolution_0 = v18.CanvasSize;
    end;
    local v19 = v14 / v15;
    if v15.y > 0 and l_l_GuiService_0_ScreenResolution_0.y > 0 then
        v19 = v19 * (v15.x / v15.y / (l_l_GuiService_0_ScreenResolution_0.x / l_l_GuiService_0_ScreenResolution_0.y));
        local l_Parent_0 = v13.Parent;
        if l_Parent_0 then
            local v21 = 1 / (l_Parent_0.AbsoluteSize / l_l_GuiService_0_ScreenResolution_0);
            if v9.IsFinite(v21.x) and v9.IsFinite(v21.y) then
                return UDim2.new(v21.x * v19.x, 0, v21.y * v19.y, 0);
            end;
        end;
    end;
    return UDim2.new(v19.x, 0, v19.y, 0);
end;
v9.Enum = {
    Anchor = {
        TopLeft = 1, 
        TopMiddle = 2, 
        TopRight = 3, 
        CenterLeft = 4, 
        Center = 5, 
        CenterRight = 6, 
        BottomLeft = 7, 
        BottomMiddle = 8, 
        BottomRight = 9
    }
};
v9.CalculateFit = function(v22, v23) --[[ Line: 76 ]] --[[ Name: CalculateFit ]]
    local v24 = v22.AbsoluteSize / v23;
    local v25 = v23 * math.min(v24.X, v24.Y);
    return UDim2.new(0, v25.X, 0, v25.Y);
end;
v9.CalculateFill = function(v26, v27) --[[ Line: 84 ]] --[[ Name: CalculateFill ]]
    local v28 = v26.AbsoluteSize / v27;
    local v29 = v27 * math.max(v28.X, v28.Y);
    return UDim2.new(0, v29.X, 0, v29.Y);
end;
local v30 = {};
local function _(v31, v32) --[[ Line: 95 ]] --[[ Name: getActiveTween ]]
    -- upvalues: v30 (copy)
    return v30[v31] and v30[v31][v32];
end;
local function _(v34, v35, v36) --[[ Line: 99 ]] --[[ Name: setActiveTween ]]
    -- upvalues: v30 (copy)
    if not v30[v34] then
        v30[v34] = {};
    end;
    v30[v34][v35] = v36;
end;
v9.Linear = function(v38, v39, v40, v41) --[[ Line: 106 ]] --[[ Name: Linear ]]
    if v41 <= v38 then
        return v39 + v40;
    else
        return v40 * v38 / v41 + v39;
    end;
end;
v9.EaseOutQuad = function(v42, v43, v44, v45) --[[ Line: 112 ]] --[[ Name: EaseOutQuad ]]
    if v45 <= v42 then
        return v43 + v44;
    else
        v42 = v42 / v45;
        return -v44 * v42 * (v42 - 2) + v43;
    end;
end;
v9.EaseInOutQuad = function(v46, v47, v48, v49) --[[ Line: 119 ]] --[[ Name: EaseInOutQuad ]]
    if v49 <= v46 then
        return v47 + v48;
    else
        v46 = v46 / (v49 / 2);
        if v46 < 1 then
            return v48 / 2 * v46 * v46 + v47;
        else
            v46 = v46 - 1;
            return -v48 / 2 * (v46 * (v46 - 2) - 1) + v47;
        end;
    end;
end;
v9.SCurveUDim2 = function(v50, v51, v52, v53) --[[ Line: 128 ]] --[[ Name: SCurveUDim2 ]]
    if v53 <= v50 then
        return v51 + v52;
    else
        v50 = v50 / v53;
        if v50 < 0 then
            v50 = 0;
        end;
        if v50 > 1 then
            v50 = 1;
        end;
        local v54 = 3 * v50 * v50 - 2 * v50 * v50 * v50;
        return UDim2.new(v54 * v52.X.Scale, v54 * v52.X.Offset, v54 * v52.Y.Scale, v54 * v52.Y.Offset) + v51;
    end;
end;
v9.SCurveVector2 = function(v55, v56, v57, v58) --[[ Line: 141 ]] --[[ Name: SCurveVector2 ]]
    if v58 <= v55 then
        return v56 + v57;
    else
        v55 = v55 / v58;
        if v55 < 0 then
            v55 = 0;
        end;
        if v55 > 1 then
            v55 = 1;
        end;
        local v59 = 3 * v55 * v55 - 2 * v55 * v55 * v55;
        return Vector2.new(v59 * v57.X, v59 * v57.Y) + v56;
    end;
end;
v9.PropertyTweener = function(v60, v61, v62, v63, v64, v65, v66, v67) --[[ Line: 152 ]] --[[ Name: PropertyTweener ]]
    -- upvalues: v9 (copy), v30 (copy), l_RunService_0 (copy)
    v65 = v65 or v9.Linear;
    v66 = v66 or false;
    local v68 = {
        StartTime = tick()
    };
    v68.EndTime = v68.StartTime + v64;
    v68.Cancelled = false;
    local v69 = false;
    local v70 = 0;
    local function _(v71) --[[ Line: 165 ]] --[[ Name: setValue ]]
        -- upvalues: v60 (copy), v61 (copy)
        if v60 then
            v60[v61] = v71;
        end;
    end;
    local function v76() --[[ Line: 171 ]] --[[ Name: finalize ]]
        -- upvalues: v65 (ref), v62 (copy), v63 (copy), v60 (copy), v61 (copy), v69 (ref), v70 (ref), v30 (ref), v68 (copy), v67 (copy)
        local v73 = v65(1, v62, v63 - v62, 1);
        if v60 then
            v60[v61] = v73;
        end;
        v69 = true;
        v70 = 1;
        local l_v61_0 = v61;
        local l_v60_0 = v60;
        if (v30[l_v61_0] and v30[l_v61_0][l_v60_0]) == v68 then
            v73 = v61;
            l_v61_0 = v60;
            if not v30[v73] then
                v30[v73] = {};
            end;
            v30[v73][l_v61_0] = nil;
        end;
        if v67 then
            v67();
        end;
    end;
    if v66 or not (v30[v61] and v30[v61][v60]) then
        if v30[v61] and v30[v61][v60] then
            (v30[v61] and v30[v61][v60]):Cancel();
        end;
        if not v30[v61] then
            v30[v61] = {};
        end;
        v30[v61][v60] = v68;
        local v77 = v65(0, v62, v63 - v62, v64);
        if v60 then
            v60[v61] = v77;
        end;
        spawn(function() --[[ Line: 193 ]]
            -- upvalues: v68 (copy), v60 (copy), v65 (ref), v62 (copy), v63 (copy), v64 (copy), v61 (copy), v70 (ref), v9 (ref), l_RunService_0 (ref), v76 (copy), v30 (ref)
            local v78 = tick();
            while v78 < v68.EndTime and v60 and not v68.Cancelled do
                local v79 = v65(v78 - v68.StartTime, v62, v63 - v62, v64);
                if v60 then
                    v60[v61] = v79;
                end;
                v70 = v9.Clamp(0, 1, (v78 - v68.StartTime) / v64);
                l_RunService_0.RenderStepped:wait();
                v78 = tick();
            end;
            if v68.Cancelled == false and v60 then
                v76();
            end;
            local l_v61_1 = v61;
            local l_v60_1 = v60;
            if (v30[l_v61_1] and v30[l_v61_1][l_v60_1]) == v68 then
                local l_v61_2 = v61;
                l_v61_1 = v60;
                if not v30[l_v61_2] then
                    v30[l_v61_2] = {};
                end;
                v30[l_v61_2][l_v61_1] = nil;
            end;
        end);
    else
        v69 = true;
    end;
    v68.GetFinal = function(_) --[[ Line: 213 ]] --[[ Name: GetFinal ]]
        -- upvalues: v63 (copy)
        return v63;
    end;
    v68.GetPercentComplete = function(_) --[[ Line: 217 ]] --[[ Name: GetPercentComplete ]]
        -- upvalues: v70 (ref)
        return v70;
    end;
    v68.IsFinished = function(_) --[[ Line: 221 ]] --[[ Name: IsFinished ]]
        -- upvalues: v69 (ref)
        return v69;
    end;
    v68.Finish = function(v86) --[[ Line: 225 ]] --[[ Name: Finish ]]
        -- upvalues: v69 (ref), v76 (copy)
        if not v69 then
            v86:Cancel();
            v76();
        end;
    end;
    v68.Cancel = function(_) --[[ Line: 232 ]] --[[ Name: Cancel ]]
        -- upvalues: v68 (copy), v69 (ref), v61 (copy), v60 (copy), v30 (ref)
        v68.Cancelled = true;
        v69 = true;
        local l_v61_3 = v61;
        local l_v60_2 = v60;
        if (v30[l_v61_3] and v30[l_v61_3][l_v60_2]) == v68 then
            local l_v61_4 = v61;
            l_v61_3 = v60;
            if not v30[l_v61_4] then
                v30[l_v61_4] = {};
            end;
            v30[l_v61_4][l_v61_3] = nil;
        end;
    end;
    return v68;
end;
v9.CancelTweens = function(v91) --[[ Line: 243 ]] --[[ Name: CancelTweens ]]
    for v92, v93 in pairs(v91) do
        v93:Finish();
        v91[v92] = nil;
    end;
end;
v9.Signal = function() --[[ Line: 252 ]] --[[ Name: Signal ]]
    local v94 = {};
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v96 = nil;
    local v97 = nil;
    v94.fire = function(_, ...) --[[ Line: 260 ]] --[[ Name: fire ]]
        -- upvalues: v96 (ref), v97 (ref), l_BindableEvent_0 (copy)
        v96 = {
            ...
        };
        v97 = select("#", ...);
        l_BindableEvent_0:Fire();
    end;
    v94.connect = function(_, v100) --[[ Line: 266 ]] --[[ Name: connect ]]
        -- upvalues: l_BindableEvent_0 (copy), v96 (ref), v97 (ref)
        if not v100 then
            error("connect(nil)", 2);
        end;
        return l_BindableEvent_0.Event:connect(function() --[[ Line: 268 ]]
            -- upvalues: v100 (copy), v96 (ref), v97 (ref)
            v100(unpack(v96, 1, v97));
        end);
    end;
    v94.wait = function(_) --[[ Line: 273 ]] --[[ Name: wait ]]
        -- upvalues: l_BindableEvent_0 (copy), v96 (ref), v97 (ref)
        l_BindableEvent_0.Event:wait();
        assert(v96, "Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.");
        return unpack(v96, 1, v97);
    end;
    return v94;
end;
v9.DisconnectEvent = function(v102) --[[ Line: 282 ]] --[[ Name: DisconnectEvent ]]
    if v102 then
        v102:disconnect();
    end;
    return nil;
end;
v9.DisconnectEvents = function(v103) --[[ Line: 289 ]] --[[ Name: DisconnectEvents ]]
    if v103 and type(v103) == "table" then
        for _, v105 in pairs(v103) do
            v105:disconnect();
        end;
    end;
end;
v9.Clamp = function(v106, v107, v108) --[[ Line: 299 ]] --[[ Name: Clamp ]]
    return (math.max(v106, (math.min(v107, v108))));
end;
v9.ClampVector2 = function(v109, v110, v111) --[[ Line: 303 ]] --[[ Name: ClampVector2 ]]
    -- upvalues: v9 (copy)
    return Vector2.new(v9.Clamp(v109.x, v110.x, v111.x), v9.Clamp(v109.y, v110.y, v111.y));
end;
v9.TweenPositionOrSet = function(v112, ...) --[[ Line: 307 ]] --[[ Name: TweenPositionOrSet ]]
    if v112:IsDescendantOf(game) then
        v112:TweenPosition(...);
        return;
    else
        v112.Position = select(1, ...);
        return;
    end;
end;
v9.ClampCanvasPosition = function(v113, v114) --[[ Line: 316 ]] --[[ Name: ClampCanvasPosition ]]
    -- upvalues: v9 (copy)
    local v115 = v113.Parent and v113.Parent.AbsoluteSize or Vector2.new(0, 0);
    local v116 = Vector2.new(v113.CanvasSize.X.Scale * v115.X + v113.CanvasSize.X.Offset, v113.CanvasSize.Y.Scale * v115.Y + v113.CanvasSize.Y.Offset);
    local v117 = v9.Clamp(0, v116.X - v113.AbsoluteWindowSize.X, v114.X);
    local v118 = v9.Clamp(0, v116.Y - v113.AbsoluteWindowSize.Y, v114.Y);
    return Vector2.new(v117, v118);
end;
v9.Round = function(v119, v120) --[[ Line: 327 ]] --[[ Name: Round ]]
    v120 = v120 or 1;
    return math.floor((v119 + v120 / 2) / v120) * v120;
end;
v9.ChompString = function(v121) --[[ Line: 335 ]] --[[ Name: ChompString ]]
    return tostring(v121):gsub("^%s+", ""):gsub("%s+$", "");
end;
v9.SpaceNormalizeString = function(v122) --[[ Line: 340 ]] --[[ Name: SpaceNormalizeString ]]
    return tostring(v122):gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", "");
end;
local function v125() --[[ Line: 344 ]] --[[ Name: getDelimiterByLocale ]]
    -- upvalues: l_LocalizationService_0 (copy)
    local v123 = l_LocalizationService_0.RobloxLocaleId:lower();
    local v124 = {
        ["en-us"] = ",", 
        ["zh-hk"] = "", 
        ["zh-tw"] = "", 
        ["nb-no"] = "\194\160", 
        ["es-es"] = " ", 
        ["nl-nl"] = ".", 
        ["it-it"] = ".", 
        ["tr-tr"] = ".", 
        ["ru-ru"] = " ", 
        ["fi-fi"] = "\194\160", 
        ["da-dk"] = ".", 
        ["de-de"] = ".", 
        ["fr-fr"] = "\194\160", 
        ["pt-br"] = ".", 
        ["pt-pt"] = ".", 
        ["pl-pl"] = " ", 
        ["sv-se"] = " "
    };
    if v124[v123] then
        return v124[v123];
    else
        return v124["en-us"];
    end;
end;
v9.FormatNumberString = function(v126) --[[ Line: 375 ]] --[[ Name: FormatNumberString ]]
    -- upvalues: v125 (copy), v9 (copy)
    local v127 = v125();
    local v128 = v9.ChompString(v126);
    local v129 = string.format("%%1%s%%2", v127);
    local _ = nil;
    repeat
        local v131, v132 = string.gsub(v128, "^(-?%d+)(%d%d%d)", v129);
        v128 = v131;
    until v132 == 0;
    return v128;
end;
v9.PrettyPrint = function(v133) --[[ Line: 391 ]] --[[ Name: PrettyPrint ]]
    -- upvalues: v9 (copy)
    if type(v133) == "table" then
        local v134 = "{";
        for v135, v136 in pairs(v133) do
            v134 = v134 == "{" and v134 or v134 .. ", ";
            if type(v135) == "string" then
                v134 = v134 .. v135 .. " = ";
            elseif type(v135) ~= "number" then
                v134 = v134 .. "[" .. v135 .. "] = ";
            end;
            v134 = v134 .. v9.PrettyPrint(v136);
        end;
        return v134 .. "}";
    elseif type(v133) == "string" then
        return "'" .. v133 .. "'";
    else
        return (tostring(v133));
    end;
end;
local function _(v137, v138, v139) --[[ Line: 415 ]] --[[ Name: SCurveTranform ]]
    -- upvalues: v9 (copy)
    v138 = v138 or 0.35;
    v139 = v139 or 0.8;
    v137 = v9.Clamp(-1, 1, v137);
    if v137 >= 0 then
        return v138 * v137 / (v138 - v137 + 1);
    else
        return -(v139 * -v137 / (v139 + v137 + 1));
    end;
end;
local function _(v141, v142) --[[ Line: 425 ]] --[[ Name: toSCurveSpace ]]
    v142 = v142 or 0.1;
    return (1 + v142) * (math.abs(v141) * 2 - 1) - v142;
end;
local function _(v144) --[[ Line: 430 ]] --[[ Name: fromSCurveSpace ]]
    return v144 / 2 + 0.5;
end;
v9.GamepadLinearToCurve = function(v146, v147, _, _) --[[ Line: 434 ]] --[[ Name: GamepadLinearToCurve ]]
    -- upvalues: v9 (copy)
    local function v156(v150) --[[ Line: 435 ]] --[[ Name: onAxis ]]
        -- upvalues: v147 (copy), v9 (ref)
        local v151 = v150 < 0 and -1 or 1;
        local v152 = math.abs(v150);
        local v153 = v147 or 0.1;
        local v154 = (1 + v153) * (math.abs(v152) * 2 - 1) - v153;
        v152 = nil;
        v153 = nil;
        v152 = v152 or 0.35;
        v153 = v153 or 0.8;
        v154 = v9.Clamp(-1, 1, v154);
        local v155 = (if v154 >= 0 then v152 * v154 / (v152 - v154 + 1) else -(v153 * -v154 / (v153 + v154 + 1))) / 2 + 0.5;
        return v9.Clamp(-1, 1, v155 * v151);
    end;
    local l_new_0 = Vector2.new;
    local l_x_0 = v146.x;
    local v159 = l_x_0 < 0 and -1 or 1;
    local v160 = math.abs(l_x_0);
    local v161 = v147 or 0.1;
    local v162 = (1 + v161) * (math.abs(v160) * 2 - 1) - v161;
    v160 = nil;
    v161 = nil;
    v160 = v160 or 0.35;
    v161 = v161 or 0.8;
    v162 = v9.Clamp(-1, 1, v162);
    local v163 = (if v162 >= 0 then v160 * v162 / (v160 - v162 + 1) else -(v161 * -v162 / (v161 + v162 + 1))) / 2 + 0.5;
    return l_new_0(v9.Clamp(-1, 1, v163 * v159), v156(v146.y));
end;
v9.IsFastFlagEnabled = function(v164) --[[ Line: 444 ]] --[[ Name: IsFastFlagEnabled ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 445 ]]
        -- upvalues: v164 (copy)
        return settings():GetFFlag(v164);
    end);
    return l_status_0 and l_result_0;
end;
v9.GetFastVariable = function(v167) --[[ Line: 452 ]] --[[ Name: GetFastVariable ]]
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 453 ]]
        -- upvalues: v167 (copy)
        return settings():GetFVariable(v167);
    end);
    return l_status_1 and l_result_1;
end;
local function _() --[[ Line: 460 ]] --[[ Name: getLocalPlayer ]]
    -- upvalues: l_Players_0 (copy)
    while l_Players_0.LocalPlayer == nil do
        wait();
    end;
    return l_Players_0.LocalPlayer;
end;
v9.IsFeatureNonZero = function(v171) --[[ Line: 467 ]] --[[ Name: IsFeatureNonZero ]]
    -- upvalues: v9 (copy)
    return (tonumber(v9.GetFastVariable(v171)) or 0) ~= 0;
end;
v9.IsFeatureRolledOut = function(v172) --[[ Line: 471 ]] --[[ Name: IsFeatureRolledOut ]]
    -- upvalues: l_Players_0 (copy), v9 (copy)
    while l_Players_0.LocalPlayer == nil do
        wait();
    end;
    return l_Players_0.LocalPlayer.UserId % 100 < (tonumber(v9.GetFastVariable(v172)) or 0);
end;
v9.ExponentialRepeat = function(v173, v174, v175) --[[ Line: 476 ]] --[[ Name: ExponentialRepeat ]]
    v175 = v175 or 6;
    local v176 = 1;
    local l_v175_0 = v175;
    while true do
        if v176 <= l_v175_0 and v173() then
            if v174() then
                return;
            else
                wait(v176 ^ 2);
                v176 = v176 + 1;
            end;
        else
            return;
        end;
    end;
end;
v9.SplitString = function(v178, v179) --[[ Line: 490 ]] --[[ Name: SplitString ]]
    local v180 = {};
    if v178 and v179 then
        for v181 in string.gmatch(v178, "([^" .. v179 .. "]+)") do
            table.insert(v180, v181);
        end;
    end;
    return v180;
end;
local function v182(v183, v184, v185) --[[ Line: 501 ]] --[[ Name: findAssetsHelper ]]
    -- upvalues: v182 (copy)
    if not v183 then
        return;
    else
        if v183:IsA("CharacterMesh") then
            if v183.MeshId > 0 then
                table.insert(v184, v185 .. tostring(v183.MeshId));
            end;
            if v183.BaseTextureId > 0 then
                table.insert(v184, v185 .. tostring(v183.BaseTextureId));
            end;
            if v183.OverlayTextureId > 0 then
                table.insert(v184, v185 .. tostring(v183.OverlayTextureId));
            end;
        elseif v183:IsA("FileMesh") then
            table.insert(v184, v183.MeshId);
            table.insert(v184, v183.TextureId);
        elseif v183:IsA("Decal") then
            table.insert(v184, v183.Texture);
        elseif v183:IsA("Pants") then
            table.insert(v184, v183.PantsTemplate);
        elseif v183:IsA("Shirt") then
            table.insert(v184, v183.ShirtTemplate);
        end;
        for _, v187 in pairs(v183:GetChildren()) do
            v182(v187, v184, v185);
        end;
        return;
    end;
end;
v9.FindAssetsInModel = function(v188, v189) --[[ Line: 529 ]] --[[ Name: FindAssetsInModel ]]
    -- upvalues: v182 (copy)
    v189 = v189 or "https://assetgame.roblox.com/asset/?id=";
    local v190 = {};
    v182(v188, v190, v189);
    return v190;
end;
v9.ConvertFontSizeEnumToInt = function(v191) --[[ Line: 536 ]] --[[ Name: ConvertFontSizeEnumToInt ]]
    local l_Name_0 = v191.Name;
    return string.match(l_Name_0, "%d+") or 10;
end;
v9.Upper = function(v193) --[[ Line: 543 ]] --[[ Name: Upper ]]
    -- upvalues: v6 (ref)
    if v6 then
        return v6:Upper(v193);
    else
        return string.upper(v193);
    end;
end;
v9.SetSelectedCoreObject = function(v194) --[[ Line: 551 ]] --[[ Name: SetSelectedCoreObject ]]
    -- upvalues: l_GuiService_0 (copy)
    l_GuiService_0.SelectedCoreObject = v194;
end;
v9.AddSelectionParent = function(v195, v196) --[[ Line: 555 ]] --[[ Name: AddSelectionParent ]]
    -- upvalues: l_GuiService_0 (copy)
    l_GuiService_0:AddSelectionParent(v195, v196);
end;
v9.RemoveSelectionGroup = function(v197) --[[ Line: 559 ]] --[[ Name: RemoveSelectionGroup ]]
    -- upvalues: l_GuiService_0 (copy)
    l_GuiService_0:RemoveSelectionGroup(v197);
end;
v9.GetTextBounds = function(v198) --[[ Line: 563 ]] --[[ Name: GetTextBounds ]]
    -- upvalues: l_TextService_0 (copy)
    local v199 = false;
    local v200 = nil;
    if v198 then
        if v198.TextFits then
            return true, v198.TextBounds;
        elseif not v198.TextWrapped then
            v200 = l_TextService_0:GetTextSize(v198.Text, v198.TextSize, v198.Font, Vector2.new(0, 0));
            v199 = true;
        end;
    end;
    return v199, v200;
end;
v9.ResizeButtonWithText = function(v201, v202, v203, v204) --[[ Line: 589 ]] --[[ Name: ResizeButtonWithText ]]
    -- upvalues: v9 (copy)
    local v205 = false;
    local v206, v207 = v9.GetTextBounds(v202);
    if v206 and v201.Size.X.Scale == 0 and v201.Size.Y.Scale == 0 then
        local v208 = Vector2.new(v201.Size.X.Offset, v201.Size.Y.Offset);
        local l_X_0 = v208.X;
        local l_Y_0 = v208.Y;
        if v203 and v208.X < v207.X + v203 * 2 then
            l_X_0 = v207.X + v203 * 2;
            v205 = true;
        end;
        if v204 and v208.Y < v207.Y + v204 * 2 then
            l_Y_0 = v207.Y + v204 * 2;
            v205 = true;
        end;
        if v205 then
            v201.Size = UDim2.new(0, l_X_0, 0, l_Y_0);
        end;
    end;
    return v205;
end;
v9.ResizeButtonWithDynamicText = function(v211, v212, v213, v214, v215) --[[ Line: 616 ]] --[[ Name: ResizeButtonWithDynamicText ]]
    -- upvalues: v9 (copy)
    local v216 = false;
    v216 = v9.ResizeButtonWithText(v211, v212, v214, v215) or v216;
    local l_Text_0 = v212.Text;
    if v213 and #v213 > 0 then
        for v218 = 1, #v213 do
            v212.Text = v213[v218];
            v216 = v9.ResizeButtonWithText(v211, v212, v214, v215) or v216;
        end;
    end;
    v212.Text = l_Text_0;
    return v216;
end;
return v9;