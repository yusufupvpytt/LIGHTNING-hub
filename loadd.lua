local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UIGradient = Instance.new("UIGradient")
local title = Instance.new("TextLabel")
local status = Instance.new("TextLabel")
local image = Instance.new("ImageLabel")


ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.449999988, 0, 0.400000006, 0)
Frame.Size = UDim2.new(0, 300, 0, 150)

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(39, 39, 39)), ColorSequenceKeypoint.new(1, Color3.fromRGB(65, 65, 65))}
UIGradient.Rotation = 30
UIGradient.Parent = Frame

title.Name = "title"
title.Parent = Frame
title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1.000
title.Size = UDim2.new(0, 300, 0, 32)
title.Font = Enum.Font.Gotham
title.Text = "joe hub (discontinued)"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 22.000

status.Name = "status"
status.Parent = Frame
status.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
status.BackgroundTransparency = 1.000
status.Position = UDim2.new(0.283333331, 0, 0.486666679, 0)
status.Size = UDim2.new(0, 203, 0, 29)
status.Font = Enum.Font.Gotham
status.Text = "looking for game"
status.TextColor3 = Color3.fromRGB(255, 255, 255)
status.TextScaled = true
status.TextSize = 20.000
status.TextWrapped = true

image.Name = "image"
image.Parent = Frame
image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
image.BackgroundTransparency = 1.000
image.Position = UDim2.new(0.0466666669, 0, 0.24666667, 0)
image.Size = UDim2.new(0, 78, 0, 100)
image.Image = "http://www.roblox.com/asset/?id=4651431673"

-- poop code below <3
-- written @ 06:13 in the morning :-)

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
	status.Text = "found game! (" .. index .. ")"
	wait(1)
	wait(1)
	status.Text = "executing script"
	ScreenGui:Destroy()
	loadstring(httpGet(scr))()
else
	status.Text = index
	wait(1)
	ScreenGui:Destroy()
end
