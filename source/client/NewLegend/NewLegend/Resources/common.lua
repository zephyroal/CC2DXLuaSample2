
COMMON = {}

-- 创建动画从单图
    COMMON.creatAni = function( imageName ,  frameWidth,  frameHeight, frameNum ,frameTime )
		
		local texture = CCTextureCache:sharedTextureCache():addImage(imageName)
		local rect = {}
		local frame = {}
		local animFrames = CCArray:create()
		for i=1, frameNum do
			rect[i] 		= CCRectMake(frameWidth*(i-1), 0, frameWidth, frameHeight)
			frame[i] 	= CCSpriteFrame:createWithTexture(texture, rect[i])
			animFrames:addObject(frame[i])
		end
		
        local animation = CCAnimation:createWithSpriteFrames(animFrames, frameTime)
        local animate = CCAnimate:create(animation);

	    return animate,frame[1]
	end 	 

-- 创建动画从序列图图
    COMMON.creatAniFromImgs = function( imageName ,  frameWidth,  frameHeight, frameNum ,frameTime )
		
		local texture = {}
		local rect = {}
		local frame = {}
		local animFrames = CCArray:create()
		for i=1,frameNum do
			texture[i] = CCTextureCache:sharedTextureCache():addImage(imageName[i])
			rect[i] 		= CCRectMake(0, 0, frameWidth, frameHeight)
			frame[i] 	= CCSpriteFrame:createWithTexture(texture[i], rect[i])		
			animFrames:addObject(frame[i])
		end	
		
        local animation = CCAnimation:createWithSpriteFrames(animFrames, 0.5)
        local animate = CCAnimate:create(animation);
	    return animate,frame[1]
	end 	 

--创建精灵		
	 COMMON.creatSpriteFromAni = function( animate ,frame, x,y )	
		local sprite = CCSprite:createWithSpriteFrame(frame)
        sprite.isPaused = false
        sprite:setPosition(x, y)
		sprite:runAction(CCRepeatForever:create(animate))				
		return sprite
	end	

	 COMMON.creatSpriteFromFile = function( fileName, x,y )	
		local sprite = CCSprite:create(fileName)
        sprite:setPosition(x, y)
		return sprite
	end	
		
