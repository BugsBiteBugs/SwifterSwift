// NSColorExtensionsTests.swift - Copyright 2024 SwifterSwift

@testable import SwifterSwift
import XCTest

#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit

final class NSColorExtensionsTests: XCTestCase {
    @available(macOS 10.15, *)
    func testInitLightDark() {
        let lightModeColor = NSColor.red
        let darkModeColor = NSColor.blue
        let color = NSColor(light: lightModeColor, dark: darkModeColor)

        let view = NSView()

        if #available(macOS 12, *) {
            NSAppearance(named: .aqua)?.performAsCurrentDrawingAppearance {
                view.backgroundColour = color
            }
        } else {
            NSAppearance.current = NSAppearance(named: .aqua)
            view.backgroundColour = color
        }
        XCTAssertEqual(view.backgroundColour, lightModeColor)

        if #available(macOS 12, *) {
            NSAppearance(named: .darkAqua)?.performAsCurrentDrawingAppearance {
                view.backgroundColour = color
            }
        } else {
            NSAppearance.current = NSAppearance(named: .darkAqua)
            view.backgroundColour = color
        }
        XCTAssertEqual(view.backgroundColour, darkModeColor)
    }
}

#endif
