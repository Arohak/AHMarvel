//
//  CharacterRowViewSpec.swift
//  Marvel
//
//  Created by Thiago Lioy on 07/01/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

import Quick
import Nimble
@testable import Marvel

class CharacterCellContentViewSpec: QuickSpec {
    
    override func spec() {
        describe("a Character Cell ContentView") {
            var contentView: CharacterCellContentView!
            
            beforeEach {
                contentView = CharacterCellContentView()
            }
            
            it("should trigger fatal error if init with coder") {
                expect { () -> Void in
                    let _ = CharacterCellContentView(coder: NSCoder())
                    }.to(throwAssertion())
            }
            
            it("should have expected background color") {
                expect(contentView.backgroundColor).to(equal(ColorPalette.black))
            }
            
            it("should have expected number of subviews") {
                let subviews = contentView.subviews
                expect(subviews.count).to(equal(3))
            }
            
            it("should have expected subviews") {
                let subviews = contentView.subviews
                expect(subviews[0]).to(beAKindOf(UIImageView.self))
                expect(subviews[1]).to(beAKindOf(UILabel.self))
                expect(subviews[2]).to(beAKindOf(UILabel.self))
            }
        }
    }
}


