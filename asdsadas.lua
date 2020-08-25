local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/yusufupvpytt/LIGHTNING-hub/master/lib31.lua"))()
local Arsenal = library.new("Astral Hub", 5013109572)

-- themes
local themes = {
Background = Color3.fromRGB(24, 24, 24),
Glow = Color3.fromRGB(0, 0, 0),
Accent = Color3.fromRGB(10, 10, 10),
LightContrast = Color3.fromRGB(20, 20, 20),
DarkContrast = Color3.fromRGB(14, 14, 14),  
TextColor = Color3.fromRGB(255, 255, 255)
}



local ESP = false --ESP
local FlyOrWhat = false --Fly
local AutoRes = false --Auto Respawn
_G.On = false --Tracers
local aim = false;
local wall = false;
--create variables
plrs = game:service'Players'
lp = plrs.LocalPlayer
char = lp.Character
_G.Fall = false --No Fall Damage
_G.Spam = false --No Spam Kick
--Initialize Functions
local GetAllPlayerParts
local WeaponTable
local breakwin
local deployfunc


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
  function GetDeployFunc() --Get the func used for spawning
  for i, v in pairs(getgc(true)) do
     if type(v) == "table" and rawget(v, "deploy") then
  deployfunc = v
     end
  end
  end
  spawn(GetDeployFunc)
  function HookAmmo() --Useless for now
  for i, v in pairs(getgc(true)) do
   if type(v) == "function" and debug.getinfo(v).name == "updateammo" then
  
  local OldFunction
  local Hook = function(self, ...)
  local Args = {...}
  if Args[1] == 0 and Args[2] > 0 then
  print("No Ammo")
  end
  return OldFunction(self, ...)
  end
  OldFunction = hookfunction(v, Hook)
  
  end
  end
  end
  spawn(HookAmmo)
  
  --hook
      local OldFunction
    function HookItNow()
       local func
  for i, v in pairs(getgc(true)) do
    if type(v) == "function" and debug.getinfo(v).name == "send" then
      func = v
    end
  end
  local OldFunction
  local Hook = function(self, ...)
  local Args = {...}
  local name = Args[1]
  for a,b in pairs(self) do
  self.playerping = self.serverping
  end
  
  if name == 'newpos' then
      --return  yes those kids are smart not letting me make kill all
  end
  if name == 'closeconnection' and _G.Spam == true then --anti kick
      return
      end
  if name == 'changehealthx' then
    if #Args > 4 and Args[3] == 'Falling' and _G.Fall == true then --anti fall damage
      return
    end
  end
  return OldFunction(self, ...)
  end
  OldFunction = hookfunction(func, Hook)
  end
    spawn(HookItNow)
  
    --Modify some messages cuz why not?
  for i, v in pairs(getgc(true)) do
     if type(v) == "table" and rawget(v, "squad") then
         v.kill = {"You killed your enemy with the help of gogo1000"}
         v.suppression = {"You suppressed the enemy with the help of gogo1000"}
     end
  end
  
  
  --Draw ESP function
  local function DrawGUI(R,G,B,pos,name)
    if not pos:FindFirstChild(name) then
      local box = Instance.new("BoxHandleAdornment", pos)
      box.AlwaysOnTop = true
      box.Adornee = pos
      box.Size = pos.Size
      box.Color3 = Color3.fromRGB(R,G,B)
      box.Name = name
      box.ZIndex = 5
    end
  end
  
  spawn(GetFunc)
  
  
  --get function used for breaking windows
  function gettable()
  for i, v in pairs(getgc(true)) do
     if type(v) == "table" and rawget(v, "effects") then
  breakwin = v.effects.module.breakwindow
     end
  end
  end
  spawn(gettable)





local page = Arsenal:addPage("Main", 5012544693)
local page2 = Arsenal:addPage("Gun Mods", 5012544693)
local page3 = Arsenal:addPage("Other", 5012544693)
local section1 = page:addSection(" ")
local section2 = page:addSection(" ")
local section3 = page2:addSection(" ")
local section4 = page3:addSection("")

section3:addButton("No Recoil", function()
    for i, data in pairs(getgc(true)) do
        if type(data) == "table" and rawget(data, "camkickmax") then
          local V = Vector3.new()
          data.camkickmin = V
          data.camkickmax = V
          data.aimcamkickmin = V
          data.aimcamkickmax = V
          data.aimtranskickmin = V
          data.aimtranskickmax = V
          data.transkickmin = V
          data.transkickmax = V
          data.rotkickmin = V
          data.rotkickmax = V
          data.aimrotkickmin = V
          data.aimrotkickmax = V
        end
      end
end)
section3:addButton("Full Auto", function()
    local V = Vector3.new()
  for i, data in pairs(getgc(true)) do
    if type(data) == "table" and rawget(data, "camkickmax") then
       for a,b in pairs(data.firemodes) do
          data.firemodes = {true, 3, 1}
        
         end
    end
  end
end)

section3:addButton("No Sway", function()
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
section3:addButton("No Flash", function()
    local V = Vector3.new()
    for i, data in pairs(getgc(true)) do
      if type(data) == "table" and rawget(data, "camkickmax") then
          if data.hideflash ~= nil then
        data.hideflash = true
        end
      end
    end
end)
section3:addButton("Fast Bullets", function()
    local V = Vector3.new()
    for i, data in pairs(getgc(true)) do
      if type(data) == "table" and rawget(data, "camkickmax") then
        data.bulletspeed = 999;
      end
    end
end)
section3:addButton("No Spread", function()
    local V = Vector3.new()
    for i, data in pairs(getgc(true)) do
      if type(data) == "table" and rawget(data, "camkickmax") then
        data.hipfirespreadrecover = 100
        data.hipfirespread = 0
        data.hipfirestability = 0
      end
    end
end)
section3:addButton("Inf Penetration", function()
    local V = Vector3.new()
    for i, data in pairs(getgc(true)) do
      if type(data) == "table" and rawget(data, "camkickmax") then
       data.penetrationdepth = 3000; --yeah its client side...
      end
    end
end)

section4:addButton("Break All Windows", function()
    for i,v in pairs(workspace.Map:GetDescendants()) do
        if v:IsA("BasePart") and tostring(v) == "Window" then
        
           breakwin(v, v, nil, true, true,nil,nil,nil)
        
            end
        end
end)


section1:addToggle("Aimbot", nil, function(value)
    aim = value
    end)

    section1:addToggle("Aimbot Wall Check", nil, function(value)
        wall = value
        end)
    

        section1:addToggle("ESP", nil, function(value)
            ESP = value
            spawn(StartESP)
            end)
            section1:addToggle("No Fall Damge", nil, function(value)
                _G.Fall = value
                end)
                
            section1:addToggle("Tracers", nil, function(value)
                _G.On = value
                spawn(tracers)
                end)
                section4:addToggle("FullBright", nil, function(value)
                    spawn(FullBright)
                    end)
                    section1:addToggle("Fly (Double Jump)", nil, function(value)
                        FlyOrWhat = value
                        end)
                        section1:addToggle("Auto Respawn", nil, function(value)
                            AutoRes = value
                            end)
                            section1:addToggle("No Kick On Spam", nil, function(value)
                                _G.Spam = value
                                end)








































  
function aimbot()--This function IS NOT made by me. Tho i modified it to work on PF
	PLAYER  = game.Players.LocalPlayer
MOUSE   = PLAYER:GetMouse()
CC      = game.Workspace.CurrentCamera

ENABLED      = false
ESP_ENABLED  = false

_G.FREE_FOR_ALL = true

_G.BIND        = 50
_G.ESP_BIND    = 52
_G.CHANGE_AIM  = 'q'

_G.AIM_AT = 'Head'

wait(1)
--This function IS NOT made by me. Tho i modified it to work on PF
function GetNearestPlayerToMouse()
	local PLAYERS      = {}
	local PLAYER_HOLD  = {}
	local DISTANCES    = {}
	for i, v in pairs(GetAllPlayerParts()) do
		if v ~= PLAYER then
			table.insert(PLAYERS, v)
		end
	end
	for i, v in pairs(PLAYERS) do
	

			local AIM = v:FindFirstChild(_G.AIM_AT)
			if AIM ~= nil then
				local DISTANCE                 = (AIM.Position - game.Workspace.CurrentCamera.CoordinateFrame.p).magnitude
				local RAY                      = Ray.new(game.Workspace.CurrentCamera.CoordinateFrame.p, (MOUSE.Hit.p - CC.CoordinateFrame.p).unit * DISTANCE)
				local HIT,POS                  = game.Workspace:FindPartOnRay(RAY, game.Workspace)
				local DIFF                     = math.floor((POS - AIM.Position).magnitude)
				PLAYER_HOLD[v.Name .. i]       = {}
				PLAYER_HOLD[v.Name .. i].dist  = DISTANCE
				PLAYER_HOLD[v.Name .. i].plr   = v
				PLAYER_HOLD[v.Name .. i].diff  = DIFF
				table.insert(DISTANCES, DIFF)
			end
		end

	
	if unpack(DISTANCES) == nil then
		return false
	end
	
	local L_DISTANCE = math.floor(math.min(unpack(DISTANCES)))
	if L_DISTANCE > 20 then
		return false
	end
	
	for i, v in pairs(PLAYER_HOLD) do
		if v.diff == L_DISTANCE then
			return v.plr
		end
	end
	return false
end
local camera = workspace.CurrentCamera
function WorldToScreen(Position)
      return camera:WorldToScreenPoint(Position) 
end


MOUSE.Button2Up:connect(function(KEY)


		ENABLED = false

end)

MOUSE.Button2Down:connect(function(KEY)

			ENABLED = true

end)
end
  spawn(aimbot)
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
