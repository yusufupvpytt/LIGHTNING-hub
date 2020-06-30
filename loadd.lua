
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("ImageLabel")
local UISizeConstraint = Instance.new("UISizeConstraint")
local UIGradient = Instance.new("UIGradient")
local title = Instance.new("TextLabel")
local image = Instance.new("ImageLabel")
local status = Instance.new("TextLabel")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Frame.Name = "Frame"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(1, 1, 1)
Frame.BackgroundTransparency = 1
Frame.Position = UDim2.new(0.347000003, 0, 1, 5)
Frame.Size = UDim2.new(0, 300, 0, 150)
Frame.Image = "rbxassetid://2851928757"
Frame.ScaleType = Enum.ScaleType.Slice
Frame.SliceCenter = Rect.new(5, 5, 5, 5)

UISizeConstraint.Parent = Frame
UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(39, 39, 39)), ColorSequenceKeypoint.new(1, Color3.fromRGB(65, 65, 65))}
UIGradient.Rotation = 30
UIGradient.Parent = Frame
title.Name = "title"
title.Parent = Frame
title.BackgroundColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.BorderSizePixel = 0
title.Size = UDim2.new(0, 300, 0, 16)
title.Font = Enum.Font.Cartoon
title.Text = "Lightning Hub"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 25
title.TextStrokeColor3 = Color3.new(1, 1, 1)

image.Name = "image"
image.Parent = Frame
image.BackgroundColor3 = Color3.new(1, 1, 1)
image.BackgroundTransparency = 1
image.Position = UDim2.new(0, 0, 0.166666672, 0)
image.Size = UDim2.new(0, 100, 0, 100)
image.Image = "rbxassetid://3291458957"

status.Name = "status"
status.Parent = Frame
status.BackgroundColor3 = Color3.new(1, 1, 1)
status.BackgroundTransparency = 1
status.BorderSizePixel = 0
status.Position = UDim2.new(0.236666664, 0, 0.326666653, 0)
status.Size = UDim2.new(0, 229, 0, 52)
status.Font = Enum.Font.Cartoon
status.Text = "Waiting Game"
status.TextColor3 = Color3.new(1, 1, 1)
status.TextSize = 25
status.TextStrokeColor3 = Color3.new(1, 1, 1)
-- Scripts:
function SCRIPT_BLSE86_FAKESCRIPT() -- Frame.LocalScript 
	local script = Instance.new('LocalScript')
	script.Parent = Frame
	script.Parent:TweenPosition(UDim2.new(0.347, 0,1, 5),"In","Quad",0.5)
	wait(2)
	script.Parent:TweenPosition(UDim2.new(0.347, 0,0.328, 5),"In","Quad",0.5)
	wait(10)
	script.Parent:TweenPosition(UDim2.new(0.347, 0,-1, 0),"In","Quad",0.5)
	wait(2)

end
coroutine.resume(coroutine.create(SCRIPT_BLSE86_FAKESCRIPT))
wait(5)
local function httpGet(link)
	local studio = game:GetService("RunService"):IsStudio()
	if studio then
		return game.ReplicatedStorage.ReturnGames:InvokeServer(link)
	else
		return game:HttpGet(link)
	end
end

local loadstring = function(x)
	local studio = game:GetService("RunService"):IsStudio()
	if studio then
		return game.ReplicatedStorage.Loadstring:InvokeServer(x)
	else
		return loadstring(x)
	end
end

local function search_For_Game()
	local games = httpGet("https://raw.githubusercontent.com/TasK-sys/joe_hub_rewritten/master/games.json")
	local decoded = game:GetService("HttpService"):JSONDecode(games)
	for i, v in pairs(decoded) do
		if v.script and v.gameid == game.GameId then
			return i, true, v.script
		end
	end
	return "no game found", false, nil
end

local index, gstatus, scr = search_For_Game()
if gstatus then
	status.Text = "(" .. index .. ")"
	wait(1)
	wait(1)
	status.Text = "Starting Script"
	ScreenGui:Destroy()
	loadstring(httpGet(scr))()
else
	status.Text = index
	wait(1)
	ScreenGui:Destroy()
end
