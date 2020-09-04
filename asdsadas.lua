local aimkey = Enum.UserInputType.MouseButton2;
local enabled = false;
local camera = workspace.CurrentCamera;
local down = false;
local aimpart = "Head";
local tsp = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2 + 400);
local gs = game:GetService("GuiService"):GetGuiInset();
local sc = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2);
local fov = 120;
local fovenabled = false;
local rainbowfov = false;
local teamcheck = false;
local walkspeedenabled = false
local triggerbot = false;
local healthcheck = false;
local visibilitycheck = false;
local counter = 0;
_G.Spread = false
local FlyOrWhat = false --Fly
local AutoRes = false 
_G.On = false --Tracers
_G.Aim = false;
local wall = false;
--create variables
plrs = game:service'Players'
lp = plrs.LocalPlayer
char = lp.Character
_G.NoFallDamage = false;
_G.Spam = false --No Spam Kick
--Initialize Functions
local GetAllPlayerParts
local WeaponTable
local breakwin
local deployfunc



  --get function used for breaking windows
  function gettable()
  for i, v in pairs(getgc(true)) do
     if type(v) == "table" and rawget(v, "effects") then
  breakwin = v.effects.module.breakwindow
     end
  end
  end
  spawn(gettable)

function GetFunc()
    for i, v in pairs(getgc(true)) do
      if type(v) == "function" and debug.getinfo(v).name == "getallparts" then
        local a = v()
        if type(a) == "table" then
          GetAllPlayerParts = v --yes using game function for ESP cuz why not?
        end
      end
    end
  end



  local Network;
  local old;
  
  for i,v in next, getreg() do
      if type(v) == "function" then
          for i,v in next, debug.getupvalues(v) do
              if type(v) == "table" and rawget(v, 'send') then
                  Network = v;
                  old = v.send;
              end
          end
      end
  end
  
  Network.send = function(self, ...)
      local Args = {...}
      if Args[1] == "changehealthx" and _G.NoFallDamage then
          return;
      end
      return old(self, unpack(Args))
  end






-- ##  Varibles  ## --
local test = false;
local Visibility = false;
local Camera = game:GetService("Workspace").CurrentCamera
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local FontValue = 3


local Lib = loadstring(game:HttpGet("https://pastebinp.com/raw/GCM3Zpzg",true))()
local Table = {}
local window = Lib:CreateWindow("Main")
local window2 = Lib:CreateWindow("Visuals")
local window3 = Lib:CreateWindow("Gun Mods")
window3:Button("Fast Bullets",function()
    local V = Vector3.new()
    for i, data in pairs(getgc(true)) do
      if type(data) == "table" and rawget(data, "camkickmax") then
        data.bulletspeed = 999;
      end
    end
end)

window3:Button("Fast Bullets",function()
    local V = Vector3.new()
    for i, data in pairs(getgc(true)) do
      if type(data) == "table" and rawget(data, "camkickmax") then
       data.penetrationdepth = 3000; --yeah its client side...
      end
    end
end)

window3:Button("No Sway",function()
    local V = Vector3.new()
    for i, data in pairs(getgc(true)) do
      if type(data) == "table" and rawget(data, "camkickmax") then
        data.swayamp = 0
        data.swayspeed = 0
        data.steadyspeed = 0
        data.breathspeed = 0
      end
    end
end)

window2:Toggle("Esp",{location = Table, flag = "Toggle"},function(ui)
    Visibility = Table["Toggle"]
end)
window2:Toggle("Fov",{location = Table, flag = "Toggle"},function(ui)
    fovenabled = Table["Toggle"]
end)
window2:Toggle("Rainbow Fov",{location = Table, flag = "Toggle"},function(ui)
    rainbowfov = Table["Toggle"]
end)
window2:Button("Rainbow Gun",function()
    game:GetService("RunService").Stepped:Connect(function()
        for a,b in pairs(workspace.Camera:GetChildren()) do 
        for c,d in pairs(game:GetService("ReplicatedStorage").GunModels:GetChildren()) do 
        if b.Name == d.Name then 
        for e,f in pairs(b:GetChildren()) do 
        if f:IsA("BasePart") then 
        f.Color = Color3.fromHSV(tick()%5/5,1,1)
        end
        end
        end
        end
        end
        end)
end)
window2:Toggle("No Falldamage",{location = Table, flag = "Toggle"},function(ui)
    _G.NoFallDamage = Table["Toggle"]
end)

window3:Toggle("Rage Mods",{location = Table, flag = "Toggle"},function(ui)
    _G.Spread = Table["Toggle"]
      loadstring(game:HttpGet("https://pastebinp.com/raw/DGDusfF9"))();
end)


window:Toggle("Silent Aim",{location = Table, flag = "Toggle"},function(ui)
    _G.Aim = Table["Toggle"]
    loadstring(game:HttpGet("https://pastebin.com/raw/WV6genzS"))();
end)

window:Toggle("Fly",{location = Table, flag = "Toggle"},function(ui)
    FlyOrWhat = Table["Toggle"]
end)

window:Toggle("Speed",{location = Table, flag = "Toggle"},function(ui)
    walkspeedenabled = Table["Toggle"]
    local walkspeedplayer = game:GetService("Players").LocalPlayer
	local walkspeedmouse = walkspeedplayer:GetMouse()
 
 
	function x_walkspeed(key)
		if (key == "w") then
			if walkspeedenabled == false then
				_G.WS = 36;
				local Humanoid = game:GetService("Players").LocalPlayer.Character.Humanoid;
				Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
				Humanoid.WalkSpeed = _G.WS;
				end)
				Humanoid.WalkSpeed = _G.WS;
 
				walkspeedenabled = true
			elseif walkspeedenabled == true then
				_G.WS = 36;
				local Humanoid = game:GetService("Players").LocalPlayer.Character.Humanoid;
				Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
				Humanoid.WalkSpeed = _G.WS;
				end)
				Humanoid.WalkSpeed = _G.WS;
 
				walkspeedenabled = false
			end
		end
	end
 
	walkspeedmouse.KeyDown:connect(x_walkspeed)
 
end)








--##   Scripts ##--
local function CycleFont()
    if FontValue + 1 > 3 then
       FontValue = 1
    else
        FontValue = FontValue + 1
    end
end

local function ModelTemplate()
   local Objects = {
       Box = Drawing.new("Quad"),
       Name = Drawing.new("Text"),
   } 
   
   return Objects
end

local function GetPartCorners(Part)
	local Size = Part.Size * Vector3.new(1, 1.5)
	return {
        TR = (Part.CFrame * CFrame.new(-Size.X, -Size.Y, 0)).Position,
		BR = (Part.CFrame * CFrame.new(-Size.X, Size.Y, 0)).Position,
		TL = (Part.CFrame * CFrame.new(Size.X, -Size.Y, 0)).Position,
		BL = (Part.CFrame * CFrame.new(Size.X, Size.Y, 0)).Position,
	}
end

local function ApplyModel(Model)
    local Objects = ModelTemplate()
    local CurrentParent = Model.Parent
    
    spawn(function()
        Objects.Name.Center = true
        Objects.Name.Visible = true
        Objects.Name.Outline = true
        Objects.Name.Transparency = 1
        Objects.Box.Visible = true
        Objects.Box.Transparency = 1
       
        while Model.Parent == CurrentParent do
            local Vector, OnScreen = Camera:WorldToScreenPoint(Model.Head.Position)
            local Distance = (Camera.CFrame.Position - Model.HumanoidRootPart.Position).Magnitude
            
            if OnScreen and Model.Parent.Name ~= game:GetService("Players").LocalPlayer.Team.Name and Visibility then
                Objects.Name.Position = Vector2.new(Vector.X, Vector.Y + math.clamp(Distance / 10, 10, 30) - 10)
                Objects.Name.Size = math.clamp(30 - Distance / 10, 10, 30)
                Objects.Name.Color = Color3.fromHSV(math.clamp(Distance / 5, 0, 125) / 255, 0.75, 1)
                Objects.Name.Visible = true
                Objects.Name.Transparency = math.clamp((500 - Distance) / 200, 0.2, 1)
            else
                Objects.Name.Visible = true 
            end
            
            local PartCorners = GetPartCorners(Model.HumanoidRootPart)
            local VectorTR, OnScreenTR = Camera:WorldToScreenPoint(PartCorners.TR)
            local VectorBR, OnScreenBR = Camera:WorldToScreenPoint(PartCorners.BR)
            local VectorTL, OnScreenTL = Camera:WorldToScreenPoint(PartCorners.TL)
            local VectorBL, OnScreenBL = Camera:WorldToScreenPoint(PartCorners.BL)
            
            if (OnScreenBL or OnScreenTL or OnScreenBR or OnScreenTR) and Model.Parent.Name ~= game:GetService("Players").LocalPlayer.Team.Name and Visibility then
                Objects.Box.PointA = Vector2.new(VectorTR.X, VectorTR.Y + 36)
                Objects.Box.PointB = Vector2.new(VectorTL.X, VectorTL.Y + 36)
                Objects.Box.PointC = Vector2.new(VectorBL.X, VectorBL.Y + 36)
                Objects.Box.PointD = Vector2.new(VectorBR.X, VectorBR.Y + 36)
                Objects.Box.Color = Color3.fromHSV(math.clamp(Distance / 5, 0, 125) / 255, 0.75, 1)
                Objects.Box.Thickness = math.clamp(3 - (Distance / 100), 0, 3)
                Objects.Box.Transparency = math.clamp((500 - Distance) / 200, 0.2, 1)
                Objects.Box.Visible = true
            else
                Objects.Box.Visible = false
            end
            
            RunService.RenderStepped:Wait()
        end
        
        Objects.Name:Remove()
        Objects.Box:Remove()
    end)
end

for _, Player in next, game:GetService("Workspace").Players.Phantoms:GetChildren() do
    ApplyModel(Player)
end

for _, Player in next, game:GetService("Workspace").Players.Ghosts:GetChildren() do
    ApplyModel(Player)
end

game:GetService("Workspace").Players.Phantoms.ChildAdded:Connect(function(Player)
    delay(0.5, function()
        ApplyModel(Player)
    end)
end)

game:GetService("Workspace").Players.Ghosts.ChildAdded:Connect(function(Player)
    delay(0.5, function()
        ApplyModel(Player)
    end)
end)
















  function StartESP()
    while wait(1) do
      --yeah this is some cringe stuff right here but im too lazy to remake
      if ESP == false then
        for i,v in pairs(GetAllPlayerParts()) do
          if tostring(v) == "Head" or tostring(v) == "Torso" or tostring(v) == "HumanoidRootPart" or tostring(v) == "Left Leg"  or tostring(v) == "Right Leg"  or tostring(v) == "Right Arm" or tostring(v) == "Left Arm" then
            if v:FindFirstChild("Friendly") then
              v.Friendly:Destroy()
            end
            if v:FindFirstChild("Enemy") then
              v.Enemy:Destroy()
            end
          end
        end
        break
      end
      --DrawGUI
      for a,b in pairs(GetAllPlayerParts()) do
        if tostring(b) == "Head" or tostring(b) == "Torso" or tostring(b) == "HumanoidRootPart" or tostring(b) == "Left Leg"  or tostring(b) == "Right Leg"  or tostring(b) == "Right Arm" or tostring(b) == "Left Arm" then
          if tostring(game.Players.LocalPlayer.Team) ~= tostring(b.Parent.Parent) then
            DrawGUI(255,0,0,b,"Friendly")
          else
            DrawGUI(13,255,48,b,"Enemy")
          end
        end
      end
    end
  end
function tracers()
   
    while wait(1) do
          
          if _G.On == false then
            
           for i,v in pairs(GetAllPlayerParts()) do
          if tostring(v) == "Head" or tostring(v) == "Torso" or tostring(v) == "HumanoidRootPart" or tostring(v) == "Left Leg"  or tostring(v) == "Right Leg"  or tostring(v) == "Right Arm" or tostring(v) == "Left Arm" then
            if v:FindFirstChild("Attachment") then
              v.Attachment:Destroy()
            end
       
          end
        end
        break
              end
       
   for i,v in pairs(GetAllPlayerParts()) do
       
      if tostring(v) == "Head" or tostring(v) == "Torso" or tostring(v) == "HumanoidRootPart" or tostring(v) == "Left Leg"  or tostring(v) == "Right Leg"  or tostring(v) == "Right Arm" or tostring(v) == "Left Arm" then
            if v:FindFirstChild("Attachment") then
              v.Attachment:Destroy()
            end
          end
       if  tostring(v) == "HumanoidRootPart"  and _G.On == true then
            local success, message = pcall(function()
               
           beam = Instance.new('Beam', plrs.LocalPlayer.Character.HumanoidRootPart)
         
           beam.Name = 'Beam'
           beam.FaceCamera = true
		     beam.Width0 = .1
           beam.Width1 = .1
             if tostring(game.Players.LocalPlayer.Team) ~= tostring(v.Parent.Parent) then
             beam.Color = ColorSequence.new(Color3.fromRGB(255,0,0),Color3.fromRGB(255,0,0))
           else
             beam.Color = ColorSequence.new(Color3.fromRGB(0,255,0),Color3.fromRGB(0,255,0))
           end
           one = Instance.new('Attachment', plrs.LocalPlayer.Character.HumanoidRootPart)
           two = Instance.new('Attachment', v)
           beam.Attachment0 = one
           beam.Attachment1 = two
             end)
       end
     
   end

end
end


--Fly (I take no credits for this fly i might make my own if i decide to update this)

local binds = {}
local binds_first = {}
local forcebinds = {}
local uis = game:GetService'UserInputService';

function bind(key, func)
	binds[key] = func;
end
function bind_first(key, func)
	binds_first[key] = func;
end
function forcebind(key, func)
	forcebinds[key] = func;
end
function unbind(key)
	binds[key] = nil;
	binds_first[key] = nil;
end

uis.InputBegan:Connect(function(key)
	key = key.KeyCode.Name:lower();
	local inChat = uis:GetFocusedTextBox() and true or false;
	if not inChat then
		if binds_first[key] and typeof(binds_first[key]) == 'function' then
			binds_first[key]();
		end
	end
end)

uis.InputEnded:Connect(function(input)
	key = input.KeyCode.Name:lower();
	local inChat = uis:GetFocusedTextBox();
	if not inChat then
		if binds[key] and typeof(binds[key]) == 'function' and input.UserInputType.Name == 'Keyboard' then
			binds[key]();
		end
		if input.UserInputType.Name == 'MouseButton1' and binds.mouse1 ~= nil then
			binds.mouse1();
		end
		if input.UserInputType.Name == 'MouseButton2' and binds.mouse2 ~= nil then
			binds.mouse2();
		end
	else
		if forcebinds[key] and typeof(binds[key]) == 'function' then
			forcebinds[key]();
		end
	end
end)

getgenv().bind = bind;
getgenv().bind_first = bind_first;
getgenv().forcebind = forcebind;
getgenv().unbind = unbind;
local input = {}
local uis = game:service'UserInputService'

input.mouse = game:GetService'Players'.LocalPlayer:GetMouse();

input.down = setmetatable({}, {
	__index = function(i, v)
		local isDown = false;
		v = v:lower();
		for _, key in pairs(Enum.UserInputType:GetEnumItems()) do
			if (key.Name:lower() == v and uis:IsMouseButtonPressed(key.Name)) then
				isDown = true;
			end
		end
		for _, key in pairs(Enum.KeyCode:GetEnumItems()) do
			if (key.Name:lower() == v and uis:IsKeyDown(key.Name)) then
				isDown = true;
			end
		end
		return isDown
	end
})

getgenv().input = input;

local player = game:GetService'Players'.LocalPlayer;
local mouse = player:GetMouse();
local camera = workspace.CurrentCamera;
local runservice = game:GetService'RunService';
local uis = game:GetService'UserInputService';

local fly = true;
local lsf = 0;
local flySpeed = 50;
local maxSpeed = 260;
local disp;

local gayGames = {
    3016661674;
    3541987450;
};

for i, v in ipairs(gayGames) do
    gayGames[v] = true;
    gayGames[i] = false;
end

local gay = gayGames[game.PlaceId];

shared.sfls = script;

if Drawing then
    disp = shared.fdisp or Drawing.new'Text';
    disp.Text = 'FlySpeed: ' .. flySpeed;
    disp.Size = 18;
    disp.Center = false;
    disp.Outline = true;
    disp.Visible = true;
    disp.Color = Color3.new(1, 1, 1);
    disp.Position = Vector2.new(150, 7);

    shared.fdisp = disp;
end

function IsInZone(Object1, Object2, YCheck) -- broken 2 lazy 2 fix
    if (typeof(Object1) ~= 'Instance' and typeof(Object1) ~= 'table') or (typeof(Object2) ~= 'Instance' and typeof(Object2) ~= 'table') then return 'NIGGER'; end
    if YCheck ~= nil and typeof(YCheck) ~= 'boolean' then return end

    YCheck = (YCheck ~= nil and YCheck or false);

    local RYCheck = true;

    local Object = Object1;
    
    local Positive = (Object2.CFrame * CFrame.new(Object2.Size.X / 2, Object2.Size.Y / 2, Object2.Size.Z / 2));
    local Negative = (Object2.CFrame * CFrame.new(-Object2.Size.X / 2, -Object2.Size.Y / 2, -Object2.Size.Z / 2));

    if YCheck then
        RYCheck = (YCheck == true and
            (Object.Position.Y > Positive.Y) and
            (Object.Position.Y < Negative.Y));
    end

    -- print(1, (Object.Position.X < Positive.X), Object.Position.X, Positive.X)
    -- print(2, (Object.Position.X > Negative.X), Object.Position.X, Negative.X)
    -- print(3, (Object.Position.Z > Positive.Z), Object.Position.Z, Positive.Z)
    -- print(4, (Object.Position.Z < Negative.Z), Object.Position.Z, Negative.Z)
    -- print(5, RYCheck);

    return (Object.Position.X < Positive.X) and
        (Object.Position.X > Negative.X) and
        (Object.Position.Z > Positive.Z) and
        (Object.Position.Z < Negative.Z) and
        (RYCheck);
end

function GetIndex(Table, Value)
    for i, v in pairs(Table) do
        if v == Value then
            return i;
        end
    end

    return -1;
end

local PartIgnore = {};

function DisableClip(Part)
    if Part:IsA'BasePart' and Part.CanCollide then
        local Start = tick();
        local OldTransparency = Part.Transparency;
        
        table.insert(PartIgnore, Part);

        while tick() - Start < 300 and player.Character and player.Character:FindFirstChild'HumanoidRootPart' and not input.down.f4 do
            
            if not input.down.space then
                break;
            end

            Part.CanCollide = false;
            
            Part.Transparency = 0.75;

            wait(1 / 8);
        end

        table.remove(PartIgnore, GetIndex(PartIgnore, Part));

        Part.Transparency = OldTransparency;
        Part.CanCollide = true;
    end
end

local lastDC = 0;


uis.InputChanged:Connect(function(Input)
    if script ~= shared.sfls then return; end

    if Input.UserInputType == Enum.UserInputType.MouseWheel then
        if input.down.leftcontrol then
            local inc = Input.Position.Z > 0 and 25 or -25;

            flySpeed = math.clamp(flySpeed + (inc * (input.down.leftshift and 2 or 1)), 0, maxSpeed);
            lastDC = tick();
        end
    end

  
end);

local lastSpace = 0;

bind_first('space', function()
    if fly and FlyOrWhat == true and tick() - lastSpace < 0.3 and player.Character and player.Character:FindFirstChild'HumanoidRootPart' and player.Character:FindFirstChildOfClass'Humanoid' then
        local root = player.Character.HumanoidRootPart;
        local hum = player.Character:FindFirstChildOfClass'Humanoid';
        
        while input.down.space and fly do
            if not gay then hum.PlatformStand = true; end
            local start = mouse.Hit.p;
            local dir = (start - camera.CFrame.p);

            root.Velocity = dir.unit * (math.random((flySpeed - 1) * 1000, (flySpeed + 2.5) * 1000) / 1000); -- adds random speed so the velocity doesn't always measure to a certain amount (prevents detection)

            local ray = Ray.new(root.Position, dir.unit * 50);
            local hit, pos = workspace:FindPartOnRayWithIgnoreList(ray, {player.Character, camera, unpack(PartIgnore)});

            

            runservice.RenderStepped:wait();
        end
        
        if not gay then
            hum.PlatformStand = false;
            root.Velocity = Vector3.new();
            hum:SetStateEnabled(0, false);
        end
    end

    lastSpace = tick();
end)

--auto respawn 
local function onChanged(property)
if tostring(property) == "Visible" and AutoRes == true then
    local repeater = 0
wait(0.5)
                    repeat
                        repeater = repeater + 1
						deployfunc.deploy()
				print(deployfunc.isdeployed())
					until deployfunc.isdeployed() == true or repeater == 2
end
end
game.Players.LocalPlayer.PlayerGui.MainGui.GameGui.Changed:Connect(onChanged)

function FullBright()
if not _G.FullBrightExecuted then

	_G.FullBrightEnabled = false

	_G.NormalLightingSettings = {
		Brightness = game:GetService("Lighting").Brightness,
		ClockTime = game:GetService("Lighting").ClockTime,
		FogEnd = game:GetService("Lighting").FogEnd,
		GlobalShadows = game:GetService("Lighting").GlobalShadows,
		Ambient = game:GetService("Lighting").Ambient
	}

	game:GetService("Lighting"):GetPropertyChangedSignal("Brightness"):Connect(function()
		if game:GetService("Lighting").Brightness ~= 1 and game:GetService("Lighting").Brightness ~= _G.NormalLightingSettings.Brightness then
			_G.NormalLightingSettings.Brightness = game:GetService("Lighting").Brightness
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").Brightness = 1
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("ClockTime"):Connect(function()
		if game:GetService("Lighting").ClockTime ~= 12 and game:GetService("Lighting").ClockTime ~= _G.NormalLightingSettings.ClockTime then
			_G.NormalLightingSettings.ClockTime = game:GetService("Lighting").ClockTime
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").ClockTime = 12
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(function()
		if game:GetService("Lighting").FogEnd ~= 786543 and game:GetService("Lighting").FogEnd ~= _G.NormalLightingSettings.FogEnd then
			_G.NormalLightingSettings.FogEnd = game:GetService("Lighting").FogEnd
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").FogEnd = 786543
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("GlobalShadows"):Connect(function()
		if game:GetService("Lighting").GlobalShadows ~= false and game:GetService("Lighting").GlobalShadows ~= _G.NormalLightingSettings.GlobalShadows then
			_G.NormalLightingSettings.GlobalShadows = game:GetService("Lighting").GlobalShadows
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").GlobalShadows = false
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("Ambient"):Connect(function()
		if game:GetService("Lighting").Ambient ~= Color3.fromRGB(178, 178, 178) and game:GetService("Lighting").Ambient ~= _G.NormalLightingSettings.Ambient then
			_G.NormalLightingSettings.Ambient = game:GetService("Lighting").Ambient
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
		end
	end)

	game:GetService("Lighting").Brightness = 1
	game:GetService("Lighting").ClockTime = 12
	game:GetService("Lighting").FogEnd = 786543
	game:GetService("Lighting").GlobalShadows = false
	game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)

	local LatestValue = true
	spawn(function()
		repeat
			wait()
		until _G.FullBrightEnabled
		while wait() do
			if _G.FullBrightEnabled ~= LatestValue then
				if not _G.FullBrightEnabled then
					game:GetService("Lighting").Brightness = _G.NormalLightingSettings.Brightness
					game:GetService("Lighting").ClockTime = _G.NormalLightingSettings.ClockTime
					game:GetService("Lighting").FogEnd = _G.NormalLightingSettings.FogEnd
					game:GetService("Lighting").GlobalShadows = _G.NormalLightingSettings.GlobalShadows
					game:GetService("Lighting").Ambient = _G.NormalLightingSettings.Ambient
				else
					game:GetService("Lighting").Brightness = 1
					game:GetService("Lighting").ClockTime = 12
					game:GetService("Lighting").FogEnd = 786543
					game:GetService("Lighting").GlobalShadows = false
					game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
				end
				LatestValue = not LatestValue
			end
		end
	end)
end

_G.FullBrightExecuted = true
_G.FullBrightEnabled = not _G.FullBrightEnabled
end
local cam = game.Workspace.CurrentCamera

local function WallChecker(p, ...)
   return #cam:GetPartsObscuringTarget({p}, {cam, lp.Character, ...}) == 0
end
game:GetService('RunService').RenderStepped:connect(function()
	if ENABLED then
		local TARGET = GetNearestPlayerToMouse()
		  local aimAt = WorldToScreen(TARGET.Head.Position) 
        local mouseLocation = WorldToScreen(MOUSE.Hit.p)
         local incrementX, incrementY = (aimAt.X - mouseLocation.X) / 10, (aimAt.Y - mouseLocation.Y) / 10
   
         if tostring(game.Players.LocalPlayer.Team) ~= tostring(TARGET.Parent) and aim == true then
if WallChecker(TARGET.Head.Position, TARGET) and wall == true then
     mousemoverel(incrementX, incrementY)
end
if wall == false then
      mousemoverel(incrementX, incrementY)
    end

end
	
	end
end)



local Players = game:GetService("Players");
local Client = Players.LocalPlayer;
local Mouse = Client:GetMouse();

local mousemoverel = mousemoverel or Input.MouseMove;


local NotObstructing = function(destination, ignore)
    local Origin = workspace.CurrentCamera.CFrame.p
    local CheckRay = Ray.new(Origin, destination- Origin)
    local Hit = workspace:FindPartOnRayWithIgnoreList(CheckRay, ignore)
    return Hit == nil
end 

function Circle(color)
    local circ = Drawing.new('Circle')
    circ.Transparency = 1
    circ.Thickness = 1.5
    circ.Visible = true
    circ.Color = color
    circ.Filled = false
    circ.Radius = fov
    return circ
end

function zigzag(X) 
    return math.acos(math.cos(X*math.pi))/math.pi 
end

local GetRel = function(x, y)
	local newy
	local newy
	if x > sc.X then
		newx = -(sc.X - x)
	else
		newx = x - sc.X
	end
	if y > sc.Y then
		newy = -(sc.Y - y)
	else
		newy = y - sc.Y
	end
	return newx, newy
end


curc = Circle(Color3.fromRGB(255,255,255));



local NotObstructing = function(destination, ignore)
    local Origin = workspace.CurrentCamera.CFrame.p
    local CheckRay = Ray.new(Origin, destination- Origin)
    local Hit = workspace:FindPartOnRayWithIgnoreList(CheckRay, ignore)
    return Hit == nil
end 

game:GetService("UserInputService").InputBegan:Connect(function( input )
    if input.UserInputType  == aimkey then
        down = true
    end
end)

game:GetService("UserInputService").InputEnded:Connect(function( input )
    if input.UserInputType == aimkey then
        down = false
    end
end)

game:GetService("RunService").RenderStepped:Connect(function( ... )
    if enabled then
        if down then
            if GetClosestPlayer() ~= nil and GetClosestPlayer().Character:FindFirstChild(aimpart) then
                pcall(function( ... )
                    local pos,visible = camera:WorldToScreenPoint(GetClosestPlayer().Character[aimpart].Position)
                    local x, y = GetRel(pos.X, pos.Y + gs.Y)
                    mousemoverel(x, y)
                end)
			end
        end
    end
    if triggerbot then
        if Mouse.Target then
			if IsPlayer(Mouse.Target.Name) or IsPlayer(Mouse.Target.Parent.Name) or IsPlayer(Mouse.Target.Parent.Parent.Name) or IsPlayer(Mouse.Target.Parent.Parent.Parent.Name) then
				mouse1press()
				wait(0.01)
				mouse1release()
			end
		end
    end
    curc.Visible = fovenabled
	curc.Position = Vector2.new(Mouse.X, Mouse.Y+gs.Y)
	curc.Radius = fov
    curc.NumSides = 15
    if rainbowfov then
        curc.Color = Color3.fromHSV(zigzag(counter),1,1)
    end
    counter = counter + 0.01
end)
