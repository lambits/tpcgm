if SERVER then
    print("TPCGM Camera Initialized!")
end

if CLIENT then
    hook.Add("AddToolMenuCategories", "TPCGMCategory", function()
        spawnmenu.AddToolCategory("Utilities", "TPCGM", "TPCGM")
    end)
    
    hook.Add("PopulateToolMenu", "TPCGMMenuSettings", function()
        spawnmenu.AddToolMenuOption("Utilities", "TPCGM", "TPCGM", "TPCGM Settings", "", "", function(panel)
            panel:ClearControls()

            local presetmanager = panel:ToolPresets("fortnitus", {
                ["tpc_enabled"] = 1,
                ["tpc_smoothing"] = 1,
                ["tpc_crouchoffset"] = 1,
                ["tpc_fovmp"] = 1,
                ["tpc_ftmp"] = 25,
                ["tpc_fovftmp"] = 5,
                ["tpc_backoffset"] = 50,
                ["tpc_rightoffset"] = 25,
                ["tpc_upoffset"] = 5,
                ["tpc_camtilt"] = 1,
                ["tpc_precision"] = 0,
                ["tpc_deathcam"] = 0,
                ["tpc_fortnite"] = 15,
                ["tpc_pitchrotation"] = 0,
                ["tpc_yawrotation"] = 0,
                ["tpc_rollrotation"] = 0,
                ["tpc_drawviewer"] = 1
            })

            panel:KeyBinder("Third Person Toggle Key", "tpc_togglekey")
            panel:ControlHelp("Which key, when pressed, will toggle between first and third person?\nIf you want to disable this behavior, set the tpc_togglekey console variable to 0\n")

            panel:CheckBox("Enabled", "tpc_enabled")
            panel:ControlHelp("Should the third person camera be enabled?\n")
            
            panel:CheckBox("Camera Smoothing", "tpc_smoothing")
            panel:ControlHelp("Should smoothing of the cameras be enabled? This does not apply to FOV.\n")
            
            panel:CheckBox("Crouch Offset", "tpc_crouchoffset")
            panel:ControlHelp("Should crouching have an additional offset?\n")
            
            panel:CheckBox("Dynamic FOV", "tpc_fovmp")
            panel:ControlHelp("Should FOV be affected by certain actions?\n")
            
            panel:NumSlider("Frame Time Multiplier", "tpc_ftmp", 0, 100, 2)
            panel:ControlHelp("By how much should the frame time be multiplied?\nHigher numbers provide less smoothing.\n0 freezes the camera in place.\n1 creates a cinematic effect.\n25 is the default.\n")
            
            panel:NumSlider("FOV Frame Time Multiplier", "tpc_fovftmp", 0, 100, 2)
            panel:ControlHelp("By how much should the frame time be multiplied for the FOV?\nHigher numbers provide less smoothing.\n0 prevents FOV from being affected.\n5 is the default.\n")
            
            panel:NumSlider("Back Offset", "tpc_backoffset", 0, 250, 2)
            panel:ControlHelp("How much to the back should the camera be from the player?\n50 is the default.\n")
            
            panel:NumSlider("Right Offset", "tpc_rightoffset", -100, 100, 2)
            panel:ControlHelp("How much to the right should the camera be from the player?\n25 is the default.\n")
            
            panel:NumSlider("Up Offset", "tpc_upoffset", -100, 100, 2)
            panel:ControlHelp("How much to the north should the camera be from the player?\n5 is the default.\n")
            
            panel:NumSlider("Camera Tilt", "tpc_camtilt", 0, 100, 2)
            panel:ControlHelp("How much should the camera tilt when falling?\n1 is the default.\n")
            
            panel:CheckBox("Precision", "tpc_precision")
            panel:ControlHelp("Should the crosshair always be centered? This is only recommended if you need extreme precision.\n")
            
            panel:CheckBox("Death Cam", "tpc_deathcam")
            panel:ControlHelp("Should the camera still function while the player is dead?\n")
            
            panel:NumSlider("Fortnite", "tpc_fortnite", 0, 100, 2)
            panel:ControlHelp("How much to the front should the camera be?\n15 is the default.\n")
            
            panel:NumSlider("Pitch Rotation", "tpc_pitchrotation", 0, 360, 2)
            panel:ControlHelp("How much should the camera be rotated from north to south? This value will NOT work when precision is enabled!\n0 is the default.\n")
            
            panel:NumSlider("Yaw Rotation", "tpc_yawrotation", 0, 360, 2)
            panel:ControlHelp("How much should the camera be rotated from left to right? This value will NOT work when precision is enabled!\n0 is the default.\n")
            
            panel:NumSlider("Roll Rotation", "tpc_rollrotation", 0, 360, 2)
            panel:ControlHelp("How much should the camera be tilted? This value will NOT work when precision is enabled!\n0 is the default.\n")
            
            panel:CheckBox("Draw Viewer", "tpc_drawviewer")
            panel:ControlHelp("Should the player be drawn?\nDisabling this means that you will be a floating viewmodel!\n")
        end)
    end)

    print("TPCGM Camera Initialized!")
    CreateConVar("tpc_enabled", 1, {FCVAR_ARCHIVE}, "Should the third person camera be enabled?", 0, 1)
    CreateConVar("tpc_smoothing", 1, {FCVAR_ARCHIVE}, "Should smoothing of the cameras be enabled? This does not apply to FOV.", 0, 1)
    CreateConVar("tpc_crouchoffset", 1, {FCVAR_ARCHIVE}, "Should crouching have an additional offset?", 0, 1)
    CreateConVar("tpc_fovmp", 1, {FCVAR_ARCHIVE}, "Should FOV be affected by certain actions?", 0, 1)
    CreateConVar("tpc_ftmp", 25, {FCVAR_ARCHIVE}, "The amount of times the Frame Time will be multiplied by. The higher, the faster.", 0, 100)
    CreateConVar("tpc_fovftmp", 5, {FCVAR_ARCHIVE}, "The amount of times the Frame Time will be multiplied by, ONLY for the FOV! The higher, the faster.", 0)
    CreateConVar("tpc_backoffset", 50, {FCVAR_ARCHIVE}, "How far should the camera be away from the player from back to front.", 0, 250)
    CreateConVar("tpc_rightoffset", 25, {FCVAR_ARCHIVE}, "How far should the camera be away from the player from left to right.", -100, 100)
    CreateConVar("tpc_upoffset", 5, {FCVAR_ARCHIVE}, "How far should the camera be away from the player from north to south.", -100, 100)
    CreateConVar("tpc_camtilt", 1, {FCVAR_ARCHIVE}, "The multiplier of how much camera tilt should be when falling.", 0, 100)
    CreateConVar("tpc_precision", 0, {FCVAR_ARCHIVE}, "Should the crosshair of the weapon the player is holding always be centered?", 0, 1)
    CreateConVar("tpc_deathcam", 0, {FCVAR_ARCHIVE}, "Should the camera be enabled while dead?", 0, 1)
    CreateConVar("tpc_fortnite", 15, {FCVAR_ARCHIVE}, "How much to the front should the camera be? 15 is recommended for battle royale.")
    CreateConVar("tpc_pitchrotation", 0, {FCVAR_ARCHIVE}, "How much should the camera be rotated from north to south. This value will NOT work when precision is enabled!", 0, 360)
    CreateConVar("tpc_yawrotation", 0, {FCVAR_ARCHIVE}, "How much should the camera be rotated from left to right. This value will NOT work when precision is enabled!", 0, 360)
    CreateConVar("tpc_rollrotation", 0, {FCVAR_ARCHIVE}, "How much should the camera be tilted. This value will NOT work when precision is enabled!", 0, 360)
    CreateConVar("tpc_drawviewer", 1, {FCVAR_ARCHIVE}, "Should the player be visible?", 0, 1)
    CreateConVar("tpc_togglekey", 0, {FCVAR_ARCHIVE}, "What key will toggle between first and third person?")

    local temerel = vector_origin
    local micea = angle_zero
    local dacatunanai = 0
    local jeaskeres = true

    local function determineTemerel(ply, ang)
        local offset = vector_origin

        if ply:Crouching() and ply:GetMoveType() ~= MOVETYPE_NOCLIP and ply:OnGround() and GetConVar("tpc_crouchoffset"):GetBool() then
            offset = offset + ang:Right() * 10 + ang:Up() * 12.5
        end

        return offset
    end

    local function detemineMiCea(ply)
        local micea = angle_zero

        micea = micea + Angle(GetConVar("tpc_pitchrotation"):GetFloat(), GetConVar("tpc_yawrotation"):GetFloat(), GetConVar("tpc_rollrotation"):GetFloat())

        if not ply:OnGround() then
            micea = micea + Angle(0, 0, GetConVar("tpc_camtilt"):GetFloat() * (ply:GetVelocity().z / 200) * math.sin(2 * math.pi * 1.25 * CurTime()))
        end

        return micea
    end

    local function determineDacaTuNaNai(ply)
        local fovmp = 1

        if not GetConVar("tpc_fovmp"):GetBool() then return fovmp end

        if not ply:OnGround() then
            fovmp = fovmp * 1.025
        end

        if ply:IsSprinting() and ply:GetVelocity():LengthSqr() >= (ply:GetSlowWalkSpeed() * 0.95) * (ply:GetSlowWalkSpeed() * 0.95) and ply:OnGround() then
            fovmp = fovmp * 1.025
        end
        
        if ply:Crouching() and ply:GetMoveType() ~= MOVETYPE_NOCLIP and ply:OnGround() then
            fovmp = fovmp * 0.8975
        end

        return fovmp
    end

    local function determineJeaskeres()
        return GetConVar("tpc_drawviewer"):GetBool()
    end

    local lastPressed = false
    local keyPressed = false
    local trulyPressed = false
    hook.Add("Think", "fortnite-keypress", function()
        if not GetConVar("tpc_togglekey"):GetBool() then return end
        lastPressed = keyPressed
        local chk = input.IsKeyDown(GetConVar("tpc_togglekey"):GetInt())
        keyPressed = chk

        if not lastPressed and keyPressed then
            trulyPressed = not trulyPressed
            GetConVar("tpc_enabled"):SetBool(trulyPressed)
        end
    end)

    hook.Add("CalcView", "fortnite-camera", function(ply, pos, ang, fov)
        local hooker = hook.Run("fortnite-camera-disable")
        if not GetConVar("tpc_enabled"):GetBool() or hooker ~= nil and hooker == true then return end
        if not ply:Alive() and not GetConVar("tpc_deathcam"):GetBool() then return end
        if ply:ShouldDrawLocalPlayer() or ply:GetViewEntity() ~= ply or IsValid(ply:GetObserverTarget()) then return end
        temerel = LerpVector(GetConVar("tpc_smoothing"):GetBool() and FrameTime() * GetConVar("tpc_ftmp"):GetFloat() or 1, temerel, pos + determineTemerel(ply, ang) + Angle(0, ang.y, ang.r):Forward() * GetConVar("tpc_fortnite"):GetFloat() - ang:Forward() * GetConVar("tpc_backoffset"):GetFloat() + ang:Right() * GetConVar("tpc_rightoffset"):GetFloat() + ang:Up() * GetConVar("tpc_upoffset"):GetFloat())
        local tr = util.TraceHull({
            start = ply:GetShootPos(),
            endpos = temerel,
            maxs = Vector(5, 5, 5),
            mins = Vector(-5, -5, -5),
            filter = ply
        })
        if tr.HitPos ~= temerel then
            temerel = tr.HitPos
        end

        if GetConVar("tpc_precision"):GetBool() then
            micea = LerpAngle(GetConVar("tpc_smoothing"):GetBool() and FrameTime() * GetConVar("tpc_ftmp"):GetFloat() or 1, micea, (ply:GetEyeTraceNoCursor().HitPos - temerel):GetNormalized():Angle())
        else
            micea = LerpAngle(GetConVar("tpc_smoothing"):GetBool() and FrameTime() * GetConVar("tpc_ftmp"):GetFloat() or 1, micea, ang + detemineMiCea(ply))
        end

        dacatunanai = Lerp(GetConVar("tpc_fovmp"):GetBool() and FrameTime() * GetConVar("tpc_fovftmp"):GetFloat() or 1, dacatunanai, ply:GetFOV() * determineDacaTuNaNai(ply))
        jeaskeres = determineJeaskeres()
        local view = {
            origin = temerel,
            angles = micea,
            fov = dacatunanai,
            drawviewer = jeaskeres
        }
    
        return view
    end)
end