
-- ============== VICE EDITION LIBRARY ============== -- 
-- == colorpicker Icon Mouse:Connect Tween Color -- ==
getgenv().mc_color_icon = Color3.fromRGB(107, 89, 222)
getgenv().ml_color_icon = Color3.fromRGB(255, 255, 255)
-- == colorpicker Icon Mouse:Leave Tween Color -- ==
local function De_stroy()
    for x = 1,69 do 
        if game.CoreGui:FindFirstChild("Vice") then 
			game.CoreGui:FindFirstChild("Vice"):Destroy() 
		end
    end
end

De_stroy()

local function notifremove()
    for x = 1,69 do 
        if game.CoreGui:FindFirstChild("NotifsGui") then 
			game.CoreGui:FindFirstChild("NotifsGui"):Destroy() 
		end
    end
end

notifremove()


local UserInputService = game:GetService('UserInputService')
local TextService = game:GetService('TextService')
local TweenService = game:GetService('TweenService')
local CoreGui = game:GetService('CoreGui')
local RenderStepped = game:GetService('RunService').RenderStepped
local LocalPlayer = game:GetService('Players').LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer

local selected_colorpicker

function convert_number_range(min_new: number, max_new: number, min_old: number, max_old: number, value: number)
	return (((value - min_old) * (max_new - min_new)) / (max_old - min_old)) + min_new
end

local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(
				StartPosition.X.Scale,
				StartPosition.X.Offset + Delta.X,
				StartPosition.Y.Scale,
				StartPosition.Y.Offset + Delta.Y)
		local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
		Tween:Play()
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end)
			end
		end)

	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
					input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end)

	UserInputService.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end)
end



local PID = LocalPlayer.UserId

--- LIB START ---

local lib = {
	Animations = {
		AnimSpeed = 0.2,
		ElementsAS = 0.2
	}
}

---HOLDERS---

local Vice = Instance.new("ScreenGui")
Vice.Name = "Vice"
Vice.Parent = game.CoreGui
Vice.ZIndexBehavior = Enum.ZIndexBehavior.Global

local NotifsGui = Instance.new("ScreenGui")
NotifsGui.Name = "NotifsGui"
NotifsGui.Parent = game.CoreGui
NotifsGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

local NotifsHolder = Instance.new("Frame")
NotifsHolder.Name = "NotifsHolder"
NotifsHolder.Parent = NotifsGui
NotifsHolder.AnchorPoint = Vector2.new(1, 0.5)
NotifsHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NotifsHolder.BackgroundTransparency = 1.000
NotifsHolder.Position = UDim2.new(1, -20, 0.5, 0)
NotifsHolder.Size = UDim2.new(0, 300, 1, -40)

local NotifsHolderListing = Instance.new("UIListLayout")
NotifsHolderListing.Name = "NotifsHolderListing"
NotifsHolderListing.Parent = NotifsHolder
NotifsHolderListing.SortOrder = Enum.SortOrder.LayoutOrder
NotifsHolderListing.VerticalAlignment = Enum.VerticalAlignment.Bottom
NotifsHolderListing.Padding = UDim.new(0, 5)

---HOLDERS END---

function lib:Create(ver, size, hidekey)
    local hidekey = hidekey or Enum.KeyCode.RightShift
	local MainFrame = Instance.new("Frame")
	MainFrame.Name = "MainFrame"
	MainFrame.Parent = Vice
	MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	MainFrame.BackgroundColor3 = Color3.fromRGB(23, 20, 41)
	MainFrame.BorderSizePixel = 0
	MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	MainFrame.Size = UDim2.new(0, 900, 0, 825)
	if size == '' or nil then
		MainFrame.Size = UDim2.new(0, 700, 0, 625)
	else
		MainFrame.Size = size
	end
	local PromptContainer = Instance.new('TextButton')
	PromptContainer.Size = UDim2.new(1,0,1,0)
	PromptContainer.BackgroundColor3 = Color3.fromRGB(13, 10, 28)
	PromptContainer.BackgroundTransparency = 0.25
	PromptContainer.AutoButtonColor = false
	PromptContainer.BorderSizePixel = 0
	PromptContainer.Visible = false
	PromptContainer.Parent = MainFrame
	PromptContainer.ZIndex = 20

    local MainGlow = Instance.new("ImageLabel")
    MainGlow.Name = "MainGlow"
    MainGlow.Parent = MainFrame
    MainGlow.BackgroundTransparency = 1
    MainGlow.Position = UDim2.new(0, -15, 0, -15)
    MainGlow.Size = UDim2.new(1, 30, 1, 30)
    MainGlow.ZIndex = 0
    MainGlow.Image = "rbxassetid://5028857084"
    MainGlow.ImageColor3 = Color3.fromRGB(107, 89, 222)
    MainGlow.ScaleType = Enum.ScaleType.Slice
    MainGlow.SliceCenter = Rect.new(24, 24, 276, 276)

	local PromptBackground = Instance.new('Frame')
	PromptBackground.Size = UDim2.new(0,300,0,200)
	PromptBackground.AnchorPoint = Vector2.new(0.5, 0.5)
	PromptBackground.Position = UDim2.new(0.5,40,0.5,0)
	PromptBackground.BorderSizePixel = 1
	PromptBackground.BackgroundColor3 = Color3.fromRGB(23, 20, 46)
	PromptBackground.Parent = PromptContainer
	PromptBackground.ZIndex = 21

	local PromptCorner = Instance.new("UICorner")
	PromptCorner.CornerRadius = UDim.new(0, 4)
	PromptCorner.Name = "PromptCorner"
	PromptCorner.Parent = PromptBackground

	local PromptStroke = Instance.new("UIStroke")
	PromptStroke.Enabled = true
	PromptStroke.Parent = PromptBackground
	PromptStroke.Color = Color3.fromRGB(31, 26, 61)
	PromptStroke.LineJoinMode = Enum.LineJoinMode.Round
	PromptStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
	PromptStroke.Thickness = 1
	PromptStroke.Transparency = 1
    
    local PromptTitle = Instance.new("TextLabel")
    PromptTitle.Name = "PromptTitle"
    PromptTitle.Parent = PromptBackground
    PromptTitle.AnchorPoint = Vector2.new(0, 0)
    PromptTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    PromptTitle.BackgroundTransparency = 1.000
    PromptTitle.Position = UDim2.new(0, 15, 0, 3)
    PromptTitle.Size = UDim2.new(0, 10, 0, 20)
    PromptTitle.Font = Enum.Font.SourceSansSemibold
    PromptTitle.Text = prompttitle or "Warning"
   --PromptTitle.Text = "<font color='rgb(107, 89, 222)'><font size='20'>»</font></font>  " .. tostring(thetext)
    PromptTitle.RichText = true
    PromptTitle.TextColor3 = Color3.new(1,1,1)
    PromptTitle.TextSize = 15
    PromptTitle.TextXAlignment = Enum.TextXAlignment.Left
    PromptTitle.ZIndex = 22

	local PromptText = Instance.new('TextLabel')
	PromptText.Name = "PromptTitle"
	PromptText.Parent = PromptBackground
	PromptText.AnchorPoint = Vector2.new(0, 0)
	PromptText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	PromptText.BackgroundTransparency = 1
	PromptText.Position = UDim2.new(0, 15, 0, 40)
	PromptText.Size = UDim2.new(1, -30, 1, -100)
	PromptText.Font = Enum.Font.SourceSans
	PromptText.TextColor3 = Color3.new(1,1,1)
	PromptText.TextWrapped = true
	PromptText.TextSize = 15
	PromptText.TextXAlignment = Enum.TextXAlignment.Left
	PromptText.TextYAlignment = Enum.TextYAlignment.Top
	PromptText.ZIndex = 22

	local PromptSepTop = Instance.new('Frame')
	PromptSepTop.Size = UDim2.new(1,0,0,1)
	PromptSepTop.Position = UDim2.new(0,0,0,30)
	PromptSepTop.BackgroundColor3 = Color3.fromRGB(31, 26, 61)
	PromptSepTop.BorderSizePixel = 0
	PromptSepTop.Parent = PromptBackground
	PromptSepTop.ZIndex = 22

	local PromptSepBottom = Instance.new('Frame')
	PromptSepBottom.Size = UDim2.new(1,0,0,1)
	PromptSepBottom.Position = UDim2.new(0,0,1,-50)
	PromptSepBottom.BackgroundColor3 = Color3.fromRGB(31, 26, 61)
	PromptSepBottom.BorderSizePixel = 0
	PromptSepBottom.Parent = PromptBackground
	PromptSepBottom.ZIndex = 22

	local PromptYesButton = Instance.new('TextButton')
	PromptYesButton.Size = UDim2.new(0,100,0,30)
	PromptYesButton.AnchorPoint = Vector2.new(0,1)
	PromptYesButton.Position = UDim2.new(.5,-105,1,-10)
	PromptYesButton.BackgroundColor3 = Color3.fromRGB(107, 89, 222)
	PromptYesButton.Text = '       Yes'
	PromptYesButton.TextColor3 = Color3.new(1,1,1)
	PromptYesButton.Font = Enum.Font.SourceSansBold
	PromptYesButton.TextSize = 14
	PromptYesButton.Parent = PromptBackground
	PromptYesButton.AutoButtonColor = false
	PromptYesButton.ZIndex = 22

	local YesCorner = Instance.new("UICorner")
	YesCorner.CornerRadius = UDim.new(0, 4)
	YesCorner.Name = "PromptYesButton"
	YesCorner.Parent = PromptYesButton

	local YesImage = Instance.new('ImageLabel')
    YesImage.Image = 'rbxassetid://3926305904'
    YesImage.ImageColor3 = Color3.new(1,1,1)
    YesImage.BackgroundTransparency = 1
    YesImage.ImageRectOffset = Vector2.new(644, 204)
    YesImage.ImageRectSize = Vector2.new(36, 36)
	YesImage.ResampleMode = Enum.ResamplerMode.Pixelated
    YesImage.ScaleType = Enum.ScaleType.Stretch
    YesImage.SliceScale = 1
    YesImage.Size = UDim2.fromOffset(18,18)
    YesImage.Position = UDim2.new(0,33,.5,0)
    YesImage.AnchorPoint = Vector2.new(.5,.5)
    YesImage.Parent = PromptYesButton
	YesImage.ZIndex = 23

	local PromptNoButton = Instance.new('TextButton')
	PromptNoButton.Size = UDim2.new(0,100,0,30)
	PromptNoButton.AnchorPoint = Vector2.new(1,1)
	PromptNoButton.Position = UDim2.new(.5,105,1,-10)
	PromptNoButton.BackgroundColor3 = Color3.fromRGB(107, 89, 222)
	PromptNoButton.Text = '       No'
	PromptNoButton.TextColor3 = Color3.new(1,1,1)
	PromptNoButton.Font = Enum.Font.SourceSansBold
	PromptNoButton.TextSize = 14
	PromptNoButton.Parent = PromptBackground
	PromptNoButton.AutoButtonColor = false
	PromptNoButton.ZIndex = 22

	local NoCorner = Instance.new("UICorner")
	NoCorner.CornerRadius = UDim.new(0, 4)
	NoCorner.Name = "PromptNoButton"
	NoCorner.Parent = PromptNoButton

	local NoImage = Instance.new('ImageLabel')
    NoImage.Image = 'rbxassetid://3926305904'
    NoImage.ImageColor3 = Color3.new(1,1,1)
    NoImage.BackgroundTransparency = 1
    NoImage.ImageRectOffset = Vector2.new(924, 724)
    NoImage.ImageRectSize = Vector2.new(36, 36)
    NoImage.ScaleType = Enum.ScaleType.Stretch
    NoImage.SliceScale = 1
    NoImage.Size = UDim2.fromOffset(18,18)
    NoImage.Position = UDim2.new(0,33,.5,0)
    NoImage.AnchorPoint = Vector2.new(.5,.5)
    NoImage.Parent = PromptNoButton
	NoImage.ZIndex = 23

    UserInputService.InputBegan:Connect(function(key)
        if key.KeyCode == hidekey then
				TweenService:Create(MainFrame,TweenInfo.new(.4),{BackgroundTransparency = 1}):Play()
				MainFrame.Visible = false
			else
				MainFrame.Visible = true
				TweenService:Create(MainFrame,TweenInfo.new(.4),{BackgroundTransparency = 0}):Play()
        	end
    	end)
			--[[

			TweenService:Create(MainFrame,TweenInfo.new(.4),{BackgroundTransparency = 0}):Play()
			
			MainFrame:TweenSize(UDim2.new(0, 597, 0, 9), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.90, true)
			-- animasyon 1
			-- animasyon 2
			-- animasyon 3

			--
				MainFrame:TweenSize(UDim2.new(0, 0, 0, 625), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.50, true)
				MainFrame.Visible
				--TweenService:Create(TopBar,TweenInfo.new(.4),{BackgroundTransparency = 1}):Play()				
				TweenService:Create(TopBar,TweenInfo.new(2.9),{BackgroundTransparency = 1}):Play() 
				TweenService:Create(AllPages,TweenInfo.new(3.1),{BackgroundTransparency = 1}):Play()
				{0, 700},{0, 625}
				TweenService:Create(MainFrame, TweenInfo.new(2), {Position = UDim2.new(0.428, 0, 0.5, 0)}):Play()
		TweenService:Create(loaderframe,TweenInfo.new(5),{BackgroundTransparency = 0}):Play() 
		loaderframe:TweenSize(UDim2.new(0, 597, 0, 488), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.90, true)
		wait(1)
			MainFrame.Visible = false
			

			]]
--[[
	function lib:waterwark(title)
		local waterwarkFrame = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local vh_title = Instance.new("TextLabel")
		local glow = Instance.new("ImageLabel")
		local vhlogo = Instance.new("ImageLabel")
		local clock = Instance.new("TextLabel")
		local line1 = Instance.new("Frame")
		local fps = Instance.new("TextLabel")
		local ping = Instance.new("TextLabel")
		local line2 = Instance.new("Frame")
		local PlayerImage = Instance.new("ImageLabel")
		local UICorner_2 = Instance.new("UICorner")
		local username = Instance.new("TextLabel")
		--local title = "VICE HUB"
		waterwarkFrame.Name = "waterwarkFrame"
		waterwarkFrame.Parent = MainFrame
		waterwarkFrame.Active = true
		waterwarkFrame.BackgroundColor3 = Color3.fromRGB(13, 10, 28)
		waterwarkFrame.BackgroundTransparency = 0.350
		waterwarkFrame.BorderSizePixel = 0
		waterwarkFrame.Position = UDim2.new(0, 1393, 0, -5)
		waterwarkFrame.Size = UDim2.new(0, 455, 0, 33)
		waterwarkFrame.Active = true
		waterwarkFrame.Draggable = true
		
		UICorner.CornerRadius = UDim.new(0, 9)
		UICorner.Parent = waterwarkFrame
		
		vh_title.Name = "vh_title"
		vh_title.Parent = waterwarkFrame
		vh_title.Active = true
		vh_title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		vh_title.BackgroundTransparency = 1.000
		vh_title.BorderSizePixel = 0
		vh_title.Position = UDim2.new(0.091405578, 0, 0.107287779, 0)
		vh_title.Size = UDim2.new(0, 66, 0, 25)
		vh_title.Font = Enum.Font.GothamBold
		vh_title.Text = title
		vh_title.TextColor3 = Color3.fromRGB(188, 188, 188)
		vh_title.TextSize = 14.000
		vh_title.TextXAlignment = Enum.TextXAlignment.Left
		
		glow.Name = "glow"
		glow.Parent = waterwarkFrame
		glow.BackgroundTransparency = 1.000
		glow.Position = UDim2.new(0, -14, 0, -16)
		glow.Size = UDim2.new(0.995604396, 30, 0.939393938, 30)
		glow.ZIndex = 0
		glow.Image = "rbxassetid://5028857084"
		glow.ImageColor3 = Color3.fromRGB(72, 0, 255)
		glow.ImageTransparency = 0.400
		glow.ScaleType = Enum.ScaleType.Slice
		glow.SliceCenter = Rect.new(24, 24, 276, 276)
		
		vhlogo.Name = "vhlogo"
		vhlogo.Parent = waterwarkFrame
		vhlogo.AnchorPoint = Vector2.new(0.5, 0)
		vhlogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		vhlogo.BackgroundTransparency = 1.000
		vhlogo.Position = UDim2.new(0.0467976965, 0, 0.0769849867, 3)
		vhlogo.Size = UDim2.new(0, 20, 0, 19)
		vhlogo.Image = "rbxassetid://10272150497"
		
		clock.Name = "clock"
		clock.Parent = waterwarkFrame
		clock.Active = true
		clock.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		clock.BackgroundTransparency = 1.000
		clock.BorderSizePixel = 0
		clock.Position = UDim2.new(0.27709195, 0, 0.107287779, 0)
		clock.Size = UDim2.new(0, 42, 0, 25)
		clock.Font = Enum.Font.GothamBold
		clock.Text = ""
		clock.TextColor3 = Color3.fromRGB(188, 188, 188)
		clock.TextSize = 14.000
		clock.TextXAlignment = Enum.TextXAlignment.Left
		
		line1.Name = "line1"
		line1.Parent = waterwarkFrame
		line1.AnchorPoint = Vector2.new(0, 0.5)
		line1.BackgroundColor3 = Color3.fromRGB(51, 45, 111)
		line1.BorderSizePixel = 0
		line1.Position = UDim2.new(0.252657831, 0, 0.499000013, 0)
		line1.Size = UDim2.new(0, 3, 0.699999988, 0)
		
		fps.Name = "fps"
		fps.Parent = waterwarkFrame
		fps.Active = true
		fps.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		fps.BackgroundTransparency = 1.000
		fps.BorderSizePixel = 0
		fps.Position = UDim2.new(0.39555952, 0, 0.107287779, 0)
		fps.Size = UDim2.new(0, 42, 0, 25)
		fps.Font = Enum.Font.GothamBold
		--fps.text = "FPS: "..thefps..""
		fps.Text = ""
		fps.TextColor3 = Color3.fromRGB(188, 188, 188)
		fps.TextSize = 14.000
		fps.TextXAlignment = Enum.TextXAlignment.Left
		
		ping.Name = "ping"
		ping.Parent = waterwarkFrame
		ping.Active = true
		ping.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ping.BackgroundTransparency = 1.000
		ping.BorderSizePixel = 0
		ping.Position = UDim2.new(0.550298452, 0, 0.107287779, 0)
		ping.Size = UDim2.new(0, 42, 0, 25)
		ping.Font = Enum.Font.GothamBold
		ping.Text = ""
		ping.TextColor3 = Color3.fromRGB(188, 188, 188)
		ping.TextSize = 14.000
		ping.TextXAlignment = Enum.TextXAlignment.Left
		
		line2.Name = "line2"
		line2.Parent = waterwarkFrame
		line2.AnchorPoint = Vector2.new(0, 0.5)
		line2.BackgroundColor3 = Color3.fromRGB(51, 45, 111)
		line2.BorderSizePixel = 0
		line2.Position = UDim2.new(0.694482267, 0, 0.499000013, 0)
		line2.Size = UDim2.new(0, 3, 0.699999988, 0)
		
		PlayerImage.Name = "PlayerImage"
		PlayerImage.Parent = waterwarkFrame
		PlayerImage.Active = true
		PlayerImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		PlayerImage.BackgroundTransparency = 1.000
		PlayerImage.Position = UDim2.new(0.72, 0, 0.047, 0)
		PlayerImage.Size = UDim2.new(0, 27, 0, 28)
		PlayerImage.Image = "rbxthumb://type=AvatarHeadShot&id="..game.Players.LocalPlayer.UserId.."&w=100&h=100"
		
		UICorner_2.CornerRadius = UDim.new(0, 100)
		UICorner_2.Parent = PlayerImage
		
		username.Name = "username"
		username.Parent = waterwarkFrame
		username.Active = true
		username.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		username.BackgroundTransparency = 1.000
		username.BorderSizePixel = 0
		username.Position = UDim2.new(0.80, 0, 0.107287779, 0)
		username.Size = UDim2.new(0, 95, 0, 25)
		username.Font = Enum.Font.GothamBold
		username.Text = game.Players.LocalPlayer.Name
		username.TextColor3 = Color3.fromRGB(188, 188, 188)
		username.TextSize = 14.000
		username.TextXAlignment = Enum.TextXAlignment.Left
		
		local ProfileOutline = Instance.new("UIStroke")
		ProfileOutline.Enabled = true
		ProfileOutline.Parent = PlayerImage
		ProfileOutline.Color = Color3.fromRGB(47, 4, 100)
		ProfileOutline.LineJoinMode = Enum.LineJoinMode.Round
		ProfileOutline.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		ProfileOutline.Thickness = 1.6
		ProfileOutline.Transparency = 0.350
		game.Stats:WaitForChild("Network")
		game.Stats.Network:WaitForChild("ServerStatsItem")
		game.Stats.Network.ServerStatsItem:WaitForChild("Data Ping")
		while wait(0.1) do
		local TimeInUnix = os.time()
		local stringToFormat = "%H:%M"
		local result = os.date(stringToFormat, TimeInUnix)
		theping = string.split(string.split(game.Stats.Network.ServerStatsItem["Data Ping"]:GetValueString(), " ")[1], ".")
		thefps = string.split(game.Stats.Workspace.Heartbeat:GetValueString(), ".")
		fps.Text = "FPS: "..thefps[1]..""  
		clock.Text = result
		ping.Text = "PING: "..theping[1]..""
		end
end]] 


	PromptText:GetPropertyChangedSignal('Text'):Connect(function()
		local size = game:GetService('TextService'):GetTextSize(PromptText.Text, PromptText.TextSize, PromptText.Font, Vector2.new(PromptText.AbsoluteSize.X,5000))
		PromptBackground.Size = UDim2.new(0,300,0,size.Y + 100)
	end)

	PromptText.Text = 'PLACEHOLDER WARNING TEXT GOES HERE'

	PromptYesButton.MouseEnter:Connect(function()
		game.TweenService:Create(PromptYesButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			BackgroundColor3 = Color3.fromRGB(42, 34, 80)
		}):Play()
	end)
	
	PromptYesButton.MouseLeave:Connect(function()
		game.TweenService:Create(PromptYesButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			BackgroundColor3 = Color3.fromRGB(107, 89, 222)
		}):Play()
	end)

	PromptYesButton.MouseButton1Down:Connect(function()
		game.TweenService:Create(PromptYesButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			BackgroundColor3 = Color3.fromRGB(91, 73, 143)
		}):Play()
	end)

	PromptYesButton.MouseButton1Up:Connect(function()
		game.TweenService:Create(PromptYesButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			BackgroundColor3 = Color3.fromRGB(42, 34, 80)
		}):Play()
	end)

	PromptNoButton.MouseEnter:Connect(function()
		game.TweenService:Create(PromptNoButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			BackgroundColor3 = Color3.fromRGB(42, 34, 80)
		}):Play()
	end)
	
	PromptNoButton.MouseLeave:Connect(function()
		game.TweenService:Create(PromptNoButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			BackgroundColor3 = Color3.fromRGB(107, 89, 222)
		}):Play()
	end)

	PromptNoButton.MouseButton1Down:Connect(function()
		game.TweenService:Create(PromptNoButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			BackgroundColor3 = Color3.fromRGB(91, 73, 143)
		}):Play()
	end)

	PromptNoButton.MouseButton1Up:Connect(function()
		game.TweenService:Create(PromptNoButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			BackgroundColor3 = Color3.fromRGB(42, 34, 80)
		}):Play()
	end)

	
	local MainFrameShadow = Instance.new("ImageLabel")
	MainFrameShadow.Name = "MainFrameShadow"
	MainFrameShadow.Parent = MainFrame
	MainFrameShadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MainFrameShadow.BackgroundTransparency = 1.000
	MainFrameShadow.Position = UDim2.new(0, -15, 0, -15)
	MainFrameShadow.Size = UDim2.new(1, 30, 1, 30)
	MainFrameShadow.Image = "rbxassetid://6521733637"
	MainFrameShadow.ImageColor3 = Color3.fromRGB(21, 19, 37)
	MainFrameShadow.ImageTransparency = 0.300
	MainFrameShadow.ScaleType = Enum.ScaleType.Slice
	MainFrameShadow.SliceCenter = Rect.new(19, 19, 281, 281)

	local MainFrameCorner = Instance.new("UICorner")
	MainFrameCorner.CornerRadius = UDim.new(0, 4)
	MainFrameCorner.Name = "MainFrameCorner"
	MainFrameCorner.Parent = MainFrame
	
	local LeftBarBack = Instance.new("Frame")
	LeftBarBack.Name = "LeftBarBack"
	LeftBarBack.Parent = MainFrame
	LeftBarBack.BackgroundColor3 = Color3.fromRGB(13, 10, 28)
	LeftBarBack.Size = UDim2.new(0, 80, 1, 0)
	
	local LeftBarBackCR = Instance.new("Frame")
	LeftBarBackCR.Name = "LeftBarBackCR"
	LeftBarBackCR.Parent = LeftBarBack
	LeftBarBackCR.BackgroundColor3 = Color3.fromRGB(12, 10, 26)
	LeftBarBackCR.BorderSizePixel = 0
	LeftBarBackCR.Position = UDim2.new(1, -5, 0, 0)
	LeftBarBackCR.Size = UDim2.new(0, 5, 1, 0)
	
	local LeftBarBackLine = Instance.new("Frame")
	LeftBarBackLine.Name = "LeftBarBackLine"
	LeftBarBackLine.Parent = LeftBarBack
	LeftBarBackLine.BackgroundColor3 = Color3.fromRGB(31, 26, 61)
	LeftBarBackLine.BorderSizePixel = 0
	LeftBarBackLine.Position = UDim2.new(1, -1, 0, 0)
	LeftBarBackLine.Size = UDim2.new(0, 1, 1, 0)
	
	local LeftBarBackCorner = Instance.new("UICorner")
	LeftBarBackCorner.CornerRadius = UDim.new(0, 4)
	LeftBarBackCorner.Name = "LeftBarBackCorner"
	LeftBarBackCorner.Parent = LeftBarBack
	
	local AllTabBtns = Instance.new("Frame")
	AllTabBtns.Name = "AllTabBtns"
	AllTabBtns.Parent = LeftBarBack
	AllTabBtns.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	AllTabBtns.BackgroundTransparency = 1.000
	AllTabBtns.Position = UDim2.new(0, 0, 0, 80)
	AllTabBtns.Size = UDim2.new(1, 0, 1, -80)
	
	local AllTabBtnsListing = Instance.new("UIListLayout")
	AllTabBtnsListing.Name = "AllTabBtnsListing"
	AllTabBtnsListing.Parent = AllTabBtns
	AllTabBtnsListing.SortOrder = Enum.SortOrder.LayoutOrder
	AllTabBtnsListing.Padding = UDim.new(0, 10)
	
	local vhlogo = Instance.new("ImageLabel")
	vhlogo.Name = "vhlogo"
	vhlogo.Parent = LeftBarBack
	vhlogo.AnchorPoint = Vector2.new(0.5, 0)
	vhlogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	vhlogo.BackgroundTransparency = 1.000
	vhlogo.Position = UDim2.new(0.493750006, 0, 0.0207999982, 3)
	vhlogo.Size = UDim2.new(0, 47, 0, 46)
	vhlogo.Image = "rbxassetid://10272150497"

	local LeftBarBackCorner = Instance.new("UICorner")
	LeftBarBackCorner.CornerRadius = UDim.new(0, 5)
	LeftBarBackCorner.Name = "LeftBarBackCorner"
	LeftBarBackCorner.Parent = LeftBarBack
	
	local MainFrameShadow = Instance.new("ImageLabel")
	MainFrameShadow.Name = "MainFrameShadow"
	MainFrameShadow.Parent = MainFrame
	MainFrameShadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MainFrameShadow.BackgroundTransparency = 1.000
	MainFrameShadow.Position = UDim2.new(0, -15, 0, -15)
	MainFrameShadow.Size = UDim2.new(1, 30, 1, 30)
	MainFrameShadow.Image = "rbxassetid://6521733637"
	MainFrameShadow.ImageColor3 = Color3.fromRGB(21, 19, 37)
	MainFrameShadow.ImageTransparency = 0.300
	MainFrameShadow.ScaleType = Enum.ScaleType.Slice
	MainFrameShadow.SliceCenter = Rect.new(19, 19, 281, 281)
	
	local TopBar = Instance.new("Frame")
	TopBar.Name = "TopBar"
	TopBar.Parent = MainFrame
	TopBar.BackgroundColor3 = Color3.fromRGB(23, 20, 46)
	TopBar.BorderSizePixel = 0
	TopBar.Position = UDim2.new(0, 80, 0, 0)
	TopBar.Size = UDim2.new(1, -80, 0, 60)
	
	local TopBarCorner = Instance.new("UICorner")
	TopBarCorner.CornerRadius = UDim.new(0, 4)
	TopBarCorner.Name = "TopBarCorner"
	TopBarCorner.Parent = TopBar
	
	local TopBarLine = Instance.new("Frame")
	TopBarLine.Name = "TopBarLine"
	TopBarLine.Parent = TopBar
	TopBarLine.BackgroundColor3 = Color3.fromRGB(31, 26, 61)
	TopBarLine.BorderSizePixel = 0
	TopBarLine.Position = UDim2.new(0, 0, 1, 0)
	TopBarLine.Size = UDim2.new(1, 0, 0, 1)
	
	local ProfileStuff = Instance.new("Frame")
	ProfileStuff.Name = "ProfileStuff"
	ProfileStuff.Parent = TopBar
	ProfileStuff.AnchorPoint = Vector2.new(1, 0.5)
	ProfileStuff.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ProfileStuff.BackgroundTransparency = 1.000
	ProfileStuff.Position = UDim2.new(1, 0, 0.5, 0)
	ProfileStuff.Size = UDim2.new(0, 140, 1, 0)
	
	local ProfileInfo = Instance.new("Frame")
	ProfileInfo.Name = "ProfileInfo"
	ProfileInfo.Parent = ProfileStuff
	ProfileInfo.AnchorPoint = Vector2.new(1, 0.5)
	ProfileInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ProfileInfo.BackgroundTransparency = 1.000
	ProfileInfo.LayoutOrder = -1
	ProfileInfo.Position = UDim2.new(1, 0, 0.5, 0)
	ProfileInfo.Size = UDim2.new(1, -40, 0, 30)
	
	local Username = Instance.new("TextLabel")
	Username.Name = "Username"
	Username.Parent = ProfileInfo
	Username.AnchorPoint = Vector2.new(0, 1)
	Username.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Username.BackgroundTransparency = 1.000
	Username.Position = UDim2.new(0, 0, 0.5, 0)
	Username.Size = UDim2.new(1, 0, 0, 14)
	Username.Font = Enum.Font.GothamMedium
	Username.Text = LocalPlayer.Name
	Username.TextColor3 = Color3.fromRGB(255, 255, 255)
	Username.TextSize = 12.000
	Username.TextXAlignment = Enum.TextXAlignment.Left
	
	local Etc = Instance.new("TextLabel")
	Etc.Name = "Etc"
	Etc.Parent = ProfileInfo
	Etc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Etc.BackgroundTransparency = 1.000
	Etc.Position = UDim2.new(0, 0, 0.5, 0)
	Etc.Size = UDim2.new(1, -10, 0, 14)
	Etc.Font = Enum.Font.GothamMedium
	Etc.Text = ver
	Etc.RichText = true
	Etc.TextColor3 = Color3.fromRGB(120, 124, 123)
	Etc.TextSize = 12.000
	Etc.TextXAlignment = Enum.TextXAlignment.Left
	
	local ProfilePictureOutline = Instance.new("Frame")
	ProfilePictureOutline.Name = "ProfilePictureOutline"
	ProfilePictureOutline.Parent = ProfileStuff
	ProfilePictureOutline.AnchorPoint = Vector2.new(0, 0.5)
	ProfilePictureOutline.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ProfilePictureOutline.BackgroundTransparency = 1.000
	ProfilePictureOutline.Position = UDim2.new(0, 0, 0.5, 0)
	ProfilePictureOutline.Size = UDim2.new(0, 30, 0, 30)
	
	local ProfilePicture = Instance.new("Frame")
	ProfilePicture.Name = "ProfilePicture"
	ProfilePicture.Parent = ProfilePictureOutline
	ProfilePicture.AnchorPoint = Vector2.new(0.5, 0.5)
	ProfilePicture.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ProfilePicture.BackgroundTransparency = 1.000
	ProfilePicture.Position = UDim2.new(0.5, 0, 0.5, 0)
	ProfilePicture.Size = UDim2.new(1, 0, 1, 0)
	
	local ProfilePictureCorner = Instance.new("UICorner")
	ProfilePictureCorner.CornerRadius = UDim.new(1, 0)
	ProfilePictureCorner.Name = "ProfilePictureCorner"
	ProfilePictureCorner.Parent = ProfilePicture
    
	local ProfileImage = Instance.new("ImageLabel")
	ProfileImage.Name = "ProfileImage"
	ProfileImage.Parent = ProfilePicture
	ProfileImage.BackgroundColor3 = Color3.fromRGB(40, 45, 52)
	ProfileImage.BackgroundTransparency = 0.800
	ProfileImage.Size = UDim2.new(1, 0, 1, 0)
	ProfileImage.Image = "rbxthumb://type=AvatarHeadShot&id=" .. PID .. "&w=48&h=48"
	
	local ProfileImageCorner = Instance.new("UICorner")
	ProfileImageCorner.CornerRadius = UDim.new(1, 0)
	ProfileImageCorner.Name = "ProfileImageCorner"
	ProfileImageCorner.Parent = ProfileImage
	
	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(1, 0)
	UICorner.Parent = ProfilePictureOutline
	
	local ProfileStroke = Instance.new("UIStroke", ProfileImage)
    ProfileStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
    ProfileStroke.Color = Color3.fromRGB(102, 82, 217)
    ProfileStroke.LineJoinMode = Enum.LineJoinMode.Round
    ProfileStroke.Thickness = 1.4
    ProfileStroke.Transparency = 0
    ProfileStroke.Name = "ProfileStroke"
    ProfileStroke.Enabled = true
	
	local SearchBack = Instance.new("Frame")
	SearchBack.Name = "SearchBack"
	SearchBack.Parent = TopBar
	SearchBack.BackgroundColor3 = Color3.fromRGB(143, 131, 255)
	SearchBack.BackgroundTransparency = 0.900
	SearchBack.Position = UDim2.new(0, 15, 0.5, -15)
	SearchBack.Size = UDim2.new(1, -180, 0, 30)
    	
	local SearchBackCorner = Instance.new("UICorner")
	SearchBackCorner.CornerRadius = UDim.new(0, 5)
	SearchBackCorner.Name = "SearchBackCorner"
	SearchBackCorner.Parent = SearchBack
	
	local SearchBox = Instance.new("TextBox")
	SearchBox.Name = "SearchBox"
	SearchBox.Parent = SearchBack
	SearchBox.AnchorPoint = Vector2.new(1, 0.5)
	SearchBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SearchBox.BackgroundTransparency = 1.000
	SearchBox.ClipsDescendants = true
	SearchBox.Position = UDim2.new(1, -6, 0.5, 0)
	SearchBox.Size = UDim2.new(1, -58, 1, 0)
	SearchBox.Font = Enum.Font.Gotham
	SearchBox.PlaceholderColor3 = Color3.fromRGB(143, 131, 255)
	SearchBox.PlaceholderText = "Search..."
	SearchBox.Text = ""
	SearchBox.TextColor3 = Color3.fromRGB(143, 131, 255)
	SearchBox.TextSize = 12.000
	SearchBox.TextXAlignment = Enum.TextXAlignment.Left
	
	local SearchIcon = Instance.new("ImageLabel")
	SearchIcon.Name = "SearchIcon"
	SearchIcon.Parent = SearchBack
	SearchIcon.AnchorPoint = Vector2.new(0, 0.5)
	SearchIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SearchIcon.BackgroundTransparency = 1.000
	SearchIcon.Position = UDim2.new(0, 10, 0.5, 0)
	SearchIcon.Size = UDim2.new(0, 18, 0, 18)
	SearchIcon.Image = "rbxassetid://9992305542"
	SearchIcon.ImageColor3 = Color3.fromRGB(143, 131, 255)
	
	local SearchBackLine = Instance.new("Frame")
	SearchBackLine.Name = "SearchBackLine"
	SearchBackLine.Parent = SearchBack
	SearchBackLine.AnchorPoint = Vector2.new(0, 0.5)
	SearchBackLine.BackgroundColor3 = Color3.fromRGB(143, 131, 255)
	SearchBackLine.Position = UDim2.new(0, 38, 0.5, 0)
	SearchBackLine.Size = UDim2.new(0, 1, 1, -20)
	
	local AllPages = Instance.new("Frame")
	AllPages.Name = "AllPages"
	AllPages.Parent = MainFrame
	AllPages.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	AllPages.BackgroundTransparency = 1.000
	AllPages.Position = UDim2.new(0, 80, 0, 60)
	AllPages.Size = UDim2.new(1, -80, 1, -60)
	AllPages.ZIndex = 2
	
	local AllPagesFolder = Instance.new("Folder")
	AllPagesFolder.Name = "AllPagesFolder"
	AllPagesFolder.Parent = AllPages
	
    MakeDraggable(TopBar, MainFrame)

	local tabs = {}
	-- ups
	function tabs:Tab(title, AssID, desc1, desc2)
		local Tab = Instance.new("Frame")
		Tab.Name = "Tab"
		Tab.Parent = AllTabBtns
		Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Tab.BackgroundTransparency = 1.000
		Tab.Size = UDim2.new(1, 0, 0, 42)
		
		local TabTitle = Instance.new("TextLabel")
		TabTitle.Name = "TabTitle"
		TabTitle.Parent = Tab
		TabTitle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		TabTitle.BackgroundTransparency = 1.000
		TabTitle.BorderSizePixel = 0
		TabTitle.Position = UDim2.new(0, 0, 1, -14)
		TabTitle.Size = UDim2.new(1, 0, 0, 14)
		TabTitle.RichText = true
		TabTitle.Font = Enum.Font.GothamMedium
		TabTitle.Text = title
		TabTitle.TextColor3 = Color3.fromRGB(122, 122, 122)
		TabTitle.TextSize = 12
		TabTitle.TextTransparency = 0
		
		local TabImage = Instance.new("ImageLabel")
		TabImage.Name = "TabImage"
		TabImage.Parent = Tab
		TabImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabImage.BackgroundTransparency = 1.000
		TabImage.AnchorPoint = Vector2.new(0.5, 0)
		TabImage.Position = UDim2.new(0.5, 0, 0, 3)
		TabImage.Size = UDim2.new(0, 18, 0, 18)
		TabImage.Image = "http://www.roblox.com/asset/?id=" .. AssID
		TabImage.ImageColor3 = Color3.fromRGB(122, 122, 122)
		TabImage.ImageTransparency = 0
		
		local TabHighlight = Instance.new("Frame")
		TabHighlight.Name = "TabHighlight"
		TabHighlight.Parent = Tab
		TabHighlight.BackgroundColor3 = Color3.fromRGB(102, 88, 218)
		TabHighlight.BackgroundTransparency = 0
		TabHighlight.BorderSizePixel = 0
		TabHighlight.AnchorPoint = Vector2.new(0, 0.5)
		TabHighlight.Position = UDim2.new(0, 0, 0.5, 0)
		TabHighlight.Size = UDim2.new(0, 4, 0, 0)
		
		local TabInteract = Instance.new("TextButton")
		TabInteract.Name = "TabInteract"
		TabInteract.Parent = Tab
		TabInteract.AnchorPoint = Vector2.new(0.5, 0.5)
		TabInteract.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabInteract.BackgroundTransparency = 1.000
		TabInteract.Position = UDim2.new(0.5, 0, 0.5, 0)
		TabInteract.Size = UDim2.new(1, 0, 1, 0)
		TabInteract.Font = Enum.Font.SourceSans
		TabInteract.Text = ""
		TabInteract.TextColor3 = Color3.fromRGB(0, 0, 0)
		TabInteract.TextSize = 14.000
		
		local Page = Instance.new("Frame")
		Page.Name = "Page"
		Page.Parent = AllPagesFolder
		Page.AnchorPoint = Vector2.new(0.5, 0)
		Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Page.BackgroundTransparency = 1.000
		Page.Position = UDim2.new(0.5, 0, 0, 20)
		Page.Size = UDim2.new(1, 0, 1, -20)
		Page.ZIndex = 2
		Page.Visible = false
		
		local PageFade = Instance.new("Frame")
		PageFade.Name = "PageFade"
		PageFade.Parent = MainFrame
		PageFade.AnchorPoint = Vector2.new(1, 1)
		PageFade.BackgroundColor3 = Color3.fromRGB(23, 20, 41)
		PageFade.BackgroundTransparency = 1
		PageFade.BorderSizePixel = 0
		PageFade.Position = UDim2.new(1, 0, 1, 0)
		PageFade.Size = UDim2.new(1, -80, 1, -60)
		PageFade.ZIndex = 99
		PageFade.Visible = true
		
		local TabInnerTitle = Instance.new("TextLabel")
		TabInnerTitle.Name = "TabInnerTitle"
		TabInnerTitle.Parent = Page
		TabInnerTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabInnerTitle.BackgroundTransparency = 1.000
		TabInnerTitle.Position = UDim2.new(0, 20, 0, 0)
		TabInnerTitle.Size = UDim2.new(0, 196, 0, 20)
		TabInnerTitle.Font = Enum.Font.GothamMedium
		TabInnerTitle.Text = desc1
		TabInnerTitle.RichText = true
		TabInnerTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
		TabInnerTitle.TextSize = 20.000
		TabInnerTitle.TextXAlignment = Enum.TextXAlignment.Left
		
		local TabDescription = Instance.new("TextLabel")
		TabDescription.Name = "TabDescription"
		TabDescription.Parent = Page
		TabDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabDescription.BackgroundTransparency = 1.000
		TabDescription.Position = UDim2.new(0, 22, 0, 24)
		TabDescription.Size = UDim2.new(0, 235, 0, 13)
		TabDescription.Font = Enum.Font.Gotham
		TabDescription.Text = desc2
        TabDescription.RichText = true
		TabDescription.TextColor3 = Color3.fromRGB(254, 253, 255)
		TabDescription.TextSize = 13.000
		TabDescription.TextXAlignment = Enum.TextXAlignment.Left
		
		local PageCont = Instance.new("Frame")
		PageCont.Name = "PageCont"
		PageCont.Parent = Page
		PageCont.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		PageCont.BackgroundTransparency = 1.000
		PageCont.Position = UDim2.new(0, 0, 0, 70)
		PageCont.Size = UDim2.new(1, 0, 1, -70)
		
		local AllSubTabBtns = Instance.new("Frame")
		AllSubTabBtns.Name = "AllSubTabBtns"
		AllSubTabBtns.Parent = PageCont
		AllSubTabBtns.AnchorPoint = Vector2.new(0.5, 0)
		AllSubTabBtns.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		AllSubTabBtns.BackgroundTransparency = 1.000
		AllSubTabBtns.Position = UDim2.new(0.5, 0, 0, 0)
		AllSubTabBtns.Size = UDim2.new(1, -40, 0, 30)
		
		local AllSubTabBtnsListing = Instance.new("UIListLayout")
		AllSubTabBtnsListing.Name = "AllSubTabBtnsListing"
		AllSubTabBtnsListing.Parent = AllSubTabBtns
		AllSubTabBtnsListing.FillDirection = Enum.FillDirection.Horizontal
		AllSubTabBtnsListing.SortOrder = Enum.SortOrder.LayoutOrder
		AllSubTabBtnsListing.VerticalAlignment = Enum.VerticalAlignment.Center
		AllSubTabBtnsListing.Padding = UDim.new(0, 5)
		
		TabInteract.MouseButton1Click:Connect(function()
			for i, v in next, AllPagesFolder:GetChildren() do
				coroutine.wrap(function()
					wait(lib.Animations.AnimSpeed)
					v.Visible = false
				end)()
			end
			coroutine.wrap(function()
				wait(lib.Animations.AnimSpeed)
				Page.Visible = true
			end)()
			
			coroutine.wrap(function()
				game.TweenService:Create(PageFade, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
					BackgroundTransparency = 0
				}):Play()
				wait(lib.Animations.AnimSpeed)
				game.TweenService:Create(PageFade, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
					BackgroundTransparency = 1
				}):Play()
			end)()

			for i, v in next, AllTabBtns:GetDescendants() do
				if v:IsA("TextLabel") then
					game.TweenService:Create(v, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
						TextColor3 = Color3.fromRGB(122, 122, 122)
					}):Play()
				end
				if v:IsA("ImageLabel") then
					game.TweenService:Create(v, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
						ImageColor3 = Color3.fromRGB(122, 122, 122)
					}):Play()
				end
				if v.Name == 'TabHighlight' then
					game.TweenService:Create(v, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
						Size = UDim2.new(0, 4, 0, 0)
					}):Play()
				end
			end
			game.TweenService:Create(TabTitle, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				TextColor3 = Color3.fromRGB(255, 255, 255)
			}):Play()
			game.TweenService:Create(TabImage, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				ImageColor3 = Color3.fromRGB(255, 255, 255)
			}):Play()
			game.TweenService:Create(TabHighlight, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Size = UDim2.new(0, 4, 1, 0)
			}):Play()
		end)
		
		local subtabs = {}
		
		local PageItems = Instance.new("Frame")
		PageItems.Name = "PageItems"
		PageItems.Parent = PageCont
		PageItems.AnchorPoint = Vector2.new(0.5, 1)
		PageItems.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		PageItems.BackgroundTransparency = 1.000
		PageItems.Position = UDim2.new(0.5, 0, 1, 0)
		PageItems.Size = UDim2.new(1, 0, 1, -44)
		PageItems.Visible = true
		
		local AllSubPagesFolder = Instance.new("Folder")
		AllSubPagesFolder.Name = "AllSubPagesFolder"
		AllSubPagesFolder.Parent = PageItems
		
		function subtabs:SubTab(title, AssID)
			local SubTabBtnOutline = Instance.new("Frame")
			SubTabBtnOutline.Name = "SubTabBtnOutline"
			SubTabBtnOutline.Parent = AllSubTabBtns
			SubTabBtnOutline.BackgroundColor3 = Color3.fromRGB(107, 89, 222)
			SubTabBtnOutline.Size = UDim2.new(0, 110, 1, -4)

			local SubTabBtnOutlineCorner = Instance.new("UICorner")
			SubTabBtnOutlineCorner.CornerRadius = UDim.new(0, 4)
			SubTabBtnOutlineCorner.Name = "SubTabBtnOutlineCorner"
			SubTabBtnOutlineCorner.Parent = SubTabBtnOutline

			local SubTabBtnInline = Instance.new("Frame")
			SubTabBtnInline.Name = "SubTabBtnInline"
			SubTabBtnInline.Parent = SubTabBtnOutline
			SubTabBtnInline.AnchorPoint = Vector2.new(0.5, 0.5)
			SubTabBtnInline.BackgroundColor3 = Color3.fromRGB(23, 20, 41)
			SubTabBtnInline.Position = UDim2.new(0.5, 0, 0.5, 0)
			SubTabBtnInline.Size = UDim2.new(1, -2, 1, -2)

			local SubTabBtnInteract = Instance.new("TextButton")
			SubTabBtnInteract.Name = "SubTabBtnInteract"
			SubTabBtnInteract.Parent = SubTabBtnInline
			SubTabBtnInteract.AnchorPoint = Vector2.new(0.5, 0.5)
			SubTabBtnInteract.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SubTabBtnInteract.BackgroundTransparency = 1.000
			SubTabBtnInteract.Position = UDim2.new(0.5, 0, 0.5, 0)
			SubTabBtnInteract.Size = UDim2.new(1, 0, 1, 0)
			SubTabBtnInteract.Font = Enum.Font.Gotham
			SubTabBtnInteract.Text = ""
			SubTabBtnInteract.TextColor3 = Color3.fromRGB(255, 255, 255)
			SubTabBtnInteract.TextSize = 12.000
			SubTabBtnInteract.TextXAlignment = Enum.TextXAlignment.Right

			SubTabBtnInteract.MouseEnter:Connect(function()
				game.TweenService:Create(SubTabBtnOutline, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					BackgroundColor3 = Color3.fromRGB(165, 120, 255)
				}):Play()
			end)
			
			SubTabBtnInteract.MouseLeave:Connect(function()
				game.TweenService:Create(SubTabBtnOutline, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					BackgroundColor3 = Color3.fromRGB(107, 89, 222)
				}):Play()
			end)

			SubTabBtnInteract.MouseButton1Down:Connect(function()
				game.TweenService:Create(SubTabBtnOutline, TweenInfo.new(0.075, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					BackgroundColor3 = Color3.fromRGB(43, 31, 82)
				}):Play()
			end)

			local SubTabBtnIcon = Instance.new("ImageLabel")
			SubTabBtnIcon.Name = "SubTabBtnIcon"
			SubTabBtnIcon.Parent = SubTabBtnInline
			SubTabBtnIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SubTabBtnIcon.BackgroundTransparency = 1.000
			SubTabBtnIcon.BorderSizePixel = 0
			SubTabBtnIcon.Position = UDim2.new(0, 3, 0.5, -9)
			SubTabBtnIcon.Size = UDim2.new(0, 18, 0, 18)
			SubTabBtnIcon.Image = "http://www.roblox.com/asset/?id=" .. AssID

			local SubTabBtnInlineCorner = Instance.new("UICorner")
			SubTabBtnInlineCorner.CornerRadius = UDim.new(0, 4)
			SubTabBtnInlineCorner.Name = "SubTabBtnInlineCorner"
			SubTabBtnInlineCorner.Parent = SubTabBtnInline

			local SubTabBtnTitle = Instance.new("TextLabel")
			SubTabBtnTitle.Name = "SubTabBtnTitle"
			SubTabBtnTitle.Parent = SubTabBtnInline
			SubTabBtnTitle.AnchorPoint = Vector2.new(1, 0.5)
			SubTabBtnTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SubTabBtnTitle.BackgroundTransparency = 1.000
			SubTabBtnTitle.ClipsDescendants = true
			SubTabBtnTitle.Position = UDim2.new(1, -4, 0.5, 0)
			SubTabBtnTitle.Size = UDim2.new(1, -30, 1, 1)
			SubTabBtnTitle.Font = Enum.Font.Gotham
			SubTabBtnTitle.Text = title
			SubTabBtnTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			SubTabBtnTitle.TextSize = 12.000
			SubTabBtnTitle.TextXAlignment = Enum.TextXAlignment.Right
			
--[[
			local SettingsFrame = Instance.new("Frame")
			local SettingsHolder = Instance.new("Frame")
			local SettingsContainer = Instance.new("ScrollingFrame")
			local SettingsBind = Instance.new("TextButton")
			local SettingsBindText = Instance.new("TextLabel")
			local SettingsBindBox = Instance.new("TextLabel")
			local SettingsBindBoxCorner = Instance.new("UICorner")
			local SettingsBindCorner = Instance.new("UICorner")
			local SettingsButton = Instance.new("TextButton")
			local SettingsButtonCorner = Instance.new("UICorner")
			local SettingsButtonText = Instance.new("TextLabel")
			local SettingsContainerPadding = Instance.new("UIPadding")
			local SettingsContainerLayout = Instance.new("UIListLayout")
			local SettingsFrameCorner = Instance.new("UICorner")
			local SettingsFrameItems = Instance.new("Frame")
			local SettingsTitle = Instance.new("TextLabel")

			SettingsFrame.Name = "SettingsFrame"
			SettingsFrame.Parent = MainFrame
			SettingsFrame.Visible = false
			SettingsFrame.BackgroundColor3 = Color3.fromRGB(13, 10, 28)
			SettingsFrame.Position = UDim2.new(0.112857141, 0, 0, 0)
			SettingsFrame.Size = UDim2.new(0, 620, 0, 625)

			SettingsHolder.Name = "SettingsHolder"
			SettingsHolder.Parent = SettingsFrame
			SettingsHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SettingsHolder.BackgroundTransparency = 1.000
			SettingsHolder.Position = UDim2.new(0.0161040276, 0, 0.0703999996, 0)
			SettingsHolder.Size = UDim2.new(0, 610, 0, 581)

			SettingsContainer.Name = "SettingsContainer"
			SettingsContainer.Parent = SettingsHolder
			SettingsContainer.Active = true
			SettingsContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SettingsContainer.BackgroundTransparency = 1.000
			SettingsContainer.BorderSizePixel = 0
			SettingsContainer.Size = UDim2.new(1, 0, 1, 0)
			SettingsContainer.ScrollBarThickness = 4

			SettingsBind.Name = "SettingsBind"
			SettingsBind.Parent = SettingsContainer
			SettingsBind.BackgroundColor3 = Color3.fromRGB(107, 89, 222)
			SettingsBind.Position = UDim2.new(0.0166320167, 0, 0, 0)
			SettingsBind.Size = UDim2.new(0, 412, 0, 36)
			SettingsBind.AutoButtonColor = false
			SettingsBind.Font = Enum.Font.Gotham
			SettingsBind.Text = ""
			SettingsBind.TextColor3 = Color3.fromRGB(255, 255, 255)
			SettingsBind.TextSize = 14.000

			SettingsBindText.Name = "SettingsBindText"
			SettingsBindText.Parent = SettingsBind
			SettingsBindText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SettingsBindText.BackgroundTransparency = 1.000
			SettingsBindText.Position = UDim2.new(9.31322575e-10, 0, 0.253584236, 0)
			SettingsBindText.Size = UDim2.new(0, 102, 0, 17)
			SettingsBindText.Font = Enum.Font.Gotham
			SettingsBindText.Text = "GUI KeyBind"
			SettingsBindText.TextColor3 = Color3.fromRGB(255, 255, 255)
			SettingsBindText.TextSize = 14.000

			SettingsBindBox.Name = "SettingsBindBox"
			SettingsBindBox.Parent = SettingsBind
			SettingsBindBox.BackgroundColor3 = Color3.fromRGB(52, 43, 108)
			SettingsBindBox.Position = UDim2.new(0.56099999, 0, 0.111000001, 0)
			SettingsBindBox.Size = UDim2.new(0, 176, 0, 27)
			SettingsBindBox.Font = Enum.Font.Gotham
			SettingsBindBox.Text = "RightShift"
			SettingsBindBox.TextColor3 = Color3.fromRGB(255, 255, 255)
			SettingsBindBox.TextSize = 14.000

			SettingsBindBoxCorner.CornerRadius = UDim.new(0, 9)
			SettingsBindBoxCorner.Name = "SettingsBindBoxCorner"
			SettingsBindBoxCorner.Parent = SettingsBindBox

			SettingsBindCorner.CornerRadius = UDim.new(0, 9)
			SettingsBindCorner.Name = "SettingsBindCorner"
			SettingsBindCorner.Parent = SettingsBind

			SettingsButton.Name = "SettingsButton"
			SettingsButton.Parent = SettingsContainer
			SettingsButton.BackgroundColor3 = Color3.fromRGB(107, 89, 222)
			SettingsButton.Position = UDim2.new(0.0166320167, 0, 0, 0)
			SettingsButton.Size = UDim2.new(0, 412, 0, 36)
			SettingsButton.AutoButtonColor = false
			SettingsButton.Font = Enum.Font.Gotham
			SettingsButton.Text = ""
			SettingsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			SettingsButton.TextSize = 14.000

			SettingsButtonCorner.CornerRadius = UDim.new(0, 3)
			SettingsButtonCorner.Name = "SettingsButtonCorner"
			SettingsButtonCorner.Parent = SettingsButton

			SettingsButtonText.Name = "SettingsButtonText"
			SettingsButtonText.Parent = SettingsButton
			SettingsButtonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SettingsButtonText.BackgroundTransparency = 1.000
			SettingsButtonText.Position = UDim2.new(9.41322575e-10, 0, 0.253584236, 0)
			SettingsButtonText.Size = UDim2.new(0, 102, 0, 17)
			SettingsButtonText.Font = Enum.Font.Gotham
			SettingsButtonText.Text = "Discord Server"
			SettingsButtonText.TextColor3 = Color3.fromRGB(255, 255, 255)
			SettingsButtonText.TextSize = 14.000
			SettingsButtonText.TextXAlignment = Enum.TextXAlignment.Right

			SettingsContainerPadding.Name = "SettingsContainerPadding"
			SettingsContainerPadding.Parent = SettingsContainer
			SettingsContainerPadding.PaddingTop = UDim.new(0, 10)

			SettingsContainerLayout.Name = "SettingsContainerLayout"
			SettingsContainerLayout.Parent = SettingsContainer
			SettingsContainerLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			SettingsContainerLayout.SortOrder = Enum.SortOrder.LayoutOrder
			SettingsContainerLayout.Padding = UDim.new(0, 7)

			SettingsFrameCorner.Name = "SettingsFrameCorner"
			SettingsFrameCorner.Parent = SettingsFrame

			SettingsFrameItems.Name = "SettingsFrameItems"
			SettingsFrameItems.Parent = SettingsFrame
			SettingsFrameItems.BackgroundColor3 = Color3.fromRGB(13, 10, 28)
			SettingsFrameItems.BorderSizePixel = 0
			SettingsFrameItems.Size = UDim2.new(0, 620, 0, 46)

			SettingsTitle.Name = "SettingsTitle"
			SettingsTitle.Parent = SettingsFrameItems
			SettingsTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SettingsTitle.BackgroundTransparency = 1.000
			SettingsTitle.Position = UDim2.new(0.41093117, 0, 0.217391312, 0)
			SettingsTitle.Size = UDim2.new(0, 87, 0, 17)
			SettingsTitle.Font = Enum.Font.Gotham
			SettingsTitle.Text = "Settings"
			SettingsTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			SettingsTitle.TextSize = 20.000
]]

			local Left = Instance.new("Frame")
			Left.Name = "Left"
			Left.Parent = AllSubPagesFolder
			Left.AnchorPoint = Vector2.new(0, 0.5)
			Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Left.BackgroundTransparency = 1.000
			Left.Position = UDim2.new(0, 0, 0.5, 0)
			Left.Size = UDim2.new(0.5, 0, 1, 0)
			Left.Visible = false
			
			local LeftListing = Instance.new("UIListLayout")
			LeftListing.Name = "LeftListing"
			LeftListing.Parent = Left
			LeftListing.HorizontalAlignment = Enum.HorizontalAlignment.Left
			LeftListing.SortOrder = Enum.SortOrder.LayoutOrder
			LeftListing.Padding = UDim.new(0, 1)
			
			local Right = Instance.new("Frame")
			Right.Name = "Right"
			Right.Parent = AllSubPagesFolder
			Right.AnchorPoint = Vector2.new(1, 0.5)
			Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Right.BackgroundTransparency = 1.000
			Right.Position = UDim2.new(1, -1, 0.5, 0)
			Right.Size = UDim2.new(0.5, -2, 1, 0)
			Right.Visible = false

			local RightListing = Instance.new("UIListLayout")
			RightListing.Name = "RightListing"
			RightListing.Parent = Right
			RightListing.HorizontalAlignment = Enum.HorizontalAlignment.Left
			RightListing.SortOrder = Enum.SortOrder.LayoutOrder
			
			local SubPageFade = Instance.new("Frame")
			SubPageFade.Name = "SubPageFade"
			SubPageFade.Parent = MainFrame
			SubPageFade.AnchorPoint = Vector2.new(1, 1)
			SubPageFade.BackgroundColor3 = Color3.fromRGB(23, 20, 41)
			SubPageFade.BackgroundTransparency = 1
			SubPageFade.BorderSizePixel = 0
			SubPageFade.Position = UDim2.new(1, 0, 1, 0)
			SubPageFade.Size = UDim2.new(1, -80, 1, -190)
			SubPageFade.ZIndex = 99
			SubPageFade.Visible = true
			
			SubTabBtnInteract.MouseButton1Click:Connect(function()
				for i, v in next, AllSubPagesFolder:GetChildren() do
					coroutine.wrap(function()
						wait(lib.Animations.AnimSpeed)
						v.Visible = false
					end)()
				end
				coroutine.wrap(function()
					wait(lib.Animations.AnimSpeed)
					Left.Visible = true
					Right.Visible = true
				end)()

				coroutine.wrap(function()
					game.TweenService:Create(SubPageFade, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
						BackgroundTransparency = 0
					}):Play()
					wait(lib.Animations.AnimSpeed)
					game.TweenService:Create(SubPageFade, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
						BackgroundTransparency = 1
					}):Play()
				end)()

				for i, v in next, AllSubTabBtns:GetDescendants() do
					if v.Name == 'SubTabBtnInline' then
						game.TweenService:Create(v, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
							BackgroundColor3 = Color3.fromRGB(23, 20, 41)
						}):Play()
					end
				end
				game.TweenService:Create(SubTabBtnInline, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
					BackgroundColor3 = Color3.fromRGB(107, 89, 222)
				}):Play()
			end)
			
			local items = {}
			
			function items:Label(side, text, image)
				local Label = Instance.new("Frame")
				Label.Name = tostring(text)
				Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Label.BorderSizePixel = 0
				Label.Size = UDim2.new(1, 0, 0, 36)
				
				local LabelOutline = Instance.new("UIStroke")
				LabelOutline.Enabled = true
				LabelOutline.Parent = Label
				LabelOutline.Color = Color3.fromRGB(31, 26, 61)
				LabelOutline.LineJoinMode = Enum.LineJoinMode.Miter
				LabelOutline.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
				LabelOutline.Thickness = 1
				LabelOutline.Transparency = 1
				
				local LabelTitle = Instance.new("TextLabel")
				LabelTitle.Name = "LabelTitle"
				LabelTitle.Parent = Label
				LabelTitle.AnchorPoint = Vector2.new(1, 0.5)
				LabelTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				LabelTitle.BackgroundTransparency = 1.000
				LabelTitle.Position = UDim2.new(1, 0, 0.5, 0)
				LabelTitle.Size = UDim2.new(1, -40, 1, 0)
				LabelTitle.Font = Enum.Font.GothamMedium
				LabelTitle.Text = text
				LabelTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				LabelTitle.TextSize = 12.000
				LabelTitle.TextXAlignment = Enum.TextXAlignment.Left
				
				local LabelArrows = Instance.new("TextLabel")
				LabelArrows.Name = "LabelArrows"
				LabelArrows.Parent = Label
				LabelArrows.AnchorPoint = Vector2.new(0, 0.5)
				LabelArrows.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				LabelArrows.BackgroundTransparency = 1.000
				LabelArrows.Position = UDim2.new(0, 21, 0.5, -1)
				LabelArrows.Size = UDim2.new(0, 10, 0, 20)
				LabelArrows.Font = Enum.Font.Ubuntu
				LabelArrows.Text = "»"
				LabelArrows.TextColor3 = Color3.fromRGB(107, 89, 222)
				LabelArrows.TextSize = 20
				LabelArrows.TextXAlignment = Enum.TextXAlignment.Left
				
				local LabelGradient = Instance.new("UIGradient")
				LabelGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(23, 20, 46)), ColorSequenceKeypoint.new(0.08, Color3.fromRGB(26, 23, 56)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(26, 23, 56))}
				LabelGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(1.00, 0.25)}
				LabelGradient.Name = "LabelGradient"
				LabelGradient.Parent = Label

				local label = {}

				function label:update(str)
					LabelTitle.Text = str
				end
				
				if side == 'Left' then
					Label.Parent = Left
				elseif side == 'Right' then
					Label.Parent = Right
				else
					Label:Destroy()
					print('please select a side for the ' .. text .. ' label')
				end

				return label
			end
			function items:Toggle(side, text, callback)
				local Toggle = Instance.new("Frame")
				Toggle.Name = tostring(text)
				Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Toggle.BackgroundTransparency = 1.000
				Toggle.BorderColor3 = Color3.fromRGB(27, 42, 53)
				Toggle.BorderSizePixel = 0
				Toggle.Size = UDim2.new(1, 0, 0, 36)
				
				local ToggleOutline = Instance.new("UIStroke")
				ToggleOutline.Enabled = true
				ToggleOutline.Parent = Toggle
				ToggleOutline.Color = Color3.fromRGB(31, 26, 61)
				ToggleOutline.LineJoinMode = Enum.LineJoinMode.Miter
				ToggleOutline.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
				ToggleOutline.Thickness = 1
				ToggleOutline.Transparency = 1
				
				local ToggleTitle = Instance.new("TextLabel")
				ToggleTitle.Name = "ToggleTitle"
				ToggleTitle.Parent = Toggle
				ToggleTitle.AnchorPoint = Vector2.new(1, 0.5)
				ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ToggleTitle.BackgroundTransparency = 1.000
				ToggleTitle.Position = UDim2.new(1, 0, 0.5, 0)
				ToggleTitle.Size = UDim2.new(1, -21, 1, 0)
				ToggleTitle.Font = Enum.Font.GothamMedium
				ToggleTitle.Text = text
				ToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				ToggleTitle.TextSize = 12.000
				ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
				
				local ToggleFrameBack = Instance.new("Frame")
				ToggleFrameBack.Name = "ToggleFrameBack"
				ToggleFrameBack.Parent = Toggle
				ToggleFrameBack.AnchorPoint = Vector2.new(1, 0.5)
				ToggleFrameBack.BackgroundColor3 = Color3.fromRGB(33, 28, 64)
				ToggleFrameBack.Position = UDim2.new(1, -12, 0.5, 0)
				ToggleFrameBack.Size = UDim2.new(0, 36, 0, 18)
				
				local ToggleFrameBackCorner = Instance.new("UICorner")
				ToggleFrameBackCorner.CornerRadius = UDim.new(1, 0)
				ToggleFrameBackCorner.Name = "ToggleFrameBackCorner"
				ToggleFrameBackCorner.Parent = ToggleFrameBack
				
				local ToggleFrameCircle = Instance.new("Frame")
				ToggleFrameCircle.Name = "ToggleFrameCircle"
				ToggleFrameCircle.Parent = ToggleFrameBack
				ToggleFrameCircle.AnchorPoint = Vector2.new(0, 0.5)
				ToggleFrameCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ToggleFrameCircle.Position = UDim2.new(0, 3, 0.5, 0)
				ToggleFrameCircle.Size = UDim2.new(0, 14, 0, 14)
				
				local ToggleFrameCircleCorner = Instance.new("UICorner")
				ToggleFrameCircleCorner.CornerRadius = UDim.new(1, 0)
				ToggleFrameCircleCorner.Name = "ToggleFrameCircleCorner"
				ToggleFrameCircleCorner.Parent = ToggleFrameCircle
				
				local ToggleInteract = Instance.new("TextButton")
				ToggleInteract.Name = "ToggleInteract"
				ToggleInteract.Parent = Toggle
				ToggleInteract.AnchorPoint = Vector2.new(0.5, 0.5)
				ToggleInteract.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ToggleInteract.BackgroundTransparency = 1.000
				ToggleInteract.Position = UDim2.new(0.5, 0, 0.5, 0)
				ToggleInteract.Size = UDim2.new(1, 0, 1, 0)
				ToggleInteract.Font = Enum.Font.SourceSans
				ToggleInteract.Text = ""
				ToggleInteract.TextColor3 = Color3.fromRGB(0, 0, 0)
				ToggleInteract.TextSize = 14.000
				
				local toggled = false
				ToggleInteract.MouseButton1Click:Connect(function()
					toggled = not toggled
					if toggled then
						game.TweenService:Create(ToggleFrameCircle, TweenInfo.new(lib.Animations.ElementsAS, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							Position = UDim2.new(0, 20, 0.5, 0)
						}):Play()
						game.TweenService:Create(ToggleFrameBack, TweenInfo.new(lib.Animations.ElementsAS, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							BackgroundColor3 = Color3.fromRGB(107, 89, 222)
						}):Play()
					else
						game.TweenService:Create(ToggleFrameCircle, TweenInfo.new(lib.Animations.ElementsAS, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							Position = UDim2.new(0, 3, 0.5, 0)
						}):Play()
						game.TweenService:Create(ToggleFrameBack, TweenInfo.new(lib.Animations.ElementsAS, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							BackgroundColor3 = Color3.fromRGB(33, 28, 64)
						}):Play()
					end
					pcall(callback, toggled)
				end)
				
				if side == 'Left' then
					Toggle.Parent = Left
				elseif side == 'Right' then
					Toggle.Parent = Right
				else
					Toggle:Destroy()
					print('please select a side for the ' .. text .. ' label')
				end
			end

            function items:Color(side, text, default, callback)

                local color_current = default or Color3.new(1,1,1)
				local trans_current = 0
				local dragging_sat = false
				local dragging_hue = false
				local dragging_trans = false

                local Color = Instance.new("Frame")
				Color.Name = tostring(text)
				Color.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Color.BackgroundTransparency = 1.000
				Color.BorderColor3 = Color3.fromRGB(27, 42, 53)
				Color.BorderSizePixel = 0
				Color.Size = UDim2.new(1, 0, 0, 36)
				
				local ColorOutline = Instance.new("UIStroke")
				ColorOutline.Enabled = true
				ColorOutline.Parent = Color
				ColorOutline.Color = Color3.fromRGB(31, 26, 61)
				ColorOutline.LineJoinMode = Enum.LineJoinMode.Miter
				ColorOutline.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
				ColorOutline.Thickness = 1
				ColorOutline.Transparency = 1
				
				local ColorTitle = Instance.new("TextLabel")
				ColorTitle.Name = "ColorTitle"
				ColorTitle.Parent = Color
				ColorTitle.AnchorPoint = Vector2.new(1, 0.5)
				ColorTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ColorTitle.BackgroundTransparency = 1.000
				ColorTitle.Position = UDim2.new(1, 0, 0.5, 0)
				ColorTitle.Size = UDim2.new(1, -21, 1, 0)
				ColorTitle.Font = Enum.Font.GothamMedium
				ColorTitle.Text = text
				ColorTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				ColorTitle.TextSize = 12.000
				ColorTitle.TextXAlignment = Enum.TextXAlignment.Left
				
                local ColorImage = Instance.new('ImageLabel')
                ColorImage.Image = 'rbxassetid://3926305904'
                ColorImage.ImageColor3 = Color3.new(1,1,1)
                ColorImage.BackgroundTransparency = 1
                ColorImage.ImageRectOffset = Vector2.new(804, 964)
                ColorImage.ImageRectSize = Vector2.new(36 ,36)
                ColorImage.ScaleType = Enum.ScaleType.Stretch
                ColorImage.SliceScale = 1
                ColorImage.Size = UDim2.fromOffset(18,18)
                ColorImage.Position = UDim2.new(1,-20,.5,0)
                ColorImage.AnchorPoint = Vector2.new(.5,.5)
                ColorImage.Parent = Color

				local Interaction = Instance.new('TextButton')
				Interaction.Text = ''
				Interaction.Size = UDim2.new(1,0,1,0)
				Interaction.BackgroundTransparency = 1
				Interaction.Parent = Color



				local ColorPickerHolder = Instance.new('Frame')
				ColorPickerHolder.Size = UDim2.new(0,160,0,150)
				ColorPickerHolder.AnchorPoint = Vector2.new(1,0)
				ColorPickerHolder.Position = UDim2.new(1,-3,1,3)
				ColorPickerHolder.BackgroundColor3 = Color3.fromRGB(23, 20, 46)
				ColorPickerHolder.Parent = Color
				ColorPickerHolder.ZIndex = 100
				ColorPickerHolder.Visible = false

				local ColorOutline = Instance.new("UIStroke")
				ColorOutline.Enabled = true
				ColorOutline.Parent = ColorPickerHolder
				ColorOutline.Color = Color3.fromRGB(31, 26, 61)
				ColorOutline.LineJoinMode = Enum.LineJoinMode.Round
				ColorOutline.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
				ColorOutline.Thickness = 1
				ColorOutline.Transparency = 1

				local ColorCorner = Instance.new("UICorner")
				ColorCorner.CornerRadius = UDim.new(0, 4)
				ColorCorner.Name = "ColorCorner"
				ColorCorner.Parent = ColorPickerHolder

				local ColorSat = Instance.new('ImageButton')
				ColorSat.Size = UDim2.new(0,120,0,120)
				ColorSat.Position = UDim2.new(0,5,0,5)
				ColorSat.Parent = ColorPickerHolder
				ColorSat.AutoButtonColor = false
				ColorSat.BackgroundColor3 = Color3.new(1,0,0)
				ColorSat.BorderColor3 = Color3.fromRGB(31, 26, 61)
				ColorSat.ZIndex = 105

				local ColorSat1 = Instance.new('ImageLabel')
				ColorSat1.Size = UDim2.new(1,0,1,0)
				ColorSat1.BackgroundTransparency = 1
				ColorSat1.Image = 'http://www.roblox.com/asset/?id=11149834788'
				ColorSat1.Parent = ColorSat
				ColorSat1.ZIndex = 107

				local ColorSat2 = Instance.new('ImageLabel')
				ColorSat2.Size = UDim2.new(1,0,1,0)
				ColorSat2.Image = 'http://www.roblox.com/asset/?id=11149834082'
				ColorSat2.BackgroundTransparency = 1
				ColorSat2.Parent = ColorSat
				ColorSat2.ZIndex = 106

				local SatPointer = Instance.new('Frame')
				SatPointer.Size = UDim2.new(0,1,0,1)
				SatPointer.BackgroundColor3 = Color3.new(1,1,1)
				SatPointer.BorderColor3 = Color3.new(0,0,0)
				SatPointer.Parent = ColorSat
				SatPointer.ZIndex = 108

				local ColorHue = Instance.new('ImageButton')
				ColorHue.Size = UDim2.new(0,10,0,120)
				ColorHue.Position = UDim2.new(0,130,0,5)
				ColorHue.BackgroundTransparency = 1
				ColorHue.Image = 'http://www.roblox.com/asset/?id=11149889174'
				ColorHue.Parent = ColorPickerHolder
				ColorHue.AutoButtonColor = false
				ColorHue.ZIndex = 103

				local ColorHueSlider = Instance.new('Frame')
				ColorHueSlider.Size = UDim2.new(1,0,0,1)
				ColorHueSlider.BackgroundColor3 = Color3.new(1,1,1)
				ColorHueSlider.BorderColor3 = Color3.new(0,0,0)
				ColorHueSlider.Parent = ColorHue
				ColorHueSlider.ZIndex = 104

				local ColorInputOutline = Instance.new("UIStroke")
				ColorInputOutline.Enabled = true
				ColorInputOutline.Parent = ColorHue
				ColorInputOutline.Color = Color3.fromRGB(31, 26, 61)
				ColorInputOutline.LineJoinMode = Enum.LineJoinMode.Round
				ColorInputOutline.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				ColorInputOutline.Thickness = 1
				ColorInputOutline.Transparency = 1

				local ColorInputCorner = Instance.new("UICorner")
				ColorInputCorner.CornerRadius = UDim.new(0, 2)
				ColorInputCorner.Name = "ColorInputCorner"
				ColorInputCorner.Parent = ColorHue
				

				local ColorInput = Instance.new('TextBox')
				ColorInput.Size = UDim2.new(1,-10,0,15)
				ColorInput.AnchorPoint = Vector2.new(0,1)
				ColorInput.Position = UDim2.new(0,5,1,-5)
				ColorInput.BackgroundColor3 = Color3.fromRGB(13, 10, 28)
				ColorInput.TextColor3 = Color3.new(1,1,1)
				ColorInput.ClearTextOnFocus = false
				ColorInput.Parent = ColorPickerHolder
				ColorInput.ZIndex = 101

				local ColorInputOutline = Instance.new("UIStroke")
				ColorInputOutline.Enabled = true
				ColorInputOutline.Parent = ColorInput
				ColorInputOutline.Color = Color3.fromRGB(31, 26, 61)
				ColorInputOutline.LineJoinMode = Enum.LineJoinMode.Round
				ColorInputOutline.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				ColorInputOutline.Thickness = 1
				ColorInputOutline.Transparency = 1

				local ColorInputCorner = Instance.new("UICorner")
				ColorInputCorner.CornerRadius = UDim.new(0, 4)
				ColorInputCorner.Name = "ColorInputCorner"
				ColorInputCorner.Parent = ColorInput

				function set_color(color, trans)
					local h,s,v = color:ToHSV()
					h = math.clamp(h == 1 and 0 or h, 0.005, 0.995)
            		s = math.clamp(s, 0.005, 0.995)
            		v = math.clamp(v, 0.005, 0.995)

					SatPointer.Position = UDim2.new(1 - s, 0, 1 - v, 0)
					ColorHueSlider.Position = UDim2.new(0,0,h,0)

					ColorSat.BackgroundColor3 = Color3.fromHSV(h,1,1)
					ColorInput.Text = '#' .. tostring(color:ToHex()):upper()
					color_current = color
					trans_current = math.clamp(trans, 0, 1)

					if callback ~= nil then
						callback(color, trans)
					end
				end

                Color.MouseEnter:Connect(function()
					game.TweenService:Create(ColorImage, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						ImageColor3 = mc_color_icon
					}):Play()
				end)
				
				Color.MouseLeave:Connect(function()
					game.TweenService:Create(ColorImage, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						ImageColor3 = ml_color_icon
					}):Play()
					
				end)

				local function set_vis(bool)
					local descendants = ColorPickerHolder:GetDescendants()
					table.insert(descendants, ColorPickerHolder)
					for i,v in next, descendants do
						task.spawn(function()
							if bool then
								v.Visible = true
							end

							local properties = {}
							local trans = bool and 0 or 1

							if v:IsA('Frame') then
								properties = {['BackgroundTransparency'] = trans}
							elseif v:IsA('ImageLabel') then
								properties = {['ImageTransparency'] = trans, ['BackgroundTransparency'] = (v == ColorSat1 or v == ColorSat2) and 1 or trans}
							elseif v:IsA('ImageButton') then
								properties = {['ImageTransparency'] = (v == ColorSat) and 1 or trans, ['BackgroundTransparency'] = trans}
							elseif v:IsA('TextBox') then
								properties = {['TextTransparency'] = trans, ['BackgroundTransparency'] = trans}
							elseif v:IsA('UIStroke') then
								properties = {['Transparency'] = trans }
							end
								
							TweenService:Create(v, TweenInfo.new(0.25), properties):Play()
							task.wait(0.25)
							if not bool then
								v.Visible = false
							end
						end)
					end
				end
				
				Interaction.MouseButton1Click:Connect(function()
					if selected_colorpicker ~= nil then
						set_vis(false)
					end

					if selected_colorpicker == ColorPickerHolder then
						selected_colorpicker = nil
						return
					end

					selected_colorpicker = ColorPickerHolder
					set_vis(true)
				end)

				local SatInput
				local HueInput
				local TransInput

				UserInputService.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging_sat = false
						dragging_hue = false
						dragging_trans = false

						if SatInput then
							SatInput:Disconnect()
						end
						if HueInput then
							HueInput:Disconnect()
						end
						if TransInput then
							TransInput:Disconnect()
						end
					end
				end)

				ColorSat.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if SatInput then SatInput:Disconnect() end

						SatInput = RunService.RenderStepped:Connect(function()
							local rel = (UserInputService:GetMouseLocation() - (ColorSat.AbsolutePosition + Vector2.new(0,36)))
							local h,s,v = color_current:ToHSV()
							s = math.clamp(1 - convert_number_range(0, 1, 0, 120, rel.X), 0.005, 0.995)
							v = math.clamp(1 - convert_number_range(0, 1, 0, 120, rel.Y), 0.005, 0.995)
							set_color(Color3.fromHSV(h,s,v), trans_current)	
						end)
					end
				end)

				ColorHue.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if HueInput then HueInput:Disconnect() end

						HueInput = RunService.RenderStepped:Connect(function()
							local rel = (UserInputService:GetMouseLocation() - (ColorHue.AbsolutePosition + Vector2.new(0,36)))
							local h,s,v = color_current:ToHSV()
							h = math.clamp(convert_number_range(0, 1, 0, 120, rel.Y), 0.005, 0.995)
							set_color(Color3.fromHSV(h,s,v), trans_current)	
						end)
					end
				end)

		

				ColorSat.InputBegan:Connect(function()
					dragging_sat = true
				end)

				ColorHue.InputBegan:Connect(function()
					dragging_hue = true
				end)

	
				ColorInput.FocusLost:Connect(function(enterpressed)
					local split = ColorInput.Text:split('')

					if split[1] ~= '#' then
						ColorInput.Text = '#' .. ColorInput.Text
					end

					xpcall(function()
						set_color(Color3.fromHex(ColorInput.Text:gsub('#', '')), trans_current)
					end, function()
						set_color(Color3.new(1,1,1), trans_current)
					end)
				end)

				if side == 'Left' then
					Color.Parent = Left
				elseif side == 'Right' then
					Color.Parent = Right
				else
					Color:Destroy()
					print('please select a side for the ' .. text .. ' label')
				end
            end

            function items:Button(side, text, callback, callback_2, prompttitle, promptmessage)
                assert(type(callback) == 'function', 'callback must be a function')

                local Button = Instance.new("Frame")
				Button.Name = text or ''
				Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Button.BackgroundTransparency = 1.000
				Button.BorderColor3 = Color3.fromRGB(27, 42, 53)
				Button.BorderSizePixel = 0
				Button.Size = UDim2.new(1, 0, 0, 36)
                Button.Parent = side == 'Left' and Left or Right
				
				local ButtonOutline = Instance.new("UIStroke")
				ButtonOutline.Enabled = true
				ButtonOutline.Parent = Button
				ButtonOutline.Color = Color3.fromRGB(31, 26, 61)
				ButtonOutline.LineJoinMode = Enum.LineJoinMode.Miter
				ButtonOutline.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
				ButtonOutline.Thickness = 1
				ButtonOutline.Transparency = 1

                local ButtonFrame = Instance.new("TextButton")
				ButtonFrame.Name = "ButtonFrame"
				ButtonFrame.Parent = Button
				ButtonFrame.AnchorPoint = Vector2.new(1, 0.5)
				ButtonFrame.BackgroundColor3 = Color3.fromRGB(34, 28, 64)
				ButtonFrame.Position = UDim2.new(1, -12, 0.5, 0)
				ButtonFrame.Size = UDim2.new(1, -33, 0, 22)
                ButtonFrame.Font = Enum.Font.GothamMedium
				ButtonFrame.Text = text
				ButtonFrame.TextColor3 = Color3.fromRGB(255, 255, 255)
				ButtonFrame.TextSize = 12.000
				ButtonFrame.TextXAlignment = Enum.TextXAlignment.Center
                ButtonFrame.AutoButtonColor = false

				local ButtonFrameCorner = Instance.new("UICorner")
				ButtonFrameCorner.CornerRadius = UDim.new(0, 4)
				ButtonFrameCorner.Name = "ButtonFrameCorner"
				ButtonFrameCorner.Parent = ButtonFrame

                ButtonFrame.MouseButton1Click:Connect(function()

					if promptmessage ~= nil then
						PromptText.Text = promptmessage
						PromptTitle.Text = prompttitle or "testt"
						PromptContainer.Visible = true

						local c_yes
						local c_no

						c_yes = PromptYesButton.MouseButton1Click:Connect(function()
							c_yes:Disconnect()
							c_no:Disconnect()
							PromptContainer.Visible = false
							callback()
						end)

						c_no = PromptNoButton.MouseButton1Click:Connect(function()
							c_yes:Disconnect()
							c_no:Disconnect()
							PromptContainer.Visible = false
							callback_2()
						end)

						return
					end

                    callback()
                end)

                ButtonFrame.MouseEnter:Connect(function()
					game.TweenService:Create(ButtonFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						BackgroundColor3 = Color3.fromRGB(42, 34, 80)
					}):Play()
				end)
                
				ButtonFrame.MouseLeave:Connect(function()
					game.TweenService:Create(ButtonFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						BackgroundColor3 = Color3.fromRGB(34, 28, 64)
					}):Play()
				end)

                ButtonFrame.MouseButton1Down:Connect(function()
					game.TweenService:Create(ButtonFrame, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						BackgroundColor3 = Color3.fromRGB(91, 73, 143)
					}):Play()
				end)

                ButtonFrame.MouseButton1Up:Connect(function()
					game.TweenService:Create(ButtonFrame, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						BackgroundColor3 = Color3.fromRGB(42, 34, 80)
					}):Play()
				end)
	
            end
            
	
			function items:Bind(side, text, mode, callback)
				local BindContainer = Instance.new("Frame")
				BindContainer.Name = tostring(text)
				BindContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				BindContainer.BackgroundTransparency = 1.000
				BindContainer.BorderColor3 = Color3.fromRGB(27, 42, 53)
				BindContainer.BorderSizePixel = 0
				BindContainer.Size = UDim2.new(1, 0, 0, 36)
				
				local BindOutline = Instance.new("UIStroke")
				BindOutline.Enabled = true
				BindOutline.Parent = BindContainer
				BindOutline.Color = Color3.fromRGB(31, 26, 61)
				BindOutline.LineJoinMode = Enum.LineJoinMode.Miter
				BindOutline.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
				BindOutline.Thickness = 1
				BindOutline.Transparency = 1
				
				local BindTitle = Instance.new("TextLabel")
				BindTitle.Name = "BindTitle"
				BindTitle.Parent = BindContainer
				BindTitle.AnchorPoint = Vector2.new(1, 0.5)
				BindTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				BindTitle.BackgroundTransparency = 1.000
				BindTitle.Position = UDim2.new(1, 0, 0.5, 0)
				BindTitle.Size = UDim2.new(1, -21, 1, 0)
				BindTitle.Font = Enum.Font.GothamMedium
				BindTitle.Text = text
				BindTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				BindTitle.TextSize = 12.000
				BindTitle.TextXAlignment = Enum.TextXAlignment.Left
				
				local KeybindFrame = Instance.new("Frame")
				KeybindFrame.Name = "KeybindFrame"
				KeybindFrame.Parent = BindContainer
				KeybindFrame.AnchorPoint = Vector2.new(1, 0.5)
				KeybindFrame.BackgroundColor3 = Color3.fromRGB(34, 28, 64)
				KeybindFrame.Position = UDim2.new(1, -12, 0.5, 0)
				KeybindFrame.Size = UDim2.new(0, 50, 0, 22)
				
				local KeybindFrameCorner = Instance.new("UICorner")
				KeybindFrameCorner.CornerRadius = UDim.new(0, 4)
				KeybindFrameCorner.Name = "KeybindFrameCorner"
				KeybindFrameCorner.Parent = KeybindFrame

				local KeybindKeytext = Instance.new("TextLabel")
				KeybindKeytext.Name = "KeybindKeytext"
				KeybindKeytext.Parent = KeybindFrame
				KeybindKeytext.AnchorPoint = Vector2.new(0.5, 0.5)
				KeybindKeytext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				KeybindKeytext.BackgroundTransparency = 1.000
				KeybindKeytext.ClipsDescendants = true
				KeybindKeytext.Position = UDim2.new(.5, 0, 0.5, 0)
				KeybindKeytext.Size = UDim2.new(0, 180, 1, 0)
				KeybindKeytext.Font = Enum.Font.GothamMedium
				KeybindKeytext.Text = text
				KeybindKeytext.TextColor3 = Color3.fromRGB(255, 255, 255)
				KeybindKeytext.TextSize = 12.000
				KeybindKeytext.TextXAlignment = Enum.TextXAlignment.Center

				local Interaction = Instance.new('TextButton')
				Interaction.Size = UDim2.new(1,0,1,0)
				Interaction.Parent = BindContainer
				Interaction.Transparency = 1
				Interaction.TextTransparency = 1

				local uis = UserInputService
				local binding = false
				local state = false
				local key = 'none'

				local mousenames = {
					[Enum.UserInputType.MouseButton1] = 'MB1',
					[Enum.UserInputType.MouseButton2] = 'MB2',
					[Enum.UserInputType.MouseButton3] = 'MB3',
				}
				
				function set_key(keycode)
					key = keycode == nil and 'none' or keycode

					local name = 'none'
					if mousenames[key] ~= nil then
						name = mousenames[key]
					elseif key ~= nil and key.Name ~= nil then
						name = key.Name
					end
            
           			KeybindKeytext.Text = tostring(name):upper()
					binding = false
				end

				uis.InputBegan:Connect(function(input)
					if binding then return end
					if key == 'none' or key == nil then return end
		
					if input.KeyCode == key or input.UserInputType == key then
						if mode == 'Toggle' then
							state = not state
							if callback ~= nil then callback(state) end
						elseif mode == 'Hold' then
							local c; c = game:GetService('RunService').RenderStepped:Connect(function(delta)
								if (input.KeyCode == key and not uis:IsKeyDown(key)) or (input.UserInputType == key and not uis:IsMouseButtonPressed(key)) then
									c:Disconnect()
									return
								end
								if callback ~= nil then callback(delta) end
							end)
						end
					end
				end)

				Interaction.MouseButton1Click:Connect(function()
					if binding then return end
					
					binding = true

					KeybindKeytext.Text = '. . .'

					local c; c = UserInputService.InputBegan:Connect(function(input)
						local binded = false

						if input.KeyCode == Enum.KeyCode.Backspace then
							set_key(nil)
							binded = true
						elseif mousenames[input.UserInputType] then
							set_key(input.UserInputType)
							binded = true
						elseif input.UserInputType == Enum.UserInputType.Keyboard then
							set_key(input.KeyCode)
							binded = true
						end

						if binded then
							c:Disconnect()
							binding = false
						end
					end)
				end)

				KeybindKeytext:GetPropertyChangedSignal('Text'):Connect(function()
					local size = game:GetService('TextService'):GetTextSize(KeybindKeytext.Text, KeybindKeytext.TextSize, KeybindKeytext.Font, Vector2.new(0,0))
					TweenService:Create(KeybindFrame, TweenInfo.new(0.125), {Size = UDim2.new(0,size.X + 14,0,22)}):Play()
				end)

				KeybindKeytext.Text = 'none'
				
				if side == 'Left' then
					BindContainer.Parent = Left
				elseif side == 'Right' then
					BindContainer.Parent = Right
				else
					BindContainer:Destroy()
					print('please select a side for the ' .. text .. ' label')
				end
			end




			--textbox by vice ^^ -- made in 25 mins ez 
			function items:Textbox(side, text, placeholdertext, callback)
				local TextBoxContainer = Instance.new("Frame")
				TextBoxContainer.Name = tostring(text)
				TextBoxContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextBoxContainer.BackgroundTransparency = 1.000
				TextBoxContainer.BorderColor3 = Color3.fromRGB(27, 42, 53)
				TextBoxContainer.BorderSizePixel = 0
				TextBoxContainer.Size = UDim2.new(1, 0, 0, 36)
				
				local TextBoxOutline = Instance.new("UIStroke")
				TextBoxOutline.Enabled = true
				TextBoxOutline.Parent = TextBoxContainer
				TextBoxOutline.Color = Color3.fromRGB(31, 26, 61)
				TextBoxOutline.LineJoinMode = Enum.LineJoinMode.Miter
				TextBoxOutline.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
				TextBoxOutline.Thickness = 1
				TextBoxOutline.Transparency = 1
				
				local TextBoxTitle = Instance.new("TextLabel")
				TextBoxTitle.Name = "TextBoxTitle"
				TextBoxTitle.Parent = TextBoxContainer
				TextBoxTitle.AnchorPoint = Vector2.new(1, 0.5)
				TextBoxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextBoxTitle.BackgroundTransparency = 1.000
				TextBoxTitle.Position = UDim2.new(1, 0, 0.5, 0)
				TextBoxTitle.Size = UDim2.new(1, -21, 1, 0)
				TextBoxTitle.Font = Enum.Font.GothamMedium
				TextBoxTitle.Text = text
				TextBoxTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextBoxTitle.TextSize = 12.000
				TextBoxTitle.TextXAlignment = Enum.TextXAlignment.Left
				
				local TextBoxFrame = Instance.new("Frame")
				TextBoxFrame.Name = "TextBoxFrame"
				TextBoxFrame.Parent = TextBoxContainer
				TextBoxFrame.AnchorPoint = Vector2.new(1, 0.5)
				TextBoxFrame.BackgroundColor3 = Color3.fromRGB(34, 28, 64)
				TextBoxFrame.Position = UDim2.new(1, -12, 0.5, 0)
				TextBoxFrame.Size = UDim2.new(0, 99, 0, 15)
				
				local TextBoxFrameCorner = Instance.new("UICorner")
				TextBoxFrameCorner.CornerRadius = UDim.new(0, 4)
				TextBoxFrameCorner.Name = "KeybindFrameCorner"
				TextBoxFrameCorner.Parent = TextBoxFrame

				local Box = Instance.new('TextBox')
				Box.Name = "Textbox"
				Box.Size = UDim2.new(1,0,1,0)
				Box.Position = UDim2.new(0, 0, 0, 0)
				Box.BackgroundTransparency = 0.2
				Box.TextColor3 = Color3.fromRGB(255, 255, 255)
				Box.Parent = TextBoxFrame
				Box.Font = Enum.Font.GothamMedium
				Box.TextScaled = true
				Box.PlaceholderText = placeholdertext
				Box.TextSize = 17.000
				Box.Text = ""
				Box.Transparency = 1
				Box.TextTransparency = 0

				local callback = callback or function() end
				Box.FocusLost:Connect(function()
					callback(Box.Text)
				 end)

				if side == 'Left' then
					TextBoxContainer.Parent = Left
				elseif side == 'Right' then
					TextBoxContainer.Parent = Right
				else
					TextBoxContainer:Destroy()
					print('please select a side for the ' .. text .. ' label')
				end
			end

			function items:Slider(side, text, min, max, inc, callback)
				local dragging = false
				local Slider = Instance.new("Frame")
				Slider.Name = tostring(text)
				Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Slider.BackgroundTransparency = 1.000
				Slider.BorderColor3 = Color3.fromRGB(27, 42, 53)
				Slider.BorderSizePixel = 0
				Slider.Size = UDim2.new(1, 0, 0, 36)
				
				local SliderOutline = Instance.new("UIStroke")
				SliderOutline.Enabled = true
				SliderOutline.Parent = Slider
				SliderOutline.Color = Color3.fromRGB(31, 26, 61)
				SliderOutline.LineJoinMode = Enum.LineJoinMode.Miter
				SliderOutline.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
				SliderOutline.Thickness = 1
				SliderOutline.Transparency = 1
				
				local SliderTitle = Instance.new("TextLabel")
				SliderTitle.Name = "SliderTitle"
				SliderTitle.Parent = Slider
				SliderTitle.AnchorPoint = Vector2.new(0, 0.5)
				SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SliderTitle.BackgroundTransparency = 1.000
				SliderTitle.ClipsDescendants = true
				SliderTitle.Position = UDim2.new(0, 21, 0.5, 0)
				SliderTitle.Size = UDim2.new(0, 180, 1, 0)
				SliderTitle.Font = Enum.Font.GothamMedium
				SliderTitle.Text = text
				SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				SliderTitle.TextSize = 12.000
				SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
				
				local SlideBack = Instance.new("Frame")
				SlideBack.Name = "SlideBack"
				SlideBack.Parent = Slider
				SlideBack.AnchorPoint = Vector2.new(1, 0.5)
				SlideBack.BackgroundColor3 = Color3.fromRGB(33, 28, 64)
				SlideBack.BorderSizePixel = 0
				SlideBack.Position = UDim2.new(1, -62, 0.5, 0)
				SlideBack.Size = UDim2.new(0, 130, 0, 2)
				
				local SlideCircle = Instance.new("Frame")
				SlideCircle.Name = "SlideCircle"
				SlideCircle.Parent = SlideBack
				SlideCircle.AnchorPoint = Vector2.new(0.5, 0.5)
				SlideCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SlideCircle.Position = UDim2.new(0, 0, 0.5, 0)
				SlideCircle.Size = UDim2.new(0, 12, 0, 12)
				SlideCircle.ZIndex = 2
				
				local SlideCircleCorner = Instance.new("UICorner")
				SlideCircleCorner.CornerRadius = UDim.new(1, 0)
				SlideCircleCorner.Name = "SlideCircleCorner"
				SlideCircleCorner.Parent = SlideCircle
				
				local SlideBackLight = Instance.new("Frame")
				SlideBackLight.Name = "SlideBackLight"
				SlideBackLight.Parent = SlideBack
				SlideBackLight.AnchorPoint = Vector2.new(0, 0.5)
				SlideBackLight.BackgroundColor3 = Color3.fromRGB(107, 89, 222)
				SlideBackLight.BorderSizePixel = 0
				SlideBackLight.Position = UDim2.new(0, 0, 0.5, 0)
				SlideBackLight.Size = UDim2.new(0, 0, 0, 2)
				
				local SlideBackLightCorner = Instance.new("UICorner")
				SlideBackLightCorner.CornerRadius = UDim.new(1, 0)
				SlideBackLightCorner.Name = "SlideBackLightCorner"
				SlideBackLightCorner.Parent = SlideBackLight
				
				local SliderValue = Instance.new("TextBox")
				SliderValue.Name = "SliderValue"
				SliderValue.Parent = Slider
				SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SliderValue.BackgroundTransparency = 1.000
				SliderValue.Position = UDim2.new(0.748096704, 21, 0.250222206, 0)
				SliderValue.Size = UDim2.new(0, 34, 0, 17)
				SliderValue.Font = Enum.Font.GothamMedium
				SliderValue.Text = min
				SliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
				SliderValue.TextSize = 14.000
				SliderValue.TextXAlignment = Enum.TextXAlignment.Right

				if side == 'Left' then
					Slider.Parent = Left
				elseif side == 'Right' then
					Slider.Parent = Right
				else
					Slider:Destroy()
					print('please select a side for the ' .. text .. ' label')
				end
				
				local function move(Input)
					local XSize = math.clamp((Input.Position.X - SlideBack.AbsolutePosition.X) / SlideBack.AbsoluteSize.X, 0, 1)
					local Increment = inc and (max / ((max - min) / (inc * 4))) or 
						(max >= 50 and max / ((max - min) / 4)) or 
						(max >= 25 and max / ((max - min) / 2)) or 
						(max / (max - min))

					local SizeRounded = UDim2.new((math.round(XSize * ((max / Increment) * 4)) / ((max / Increment) * 4)), 0, 0, 2)
					local PosRoundedCircle = UDim2.new((math.round(XSize * ((max / Increment) * 4)) / ((max / Increment) * 4)), 0, 0.5, 0)
					SlideBackLight:TweenSize(SizeRounded, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true)
					SlideCircle:TweenPosition(PosRoundedCircle, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true)

					local Val = math.round((((SizeRounded.X.Scale * max) / max) * (max - min) + min) * 20) / 20
					SliderValue.Text = tostring(Val)

					pcall(callback, tonumber(Val))
				end

				SlideCircle.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = true
						move(input)
					end
				end)

				SlideCircle.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = false
						move(input)
					end
				end)
				
				SlideBack.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = true
						move(input)
					end
				end)

				SlideBack.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = false
						move(input)
					end
				end)
				
				SlideBackLight.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = true
						move(input)
					end
				end)

				SlideBackLight.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = false
						move(input)
					end
				end)

				game:GetService("UserInputService").InputChanged:Connect(function(input)
					if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
						move(input)
					end
				end)

				SliderValue.FocusLost:Connect(function(ep)
					if ep then
					 if (tonumber(SliderValue.Text) > max)  then
						SliderValue.Text = tostring(max)
						 pcall(callback, tostring(SliderValue.Text))TweenService:Create(SlideBackLight,TweenInfo.new(.3, Enum.EasingStyle.Quad),{Size = UDim2.new((tonumber(SliderValue.Text)) / max, 0, 0, 2)}):Play()
					 else
						 pcall(callback, tostring(SliderValue.Text))
						 TweenService:Create(SlideBackLight,TweenInfo.new(.3, Enum.EasingStyle.Quad),{Size = UDim2.new((tonumber(SliderValue.Text)) / max, 0, 0, 2)}):Play()
					 end
					 if (tonumber(SliderValue.Text) < min) then
						SliderValue.Text = tostring(min)
						 pcall(callback, tostring(SliderValue.Text))
						 TweenService:Create(SlideBackLight,TweenInfo.new(.3, Enum.EasingStyle.Quad),{Size = UDim2.new((tonumber(SliderValue.Text)) / max, 0, 0, 2)}):Play()
					 else
						 pcall(callback, tostring(SliderValue.Text))
						 TweenService:Create(SlideBackLight,TweenInfo.new(.3, Enum.EasingStyle.Quad),{Size = UDim2.new((tonumber(SliderValue.Text)) / max, 0, 0, 2)}):Play()
					 end
					 if (tonumber(SliderValue.Text) <= min) then
						 pcall(callback, tostring(SliderValue.Text))
						 TweenService:Create(SlideBackLight,TweenInfo.new(.3, Enum.EasingStyle.Quad),{Size = UDim2.new(0, 0, 0, 3)}):Play()
					 end
					end
			 end)
			 
			end

			function items:Dropdown(side, text, default, options, cb, multi)
				local opened = false
				assert(type(options) == "table", "options must be a table")
				assert(type(cb) == "function", "callback must be a function")
				
				local Dropdown = Instance.new("Frame")
				Dropdown.Name = text or ''
				Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Dropdown.BackgroundTransparency = 1.000
				Dropdown.BorderColor3 = Color3.fromRGB(27, 42, 53)
				Dropdown.BorderSizePixel = 0
				Dropdown.Size = UDim2.new(1, 0, 0, 36)
				
				local DropdownOutline = Instance.new("UIStroke")
				DropdownOutline.Enabled = true
				DropdownOutline.Parent = Dropdown
				DropdownOutline.Color = Color3.fromRGB(31, 26, 61)
				DropdownOutline.LineJoinMode = Enum.LineJoinMode.Miter
				DropdownOutline.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
				DropdownOutline.Thickness = 1
				DropdownOutline.Transparency = 1
				
				local DropdownTitle = Instance.new("TextLabel")
				DropdownTitle.Name = "DropdownTitle"
				DropdownTitle.Parent = Dropdown
				DropdownTitle.AnchorPoint = Vector2.new(0, 0.5)
				DropdownTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropdownTitle.BackgroundTransparency = 1.000
				DropdownTitle.ClipsDescendants = true
				DropdownTitle.Position = UDim2.new(0, 21, 0.5, 0)
				DropdownTitle.Size = UDim2.new(0, 180, 1, 0)
				DropdownTitle.Font = Enum.Font.GothamMedium
				DropdownTitle.Text = text
				DropdownTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				DropdownTitle.TextSize = 12.000
				DropdownTitle.TextXAlignment = Enum.TextXAlignment.Left
				
				local DropdownDropFrame = Instance.new("Frame")
				DropdownDropFrame.Name = "DropdownDropFrame"
				DropdownDropFrame.Parent = Dropdown
				DropdownDropFrame.AnchorPoint = Vector2.new(1, 0.5)
				DropdownDropFrame.BackgroundColor3 = Color3.fromRGB(34, 28, 64)
				DropdownDropFrame.Position = UDim2.new(1, -12, 0.5, 0)
				DropdownDropFrame.Size = UDim2.new(0, 173, 0, 22)
				
				local DropdownDropFrameCorner = Instance.new("UICorner")
				DropdownDropFrameCorner.CornerRadius = UDim.new(0, 4)
				DropdownDropFrameCorner.Name = "DropdownDropFrameCorner"
				DropdownDropFrameCorner.Parent = DropdownDropFrame
				
				local DropdownInteract = Instance.new("TextButton")
				DropdownInteract.Name = "DropdownInteract"
				DropdownInteract.Parent = DropdownDropFrame
				DropdownInteract.AnchorPoint = Vector2.new(0, 0.5)
				DropdownInteract.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
				DropdownInteract.BorderColor3 = Color3.fromRGB(27, 42, 53)
				DropdownInteract.Position = UDim2.new(0, 0, 0.5, 0)
				DropdownInteract.Size = UDim2.new(1, 0, 1, 0)
				DropdownInteract.AutoButtonColor = false
				DropdownInteract.Font = Enum.Font.SourceSans
				DropdownInteract.Text = ""
				DropdownInteract.TextColor3 = Color3.fromRGB(0, 0, 0)
				DropdownInteract.TextSize = 14.000
				DropdownInteract.BackgroundTransparency = 1
				
				local DropdownDropFrameArrowHolder = Instance.new("Frame")
				DropdownDropFrameArrowHolder.Name = "DropdownDropFrameArrowHolder"
				DropdownDropFrameArrowHolder.Parent = DropdownDropFrame
				DropdownDropFrameArrowHolder.AnchorPoint = Vector2.new(1, 0.5)
				DropdownDropFrameArrowHolder.BackgroundColor3 = Color3.fromRGB(107, 89, 222)
				DropdownDropFrameArrowHolder.Position = UDim2.new(1, -2, 0.5, 0)
				DropdownDropFrameArrowHolder.Size = UDim2.new(0, 14, 0, 16)
				
				local DropdownDropFrameArrowHolderCorner = Instance.new("UICorner")
				DropdownDropFrameArrowHolderCorner.CornerRadius = UDim.new(0, 4)
				DropdownDropFrameArrowHolderCorner.Name = "DropdownDropFrameArrowHolderCorner"
				DropdownDropFrameArrowHolderCorner.Parent = DropdownDropFrameArrowHolder
				
				local DropdownArrow = Instance.new("ImageLabel")
				DropdownArrow.Name = "DropdownArrow"
				DropdownArrow.Parent = DropdownDropFrameArrowHolder
				DropdownArrow.AnchorPoint = Vector2.new(0.5, 0.5)
				DropdownArrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropdownArrow.BackgroundTransparency = 1.000
				DropdownArrow.Position = UDim2.new(0.5, 0, 0.5, 0)
				DropdownArrow.Size = UDim2.new(1, 0, 1, 0)
				DropdownArrow.Image = "rbxassetid://10125383411"
				
				local DropdownSelected = Instance.new("TextLabel")
				DropdownSelected.Name = "DropdownSelected"
				DropdownSelected.Parent = DropdownDropFrame
				DropdownSelected.AnchorPoint = Vector2.new(0, 0.5)
				DropdownSelected.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropdownSelected.BackgroundTransparency = 1.000
				DropdownSelected.ClipsDescendants = false
				DropdownSelected.Position = UDim2.new(0, 4, 0.5, 0)
				DropdownSelected.Size = UDim2.new(1, -24, 1, 0)
				DropdownSelected.Visible = true
				DropdownSelected.Font = Enum.Font.Gotham
				DropdownSelected.Text = string.format(default)
				DropdownSelected.TextColor3 = Color3.fromRGB(255, 255, 255)
				DropdownSelected.TextSize = 12.000
				DropdownSelected.TextXAlignment = Enum.TextXAlignment.Left
				
				local DropdownChildFrameOutline = Instance.new("Frame")
				DropdownChildFrameOutline.Name = "DropdownChildFrame"
				DropdownChildFrameOutline.Parent = DropdownDropFrame
				DropdownChildFrameOutline.AnchorPoint = Vector2.new(0.5, 0)
				DropdownChildFrameOutline.BackgroundColor3 = Color3.fromRGB(34, 28, 64)
				DropdownChildFrameOutline.Position = UDim2.new(0.5, 0, 0, 0)
				DropdownChildFrameOutline.Size = UDim2.new(1, 0, 0, 100)
				DropdownChildFrameOutline.BackgroundTransparency = 1
				DropdownChildFrameOutline.Visible = false
				DropdownChildFrameOutline.ZIndex = 99
				
				local DropdownChildFrameOutlineCorner = Instance.new("UICorner")
				DropdownChildFrameOutlineCorner.CornerRadius = UDim.new(0, 4)
				DropdownChildFrameOutlineCorner.Name = "DropdownChildFrameOutlineCorner"
				DropdownChildFrameOutlineCorner.Parent = DropdownChildFrameOutline
				
				local DropdownChildFrame = Instance.new("Frame")
				DropdownChildFrame.Name = "DropdownChildFrame"
				DropdownChildFrame.Parent = DropdownChildFrameOutline
				DropdownChildFrame.AnchorPoint = Vector2.new(0.5, 0.5)
				DropdownChildFrame.BackgroundColor3 = Color3.fromRGB(22, 20, 45)
				DropdownChildFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
				DropdownChildFrame.Size = UDim2.new(1, -2, 1, -2)
				DropdownChildFrame.BackgroundTransparency = 1
				DropdownChildFrame.ZIndex = 99
				
				local DropdownChildFrameCorner = Instance.new("UICorner")
				DropdownChildFrameCorner.CornerRadius = UDim.new(0, 4)
				DropdownChildFrameCorner.Name = "DropdownChildFrameCorner"
				DropdownChildFrameCorner.Parent = DropdownChildFrame
				
				local DropdownChildFrameScroll = Instance.new("ScrollingFrame")
				DropdownChildFrameScroll.Name = "DropdownChildFrameScroll"
				DropdownChildFrameScroll.Parent = DropdownChildFrame
				DropdownChildFrameScroll.Active = true
				DropdownChildFrameScroll.AnchorPoint = Vector2.new(0.5, 0.5)
				DropdownChildFrameScroll.BackgroundColor3 = Color3.fromRGB(33, 28, 64)
				DropdownChildFrameScroll.BackgroundTransparency = 1.000
				DropdownChildFrameScroll.BorderSizePixel = 0
				DropdownChildFrameScroll.Position = UDim2.new(0.5, 0, 0.5, 0)
				DropdownChildFrameScroll.Size = UDim2.new(1, 0, 1, -8)
				DropdownChildFrameScroll.ScrollBarThickness = 0
				DropdownChildFrameScroll.ZIndex = 99
				
				local DropdownChildFrameScrollListing = Instance.new("UIListLayout")
				DropdownChildFrameScrollListing.Name = "DropdownChildFrameScrollListing"
				DropdownChildFrameScrollListing.Parent = DropdownChildFrameScroll
				DropdownChildFrameScrollListing.HorizontalAlignment = Enum.HorizontalAlignment.Center
				DropdownChildFrameScrollListing.SortOrder = Enum.SortOrder.LayoutOrder
				DropdownChildFrameScrollListing.Padding = UDim.new(0, 1)
				
				DropdownChildFrameScrollListing:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
					DropdownChildFrameScroll.CanvasSize = UDim2.new(0, 0, 0, DropdownChildFrameScrollListing.AbsoluteContentSize.Y) 
				end)
				
				DropdownInteract.MouseEnter:Connect(function()
					game.TweenService:Create(DropdownDropFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						BackgroundColor3 = Color3.fromRGB(42, 34, 80)
					}):Play()
				end)
				DropdownInteract.MouseLeave:Connect(function()
					game.TweenService:Create(DropdownDropFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						BackgroundColor3 = Color3.fromRGB(34, 28, 64)
					}):Play()
				end)
				
				local debounce = false

				local function toggle()
					DropdownChildFrameOutline.Visible = true
					if (debounce) then return end

					opened = not opened

					if (not opened) then
						debounce = true
					end

					local tween = TweenService:Create(
						DropdownChildFrame, TweenInfo.new(.2), {
							BackgroundTransparency = opened and 0 or 1
						}
					)
					TweenService:Create(
						DropdownChildFrameOutline, TweenInfo.new(.2), {
							BackgroundTransparency = opened and 0 or 1
						}
					):Play()
					
					for i,v in next, DropdownChildFrameScroll:GetDescendants() do
						if v:IsA('TextButton') then
							game.TweenService:Create(v, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								BackgroundTransparency = opened and 0 or 1
							}):Play()
						end
						if v:IsA('TextLabel') then
							game.TweenService:Create(v, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								TextTransparency = opened and 0 or 1
							}):Play()
						end
						if v:IsA('ImageLabel') then
							game.TweenService:Create(v, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								ImageTransparency = opened and 0 or 1
							}):Play()
						end
					end
					
					tween:Play()
					if (not opened) then
						wait(.2)
						debounce = false
					end

					DropdownChildFrame.Visible = opened
				end

				DropdownInteract.InputBegan:Connect(function(inp)
					if (inp.UserInputType == Enum.UserInputType.MouseButton1) then
						toggle()
					end
				end)
				
				local pressed = false
				for _, opt in next, options do
					local DropdownBtn = Instance.new("TextButton")
					DropdownBtn.Name = "DropdownBtn"
					DropdownBtn.Parent = DropdownChildFrameScroll
					DropdownBtn.BackgroundColor3 = Color3.fromRGB(22, 20, 45)
					DropdownBtn.Size = UDim2.new(1, -8, 0, 22)
					DropdownBtn.Font = Enum.Font.SourceSans
					DropdownBtn.Text = ""
					DropdownBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
					DropdownBtn.TextSize = 14.000
					DropdownBtn.AutoButtonColor = false
					DropdownBtn.BackgroundTransparency = 1
					DropdownBtn.ZIndex = 99
					
					local DropdownBtnTitle = Instance.new("TextLabel")
					DropdownBtnTitle.Name = "DropdownBtnTitle"
					DropdownBtnTitle.Parent = DropdownBtn
					DropdownBtnTitle.AnchorPoint = Vector2.new(1, 0.5)
					DropdownBtnTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					DropdownBtnTitle.BackgroundTransparency = 1.000
					DropdownBtnTitle.ClipsDescendants = true
					DropdownBtnTitle.Position = UDim2.new(1, 0, 0.5, 0)
					DropdownBtnTitle.Size = UDim2.new(1, -6, 1, 0)
					DropdownBtnTitle.Font = Enum.Font.Gotham
					DropdownBtnTitle.Text = tostring(opt)
					DropdownBtnTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
					DropdownBtnTitle.TextSize = 12.000
					DropdownBtnTitle.TextXAlignment = Enum.TextXAlignment.Left
					DropdownBtnTitle.TextTransparency = 1
					DropdownBtnTitle.ZIndex = 99

					local DropdownBtnCorner = Instance.new("UICorner")
					DropdownBtnCorner.CornerRadius = UDim.new(0, 4)
					DropdownBtnCorner.Name = "DropdownBtnCorner"
					DropdownBtnCorner.Parent = DropdownBtn
					
					DropdownBtn.MouseButton1Click:Connect(function()
						if (pressed) then return end
						pressed = true
						DropdownSelected.Text = string.format(opt)
						coroutine.wrap(cb)(opt)
						toggle()
						pressed = false
					end)
					DropdownBtn.MouseEnter:Connect(function()
						game.TweenService:Create(DropdownBtn, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
							BackgroundColor3 = Color3.fromRGB(107, 89, 222)
						}):Play()
					end)
					DropdownBtn.MouseLeave:Connect(function()
						game.TweenService:Create(DropdownBtn, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
							BackgroundColor3 = Color3.fromRGB(22, 20, 45)
						}):Play()
					end)
				end
				
				if side == 'Left' then
					Dropdown.Parent = Left
				elseif side == 'Right' then
					Dropdown.Parent = Right
				else
					Dropdown:Destroy()
					print('please select a side for the ' .. text .. ' label')
				end
			end
			
			local subitems = {}
			
			function subitems:AddColor(name, presetcolor, callback)
				local ColorPickerToggled = false
				local OldToggleColor = Color3.fromRGB(0, 0, 0)
				local OldColor = Color3.fromRGB(0, 0, 0)
				local OldColorSelectionPosition = nil
				local OldHueSelectionPosition = nil
				local ColorH, ColorS, ColorV = 1, 1, 1
				local RainbowColorPicker = false
				local ColorPickerInput = nil
				local ColorInput = nil
				local HueInput = nil

				local ColorPickerHolder = Instance.new("Frame")
				ColorPickerHolder.Name = ("ColorPickerHolder")
				ColorPickerHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ColorPickerHolder.BackgroundTransparency = 1.000
				ColorPickerHolder.Position = UDim2.new(0, 0, 0, 0)
				ColorPickerHolder.Size = UDim2.new(1, 0, 0, 22)
				ColorPickerHolder.ClipsDescendants = false

				local NameColorPicker = Instance.new("Frame")
				NameColorPicker.Name = (name .. "ColorPicker")
				NameColorPicker.Parent = ColorPickerHolder
				NameColorPicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				NameColorPicker.BackgroundTransparency = 1.000
				NameColorPicker.AnchorPoint = Vector2.new(1, 0)
				NameColorPicker.Position = UDim2.new(1, -6, 1, 0)
				NameColorPicker.Size = UDim2.new(0, 170, 0, 0)
				NameColorPicker.ClipsDescendants = true

				local ColorPickerCover = Instance.new("TextButton")
				ColorPickerCover.Name = "ColorPickerCover"
				ColorPickerCover.Parent = NameColorPicker
				ColorPickerCover.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
				ColorPickerCover.BackgroundTransparency = 1
				ColorPickerCover.BorderSizePixel = 0
				ColorPickerCover.Size = UDim2.new(1, 0, 1, 0)
				ColorPickerCover.AutoButtonColor = false
				ColorPickerCover.Font = Enum.Font.Gotham
				ColorPickerCover.Text = ""
				ColorPickerCover.TextColor3 = Color3.fromRGB(160, 160, 160)
				ColorPickerCover.TextSize = 12.000
				ColorPickerCover.ZIndex = 99

				local Title = Instance.new("TextLabel")
				Title.Name = "Title"
				Title.Parent = ColorPickerHolder
				Title.AnchorPoint = Vector2.new(0, 0.5)
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.Position = UDim2.new(0, 6, 0.5, 0)
				Title.Size = UDim2.new(1, 0, 0, 14)
				Title.Font = Enum.Font.Gotham
				Title.Text = name
				Title.TextColor3 = Color3.fromRGB(160, 160, 160)
				Title.TextSize = 12.000
				Title.TextXAlignment = Enum.TextXAlignment.Left

				local ColorPickerToggleOutline = Instance.new("Frame")
				ColorPickerToggleOutline.Name = "ColorPickerToggle"
				ColorPickerToggleOutline.Parent = ColorPickerHolder
				ColorPickerToggleOutline.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				ColorPickerToggleOutline.BackgroundTransparency = 0
				ColorPickerToggleOutline.AnchorPoint = Vector2.new(1, 0.5)
				ColorPickerToggleOutline.Position = UDim2.new(1, -6, 0.5, 0)
				ColorPickerToggleOutline.Size = UDim2.new(0, 24, 0, 12)

				local ColorPickerToggleOutlineCorner = Instance.new("UICorner")
				ColorPickerToggleOutlineCorner.CornerRadius = UDim.new(0, 2)
				ColorPickerToggleOutlineCorner.Name = "ColorPickerToggleOutlineCorner"
				ColorPickerToggleOutlineCorner.Parent = ColorPickerToggleOutline

				local ColorPickerToggle = Instance.new("Frame")
				ColorPickerToggle.Name = "ColorPickerToggle"
				ColorPickerToggle.Parent = ColorPickerToggleOutline
				ColorPickerToggle.BackgroundColor3 = presetcolor
				ColorPickerToggle.BackgroundTransparency = 0
				ColorPickerToggle.AnchorPoint = Vector2.new(0.5, 0.5)
				ColorPickerToggle.Position = UDim2.new(0.5, 0, 0.5, 0)
				ColorPickerToggle.Size = UDim2.new(1, -2, 1, -2)

				local ColorPickerToggleCorner = Instance.new("UICorner")
				ColorPickerToggleCorner.CornerRadius = UDim.new(0, 2)
				ColorPickerToggleCorner.Name = "ColorPickerToggleCorner"
				ColorPickerToggleCorner.Parent = ColorPickerToggle

				local ColorPickerOutline = Instance.new("Frame")
				ColorPickerOutline.Name = "ColorPickerOutline"
				ColorPickerOutline.Parent = NameColorPicker
				ColorPickerOutline.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				ColorPickerOutline.BackgroundTransparency = 0
				ColorPickerOutline.ClipsDescendants = true
				ColorPickerOutline.AnchorPoint = Vector2.new(0.5, 0.5)
				ColorPickerOutline.Position = UDim2.new(0.5, 0, 0.5, 0)
				ColorPickerOutline.Size = UDim2.new(1, 0, 1, 0)
				ColorPickerOutline.BorderSizePixel = 0
				ColorPickerOutline.ZIndex = 100

				local ColorPickerOutlineCorner = Instance.new("UICorner")
				ColorPickerOutlineCorner.CornerRadius = UDim.new(0, 2)
				ColorPickerOutlineCorner.Name = "ColorPickerOutlineCorner"
				ColorPickerOutlineCorner.Parent = ColorPickerOutline

				local ColorPicker = Instance.new("Frame")
				ColorPicker.Name = "ColorPicker"
				ColorPicker.Parent = ColorPickerOutline
				ColorPicker.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
				ColorPicker.BackgroundTransparency = 0
				ColorPicker.ClipsDescendants = false
				ColorPicker.AnchorPoint = Vector2.new(0.5, 0.5)
				ColorPicker.Position = UDim2.new(0.5, 0, 0.5, 0)
				ColorPicker.Size = UDim2.new(1, -2, 1, -2)
				ColorPicker.BorderSizePixel = 0
				ColorPicker.ZIndex = 100

				local ColorPickerCorner = Instance.new("UICorner")
				ColorPickerCorner.CornerRadius = UDim.new(0, 2)
				ColorPickerCorner.Name = "ColorPickerCorner"
				ColorPickerCorner.Parent = ColorPicker

				local Color = Instance.new("ImageLabel")
				Color.Name = "Color"
				Color.Parent = ColorPicker
				Color.BackgroundColor3 = presetcolor
				Color.BorderSizePixel = 0
				Color.AnchorPoint = Vector2.new(0, 0)
				Color.Position = UDim2.new(0, 6, 0, 6)
				Color.Size = UDim2.new(0, 124, 0, 100)
				Color.ZIndex = 100
				Color.Image = "rbxassetid://4155801252"

				local ColorSelection = Instance.new("ImageLabel")
				ColorSelection.Name = "ColorSelection"
				ColorSelection.Parent = Color
				ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
				ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ColorSelection.BackgroundTransparency = 1.000
				ColorSelection.Position = UDim2.new(presetcolor and select(3, Color3.toHSV(presetcolor)))
				ColorSelection.Size = UDim2.new(0, 12, 0, 12)
				ColorSelection.ZIndex = 101
				ColorSelection.Image = "rbxassetid://4953646208"
				ColorSelection.ScaleType = Enum.ScaleType.Fit

				local RValueOutline = Instance.new("Frame")
				RValueOutline.Name = "RValueOutline"
				RValueOutline.Parent = ColorPicker
				RValueOutline.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				RValueOutline.BackgroundTransparency = 0
				RValueOutline.AnchorPoint = Vector2.new(0, 1)
				RValueOutline.Position = UDim2.new(0, 6, 0, 132)
				RValueOutline.Size = UDim2.new(0, 46, 0, 20)
				RValueOutline.ZIndex = 100

				local RValueOutlineCorner = Instance.new("UICorner")
				RValueOutlineCorner.CornerRadius = UDim.new(0, 2)
				RValueOutlineCorner.Name = "RValueOutlineCorner"
				RValueOutlineCorner.Parent = RValueOutline

				local RValue = Instance.new("Frame")
				RValue.Name = "RValue"
				RValue.Parent = RValueOutline
				RValue.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
				RValue.BackgroundTransparency = 0
				RValue.AnchorPoint = Vector2.new(0.5, 0.5)
				RValue.Position = UDim2.new(0.5, 0, 0.5, 0)
				RValue.Size = UDim2.new(1, -2, 1, -2)
				RValue.ZIndex = 100

				local RValueCorner = Instance.new("UICorner")
				RValueCorner.CornerRadius = UDim.new(0, 2)
				RValueCorner.Name = "RValueCorner"
				RValueCorner.Parent = RValue

				local ValueR = Instance.new("TextLabel")
				ValueR.Name = "ValueR"
				ValueR.Parent = RValue
				ValueR.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ValueR.BackgroundTransparency = 1.000
				ValueR.AnchorPoint = Vector2.new(0.5, 0.5)
				ValueR.Position = UDim2.new(0.5, 0, 0.5, 0)
				ValueR.Size = UDim2.new(1, -8, 1, 0)
				ValueR.ZIndex = 101
				ValueR.Font = Enum.Font.Gotham
				ValueR.Text = "255"
				ValueR.TextColor3 = Color3.fromRGB(255, 255, 255)
				ValueR.TextSize = 12.000

				local GValueOutline = Instance.new("Frame")
				GValueOutline.Name = "GValueOutline"
				GValueOutline.Parent = ColorPicker
				GValueOutline.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				GValueOutline.BackgroundTransparency = 0
				GValueOutline.AnchorPoint = Vector2.new(0.5, 1)
				GValueOutline.Position = UDim2.new(0.5, 0, 0, 132)
				GValueOutline.Size = UDim2.new(0, 46, 0, 20)
				GValueOutline.ZIndex = 100

				local GValueOutlineCorner = Instance.new("UICorner")
				GValueOutlineCorner.CornerRadius = UDim.new(0, 2)
				GValueOutlineCorner.Name = "GValueOutlineCorner"
				GValueOutlineCorner.Parent = GValueOutline

				local GValue = Instance.new("Frame")
				GValue.Name = "GValue"
				GValue.Parent = GValueOutline
				GValue.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
				GValue.BackgroundTransparency = 0
				GValue.AnchorPoint = Vector2.new(0.5, 0.5)
				GValue.Position = UDim2.new(0.5, 0, 0.5, 0)
				GValue.Size = UDim2.new(1, -2, 1, -2)
				GValue.ZIndex = 100

				local GValueCorner = Instance.new("UICorner")
				GValueCorner.CornerRadius = UDim.new(0, 2)
				GValueCorner.Name = "GValueCorner"
				GValueCorner.Parent = GValue

				local ValueG = Instance.new("TextLabel")
				ValueG.Name = "ValueG"
				ValueG.Parent = GValue
				ValueG.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ValueG.BackgroundTransparency = 1.000
				ValueG.AnchorPoint = Vector2.new(0.5, 0.5)
				ValueG.Position = UDim2.new(0.5, 0, 0.5, 0)
				ValueG.Size = UDim2.new(1, -8, 1, 0)
				ValueG.ZIndex = 101
				ValueG.Font = Enum.Font.Gotham
				ValueG.Text = "255"
				ValueG.TextColor3 = Color3.fromRGB(255, 255, 255)
				ValueG.TextSize = 12.000

				local BValueOutline = Instance.new("Frame")
				BValueOutline.Name = "BValueOutline"
				BValueOutline.Parent = ColorPicker
				BValueOutline.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				BValueOutline.BackgroundTransparency = 0
				BValueOutline.AnchorPoint = Vector2.new(1, 1)
				BValueOutline.Position = UDim2.new(1, -6, 0, 132)
				BValueOutline.Size = UDim2.new(0, 46, 0, 20)
				BValueOutline.ZIndex = 100

				local BValueOutlineCorner = Instance.new("UICorner")
				BValueOutlineCorner.CornerRadius = UDim.new(0, 2)
				BValueOutlineCorner.Name = "BValueOutlineCorner"
				BValueOutlineCorner.Parent = BValueOutline

				local BValue = Instance.new("Frame")
				BValue.Name = "BValue"
				BValue.Parent = BValueOutline
				BValue.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
				BValue.BackgroundTransparency = 0
				BValue.AnchorPoint = Vector2.new(0.5, 0.5)
				BValue.Position = UDim2.new(0.5, 0, 0.5, 0)
				BValue.Size = UDim2.new(1, -2, 1, -2)
				BValue.ZIndex = 100

				local BValueCorner = Instance.new("UICorner")
				BValueCorner.CornerRadius = UDim.new(0, 2)
				BValueCorner.Name = "BValueCorner"
				BValueCorner.Parent = BValue

				local ValueB = Instance.new("TextLabel")
				ValueB.Name = "ValueB"
				ValueB.Parent = BValue
				ValueB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ValueB.BackgroundTransparency = 1.000
				ValueB.AnchorPoint = Vector2.new(0.5, 0.5)
				ValueB.Position = UDim2.new(0.5, 0, 0.5, 0)
				ValueB.Size = UDim2.new(1, -8, 1, 0)
				ValueB.ZIndex = 101
				ValueB.Font = Enum.Font.Gotham
				ValueB.Text = "255"
				ValueB.TextColor3 = Color3.fromRGB(255, 255, 255)
				ValueB.TextSize = 12.000

				local Hue = Instance.new("Frame")
				Hue.Name = "Hue"
				Hue.Parent = ColorPicker
				Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Hue.BackgroundTransparency = 0
				Hue.AnchorPoint = Vector2.new(1, 0)
				Hue.Position = UDim2.new(1, -6, 0, 6)
				Hue.Size = UDim2.new(0, 25, 0, 100)
				Hue.ZIndex = 100

				local UIGradient = Instance.new("UIGradient")
				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)), ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)), ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)), ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)), ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))}
				UIGradient.Rotation = 270
				UIGradient.Parent = Hue

				local HueSelection = Instance.new("ImageLabel")
				HueSelection.Name = "HueSelection"
				HueSelection.Parent = Hue
				HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
				HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				HueSelection.BackgroundTransparency = 1.000
				HueSelection.Position = UDim2.new(0.48, 0, 1 - select(1, Color3.toHSV(presetcolor)))
				HueSelection.Size = UDim2.new(0, 12, 0, 12)
				HueSelection.ZIndex = 101
				HueSelection.Image = "rbxassetid://4953646208"
				HueSelection.ScaleType = Enum.ScaleType.Fit

				ColorPickerHolder.MouseEnter:Connect(function()
					game.TweenService:Create(Title, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						TextColor3 = Color3.fromRGB(200, 200, 200)
					}):Play()
				end)
				ColorPickerHolder.MouseLeave:Connect(function()
					game.TweenService:Create(Title, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						TextColor3 = Color3.fromRGB(160, 160, 160)
					}):Play()
				end)

				local function SetRGBValues()
					ValueR.Text = (math.floor(ColorPickerToggle.BackgroundColor3.r * 255))
					ValueG.Text = (math.floor(ColorPickerToggle.BackgroundColor3.g * 255))
					ValueB.Text = (math.floor(ColorPickerToggle.BackgroundColor3.b * 255))
				end

				local function UpdateColorPicker(nope)
					ColorPickerToggle.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
					Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

					SetRGBValues()
					callback(ColorPickerToggle.BackgroundColor3)
				end

				ColorH = 1 - (math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) / Hue.AbsoluteSize.Y)
				ColorS = (math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) / Color.AbsoluteSize.X)
				ColorV = 1 - (math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) / Color.AbsoluteSize.Y)

				ColorPickerToggle.BackgroundColor3 = presetcolor
				Color.BackgroundColor3 = presetcolor
				SetRGBValues()
				callback(Color.BackgroundColor3)

				Color.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if RainbowColorPicker then return end

						if ColorInput then
							ColorInput:Disconnect()
						end

						ColorInput = RunService.RenderStepped:Connect(function()
							local ColorX = (math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) / Color.AbsoluteSize.X)
							local ColorY = (math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) / Color.AbsoluteSize.Y)
							ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
							ColorS = ColorX
							ColorV = 1 - ColorY

							UpdateColorPicker(true)
						end)
					end
				end)

				Color.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if ColorInput then
							ColorInput:Disconnect()
						end
					end
				end)

				Hue.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if RainbowColorPicker then return end

						if HueInput then
							HueInput:Disconnect()
						end

						HueInput = RunService.RenderStepped:Connect(function()
							local HueY = (math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) / Hue.AbsoluteSize.Y)

							HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
							ColorH = 1 - HueY

							UpdateColorPicker(true)
						end)
					end
				end)

				Hue.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if HueInput then
							HueInput:Disconnect()
						end
					end
				end)

				ColorPickerToggle.InputBegan:Connect(function(inp)
					if (inp.UserInputType == Enum.UserInputType.MouseButton1) then
						ColorPickerToggled = not ColorPickerToggled

						coroutine.wrap(function()
							if ColorPickerToggled then
								while ColorPickerToggled do
									RunService.RenderStepped:Wait(Highlight(Title))
								end
							else
								game.TweenService:Create(Title, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									TextColor3 = Color3.fromRGB(160, 160, 160)
								}):Play()
							end
						end)()

						if ColorPickerToggled then
							TweenService:Create(NameColorPicker, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 170, 0, 140)}):Play()
							game.TweenService:Create(Title, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								TextColor3 = Color3.fromRGB(255, 255, 255)
							}):Play()
						elseif not ColorPickerToggled then
							TweenService:Create(NameColorPicker, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 170, 0, 0)}):Play()
							game.TweenService:Create(Title, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								TextColor3 = Color3.fromRGB(160, 160, 160)
							}):Play()
						end
					end
				end)
				
				if side == 'Left' then
					ColorPicker.Parent = Left
				elseif side == 'Right' then
					ColorPicker.Parent = Right
				else
					ColorPicker:Destroy()
					print('please select a side for the ' .. text .. ' label')
				end
				
			end
			
			---SEARCH BAR FUNCTION---
			local function Refresh()
				local entry = string.lower(SearchBox.Text)
				for i,v in pairs(Left:GetChildren()) do
					if v:IsA("Frame") then
						if entry ~= "" then
							local Script = string.lower(v.Name)
							if string.find(Script, entry) then
								v.Visible = true
							else
								v.Visible = false
							end
						else
							v.Visible = true
						end
					end
				end
				for i,v in pairs(Right:GetChildren()) do
					if v:IsA("Frame") then
						if entry ~= "" then
							local Script = string.lower(v.Name)
							if string.find(Script, entry) then
								v.Visible = true
							else
								v.Visible = false
							end
						else
							v.Visible = true
						end
					end
				end
			end
			SearchBox.Changed:Connect(Refresh)
			---JUST STUFF---
			return items
		end
		return subtabs
	end
	return tabs
end
function lib:Notify(title, desc, dur)
	local Notification = Instance.new("Frame")
	Notification.Name = "Notification"
	Notification.Parent = NotifsHolder
	Notification.BackgroundColor3 = Color3.fromRGB(23, 20, 41)
	Notification.Size = UDim2.new(1, 0, 0, 60)
	Notification.AnchorPoint = Vector2.new(0, 0.5)
	Notification.Position = UDim2.new(1, 20, 0.5, 0)
	Notification.BackgroundTransparency = 1
	
	local NotificationBack = Instance.new("Frame")
	NotificationBack.Name = "NotificationBack"
	NotificationBack.Parent = Notification
	NotificationBack.BackgroundColor3 = Color3.fromRGB(23, 20, 41)
	NotificationBack.Size = UDim2.new(1, 0, 1, 0)
	NotificationBack.AnchorPoint = Vector2.new(0, 0.5)
	NotificationBack.Position = UDim2.new(1, 20, 0.5, 0)
	NotificationBack.BackgroundTransparency = 1
	
	local NotificationShadow = Instance.new("ImageLabel")
	NotificationShadow.Name = "NotificationShadow"
	NotificationShadow.Parent = NotificationBack
	NotificationShadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NotificationShadow.BackgroundTransparency = 1.000
	NotificationShadow.Position = UDim2.new(0, -15, 0, -15)
	NotificationShadow.Size = UDim2.new(1, 30, 1, 30)
	NotificationShadow.Image = "rbxassetid://6521733637"
	NotificationShadow.ImageColor3 = Color3.fromRGB(21, 19, 37)
	NotificationShadow.ImageTransparency = 0.300
	NotificationShadow.ScaleType = Enum.ScaleType.Slice
	NotificationShadow.SliceCenter = Rect.new(19, 19, 281, 281)

	local NotificationCorner = Instance.new("UICorner")
	NotificationCorner.CornerRadius = UDim.new(0, 4)
	NotificationCorner.Name = "NotificationCorner"
	NotificationCorner.Parent = NotificationBack

	local NotificationLine = Instance.new("Frame")
	NotificationLine.Name = "NotificationLine"
	NotificationLine.Parent = NotificationBack
	NotificationLine.BackgroundColor3 = Color3.fromRGB(31, 26, 61)
	NotificationLine.BorderSizePixel = 0
	NotificationLine.Position = UDim2.new(0, 0, 0, 20)
	NotificationLine.Size = UDim2.new(1, 0, 0, 1)
	NotificationLine.BackgroundTransparency = 1
	
	local NotificationDurationLine = Instance.new("Frame")
	NotificationDurationLine.Name = "NotificationDurationLine"
	NotificationDurationLine.Parent = NotificationBack
	NotificationDurationLine.BackgroundColor3 = Color3.fromRGB(89, 75, 176)
	NotificationDurationLine.BorderSizePixel = 0
	NotificationDurationLine.Position = UDim2.new(0, 0, 0, 20)
	NotificationDurationLine.Size = UDim2.new(1, 0, 0, 1)
	NotificationDurationLine.BackgroundTransparency = 1

	local NotificationTitle = Instance.new("TextLabel")
	NotificationTitle.Name = "NotificationTitle"
	NotificationTitle.Parent = NotificationBack
	NotificationTitle.AnchorPoint = Vector2.new(0, 0)
	NotificationTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NotificationTitle.BackgroundTransparency = 1.000
	NotificationTitle.Position = UDim2.new(0, 10, 0, 0)
	NotificationTitle.Size = UDim2.new(1, -10, 0, 20)
	NotificationTitle.Font = Enum.Font.GothamMedium
	NotificationTitle.Text = title
	NotificationTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	NotificationTitle.TextSize = 12.000
	NotificationTitle.TextXAlignment = Enum.TextXAlignment.Left
	NotificationTitle.TextTransparency = 1

    local NotificationGlow = Instance.new("ImageLabel")
    NotificationGlow.Name = "NotificationGlow"
    NotificationGlow.Parent = NotificationBack
    NotificationGlow.BackgroundTransparency = 1.000
    NotificationGlow.Position = UDim2.new(0, -15, 0, -15)
    NotificationGlow.Size = UDim2.new(0.995714188, 30, 0.983333349, 30)
    NotificationGlow.ZIndex = 0
    NotificationGlow.Image = "rbxassetid://5028857084"
    NotificationGlow.ImageColor3 = Color3.fromRGB(107, 89, 222)
    NotificationGlow.ScaleType = Enum.ScaleType.Slice
    NotificationGlow.SliceCenter = Rect.new(24, 24, 276, 276)
    

	local NotificationDesc = Instance.new("TextLabel")
	NotificationDesc.Name = "NotificationDesc"
	NotificationDesc.Parent = NotificationBack
	NotificationDesc.AnchorPoint = Vector2.new(1, 1)
	NotificationDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NotificationDesc.BackgroundTransparency = 1.000
	NotificationDesc.Position = UDim2.new(1, 0, 1, 8)
	NotificationDesc.Size = UDim2.new(1, -10, 1, -16)
	NotificationDesc.Font = Enum.Font.Gotham
	NotificationDesc.Text = desc
	NotificationDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
	NotificationDesc.TextSize = 12.000
	NotificationDesc.TextWrapped = true
	NotificationDesc.TextXAlignment = Enum.TextXAlignment.Left
	NotificationDesc.TextYAlignment = Enum.TextYAlignment.Top
	NotificationDesc.TextTransparency = 1
	
	coroutine.wrap(function()
		for i,v in next, NotificationBack:GetChildren() do
			if v:IsA('Frame') then
				game.TweenService:Create(v, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
					BackgroundTransparency = 0
				}):Play()
			elseif v:IsA('TextLabel') then
				game.TweenService:Create(v, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
					TextTransparency = 0
				}):Play()
			end
		end
		game.TweenService:Create(NotificationDurationLine, TweenInfo.new(dur, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
			Size = UDim2.new(0, 0, 0, 1)
		}):Play()
		game.TweenService:Create(NotificationBack, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Position = UDim2.new(0, 0, 0.5, 0)
		}):Play()
		game.TweenService:Create(NotificationBack, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			BackgroundTransparency = 0
		}):Play()
		
		wait(lib.Animations.AnimSpeed)
		wait(dur)
		
		game.TweenService:Create(NotificationBack, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
			Position = UDim2.new(1, 20, 0.5, 0)
		}):Play()
		for i,v in next, NotificationBack:GetChildren() do
			if v:IsA('Frame') then
				game.TweenService:Create(v, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
					BackgroundTransparency = 1.000
				}):Play()
			elseif v:IsA('TextLabel') then
				game.TweenService:Create(v, TweenInfo.new(lib.Animations.AnimSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
					TextTransparency = 1.000
				}):Play()
			end
		end
		wait(lib.Animations.AnimSpeed)
		Notification:Destroy()
	end)()
end

getgenv().library = lib
return lib
