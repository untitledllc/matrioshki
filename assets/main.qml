import bb.cascades 1.0
import "logic.js" as Logic

Page {
    id: mainPage
    property int clicksAmount: 0
    Container {
        layout: DockLayout {
        }
        Label {
            id: topLabel
            horizontalAlignment: HorizontalAlignment.Center
            textStyle {
                base: SystemDefaults.TextStyles.TitleText
                color: Color.Red
            }
            text: clicksAmount.toString()
        }
        ImageView {
            id: mainImage
            imageSource: "asset:///images/first.png"
            layoutProperties: StackLayoutProperties {
                spaceQuota: 1.0
            }
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            scalingMethod: ScalingMethod.AspectFit
            onTouch: {
                Logic.onTouch(event);
                sequential.play();
            }
            animations: [
                SequentialAnimation {
                    id: sequential
                    RotateTransition {
                        toAngleZ: 10
                        duration: 20
                    }
                    RotateTransition {
                        toAngleZ: 0
                        duration: 20
                    }
                    RotateTransition {
                        toAngleZ: -10
                        duration: 20
                    }
                    RotateTransition {
                        toAngleZ: 0
                        duration: 20
                    }
                }
            ]
        }
        Container {
            id: clippedImage
            visible: false
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            animations: [
                ParallelAnimation {
                    id: parallelAnimation_top
                    target: mainImage_top
                    onEnded: {                 
                        Logic.setupAnimationForSecondImage();
                    }
                    RotateTransition {
                        toAngleZ: -70
                        duration: 500
                    }
                    TranslateTransition {
                        duration: 500
                        toX: -1000
                        toY: -1000
                    }
                    FadeTransition {
                        duration: 500
                        fromOpacity: 1.0
                        toOpacity: 0.5
                    }
                },
                ParallelAnimation {
                    id: parallelAnimation_bottom
                    target: mainImage_bottom
                    RotateTransition {
                        toAngleZ: -270
                        duration: 500
                    }
                    TranslateTransition {
                        duration: 500
                        toX: 20
                        toY: 1300
                    }
                    FadeTransition {
                        duration: 500
                        fromOpacity: 1.0
                        toOpacity: 0.5
                    }
                },
                ParallelAnimation {
                    id: reverseAnimation_top
                    target: mainImage_top
                    RotateTransition {
                        toAngleZ: 0
                        duration: 500
                    }
                    TranslateTransition {
                        duration: 500
                        toX: 0
                        toY: 0
                    }
                    FadeTransition {
                        duration: 500
                        toOpacity: 1
                    }
                },
                ParallelAnimation {
                    id: reverseAnimation_bottom
                    target: mainImage_bottom
                    RotateTransition {
                        toAngleZ: 0
                            duration: 500
                        }
                        TranslateTransition {
                            duration: 500
                            toX: 0
                            toY: 0
                        }
                        FadeTransition {
                            duration: 500
                            toOpacity: 1
                        }
                    }
            ]
            leftPadding: 200.0
            rightPadding: 200.0
            topPadding: 250.0
            bottomPadding: 250.0
            ImageView {
                id: mainImage_top
                imageSource: "asset:///images/first_1.png"
                scalingMethod: ScalingMethod.AspectFit
            }
            ImageView {
                id: mainImage_bottom
                imageSource: "asset:///images/first_2.png"
                scalingMethod: ScalingMethod.AspectFit
            }
        }
    }
    actions: [
        ActionItem {
            title: qsTr("Restart")
            onTriggered: {
                Logic.restart();           
            }
        }
    ]
}

