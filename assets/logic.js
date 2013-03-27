function onTouch(event) {
	if (event.touchType == TouchType.Up) 
        mainPage.clicksAmount = clicksAmount+1;
    if (mainPage.clicksAmount === 10)
    	mainImage.imageSource = "asset:///images/second.png";
    if (mainPage.clicksAmount === 20)
        mainImage.imageSource = "asset:///images/third.png";
}
