//
//  CharacterTableCellSpec.swift
//  Marvel
//
//  Created by Thiago Lioy on 06/01/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

import Quick
import Nimble
@testable import Marvel

class CharacterTableCellSpec: QuickSpec {
    
    override func spec() {
        describe("a Character Table Cell ") {
            var cell: CharacterTableCell!
            var character: Marvel.Character!
            
            beforeEach {
                let testBundle = Bundle(for: type(of: self))
                let mockLoader = MockLoader(file: "character", in: testBundle)
                character = mockLoader?.map(to: Character.self)
                
                cell = CharacterTableCell(style: .default, reuseIdentifier: "CharacterTableCell")
                
                cell.setup(with: character)
            }
            
            it("should trigger fatal error if init with coder") {
                expect { () -> Void in
                    let _ = CharacterTableCell(coder: NSCoder())
                    }.to(throwAssertion())
            }
            
            it("should not be nil") {
                expect(cell).toNot(beNil())
                expect(cell.cellContentView).toNot(beNil())
            }
            
            it("should have expected selection style") {
                expect(cell.selectionStyle == .none).to(beTruthy())
            }
            
            it("should have expected thumb image download") {
                let path = character.thumImage!.fullPath()
                
                expect { () -> Void in
                    cell.cellContentView.thumbImageView.download(image: path)
                    }.toNot(throwAssertion())
            }
        }
    }
}
