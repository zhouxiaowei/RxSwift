//
//  UISegmentedControl+RxTests.swift
//  Tests
//
//  Created by Krunoslav Zaher on 11/26/16.
//  Copyright © 2016 Krunoslav Zaher. All rights reserved.
//

import RxCocoa
import RxSwift
import RxTest
import XCTest

final class UISegmentedControlTests: RxTest {
    
}

extension UISegmentedControlTests {
    func testSegmentedControl_ValueCompletesOnDealloc() {
        let createView: () -> UISegmentedControl = { UISegmentedControl(items: ["a", "b", "c"]) }
        ensurePropertyDeallocated(createView, 1) { (view: UISegmentedControl) in view.rx.value }
    }

    func testSegmentedControl_SelectedSegmentIndexCompletesOnDealloc() {
        let createView: () -> UISegmentedControl = { UISegmentedControl(items: ["a", "b", "c"]) }
        ensurePropertyDeallocated(createView, 1) { (view: UISegmentedControl) in view.rx.selectedSegmentIndex }
    }

    func testSegmentedControl_SegmentDisabled() {
        let segmentedControl = UISegmentedControl(items: ["a", "b", "c"])

        XCTAssertTrue(segmentedControl.isEnabledForSegment(at: 0))
        _ = Observable.just(false).subscribe(segmentedControl.rx.enabled(forSegmentAt: 0))
        XCTAssertFalse(segmentedControl.isEnabledForSegment(at: 0))
    }
}
