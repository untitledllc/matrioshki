import bb.cascades 1.0
import "logic.js" as Logic

Page {
    id: mainPage
    property int clicksAmount: 0
    Container {
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

