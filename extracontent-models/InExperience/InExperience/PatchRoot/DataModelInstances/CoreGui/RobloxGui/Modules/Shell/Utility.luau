local l_RunService_0 = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local l_TextService_0 = game:GetService("TextService");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("CoreGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_game_EngineFeature_0 = game:GetEngineFeature("DeprecateOldGuiObjectProperties");
local v7 = nil;
pcall(function() --[[ Line: 12 ]]
    -- upvalues: v7 (ref)
    v7 = game:GetService("PlatformService");
end);
local v10 = {
    IsFinite = function(v8) --[[ Line: 17 ]] --[[ Name: IsFinite ]]
        local v9 = false;
        if v8 == v8 then
            v9 = false;
            if v8 ~= 1e999 then
                v9 = v8 ~= -1e999;
            end;
        end;
        return v9;
    end
};
v10.FindAncestorOfType = function(v11, v12) --[[ Line: 21 ]] --[[ Name: FindAncestorOfType ]]
    -- upvalues: v10 (copy)
    local v13 = v11 and v11.Parent;
    if v13 then
        if v13:IsA(v12) then
            return v13;
        else
            return v10.FindAncestorOfType(v13, v12);
        end;
    else
        return nil;
    end;
end;
v10.CalculateRelativeDimensions = function(v14, v15, v16, _) --[[ Line: 33 ]] --[[ Name: CalculateRelativeDimensions ]]
    -- upvalues: l_GuiService_0 (copy), v10 (copy)
    local l_l_GuiService_0_ScreenResolution_0 = l_GuiService_0:GetScreenResolution();
    local v19 = v10.FindAncestorOfType(v14, "SurfaceGui");
    if v19 then
        l_l_GuiService_0_ScreenResolution_0 = v19.CanvasSize;
    end;
    local v20 = v15 / v16;
    if v16.y > 0 and l_l_GuiService_0_ScreenResolution_0.y > 0 then
        v20 = v20 * (v16.x / v16.y / (l_l_GuiService_0_ScreenResolution_0.x / l_l_GuiService_0_ScreenResolution_0.y));
        local l_Parent_0 = v14.Parent;
        if l_Parent_0 then
            local v22 = 1 / (l_Parent_0.AbsoluteSize / l_l_GuiService_0_ScreenResolution_0);
            if v10.IsFinite(v22.x) and v10.IsFinite(v22.y) then
                return UDim2.new(v22.x * v20.x, 0, v22.y * v20.y, 0);
            end;
        end;
    end;
    return UDim2.new(v20.x, 0, v20.y, 0);
end;
v10.Enum = {
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
v10.CalculateFit = function(v23, v24) --[[ Line: 78 ]] --[[ Name: CalculateFit ]]
    local v25 = v23.AbsoluteSize / v24;
    local v26 = v24 * math.min(v25.X, v25.Y);
    return UDim2.new(0, v26.X, 0, v26.Y);
end;
v10.CalculateFill = function(v27, v28) --[[ Line: 86 ]] --[[ Name: CalculateFill ]]
    local v29 = v27.AbsoluteSize / v28;
    local v30 = v28 * math.max(v29.X, v29.Y);
    return UDim2.new(0, v30.X, 0, v30.Y);
end;
local v31 = {};
local function _(v32, v33) --[[ Line: 97 ]] --[[ Name: getActiveTween ]]
    -- upvalues: v31 (copy)
    return v31[v32] and v31[v32][v33];
end;
local function _(v35, v36, v37) --[[ Line: 101 ]] --[[ Name: setActiveTween ]]
    -- upvalues: v31 (copy)
    if not v31[v35] then
        v31[v35] = {};
    end;
    v31[v35][v36] = v37;
end;
v10.Linear = function(v39, v40, v41, v42) --[[ Line: 108 ]] --[[ Name: Linear ]]
    if v42 <= v39 then
        return v40 + v41;
    else
        return v41 * v39 / v42 + v40;
    end;
end;
v10.EaseOutQuad = function(v43, v44, v45, v46) --[[ Line: 114 ]] --[[ Name: EaseOutQuad ]]
    if v46 <= v43 then
        return v44 + v45;
    else
        v43 = v43 / v46;
        return -v45 * v43 * (v43 - 2) + v44;
    end;
end;
v10.EaseInOutQuad = function(v47, v48, v49, v50) --[[ Line: 121 ]] --[[ Name: EaseInOutQuad ]]
    if v50 <= v47 then
        return v48 + v49;
    else
        v47 = v47 / (v50 / 2);
        if v47 < 1 then
            return v49 / 2 * v47 * v47 + v48;
        else
            v47 = v47 - 1;
            return -v49 / 2 * (v47 * (v47 - 2) - 1) + v48;
        end;
    end;
end;
v10.SCurveUDim2 = function(v51, v52, v53, v54) --[[ Line: 130 ]] --[[ Name: SCurveUDim2 ]]
    if v54 <= v51 then
        return v52 + v53;
    else
        v51 = v51 / v54;
        if v51 < 0 then
            v51 = 0;
        end;
        if v51 > 1 then
            v51 = 1;
        end;
        local v55 = 3 * v51 * v51 - 2 * v51 * v51 * v51;
        return UDim2.new(v55 * v53.X.Scale, v55 * v53.X.Offset, v55 * v53.Y.Scale, v55 * v53.Y.Offset) + v52;
    end;
end;
v10.SCurveVector2 = function(v56, v57, v58, v59) --[[ Line: 143 ]] --[[ Name: SCurveVector2 ]]
    if v59 <= v56 then
        return v57 + v58;
    else
        v56 = v56 / v59;
        if v56 < 0 then
            v56 = 0;
        end;
        if v56 > 1 then
            v56 = 1;
        end;
        local v60 = 3 * v56 * v56 - 2 * v56 * v56 * v56;
        return Vector2.new(v60 * v58.X, v60 * v58.Y) + v57;
    end;
end;
v10.PropertyTweener = function(v61, v62, v63, v64, v65, v66, v67, v68) --[[ Line: 154 ]] --[[ Name: PropertyTweener ]]
    -- upvalues: v10 (copy), v31 (copy), l_RunService_0 (copy)
    v66 = v66 or v10.Linear;
    v67 = v67 or false;
    local v69 = {
        StartTime = tick()
    };
    v69.EndTime = v69.StartTime + v65;
    v69.Cancelled = false;
    local v70 = false;
    local v71 = 0;
    local function _(v72) --[[ Line: 167 ]] --[[ Name: setValue ]]
        -- upvalues: v61 (copy), v62 (copy)
        if v61 then
            v61[v62] = v72;
        end;
    end;
    local function v77() --[[ Line: 173 ]] --[[ Name: finalize ]]
        -- upvalues: v66 (ref), v63 (copy), v64 (copy), v61 (copy), v62 (copy), v70 (ref), v71 (ref), v31 (ref), v69 (copy), v68 (copy)
        local v74 = v66(1, v63, v64 - v63, 1);
        if v61 then
            v61[v62] = v74;
        end;
        v70 = true;
        v71 = 1;
        local l_v62_0 = v62;
        local l_v61_0 = v61;
        if (v31[l_v62_0] and v31[l_v62_0][l_v61_0]) == v69 then
            v74 = v62;
            l_v62_0 = v61;
            if not v31[v74] then
                v31[v74] = {};
            end;
            v31[v74][l_v62_0] = nil;
        end;
        if v68 then
            v68();
        end;
    end;
    if v67 or not (v31[v62] and v31[v62][v61]) then
        if v31[v62] and v31[v62][v61] then
            (v31[v62] and v31[v62][v61]):Cancel();
        end;
        if not v31[v62] then
            v31[v62] = {};
        end;
        v31[v62][v61] = v69;
        local v78 = v66(0, v63, v64 - v63, v65);
        if v61 then
            v61[v62] = v78;
        end;
        spawn(function() --[[ Line: 195 ]]
            -- upvalues: v69 (copy), v61 (copy), v66 (ref), v63 (copy), v64 (copy), v65 (copy), v62 (copy), v71 (ref), v10 (ref), l_RunService_0 (ref), v77 (copy), v31 (ref)
            local v79 = tick();
            while v79 < v69.EndTime and v61 and not v69.Cancelled do
                local v80 = v66(v79 - v69.StartTime, v63, v64 - v63, v65);
                if v61 then
                    v61[v62] = v80;
                end;
                v71 = v10.Clamp(0, 1, (v79 - v69.StartTime) / v65);
                l_RunService_0.RenderStepped:wait();
                v79 = tick();
            end;
            if v69.Cancelled == false and v61 then
                v77();
            end;
            local l_v62_1 = v62;
            local l_v61_1 = v61;
            if (v31[l_v62_1] and v31[l_v62_1][l_v61_1]) == v69 then
                local l_v62_2 = v62;
                l_v62_1 = v61;
                if not v31[l_v62_2] then
                    v31[l_v62_2] = {};
                end;
                v31[l_v62_2][l_v62_1] = nil;
            end;
        end);
    else
        v70 = true;
    end;
    v69.GetFinal = function(_) --[[ Line: 215 ]] --[[ Name: GetFinal ]]
        -- upvalues: v64 (copy)
        return v64;
    end;
    v69.GetPercentComplete = function(_) --[[ Line: 219 ]] --[[ Name: GetPercentComplete ]]
        -- upvalues: v71 (ref)
        return v71;
    end;
    v69.IsFinished = function(_) --[[ Line: 223 ]] --[[ Name: IsFinished ]]
        -- upvalues: v70 (ref)
        return v70;
    end;
    v69.Finish = function(v87) --[[ Line: 227 ]] --[[ Name: Finish ]]
        -- upvalues: v70 (ref), v77 (copy)
        if not v70 then
            v87:Cancel();
            v77();
        end;
    end;
    v69.Cancel = function(_) --[[ Line: 234 ]] --[[ Name: Cancel ]]
        -- upvalues: v69 (copy), v70 (ref), v62 (copy), v61 (copy), v31 (ref)
        v69.Cancelled = true;
        v70 = true;
        local l_v62_3 = v62;
        local l_v61_2 = v61;
        if (v31[l_v62_3] and v31[l_v62_3][l_v61_2]) == v69 then
            local l_v62_4 = v62;
            l_v62_3 = v61;
            if not v31[l_v62_4] then
                v31[l_v62_4] = {};
            end;
            v31[l_v62_4][l_v62_3] = nil;
        end;
    end;
    return v69;
end;
v10.CancelTweens = function(v92) --[[ Line: 245 ]] --[[ Name: CancelTweens ]]
    for v93, v94 in pairs(v92) do
        v94:Finish();
        v92[v93] = nil;
    end;
end;
v10.Signal = function() --[[ Line: 254 ]] --[[ Name: Signal ]]
    local v95 = {};
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v97 = nil;
    local v98 = nil;
    v95.fire = function(_, ...) --[[ Line: 262 ]] --[[ Name: fire ]]
        -- upvalues: v97 (ref), v98 (ref), l_BindableEvent_0 (copy)
        v97 = {
            ...
        };
        v98 = select("#", ...);
        l_BindableEvent_0:Fire();
    end;
    v95.connect = function(_, v101) --[[ Line: 268 ]] --[[ Name: connect ]]
        -- upvalues: l_BindableEvent_0 (copy), v97 (ref), v98 (ref)
        if not v101 then
            error("connect(nil)", 2);
        end;
        return l_BindableEvent_0.Event:connect(function() --[[ Line: 270 ]]
            -- upvalues: v101 (copy), v97 (ref), v98 (ref)
            v101(unpack(v97, 1, v98));
        end);
    end;
    v95.wait = function(_) --[[ Line: 275 ]] --[[ Name: wait ]]
        -- upvalues: l_BindableEvent_0 (copy), v97 (ref), v98 (ref)
        l_BindableEvent_0.Event:wait();
        assert(v97, "Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.");
        return unpack(v97, 1, v98);
    end;
    return v95;
end;
v10.DisconnectEvent = function(v103) --[[ Line: 284 ]] --[[ Name: DisconnectEvent ]]
    if v103 then
        v103:disconnect();
    end;
    return nil;
end;
v10.DisconnectEvents = function(v104) --[[ Line: 291 ]] --[[ Name: DisconnectEvents ]]
    if v104 and type(v104) == "table" then
        for _, v106 in pairs(v104) do
            v106:disconnect();
        end;
    end;
end;
v10.Clamp = function(v107, v108, v109) --[[ Line: 301 ]] --[[ Name: Clamp ]]
    return (math.max(v107, (math.min(v108, v109))));
end;
v10.ClampVector2 = function(v110, v111, v112) --[[ Line: 305 ]] --[[ Name: ClampVector2 ]]
    -- upvalues: v10 (copy)
    return Vector2.new(v10.Clamp(v110.x, v111.x, v112.x), v10.Clamp(v110.y, v111.y, v112.y));
end;
v10.TweenPositionOrSet = function(v113, ...) --[[ Line: 309 ]] --[[ Name: TweenPositionOrSet ]]
    -- upvalues: l_game_EngineFeature_0 (copy)
    if v113:IsDescendantOf(game) then
        if l_game_EngineFeature_0 then
            v113:TweenPositionInternal(...);
            return;
        else
            v113:TweenPosition(...);
            return;
        end;
    else
        v113.Position = select(1, ...);
        return;
    end;
end;
v10.ClampCanvasPosition = function(v114, v115) --[[ Line: 322 ]] --[[ Name: ClampCanvasPosition ]]
    -- upvalues: v10 (copy)
    local v116 = v114.Parent and v114.Parent.AbsoluteSize or Vector2.new(0, 0);
    local v117 = Vector2.new(v114.CanvasSize.X.Scale * v116.X + v114.CanvasSize.X.Offset, v114.CanvasSize.Y.Scale * v116.Y + v114.CanvasSize.Y.Offset);
    local v118 = v10.Clamp(0, v117.X - v114.AbsoluteWindowSize.X, v115.X);
    local v119 = v10.Clamp(0, v117.Y - v114.AbsoluteWindowSize.Y, v115.Y);
    return Vector2.new(v118, v119);
end;
v10.Round = function(v120, v121) --[[ Line: 333 ]] --[[ Name: Round ]]
    v121 = v121 or 1;
    return math.floor((v120 + v121 / 2) / v121) * v121;
end;
v10.ChompString = function(v122) --[[ Line: 341 ]] --[[ Name: ChompString ]]
    return tostring(v122):gsub("^%s+", ""):gsub("%s+$", "");
end;
v10.SpaceNormalizeString = function(v123) --[[ Line: 346 ]] --[[ Name: SpaceNormalizeString ]]
    return tostring(v123):gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", "");
end;
local function v126() --[[ Line: 350 ]] --[[ Name: getDelimiterByLocale ]]
    -- upvalues: l_LocalizationService_0 (copy)
    local v124 = l_LocalizationService_0.RobloxLocaleId:lower();
    local v125 = {
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
    if v125[v124] then
        return v125[v124];
    else
        return v125["en-us"];
    end;
end;
v10.FormatNumberString = function(v127) --[[ Line: 381 ]] --[[ Name: FormatNumberString ]]
    -- upvalues: v126 (copy), v10 (copy)
    local v128 = v126();
    local v129 = v10.ChompString(v127);
    local v130 = string.format("%%1%s%%2", v128);
    local _ = nil;
    repeat
        local v132, v133 = string.gsub(v129, "^(-?%d+)(%d%d%d)", v130);
        v129 = v132;
    until v133 == 0;
    return v129;
end;
v10.PrettyPrint = function(v134) --[[ Line: 397 ]] --[[ Name: PrettyPrint ]]
    -- upvalues: v10 (copy)
    if type(v134) == "table" then
        local v135 = "{";
        for v136, v137 in pairs(v134) do
            v135 = v135 == "{" and v135 or v135 .. ", ";
            if type(v136) == "string" then
                v135 = v135 .. v136 .. " = ";
            elseif type(v136) ~= "number" then
                v135 = v135 .. "[" .. v136 .. "] = ";
            end;
            v135 = v135 .. v10.PrettyPrint(v137);
        end;
        return v135 .. "}";
    elseif type(v134) == "string" then
        return "'" .. v134 .. "'";
    else
        return (tostring(v134));
    end;
end;
local function _(v138, v139, v140) --[[ Line: 421 ]] --[[ Name: SCurveTranform ]]
    -- upvalues: v10 (copy)
    v139 = v139 or 0.35;
    v140 = v140 or 0.8;
    v138 = v10.Clamp(-1, 1, v138);
    if v138 >= 0 then
        return v139 * v138 / (v139 - v138 + 1);
    else
        return -(v140 * -v138 / (v140 + v138 + 1));
    end;
end;
local function _(v142, v143) --[[ Line: 431 ]] --[[ Name: toSCurveSpace ]]
    v143 = v143 or 0.1;
    return (1 + v143) * (math.abs(v142) * 2 - 1) - v143;
end;
local function _(v145) --[[ Line: 436 ]] --[[ Name: fromSCurveSpace ]]
    return v145 / 2 + 0.5;
end;
v10.GamepadLinearToCurve = function(v147, v148, _, _) --[[ Line: 440 ]] --[[ Name: GamepadLinearToCurve ]]
    -- upvalues: v10 (copy)
    local function v157(v151) --[[ Line: 441 ]] --[[ Name: onAxis ]]
        -- upvalues: v148 (copy), v10 (ref)
        local v152 = v151 < 0 and -1 or 1;
        local v153 = math.abs(v151);
        local v154 = v148 or 0.1;
        local v155 = (1 + v154) * (math.abs(v153) * 2 - 1) - v154;
        v153 = nil;
        v154 = nil;
        v153 = v153 or 0.35;
        v154 = v154 or 0.8;
        v155 = v10.Clamp(-1, 1, v155);
        local v156 = (if v155 >= 0 then v153 * v155 / (v153 - v155 + 1) else -(v154 * -v155 / (v154 + v155 + 1))) / 2 + 0.5;
        return v10.Clamp(-1, 1, v156 * v152);
    end;
    local l_new_0 = Vector2.new;
    local l_x_0 = v147.x;
    local v160 = l_x_0 < 0 and -1 or 1;
    local v161 = math.abs(l_x_0);
    local v162 = v148 or 0.1;
    local v163 = (1 + v162) * (math.abs(v161) * 2 - 1) - v162;
    v161 = nil;
    v162 = nil;
    v161 = v161 or 0.35;
    v162 = v162 or 0.8;
    v163 = v10.Clamp(-1, 1, v163);
    local v164 = (if v163 >= 0 then v161 * v163 / (v161 - v163 + 1) else -(v162 * -v163 / (v162 + v163 + 1))) / 2 + 0.5;
    return l_new_0(v10.Clamp(-1, 1, v164 * v160), v157(v147.y));
end;
v10.IsFastFlagEnabled = function(v165) --[[ Line: 450 ]] --[[ Name: IsFastFlagEnabled ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 451 ]]
        -- upvalues: v165 (copy)
        return settings():GetFFlag(v165);
    end);
    return l_status_0 and l_result_0;
end;
v10.GetFastVariable = function(v168) --[[ Line: 458 ]] --[[ Name: GetFastVariable ]]
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 459 ]]
        -- upvalues: v168 (copy)
        return settings():GetFVariable(v168);
    end);
    return l_status_1 and l_result_1;
end;
local function _() --[[ Line: 466 ]] --[[ Name: getLocalPlayer ]]
    -- upvalues: l_Players_0 (copy)
    while l_Players_0.LocalPlayer == nil do
        wait();
    end;
    return l_Players_0.LocalPlayer;
end;
v10.IsFeatureNonZero = function(v172) --[[ Line: 473 ]] --[[ Name: IsFeatureNonZero ]]
    -- upvalues: v10 (copy)
    return (tonumber(v10.GetFastVariable(v172)) or 0) ~= 0;
end;
v10.IsFeatureRolledOut = function(v173) --[[ Line: 477 ]] --[[ Name: IsFeatureRolledOut ]]
    -- upvalues: l_Players_0 (copy), v10 (copy)
    while l_Players_0.LocalPlayer == nil do
        wait();
    end;
    return l_Players_0.LocalPlayer.UserId % 100 < (tonumber(v10.GetFastVariable(v173)) or 0);
end;
v10.ExponentialRepeat = function(v174, v175, v176) --[[ Line: 482 ]] --[[ Name: ExponentialRepeat ]]
    v176 = v176 or 6;
    local v177 = 1;
    local l_v176_0 = v176;
    while true do
        if v177 <= l_v176_0 and v174() then
            if v175() then
                return;
            else
                wait(v177 ^ 2);
                v177 = v177 + 1;
            end;
        else
            return;
        end;
    end;
end;
v10.SplitString = function(v179, v180) --[[ Line: 496 ]] --[[ Name: SplitString ]]
    local v181 = {};
    if v179 and v180 then
        for v182 in string.gmatch(v179, "([^" .. v180 .. "]+)") do
            table.insert(v181, v182);
        end;
    end;
    return v181;
end;
local function v183(v184, v185, v186) --[[ Line: 507 ]] --[[ Name: findAssetsHelper ]]
    -- upvalues: v183 (copy)
    if not v184 then
        return;
    else
        if v184:IsA("CharacterMesh") then
            if v184.MeshId > 0 then
                table.insert(v185, v186 .. tostring(v184.MeshId));
            end;
            if v184.BaseTextureId > 0 then
                table.insert(v185, v186 .. tostring(v184.BaseTextureId));
            end;
            if v184.OverlayTextureId > 0 then
                table.insert(v185, v186 .. tostring(v184.OverlayTextureId));
            end;
        elseif v184:IsA("FileMesh") then
            table.insert(v185, v184.MeshId);
            table.insert(v185, v184.TextureId);
        elseif v184:IsA("Decal") then
            table.insert(v185, v184.Texture);
        elseif v184:IsA("Pants") then
            table.insert(v185, v184.PantsTemplate);
        elseif v184:IsA("Shirt") then
            table.insert(v185, v184.ShirtTemplate);
        end;
        for _, v188 in pairs(v184:GetChildren()) do
            v183(v188, v185, v186);
        end;
        return;
    end;
end;
v10.FindAssetsInModel = function(v189, v190) --[[ Line: 535 ]] --[[ Name: FindAssetsInModel ]]
    -- upvalues: v183 (copy)
    v190 = v190 or "https://assetgame.roblox.com/asset/?id=";
    local v191 = {};
    v183(v189, v191, v190);
    return v191;
end;
v10.ConvertFontSizeEnumToInt = function(v192) --[[ Line: 542 ]] --[[ Name: ConvertFontSizeEnumToInt ]]
    local l_Name_0 = v192.Name;
    return string.match(l_Name_0, "%d+") or 10;
end;
v10.Upper = function(v194) --[[ Line: 549 ]] --[[ Name: Upper ]]
    -- upvalues: v7 (ref)
    if v7 then
        return v7:Upper(v194);
    else
        return string.upper(v194);
    end;
end;
v10.SetSelectedCoreObject = function(v195) --[[ Line: 557 ]] --[[ Name: SetSelectedCoreObject ]]
    -- upvalues: l_GuiService_0 (copy)
    l_GuiService_0.SelectedCoreObject = v195;
end;
v10.AddSelectionParent = function(v196, v197) --[[ Line: 561 ]] --[[ Name: AddSelectionParent ]]
    -- upvalues: l_GuiService_0 (copy)
    l_GuiService_0:AddSelectionParent(v196, v197);
end;
v10.RemoveSelectionGroup = function(v198) --[[ Line: 565 ]] --[[ Name: RemoveSelectionGroup ]]
    -- upvalues: l_GuiService_0 (copy)
    l_GuiService_0:RemoveSelectionGroup(v198);
end;
v10.GetTextBounds = function(v199) --[[ Line: 569 ]] --[[ Name: GetTextBounds ]]
    -- upvalues: l_TextService_0 (copy)
    local v200 = false;
    local v201 = nil;
    if v199 then
        if v199.TextFits then
            return true, v199.TextBounds;
        elseif not v199.TextWrapped then
            v201 = l_TextService_0:GetTextSize(v199.Text, v199.TextSize, v199.Font, Vector2.new(0, 0));
            v200 = true;
        end;
    end;
    return v200, v201;
end;
v10.ResizeButtonWithText = function(v202, v203, v204, v205) --[[ Line: 595 ]] --[[ Name: ResizeButtonWithText ]]
    -- upvalues: v10 (copy)
    local v206 = false;
    local v207, v208 = v10.GetTextBounds(v203);
    if v207 and v202.Size.X.Scale == 0 and v202.Size.Y.Scale == 0 then
        local v209 = Vector2.new(v202.Size.X.Offset, v202.Size.Y.Offset);
        local l_X_0 = v209.X;
        local l_Y_0 = v209.Y;
        if v204 and v209.X < v208.X + v204 * 2 then
            l_X_0 = v208.X + v204 * 2;
            v206 = true;
        end;
        if v205 and v209.Y < v208.Y + v205 * 2 then
            l_Y_0 = v208.Y + v205 * 2;
            v206 = true;
        end;
        if v206 then
            v202.Size = UDim2.new(0, l_X_0, 0, l_Y_0);
        end;
    end;
    return v206;
end;
v10.ResizeButtonWithDynamicText = function(v212, v213, v214, v215, v216) --[[ Line: 622 ]] --[[ Name: ResizeButtonWithDynamicText ]]
    -- upvalues: v10 (copy)
    local v217 = false;
    v217 = v10.ResizeButtonWithText(v212, v213, v215, v216) or v217;
    local l_Text_0 = v213.Text;
    if v214 and #v214 > 0 then
        for v219 = 1, #v214 do
            v213.Text = v214[v219];
            v217 = v10.ResizeButtonWithText(v212, v213, v215, v216) or v217;
        end;
    end;
    v213.Text = l_Text_0;
    return v217;
end;
return v10;