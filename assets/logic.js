function onTouch(event) {
	if (event.touchType == TouchType.Up) { 
		mainPage.clicksAmount = clicksAmount+1;
		if (mainPage.clicksAmount === 10) {
			clippedImage.visible = true;
			mainImage.imageSource = "asset:///images/second.png";
			playParallelAnimation();
		}
		if (mainPage.clicksAmount === 20) {
			clippedImage.visible = true;
			mainImage.imageSource = "asset:///images/third.png";
			playParallelAnimation();
		}
	}
}

function restart() {
	mainPage.clicksAmount = 0;
	mainImage.imageSource = "asset:///images/first.png";
	setupAnimationForFirstImage();
}

function setupAnimationForSecondImage() {
	clippedImage.visible = false;
	playReverseAnimation();
	mainImage_top.imageSource = "asset:///images/second_1.png";
	mainImage_bottom.imageSource = "asset:///images/second_2.png";
}

function setupAnimationForFirstImage() {
	clippedImage.visible = false;
	playReverseAnimation();
	mainImage_top.imageSource = "asset:///images/first_1.png";
	mainImage_bottom.imageSource = "asset:///images/first_2.png";
}

function playReverseAnimation() {
	reverseAnimation_top.play();
	reverseAnimation_bottom.play();
}

function playParallelAnimation() {
	parallelAnimation_top.play();
	parallelAnimation_bottom.play();
}
