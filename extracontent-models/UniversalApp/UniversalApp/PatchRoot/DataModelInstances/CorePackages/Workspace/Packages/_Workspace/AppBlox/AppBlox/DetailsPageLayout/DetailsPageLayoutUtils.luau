return {
    computeContentTopOffset = function(v0, v1, v2) --[[ Line: 10 ]] --[[ Name: computeContentTopOffset ]]
        if v0 <= 0 then
            return 0;
        else
            return (math.max(0, v0 / v1 - v2));
        end;
    end, 
    computeInitialScrollY = function(v3, v4, v5, v6) --[[ Line: 26 ]] --[[ Name: computeInitialScrollY ]]
        return (math.max(0, (v3 <= 0 and 0 or math.max(0, v3 / v4 - v5)) - v6));
    end, 
    computeCanvasPaddingTop = function(v7, v8, v9, v10) --[[ Line: 62 ]] --[[ Name: computeCanvasPaddingTop ]]
        local v11 = math.max(0, v7 - if v8 then v9 else 0);
        if v11 == 0 then
            v11 = v10;
        end;
        return v11;
    end, 
    getNoBannerFadeParams = function(v12) --[[ Line: 40 ]] --[[ Name: getNoBannerFadeParams ]]
        return (math.max(60, v12 * 1.5));
    end, 
    getHeaderFadeParams = function(v13, v14, v15) --[[ Line: 80 ]] --[[ Name: getHeaderFadeParams ]]
        local v16 = math.max(0, v13 - v15);
        local v17 = false;
        if v14 > 0 then
            v17 = v14 < v13;
        end;
        return v16, if v17 then math.max(1, v14 - v16) else math.max(1, (v13 - v16) / 3);
    end, 
    shouldShowStickyBar = function(v18, v19, v20, v21) --[[ Line: 48 ]] --[[ Name: shouldShowStickyBar ]]
        local v22 = v20 + v21 <= v18;
        local v23 = true;
        if v19 >= v18 then
            v23 = v22;
        end;
        return v23;
    end
};